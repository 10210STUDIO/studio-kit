# Manutenzione settimanale

Tiene vivi i playbook: ogni lunedì `insight-research` controlla le fonti di `fonti.md` e le voci più vecchie di 90 giorni (`scadute.py`), scrive un report in `report/`, e ogni agente citato aggiorna il proprio playbook.

- Prova senza agenti: `DRY=1 bash ~/.claude/studio/manutenzione/settimanale.sh`
- Test dell'elenco delle voci scadute: `python3 ~/.claude/studio/manutenzione/scadute.py --test`
- Giro vero: `bash ~/.claude/studio/manutenzione/settimanale.sh` (usa crediti del tuo piano Claude: provalo a mano una volta prima di automatizzarlo).
- Il giro modifica i playbook ma non fa commit: se versioni `~/.claude/studio/`, controlla il diff.
- `fonti.md` è un elenco di partenza: tieni solo le fonti che toccano i tuoi clienti e aggiungi le tue.

## Esempio per launchd (macOS)

Salva come `~/Library/LaunchAgents/studio.{{STUDIO_SLUG}}.manutenzione.plist`, sostituisci `IL-TUO-UTENTE` con il nome dell'utente del Mac (launchd non espande `~`), poi `launchctl load` sul file.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key><string>studio.{{STUDIO_SLUG}}.manutenzione</string>
  <key>ProgramArguments</key>
  <array>
    <string>/bin/bash</string>
    <string>/Users/IL-TUO-UTENTE/.claude/studio/manutenzione/settimanale.sh</string>
  </array>
  <key>StartCalendarInterval</key>
  <dict><key>Weekday</key><integer>1</integer><key>Hour</key><integer>8</integer><key>Minute</key><integer>0</integer></dict>
  <key>StandardOutPath</key><string>/Users/IL-TUO-UTENTE/.claude/studio/manutenzione/launchd.log</string>
  <key>StandardErrorPath</key><string>/Users/IL-TUO-UTENTE/.claude/studio/manutenzione/launchd.log</string>
</dict>
</plist>
```
