#!/usr/bin/env python3
# SubagentStop (settings.json): una riga JSONL per ogni chiusura di sottoagente in ~/.claude/registro-agenti/chiusure.jsonl.
# Non decide nulla: niente stdout, exit 0 sempre; i propri errori vanno in ~/.claude/registro-agenti/errori.log.
# Niente contenuti: del testo dell'agente si tiene solo la prima riga di un errore API (160 caratteri).
import glob, json, os, re, sys, time, traceback

DIR = os.path.expanduser("~/.claude/registro-agenti")
ERRORI = [  # classe dell'errore, dal testo «API Error: ...»
    ("corpo_illeggibile", r"failed to read request body"),
    ("oauth_revocato", r"OAuth.*revoked|revoked.*OAuth"),
    ("modello_non_disponibile", r"not available on your|does not support this model|model.*not (found|available)"),
    ("immagine_troppo_grande", r"2000 ?(px|pixels)|image dimensions|exceeds? the maximum"),
    ("rate_limit", r"\b429\b|rate.?limit"),
    ("sovraccarico", r"\b529\b|overloaded"),
    ("connessione", r"Unable to connect|ECONNRESET|timed out"),
    ("contesto_pieno", r"Prompt is too long|Request too large"),
]


def max_turns(tipo, cwd):
    if not re.fullmatch(r"[\w.-]+", tipo or ""):  # tipo usato come nome di file: niente percorsi
        return None
    for base in (os.path.join(cwd or "", ".claude/agents"), os.path.expanduser("~/.claude/agents")):
        try:
            testa = open(os.path.join(base, tipo + ".md"), encoding="utf-8").read(8000).split("\n---", 1)[0]
        except OSError:
            continue
        m = re.search(r"^maxTurns:\s*(\d+)", testa, re.M)
        return int(m.group(1)) if m else None
    return None


def leggi_transcript(path):
    modello, turni, strumenti, errore, ultimo = None, set(), 0, None, ""
    try:
        righe = open(path, encoding="utf-8")
    except (OSError, TypeError):
        return modello, 0, 0, None, ""
    with righe:
        for riga in righe:
            try:
                r = json.loads(riga)
            except ValueError:
                continue
            if r.get("type") != "assistant":
                continue
            msg = r.get("message") or {}
            testo = "".join(p.get("text", "") for p in msg.get("content") or [] if isinstance(p, dict) and p.get("type") == "text")
            if r.get("isApiErrorMessage"):
                errore = testo
                continue
            ultimo = testo if testo.strip() else ultimo  # solo in memoria, per il criterio «troncato»
            errore = None  # un errore seguito da altre risposte è stato superato (retry)
            if msg.get("model") and msg["model"] != "<synthetic>":
                modello = msg["model"]
            turni.add(msg.get("id") or r.get("uuid"))  # un turno = una risposta del modello, divisa in più record con lo stesso id
            strumenti += sum(1 for p in msg.get("content") or [] if isinstance(p, dict) and p.get("type") == "tool_use")
    return modello, len(turni), strumenti, errore, ultimo


def classe_errore(testo):
    for nome, pat in ERRORI:
        if re.search(pat, testo[:300], re.I):  # 300 caratteri: alcuni pattern sono quadratici su testi lunghi
            return nome
    m = re.search(r"API Error:\s*(\d{3})", testo)
    return "http_" + m.group(1) if m else "altro"


def troncato(testo):
    # criterio: vuoto, oppure finisce con un segno che apre o continua la frase, oppure con una lettera minuscola su una riga che non è un percorso o codice
    t = (testo or "").rstrip()
    if not t:
        return True
    if t[-1] in ",;:([{-–—":
        return True
    ultima = t.splitlines()[-1]
    return t[-1].islower() and not re.search(r"[/`]|\.\w{1,5}$", ultima)


def esito(dati, mt, turni, errore_transcript):
    ultimo = dati.get("last_assistant_message")
    err = errore_transcript or (ultimo if re.match(r"\s*(API Error|Prompt is too long|Request too large)", ultimo or "") else None)
    if err:  # criterio: l'ultima risposta registrata è un errore API (record isApiErrorMessage o testo «API Error»)
        m = re.match(r"\s*(API Error|Prompt is too long|Request too large)\W*(\d{3})?", err)  # solo prefisso e codice HTTP: il resto può essere testo dell'agente
        return "errore", classe_errore(err), " ".join(filter(None, m.groups())) if m else None
    if mt and turni >= mt - 1:  # criterio: turni usati a 1 o meno dal maxTurns del frontmatter
        return "turni_finiti", None, None
    if troncato(ultimo):  # criterio: vedi troncato()
        return "troncato", None, None
    return "ok", None, None


def da_post_tool_use(dati):
    # SubagentStop non scatta quando l'agente arriva a maxTurns (provato su 2.1.302): PostToolUse(Agent) copre quel caso in foreground.
    r = dati.get("tool_response") or {}
    if not isinstance(r, dict) or r.get("status") != "completed" or not re.fullmatch(r"\w+", r.get("agentId") or ""):
        return None  # background (async_launched) o risposta inattesa
    try:
        with open(os.path.join(DIR, "chiusure.jsonl"), encoding="utf-8") as f:
            if any(f'"id": "{r["agentId"]}"' in riga for riga in f.readlines()[-300:]):
                return None  # già registrato da SubagentStop
    except OSError:
        pass
    base = os.path.splitext(dati.get("transcript_path") or "")[0]
    return {"agent_type": r.get("agentType") or (dati.get("tool_input") or {}).get("subagent_type") or "general-purpose",
            "agent_id": r["agentId"], "session_id": dati.get("session_id"), "cwd": dati.get("cwd"),
            "agent_transcript_path": os.path.join(base, "subagents", f"agent-{r['agentId']}.jsonl"),
            "last_assistant_message": None, "_fonte": "post_tool_use"}


def scan(giorni=7, fermo=900):
    # I lanci in background che finiscono i turni non fanno scattare nessun hook (2.1.302): li recupera `agenti --scan` dai transcript.
    # Chiuso = meta.json con finished:true, o transcript fermo da `fermo` secondi (copre un Bash da 10 min). Dedup per id su tutto il registro.
    try:
        visti = set(re.findall(r'"id": "(\w+)"', open(os.path.join(DIR, "chiusure.jsonl"), encoding="utf-8").read()))
    except OSError:
        visti = set()
    ora, n = time.time(), 0
    for meta in glob.glob(os.path.expanduser("~/.claude/projects/*/*/subagents/agent-*.meta.json")):
        aid = os.path.basename(meta)[6:-10]
        tr = meta[:-10] + ".jsonl"
        try:
            if aid in visti or not re.fullmatch(r"\w+", aid) or "-tmp-" in meta.split(os.sep)[-4]:  # progetti in /tmp (prove): fuori
                continue
            mtime = os.stat(tr).st_mtime
            m = json.load(open(meta, encoding="utf-8"))
            if mtime < ora - 86400 * giorni or (not m.get("finished") and mtime > ora - fermo):
                continue
            with open(tr, encoding="utf-8") as f:
                cwd = json.loads(f.readline()).get("cwd")
            n += registra({"agent_type": m.get("agentType") or "", "agent_id": aid, "cwd": cwd,
                           "session_id": os.path.basename(os.path.dirname(os.path.dirname(tr))),
                           "agent_transcript_path": tr, "last_assistant_message": None, "_fonte": "scan"},
                          time.strftime("%Y-%m-%dT%H:%M:%S%z", time.localtime(mtime)))
        except Exception:
            continue  # transcript sparito, illeggibile o di forma inattesa: si salta questo, lo scan prosegue
    return n


def main():
    dati = json.load(sys.stdin)
    if dati.get("hook_event_name") == "PostToolUse":
        dati = da_post_tool_use(dati)
        if not dati:
            return
    registra(dati)


def registra(dati, ora=None):
    tipo = dati.get("agent_type") or ""
    if not tipo:  # agenti interni di Claude Code (suggerimenti, /btw): non sono lanci dello studio
        return 0
    modello, turni, strumenti, err_tr, ultimo = leggi_transcript(dati.get("agent_transcript_path"))
    if dati.get("last_assistant_message") is None:
        dati["last_assistant_message"] = ultimo
    mt = max_turns(tipo, dati.get("cwd"))
    e, classe, riga = esito(dati, mt, turni, err_tr)
    voce = {
        "ora": ora or time.strftime("%Y-%m-%dT%H:%M:%S%z"),
        "agente": tipo,
        "id": dati.get("agent_id"),
        "sessione": dati.get("session_id"),
        "modello": modello,
        "turni": turni,
        "strumenti": strumenti,
        "max_turns": mt,
        "esito": e,
        "ripresa": bool(dati.get("stop_hook_active")),  # fermata dopo un hook Stop che l'ha fatto ripartire: stesso lancio
    }
    if dati.get("_fonte"):
        voce["fonte"] = dati["_fonte"]
    if classe:
        voce["errore"] = classe
        voce["errore_riga"] = riga
    os.makedirs(DIR, mode=0o700, exist_ok=True)
    with open(os.path.join(DIR, "chiusure.jsonl"), "a", encoding="utf-8") as f:
        f.write(json.dumps(voce, ensure_ascii=False) + "\n")
    return 1


if __name__ == "__main__" and sys.argv[1:2] == ["--scan"]:  # da `agenti`: qui stampa e può fallire a voce
    print(scan(int(sys.argv[2]) if sys.argv[2:] else 7))
elif __name__ == "__main__":
    try:
        main()
    except BaseException:
        try:
            os.makedirs(DIR, mode=0o700, exist_ok=True)
            with open(os.path.join(DIR, "errori.log"), "a") as f:
                f.write(time.strftime("%Y-%m-%dT%H:%M:%S ") + traceback.format_exc(limit=3).replace("\n", " | ")[:600] + "\n")
        except BaseException:
            pass
    sys.exit(0)  # hook: sempre 0, anche se main() è fallito
