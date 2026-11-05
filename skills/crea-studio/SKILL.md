---
name: crea-studio
description: Installa e personalizza studio-kit nel ~/.claude/ dell'utente, dopo poche domande (nome dello studio, chi decide, lingua, gusto). Copia 24 agenti coordinati da studio-lead, le regole dello studio, i playbook, i benchmark, i controlli automatici (hook), le cartelle progetto che si preparano da sole, il collaudo e la manutenzione degli agenti, 35 skill di mestiere e l'atlante culturale, senza sovrascrivere niente senza chiedere. Usala quando l'utente dice «crea il mio studio», «installa il team», «configura studio-kit» o vuole aggiornare un'installazione esistente.
---

# Crea il tuo studio

Questa skill copia i modelli del kit nel `~/.claude/` dell'utente e li personalizza. Non tocca nulla che esiste già senza chiedere.

I modelli stanno nella cartella del plugin, in `templates/`. Per trovarla: leggi `~/.claude/plugins/installed_plugins.json` e prendi il campo `installPath` della voce `studio-kit@studio-kit` (è la versione installata, anche se in cache ce ne sono altre). Solo se il file non c'è, usa `${CLAUDE_PLUGIN_ROOT}/templates/` o, in ultima istanza, la cartella `templates` più recente sotto `~/.claude/plugins/cache/studio-kit/`.

**Lo studio è già installato?** Se `~/.claude/studio/STUDIO.md` esiste, non rifare l'installazione: vai direttamente alla sezione «Aggiornare un'installazione».

## 1. Intervista (una domanda alla volta, in modo semplice)

1. Come si chiama lo studio? → `{{STUDIO}}`; ricava `{{STUDIO_SLUG}}` (minuscolo, trattini, senza spazi). Mostralo e fallo confermare.
2. Chi decide nello studio (nome)? → `{{TITOLARE}}`.
3. In una o due righe: cosa fa lo studio, per chi? → `{{DESCRIZIONE}}`.
4. In che lingua devono rispondere gli agenti? (default: «italiano semplice») → `{{LINGUA}}`.
5. Il titolare ha altre attività o aziende da tenere separate? (elenco o «nessuna») → `{{ALTRE_ATTIVITA}}`.
6. Canale per gli alert urgenti? (Telegram, Slack, email, nessuno) → `{{CANALE_NOTIFICHE}}`.
7. Il gusto dello studio, per il `CONTEXT.md` del proprio brand: registro, riferimenti amati, cose vietate, colori. Se l'utente non sa rispondere ora, lascia l'esempio e dillo.
8. In quale cartella tieni i progetti dei clienti? (default: `~/Progetti`) → la cartella dei progetti (passo 3b). Ogni cartella creata lì dentro e aperta con Claude diventa un progetto cliente. Se l'utente non la vuole, salta il passo 3b.

## 2. Controllo prima di scrivere

- Elenca cosa esiste già con lo stesso nome dei modelli in `~/.claude/agents/`, `~/.claude/skills/` e `~/.claude/studio/` (compreso `clients/{{STUDIO_SLUG}}/CONTEXT.md`).
- Se c'è sovrapposizione, mostra l'elenco raggruppato (agenti, skill, studio) e chiedi **una volta per gruppo**: **salta** quei file, **sovrascrivi** (prima una copia `.bak` di ciascuno), **scegli file per file**, o **annulla** tutto. Mai sovrascrivere in silenzio: sono il lavoro e la memoria dell'utente.
- **I playbook esistenti non si sovrascrivono mai**, nemmeno se l'utente sceglie «sovrascrivi»: si saltano e lo dici.

## 3. Copia e personalizza

Per ogni file dei modelli, sostituisci i segnaposto (`{{STUDIO}}`, `{{STUDIO_SLUG}}`, `{{TITOLARE}}`, `{{DESCRIZIONE}}`, `{{LINGUA}}`, `{{ALTRE_ATTIVITA}}`, `{{CANALE_NOTIFICHE}}`) e scrivi in:

| Da `templates/` | A |
|---|---|
| `agents/*.md` | `~/.claude/agents/` |
| `skills/*/` | `~/.claude/skills/` |
| `studio/STUDIO.md`, `studio/nuovo-cliente.sh`, `studio/playbooks/`, `studio/benchmarks/`, `studio/hooks/`, `studio/collaudo/`, `studio/manutenzione/` | `~/.claude/studio/` (stessa struttura) |
| `studio/clients/_esempio/CONTEXT.md` | due copie: `~/.claude/studio/clients/_esempio/CONTEXT.md` (identica, come modello) e `~/.claude/studio/clients/{{STUDIO_SLUG}}/CONTEXT.md`, dove metti il nome dello studio nel titolo, la descrizione (domanda 3) in «Chi è» e **sostituisci** gli esempi di «Gusto e regole visive» con le risposte della domanda 7 (se non ha risposto, lascia gli esempi e scrivi in testa «da compilare») |

Usa uno script (es. Python) che legga ogni file, sostituisca e scriva: non a mano file per file. I file che non sono testo UTF-8 (font, immagini) si copiano byte per byte, senza sostituzioni. Dopo:

- rendi eseguibili gli script (`chmod +x` su `studio/hooks/*.py`, `studio/hooks/*.sh`, `studio/nuovo-cliente.sh`, `studio/collaudo/collaudo.sh`, `studio/manutenzione/*.sh`, `studio/manutenzione/scadute.py`);
- verifica con grep che in `~/.claude/agents/`, `~/.claude/studio/` e nelle skill copiate non resti nessuno dei segnaposto dell'intervista (`grep -rE '\{\{(STUDIO|STUDIO_SLUG|TITOLARE|DESCRIZIONE|LINGUA|ALTRE_ATTIVITA|CANALE_NOTIFICHE)\}\}'`; le graffe del codice React nelle skill HyperFrames sono normali);
- lancia `bash ~/.claude/studio/hooks/test_hooks.sh`: deve stampare solo `OK`. Se fallisce, dillo all'utente: i cancelli automatici degli agenti `web-engineer` e `delivery-qa` non funzionerebbero.

## 3b. Cartelle progetto

Con la risposta 8: crea la cartella se non c'è. Se c'è già e contiene sottocartelle, elencale e avvisa: ognuna, aperta con Claude, diventerà un progetto cliente (a meno che abbia già un `CLAUDE.md`); se dentro ci sono repository di codice o altro che non è un cliente, meglio scegliere una cartella dedicata. Poi **mostra all'utente la modifica a `~/.claude/settings.json` e chiedi un sì** (prima fai una copia `settings.json.bak`). Con uno script Python che legge il JSON e lo riscrive:

- in `hooks.SessionStart` aggiungi `{"hooks": [{"type": "command", "command": "bash \"<HOME>/.claude/studio/hooks/cartella-cliente.sh\" \"<cartella dei progetti>\""}]}`, con percorsi assoluti; se c'è già una voce con `cartella-cliente.sh`, sostituiscila;
- in `permissions.additionalDirectories` aggiungi `<HOME>/.claude/studio` e la cartella dei progetti; in `permissions.allow` aggiungi `Read(/<HOME>/.claude/studio/**)`, `Read(/<cartella dei progetti>/**)`, `Edit(/<cartella dei progetti>/**)`, `Edit(/<HOME>/.claude/studio/playbooks/**)` e `Edit(/<HOME>/.claude/studio/clients/**)` (il percorso assoluto comincia già con `/`, quindi la regola ha `//`). Così gli agenti aggiornano playbook e contesti da qualunque progetto senza chiedere, mentre regole, hook e script dello studio continuano a chiedere conferma: non dare `Edit` su tutto `~/.claude/studio`.

Da lì in poi: cartella nuova dentro la cartella dei progetti → la si apre con Claude (Terminale o app Desktop, sezione Code) → l'hook la prepara (collegamento agli agenti, `CLAUDE.md` che carica solo `studio/clients/<sigla>/CONTEXT.md`, creato vuoto se il cliente è nuovo) e dalla sessione dopo Claude parte come `studio-lead`. La sigla del cliente si ricava dal nome della cartella (minuscole, trattini, senza accenti). Se esiste già un cliente con la stessa parola iniziale, l'hook non decide da solo: Claude chiede se è lo stesso. A mano: `bash ~/.claude/studio/nuovo-cliente.sh "<cartella>" <sigla>`.

## 4. Dipendenze

Gli agenti nominano anche skill di terzi. Controlla quali mancano: cartelle in `~/.claude/skills/` e plugin elencati in `~/.claude/plugins/installed_plugins.json` (o con `claude plugin list`). Proponi all'utente i comandi; **qui, durante l'installazione, non installare nulla senza un sì** (la frase di `STUDIO.md` «li usi senza chiedere» vale per gli agenti al lavoro, dopo che gli strumenti sono stati installati):

- **Higgsfield** (foto, video, audio AI): CLI `npm i -g @higgsfield/cli` poi `higgs auth login`; skill ufficiali `npx skills add higgsfield-ai/skills -g -a claude-code`; skill di prompt esperti `git clone https://github.com/OSideMedia/higgsfield-ai-prompt-skill ~/.claude/skills/higgsfield`. Serve un account Higgsfield a pagamento.
- **HyperFrames** (video da HTML, per `motion-video`; le 4 skill sono già nel kit): CLI `npm i -g hyperframes@0.9.10 --ignore-scripts`, poi `hyperframes telemetry disable`. Proponi di aggiungere in `~/.claude/settings.json`: `env` con `HYPERFRAMES_NO_TELEMETRY=1` e `DO_NOT_TRACK=1`, e in `permissions.deny` i comandi che caricano il progetto fuori o cambiano versione: `Bash(hyperframes cloud*)`, `Bash(hyperframes publish*)`, `Bash(hyperframes lambda*)`, `Bash(hyperframes cloudrun*)`, `Bash(hyperframes play*)`, `Bash(hyperframes present*)`, `Bash(hyperframes upgrade*)`, `Bash(hyperframes login*)`, `Bash(hyperframes *heygen*)` (e le stesse con `npx hyperframes`).
- Plugin Claude Code: `/plugin install <nome>@<marketplace>` dopo `/plugin marketplace add <repo>`, con i repository elencati nel README.
- Gli altri (design, sviluppo, ricerca) sono elencati nel `README.md` del kit, sezione «Requisiti e dipendenze». Senza di loro gli agenti funzionano lo stesso: usano gli strumenti di base.

## 5. Chiudi

Riassumi in poche righe: cosa è stato installato, cosa è stato saltato, quali dipendenze mancano, l'esito del test degli hook, la cartella dei progetti, e il prossimo passo: «Riavvia Claude Code, crea la cartella del primo cliente dentro la cartella dei progetti e aprila con Claude; oppure chiedi a `studio-lead` il primo lavoro». Ricorda di compilare `~/.claude/studio/benchmarks/listino.md` prima di fare preventivi. Due cose sono facoltative e non partono da sole: il collaudo degli agenti (`studio/collaudo/README.md`) e la manutenzione settimanale (`studio/manutenzione/README.md`, con l'esempio per launchd); entrambe usano il piano Claude dell'utente, quindi non lanciarle senza un sì.

## Aggiornare un'installazione

1. **Le risposte non si richiedono:** ricavale dall'installazione esistente. `{{STUDIO}}` dal titolo di `~/.claude/studio/STUDIO.md` (prima di « — Standard operativi»); `{{DESCRIZIONE}}` dalla prima riga di «Chi siamo»; `{{TITOLARE}}`, `{{LINGUA}}`, `{{ALTRE_ATTIVITA}}`, `{{CANALE_NOTIFICHE}}` dalla sezione «Configurazione»; `{{STUDIO_SLUG}}`: la cartella di `~/.claude/studio/clients/` il cui `CONTEXT.md` ha come titolo il nome dello studio (con le cartelle progetto i clienti sono tanti: non prendere la prima che trovi; se non sei sicuro, chiedilo). Se qualcosa non si trova, chiedi solo quello.
2. **Confronta** ogni modello (con i segnaposto già sostituiti) con il file installato e dividi in tre gruppi: **uguali**, **diversi**, **nuovi nel kit** (mancano nell'installazione). Sono compresi `studio/hooks/`, `studio/collaudo/` e `studio/manutenzione/`: se l'installazione viene da una versione senza queste cartelle, finiscono tutte fra i «nuovi».
3. **Mostra il riepilogo** con i numeri dei tre gruppi. Se diversi e nuovi sono zero, di' «lo studio è già aggiornato» e fermati.
4. **Diversi:** mostra le differenze file per file e aggiorna solo quelli che l'utente approva (la skill non sa quali file l'utente ha modificato: chiedi sempre; prima di sovrascrivere, copia `.bak`). **Nuovi:** elencali e chiedi se aggiungerli.
5. **I playbook dell'utente non si sovrascrivono mai**: sono la sua memoria. Proponi solo di aggiungere in fondo i pattern nuovi del kit che mancano (confronta per titolo, ignorando la data: se c'è già una voce con lo stesso titolo, salta). Lo stesso vale per `collaudo/storico.md`, `collaudo/risultati/`, `manutenzione/fonti.md` (l'utente l'ha adattato) e per tutto ciò che la manutenzione ha scritto (`log.txt`, `report/`, `higgs/`).
6. **Dopo l'aggiornamento** rifai il controllo dei `{{` e lancia di nuovo `test_hooks.sh`.
7. **Cartelle progetto:** se in `~/.claude/settings.json` non c'è un hook con `cartella-cliente.sh`, fai la domanda 8 e il passo 3b.

Se in `installed_plugins.json` la voce `studio-kit@studio-kit` ha più installazioni (es. utente e progetto), usa quella con `scope` uguale a `user`; se non c'è, la più recente.
