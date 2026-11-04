# Manutenzione settimanale

Tiene vivi i playbook. Ogni lunedì `settimanale.py`:
1. scarica le pagine elencate in `fonti.md` (solo quei domini, solo https, anche dopo i redirect: il modello non sceglie gli indirizzi);
2. le passa a un modello che gira **senza strumenti**, dentro blocchi `<untrusted>` che il testo del web non può chiudere;
3. accetta una voce solo se: l'agente è il proprietario di quella fonte in `fonti.md`; la citazione (almeno 8 parole, con un numero, una data o una versione) compare parola per parola nella pagina; il testo, già normalizzato, non ha link, domini, comandi, istruzioni, a capo, formattazione o caratteri invisibili; al massimo 15 voci per giro;
4. scrive le voci accettate nei playbook in formato fisso; le altre e le voci più vecchie di 90 giorni (`scadute.py`) vanno nel report in `report/`.

Perché così: lo script gira senza nessuno davanti e legge pagine web; un agente con strumenti potrebbe seguire istruzioni nascoste in una pagina. Schema ripreso da [harvey](https://github.com/ethanplusai/harvey) (`untrusted.py`, `gate.py`, `claude_runtime.py`). Resta un limite: se una fonte ufficiale scrive una cosa sbagliata, la voce entra lo stesso. Il diff dei playbook va guardato.

- Prova senza modello (scarica solo le pagine): `DRY=1 bash ~/.claude/studio/manutenzione/settimanale.sh`
- Test dei controlli: `python3 ~/.claude/studio/manutenzione/settimanale.py --test`
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
