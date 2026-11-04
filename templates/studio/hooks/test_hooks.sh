#!/bin/bash
# Self-test degli hook dello studio: bash test_hooks.sh (deve stampare solo OK).
cd "$(dirname "$0")"; T=$(mktemp -d); fail=0
run(){ printf '{"cwd":"%s","tool_input":{"command":%s,"file_path":%s}}' "$T" "$(python3 -c 'import json,sys;print(json.dumps(sys.argv[1]))' "$2")" "$(python3 -c 'import json,sys;print(json.dumps(sys.argv[1]))' "$2")" | python3 $1 2>/dev/null; echo $?; }
chk(){ [ "$(run "$1" "$2")" = "$3" ] || { echo "FAIL: $1 «$2» atteso $3"; fail=1; }; }
H="deploy-con-qa.py"; R="rsync -rlt dist/ utente@host.example.com:public/"
chk $H "npm run build" 0; chk $H "rsync -a src/ dst/" 0; chk $H "rsync -r dist/ prod:public/" 2; chk $H "scp -r dist prod:/var/www" 2; chk $H "rsync -a ./a/ /Users/x/b/" 0; chk $H "rsync -r dist/ 'prod:public/'" 2; chk $H 'rsync -r dist/ "prod:public/"' 2; chk $H "rsync -r dist/ rsync://host/mod" 2; chk $H "$R" 2; chk $H "vercel --prod" 2; chk $H "touch .qa-approvato" 2
touch "$T/.qa-approvato"; chk $H "$R" 0; touch -t 202001010000 "$T/.qa-approvato"; chk $H "$R" 2
chk "solo-playbook.py delivery-qa" "$HOME/.claude/studio/playbooks/delivery-qa.md" 0
chk "solo-playbook.py delivery-qa" "/tmp/x.html" 2
chk $H "/progetto/.qa-approvato" 2
L=$(printf 'parola %.0s' $(seq 320))
[ "$(echo "{\"last_assistant_message\":\"$L\"}" | python3 resoconto-corto.py 2>/dev/null; echo $?)" = 2 ] || { echo "FAIL: resoconto lungo non bloccato"; fail=1; }
[ "$(echo '{"last_assistant_message":"ok"}' | python3 resoconto-corto.py; echo $?)" = 0 ] || { echo "FAIL: resoconto corto bloccato"; fail=1; }
rm -rf "$T"; [ $fail = 0 ] && echo OK
