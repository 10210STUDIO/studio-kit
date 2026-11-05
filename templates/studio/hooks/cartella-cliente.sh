#!/usr/bin/env bash
# SessionStart: se Claude parte in una cartella nuova dentro la cartella dei progetti ($1, scelta all'installazione),
# la prepara come progetto cliente (team, contesto, studio-lead come direttore). Fuori da lì non fa niente.
R="${1%/}"; D="${CLAUDE_PROJECT_DIR:-$PWD}"; N="$(basename "$D")"; S="$(cd "$(dirname "$0")/.." && pwd)"
[ -n "$R" ] && [ "$(dirname "$D")" = "$R" ] && [ "$D" != "$S" ] && [ "$D" != "$(dirname "$S")" ] && [ "${N#.}" = "$N" ] && [ ! -e "$D/CLAUDE.md" ] || exit 0
case "$N" in *[[:cntrl:]]*) exit 0;; esac  # a capo o caratteri di controllo nel nome: non si tocca
SIGLA="$(printf '%s' "$N" | iconv -c -f UTF-8 -t ASCII//TRANSLIT 2>/dev/null | tr -d "\`'^~\"" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-' | sed 's/^-//;s/-$//')"
[ -n "$SIGLA" ] || { echo "La cartella «${N}» non è stata preparata: dal nome non si ricava una sigla. Se è un progetto cliente, chiedi all'utente la sigla e lancia: bash $S/nuovo-cliente.sh \"$D\" <sigla>"; exit 0; }
[ -f "$S/clients/$SIGLA/CONTEXT.md" ] && NUOVO="" || NUOVO=1
bash "$S/nuovo-cliente.sh" "$D" "$SIGLA" >/dev/null || exit 0
echo "Cartella progetto «${N}» preparata (cliente $SIGLA): team collegato, studio-lead farà da direttore dalla prossima sessione."
if [ -n "$NUOVO" ]; then
  echo "Il contesto ~/.claude/studio/clients/$SIGLA/CONTEXT.md è vuoto: prima di lavorare chiedi all'utente chi è il cliente, cosa vende e cosa serve, e compilalo."
  # Un cliente con la stessa parola iniziale esiste già: può essere lo stesso, ma non si decide da soli.
  P="${SIGLA%%-*}"; [ "$P" != "$SIGLA" ] && [ -d "$S/clients/$P" ] && echo "Esiste già il cliente «${P}»: chiedi all'utente se è lo stesso. Se sì, in CLAUDE.md usa clients/$P e cancella la cartella vuota clients/$SIGLA."
else echo "Contesto del cliente: leggi ~/.claude/studio/clients/$SIGLA/CONTEXT.md."; fi
exit 0
