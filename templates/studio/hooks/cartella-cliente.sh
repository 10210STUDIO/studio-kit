#!/usr/bin/env bash
# SessionStart: se Claude parte in una cartella nuova dentro la cartella dei progetti ($1, scelta all'installazione),
# la prepara come progetto cliente (team, contesto, studio-lead come direttore). Fuori da lì non fa niente.
R="${1%/}"; D="${CLAUDE_PROJECT_DIR:-$PWD}"; N="$(basename "$D")"; S="$(cd "$(dirname "$0")/.." && pwd)"
[ -n "$R" ] && [ "$(dirname "$D")" = "$R" ] && [ "$D" != "$S" ] && [ "$D" != "$(dirname "$S")" ] && [ "${N#.}" = "$N" ] && [ ! -e "$D/CLAUDE.md" ] || exit 0
SIGLA="$(printf '%s' "$N" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-' | sed 's/^-//;s/-$//')"
# Cliente che esiste già (la cartella «ROSSI CAFFÈ SRL» → clients/rossi): si usa il suo contesto.
[ -d "$S/clients/${SIGLA%%-*}" ] && SIGLA="${SIGLA%%-*}"
[ -f "$S/clients/$SIGLA/CONTEXT.md" ] && NUOVO="" || NUOVO=1
bash "$S/nuovo-cliente.sh" "$D" "$SIGLA" >/dev/null || exit 0
echo "Cartella progetto «${N}» preparata (cliente $SIGLA): team collegato, studio-lead farà da direttore dalla prossima sessione."
if [ -n "$NUOVO" ]; then echo "Il contesto ~/.claude/studio/clients/$SIGLA/CONTEXT.md è vuoto: prima di lavorare chiedi all'utente chi è il cliente, cosa vende e cosa serve, e compilalo."
else echo "Contesto del cliente: leggi ~/.claude/studio/clients/$SIGLA/CONTEXT.md."; fi
