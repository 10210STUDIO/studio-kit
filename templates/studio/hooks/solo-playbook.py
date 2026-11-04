#!/usr/bin/env python3
# PreToolUse per gli agenti che giudicano: possono scrivere solo nel proprio playbook.
# shortcut: Bash non è coperto (servirebbe un parser dei comandi); la regola su Bash sta scritta nel file agente. Upgrade se un QA scrive fuori dal playbook.
# Uso nel frontmatter: command: "python3 ~/.claude/studio/hooks/solo-playbook.py <nome-agente>"
import json, os, sys

agent = sys.argv[1]
path = json.load(sys.stdin).get("tool_input", {}).get("file_path", "")
allowed = os.path.realpath(os.path.expanduser(f"~/.claude/studio/playbooks/{agent}.md"))
if os.path.realpath(os.path.expanduser(path)) != allowed:
    print(f"{agent} non corregge: puoi scrivere solo in {allowed}. Elenca la correzione nel resoconto.", file=sys.stderr)
    sys.exit(2)
