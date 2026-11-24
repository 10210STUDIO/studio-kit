#!/bin/bash
# Self-test di registro-agenti.py su transcript finti: bash test_registro.sh (deve stampare solo OK). HOME finta: il registro vero non si tocca.
cd "$(dirname "$0")"; H=$(mktemp -d); fail=0; mkdir -p "$H/.claude/agents"
printf -- '---\nname: finto\nmaxTurns: 5\n---\nmaxTurns: 99\n' > "$H/.claude/agents/finto.md"
tr(){ # $1 file, poi i messaggi: "E..." = errore API, "T" = solo tool_use, altro = testo
  o="$1"; : > "$o"; shift; i=0; for p in "$@"; do i=$((i+1))
    case $p in E*) printf '{"type":"assistant","isApiErrorMessage":true,"message":{"id":"e%s","model":"<synthetic>","content":[{"type":"text","text":"%s"}]}}\n' $i "${p#E}" ;;
      T) printf '{"type":"assistant","message":{"id":"m%s","model":"claude-sonnet-5","content":[{"type":"tool_use","name":"Bash","input":{}}]}}\n{"type":"user","message":{"content":[{"type":"tool_result"}]}}\n' $i ;;
      *) printf '{"type":"assistant","message":{"id":"m%s","model":"claude-sonnet-5","content":[{"type":"text","text":"%s"}]}}\n' $i "$p" ;;
    esac >> "$o"; done; }
caso(){ # $1 nome, $2 last_assistant_message, $3 esito atteso, $4 campo extra atteso (k=v) ; transcript già in $F
  out=$(printf '{"agent_type":"finto","agent_id":"x","agent_transcript_path":"%s","last_assistant_message":%s,"cwd":"/nonc"}' "$F" "$2" | HOME="$H" python3 registro-agenti.py; echo "rc=$?")
  [ "$out" = "rc=0" ] || { echo "FAIL $1: stdout o exit «${out}»"; fail=1; }
  got=$(tail -1 "$H/.claude/registro-agenti/chiusure.jsonl" | python3 -c 'import json,sys;d=json.load(sys.stdin);print(d["esito"],d.get("modello"),d["max_turns"],d.get("errore",""))')
  case "$got" in "$3"*) ;; *) echo "FAIL $1: «${got}» atteso «${3}»"; fail=1;; esac; }
F="$H/t.jsonl"
tr "$F" T "Fatto. File in out/a.md."; caso ok '"Fatto. File in out/a.md."' "ok claude-sonnet-5 5"
tr "$F" T T T T T; caso turni '""' "turni_finiti claude-sonnet-5 5"
tr "$F" T "EAPI Error: 400 failed to read request body"; caso err400 '"API Error: 400 failed to read request body"' "errore claude-sonnet-5 5 corpo_illeggibile"
tail -1 "$H/.claude/registro-agenti/chiusure.jsonl" | grep -q '"errore_riga": "API Error 400"}' || { echo "FAIL: errore_riga non ridotto a prefisso e codice"; fail=1; }
tr "$F" "EAPI Error: 401 OAuth token revoked"; caso err401 '""' "errore None 5 oauth_revocato"
tr "$F" "EAPI Error: 400 model opus not available on your deployment"; caso errmod '""' "errore None 5 modello_non_disponibile"
tr "$F" "EAPI Error: 529 overloaded" T "Fatto."; caso retry '"Fatto."' "ok"
tr "$F" T "Ho scritto il file e ora"; caso tronc '"Ho scritto il file e ora"' "troncato"
tr "$F" T; caso vuoto '""' "troncato"
tr "$F" T "Resoconto:"; caso duepunti '"Resoconto:"' "troncato"
# PostToolUse(Agent): SubagentStop non scatta a maxTurns, quindi la riga arriva da qui; mai doppia, mai per i lanci in background
mkdir -p "$H/s/subagents"; tr "$H/s/subagents/agent-pt1.jsonl" T T T T T
pt(){ printf '{"hook_event_name":"PostToolUse","transcript_path":"%s/s.jsonl","tool_input":{"subagent_type":"finto"},"tool_response":{"status":"%s","agentId":"%s","agentType":"finto"}}' "$H" "$1" "$2" | HOME="$H" python3 registro-agenti.py; }
n0=$(wc -l < "$H/.claude/registro-agenti/chiusure.jsonl"); pt completed pt1
tail -1 "$H/.claude/registro-agenti/chiusure.jsonl" | grep -q '"esito": "turni_finiti".*"fonte": "post_tool_use"' || { echo "FAIL: PostToolUse a maxTurns"; fail=1; }
pt completed pt1; pt async_launched pt2; pt completed x
[ $(wc -l < "$H/.claude/registro-agenti/chiusure.jsonl") = $((n0+1)) ] || { echo "FAIL: PostToolUse doppione o background registrato"; fail=1; }
# --scan: agente in background con turni finiti (nessun hook) recuperato dai transcript; non i vivi, non i vecchi, non i già visti, mai due volte
P="$H/.claude/projects/-Users-x/sess1/subagents"; mkdir -p "$P"
bg(){ tr "$P/agent-$1.jsonl" T T T T T; printf '{"agentType":"finto","finished":%s}' "$2" > "$P/agent-$1.meta.json"; }
bg bg1 true; bg vivo false; bg vecchio true; touch -t 202601010000 "$P/agent-vecchio.jsonl"; bg pt1 true
s1=$(HOME="$H" python3 registro-agenti.py --scan); s2=$(HOME="$H" python3 registro-agenti.py --scan)
[ "$s1 $s2" = "1 0" ] || { echo "FAIL scan: aggiunte «${s1} ${s2}» attese «1 0»"; fail=1; }
tail -1 "$H/.claude/registro-agenti/chiusure.jsonl" | grep -q '"id": "bg1", "sessione": "sess1".*"turni": 5.*"esito": "turni_finiti".*"fonte": "scan"' || { echo "FAIL: riga dello scan"; fail=1; }
# scan: un transcript di forma inattesa ("text": 5) si salta e lo scan recupera gli altri
bg arotto true; printf '{"type":"assistant","message":{"content":[{"type":"text","text":5}]}}\n' >> "$P/agent-arotto.jsonl"; bg zdopo true  # nomi in ordine: il rotto viene prima
s3=$(HOME="$H" python3 registro-agenti.py --scan 2>&1)
[ "$s3" = "1" ] && grep -q '"id": "zdopo"' "$H/.claude/registro-agenti/chiusure.jsonl" || { echo "FAIL scan con transcript rotto: «${s3}»"; fail=1; }
# errore «API Error» da 200 KB scritto dal modello: classificato in meno di 1 s (regex solo sui primi 300 caratteri)
python3 -c '
import importlib.util as u, time
s = u.spec_from_file_location("r", "registro-agenti.py"); r = u.module_from_spec(s); s.loader.exec_module(r)
t = time.time(); c = r.classe_errore("API Error: " + "model OAuth " * 17000); d = time.time() - t
assert d < 1 and c == "altro", (d, c)' || { echo "FAIL: errore da 200 KB lento"; fail=1; }
# input rotto, tipo con percorso, tipo vuoto: exit 0, niente stdout
for inp in 'non json' '{"agent_type":"../../etc/x","agent_transcript_path":"/nope"}' '{"agent_type":""}'; do
  out=$(echo "$inp" | HOME="$H" python3 registro-agenti.py; echo "rc=$?"); [ "$out" = "rc=0" ] || { echo "FAIL input «${inp}»: «${out}»"; fail=1; }; done
grep -q "JSONDecodeError\|Expecting value" "$H/.claude/registro-agenti/errori.log" || { echo "FAIL: errore non loggato"; fail=1; }
grep -q '"agente": ""' "$H/.claude/registro-agenti/chiusure.jsonl" && { echo "FAIL: agente interno registrato"; fail=1; }
grep -q "Fatto\|Ho scritto\|failed to read\|token revoked\|not available" "$H/.claude/registro-agenti/chiusure.jsonl" && { echo "FAIL: contenuto nel registro"; fail=1; }
rm -rf "$H"; [ $fail = 0 ] && echo OK
