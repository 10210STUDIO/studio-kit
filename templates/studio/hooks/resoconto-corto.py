#!/usr/bin/env python3
# Stop hook degli agenti: se il resoconto finale supera 300 parole, l'agente deve accorciarlo (regola 15).
# Nel collaudo del 2026-11-04 la regola scritta non bastava: 5 resoconti su 6 erano fra 319 e 342 parole.
import json, sys

LIMITE = 300
data = json.load(sys.stdin)
if data.get("stop_hook_active"):  # ha già riscritto una volta: non bloccare di nuovo
    sys.exit(0)

testo = data.get("last_assistant_message")
if testo is None:  # versioni vecchie di Claude Code: leggi l'ultimo messaggio dal transcript
    try:
        testo = ""
        for riga in open(data["transcript_path"]):
            m = json.loads(riga)
            if m.get("type") == "assistant":
                t = "".join(p.get("text", "") for p in m.get("message", {}).get("content", [])
                            if isinstance(p, dict) and p.get("type") == "text")
                testo = t if t.strip() else testo
    except (KeyError, OSError, ValueError):
        sys.exit(0)

n = len(testo.split())
if n > LIMITE:
    print(f"Il resoconto ha {n} parole: il limite è {LIMITE} (regola 15 di STUDIO.md). Riscrivilo più corto, "
          "tenendo percorsi dei file, decisioni aperte, richieste per altri agenti e cosa non hai verificato.", file=sys.stderr)
    sys.exit(2)
