#!/usr/bin/env python3
# PreToolUse (Bash) per web-engineer: niente deploy in produzione senza l'approvazione di delivery-qa.
# L'approvazione è il file `.qa-approvato` nella cartella del progetto, scritto dal lead (non dall'agente)
# dopo il verdetto APPROVATO di delivery-qa e l'ok di Mario. Vale 24 ore.
# shortcut: riconosce i deploy più comuni (rsync/scp/sftp/lftp verso un host remoto o un alias SSH, CLI con --prod); un deploy dentro uno script o fatto in altro modo non viene visto. Upgrade se si aggiunge un hosting nuovo.
import json, os, re, sys, time

MARKER = ".qa-approvato"
data = json.load(sys.stdin)
cmd = data.get("tool_input", {}).get("command", "")

if MARKER in cmd or data.get("tool_input", {}).get("file_path", "").endswith(MARKER):
    print("L'approvazione al deploy la scrive solo il lead, dopo delivery-qa e l'ok di Mario.", file=sys.stderr)
    sys.exit(2)

# destinazione remota: [utente@]host:percorso, anche con un alias SSH senza punto (es. "prod:public/")
remote = r"(\S+@)?[A-Za-z0-9][\w.-]*:(?!//)\S*"
deploy = (re.search(r"\b(rsync|scp)\b.*\s['\"]?(" + remote + r"|rsync://)", cmd)
          or re.search(r"\b(sftp|lftp)\b", cmd)
          or re.search(r"\b(vercel|netlify|firebase|wrangler)\b.*(--prod|deploy)", cmd))
if not deploy:
    sys.exit(0)

cwd = data.get("cwd") or os.getcwd()
dirs = {cwd} | {d.strip() for _, d in re.findall(r"\bcd\s+(['\"]?)([^'\";&]+)\1", cmd)}
for d in dirs:
    p = os.path.join(os.path.expanduser(d), MARKER)
    if os.path.exists(p) and time.time() - os.path.getmtime(p) < 24 * 3600:
        sys.exit(0)

print("Deploy bloccato: manca l'approvazione di delivery-qa (file .qa-approvato nel progetto, meno di 24 ore). "
      "Prepara la build e chiedi nel resoconto il controllo di delivery-qa e l'ok di Mario.", file=sys.stderr)
sys.exit(2)
