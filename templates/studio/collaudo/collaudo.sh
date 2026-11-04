#!/bin/bash
# Collaudo degli agenti: ogni brief in brief/ va all'agente nel nome del file, poi delivery-qa giudica con rubrica.md.
# Uso: bash collaudo.sh [etichetta]   → risultati in risultati/<data>-<etichetta>/ e una riga per brief in storico.md
# Da rifare dopo ogni modifica importante agli agenti, e confrontare con le righe precedenti dello storico.
set -uo pipefail
export PATH="$HOME/.local/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$PATH"
C="$(cd "$(dirname "$0")" && pwd)"; L="${1:-giro}"; OUT="$C/risultati/$(date +%F)-$L"; mkdir -p "$OUT"
TOOLS="Read,Glob,Grep,WebSearch,WebFetch,Skill,Bash(higgs model *),Edit(${OUT/#$HOME/~}/**)"

for B in "$C"/brief/*.md; do
  N=$(basename "$B" .md); A=${N#*-}
  ( printf 'PROVA DI COLLAUDO DELLO STUDIO. Non aggiornare il playbook, non generare immagini o video, non contattare nessuno. Scrivi il deliverable SOLO nel file %s/%s.md, poi un resoconto breve.\n\n%s\n' "$OUT" "$N" "$(cat "$B")" \
    | claude -p --agent "$A" --permission-mode acceptEdits --allowedTools="$TOOLS" > "$OUT/$N.resoconto.txt" 2>&1 ) &
done
wait

printf 'GIUDIZIO DI COLLAUDO. Non aggiornare il playbook e non scrivere file: rispondi solo nel messaggio finale. Rubrica: %s/rubrica.md. Per ogni brief in %s/brief/ c'"'"'è l'"'"'elaborato con lo stesso nome in %s/ (il .md; il .resoconto.txt è il resoconto dell'"'"'agente: giudica anche la regola 5 su quello). Dai voti e difetti come chiede la rubrica, poi chiudi con una riga per brief esattamente nel formato: | <AAAA-MM-GG> | %s | <brief> | b f u p r | totale |\n' "$C" "$C" "$OUT" "$L" \
  | claude -p --agent delivery-qa --allowedTools="Read,Glob,Grep,WebSearch,WebFetch" > "$OUT/voti.md" 2>&1
grep -E '^\| [0-9]{4}-' "$OUT/voti.md" >> "$C/storico.md"
echo "Fatto: $OUT"; tail -8 "$C/storico.md"
