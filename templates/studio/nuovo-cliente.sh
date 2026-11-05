#!/usr/bin/env bash
# Prepara la cartella di un progetto cliente, ovunque sia: il team (collegamento agli agenti) e un CLAUDE.md
# che carica solo il contesto di quel cliente. Uso: bash nuovo-cliente.sh "percorso/ROSSI CAFFÈ SRL" rossi
# Il secondo argomento è il nome della cartella in clients/ (viene creata se manca).
set -euo pipefail
[ $# -eq 2 ] || { echo "Uso: bash nuovo-cliente.sh \"CARTELLA DEL PROGETTO\" sigla"; exit 1; }
S="$(cd "$(dirname "$0")" && pwd)"; DIR="$1"; SIGLA="$2"; case "$DIR" in /*) ;; *) DIR="$PWD/$DIR";; esac; N="$(basename "$DIR")"
mkdir -p "$DIR/.claude" "$S/clients/$SIGLA"
[ -f "$S/clients/$SIGLA/CONTEXT.md" ] || printf '# %s — contesto\n\nDa compilare: chi è, cosa vende, decisioni ferme, materiali.\n' "$N" > "$S/clients/$SIGLA/CONTEXT.md"
[ -e "$DIR/.claude/agents" ] || ln -s "$HOME/.claude/agents" "$DIR/.claude/agents"
# La sessione principale parte come studio-lead: il direttore che chiama il team. Per lavorare senza, togli questo file.
[ -e "$DIR/.claude/settings.json" ] || printf '{\n  "agent": "studio-lead"\n}\n' > "$DIR/.claude/settings.json"
if [ -e "$DIR/CLAUDE.md" ]; then echo "  CLAUDE.md esiste già in $N: non lo tocco"; else cat > "$DIR/CLAUDE.md" <<EOF
# $N

Cartella del cliente $N. Lavora qui con il team {{STUDIO}} (agenti in \`.claude/agents\`, regole in \`~/.claude/studio/STUDIO.md\`).
Il cliente è \`$SIGLA\`: nei brief agli agenti indica sempre \`clients/$SIGLA/CONTEXT.md\`. Non caricare il contesto degli altri clienti.

@~/.claude/studio/clients/$SIGLA/CONTEXT.md
EOF
fi
echo "Pronto: $DIR"
