#!/bin/bash
# Manutenzione settimanale degli agenti (da lanciare a mano o da launchd/cron, vedi README.md).
# 1) insight-research verifica fonti.md + voci scadute + catalogo Higgsfield (se presente) e scrive il report;
# 2) ogni agente citato nel report aggiorna il proprio playbook.
# Sicurezza: gira senza nessuno davanti e legge il web → niente Bash libera, curl, python o gh; scrive solo il report e il proprio playbook.
# Prova senza agenti: DRY=1 bash settimanale.sh
set -uo pipefail
export PATH="$HOME/.local/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$PATH"
S="$HOME/.claude/studio"; M="$S/manutenzione"
D=$(date +%F); OUT="$M/report"; R="$OUT/$D.md"
REPORT_GLOB="${OUT/#$HOME/~}/**"; mkdir -p "$OUT" "$M/higgs"; cd "$M" || exit 1; exec >>"$M/log.txt" 2>&1; echo "== $D $(date +%T) inizio"

python3 "$M/scadute.py" > "$M/scadute.txt"
if command -v higgs >/dev/null; then
  higgs model list --image > "$M/higgs/$D-image.txt" 2>&1; higgs model list --video > "$M/higgs/$D-video.txt" 2>&1
  PREV=$(ls "$M/higgs"/*-video.txt | grep -v "$D" | tail -1); PREVI=${PREV/-video/-image}
  { [ -n "$PREV" ] && diff "$PREVI" "$M/higgs/$D-image.txt"; [ -n "$PREV" ] && diff "$PREV" "$M/higgs/$D-video.txt"; } > "$M/higgs-diff.txt"
fi
[ -s "$M/higgs-diff.txt" ] || echo "(nessun cambiamento, primo giro o Higgsfield non installato)" > "$M/higgs-diff.txt"

if [ "${DRY:-0}" = 1 ]; then echo "DRY: preparati scadute.txt e higgs-diff.txt"; exit 0; fi

TOOLS="Read,Glob,Grep,WebSearch,WebFetch,Skill,Bash(higgs model list *),Edit($REPORT_GLOB)"
claude -p --agent insight-research --permission-mode acceptEdits --allowedTools="$TOOLS" "MANUTENZIONE SETTIMANALE dello studio ($D). Leggi STUDIO.md e il tuo playbook (scala di tenacia, [P]/[S]). Controlla:
1) le fonti in $M/fonti.md: cosa è cambiato negli ultimi 7 giorni che tocca un agente;
2) le voci scadute in $M/scadute.txt: sono ancora vere sulla fonte primaria?
3) il cambio del catalogo Higgsfield in $M/higgs-diff.txt.
Scrivi $R. Per ogni agente da aggiornare una sezione che inizia esattamente con '## agente: <nome-agente>' e contiene le voci pronte nel formato di STUDIO.md (data $D, fonte [P] con URL, Quando non vale) oppure la voce da cancellare perché smentita. Solo fatti letti sulla fonte primaria; il resto in una sezione finale '## Da verificare'. Se non c'è nulla, scrivi '## Nessuna novità'. Non modificare playbook o agenti."

AGENTI=$(grep -E '^## agente: ' "$R" 2>/dev/null | sed 's/## agente: //' | tr -d ' ' | sort -u | tr '\n' ' ')
echo "report: $R ($(wc -c < "$R" 2>/dev/null || echo 0) byte); agenti da aggiornare: ${AGENTI:-nessuno}"
for A in $AGENTI; do
  echo "applico a $A"
  [ -f "$HOME/.claude/agents/$A.md" ] || { echo "agente sconosciuto: $A"; continue; }
  claude -p --agent "$A" --permission-mode acceptEdits --allowedTools="Read,Glob,Grep,Edit(${S/#$HOME/~}/playbooks/$A.md)" "MANUTENZIONE SETTIMANALE ($D). Nel report $R c'è la sezione '## agente: $A' con voci verificate da insight-research. Applicale al TUO playbook ($S/playbooks/$A.md) secondo STUDIO.md: aggiungi, sostituisci o cancella le voci; pota sopra 150 righe. Se una voce cambia il tuo metodo, non toccare il file agente: scrivi la proposta nel resoconto. Resoconto max 80 parole." >> "$R.applicato.txt"
done

[ -s "$R" ] || { echo "report non scritto"; exit 1; }
osascript -e "display notification \"Report in $R\" with title \"{{STUDIO}}: manutenzione agenti\"" 2>/dev/null
echo "== $D $(date +%T) fine"
