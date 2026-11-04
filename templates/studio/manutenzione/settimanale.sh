#!/bin/bash
# Manutenzione settimanale degli agenti (da lanciare a mano o da launchd/cron, vedi README.md).
# Il lavoro sta in settimanale.py: il codice scarica le fonti di fonti.md, un modello SENZA strumenti propone le voci,
# il codice le controlla (la citazione deve comparire nella pagina) e le scrive nei playbook. Report in manutenzione/report/.
# Prova senza agenti: DRY=1 bash settimanale.sh
set -uo pipefail
export PATH="$HOME/.local/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$PATH"
S="$HOME/.claude/studio"; M="$S/manutenzione"
D=$(date +%F); OUT="$M/report"; R="$OUT/$D.md"
mkdir -p "$OUT" "$M/higgs"; cd "$M" || exit 1; exec >>"$M/log.txt" 2>&1; echo "== $D $(date +%T) inizio"

python3 "$M/scadute.py" > "$M/scadute.txt"
if command -v higgs >/dev/null; then
  higgs model list --image > "$M/higgs/$D-image.txt" 2>&1; higgs model list --video > "$M/higgs/$D-video.txt" 2>&1
  PREV=$(ls "$M/higgs"/*-video.txt | grep -v "$D" | tail -1); PREVI=${PREV/-video/-image}
  { [ -n "$PREV" ] && diff "$PREVI" "$M/higgs/$D-image.txt"; [ -n "$PREV" ] && diff "$PREV" "$M/higgs/$D-video.txt"; } > "$M/higgs-diff.txt"
fi
[ -s "$M/higgs-diff.txt" ] || echo "(nessun cambiamento, primo giro o Higgsfield non installato)" > "$M/higgs-diff.txt"

if [ "${DRY:-0}" = 1 ]; then python3 "$M/settimanale.py" --dry; exit 0; fi

python3 "$M/settimanale.py" || { echo "settimanale.py fallito"; exit 1; }

[ -s "$R" ] || { echo "report non scritto"; exit 1; }
osascript -e "display notification \"Report in $R\" with title \"{{STUDIO}}: manutenzione agenti\"" 2>/dev/null
echo "== $D $(date +%T) fine"
