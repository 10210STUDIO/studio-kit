---
name: crea-studio
description: Installa e personalizza studio-kit nel ~/.claude/ dell'utente, dopo poche domande (nome dello studio, chi decide, lingua, gusto). Copia 24 agenti coordinati da studio-lead, le regole dello studio, i playbook, 35 skill di mestiere e l'atlante culturale, senza sovrascrivere niente senza chiedere. Usala quando l'utente dice «crea il mio studio», «installa il team», «configura studio-kit» o vuole aggiornare un'installazione esistente.
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
| `studio/STUDIO.md`, `studio/playbooks/`, `studio/benchmarks/` | `~/.claude/studio/` |
| `studio/clients/_esempio/CONTEXT.md` | due copie: `~/.claude/studio/clients/_esempio/CONTEXT.md` (identica, come modello) e `~/.claude/studio/clients/{{STUDIO_SLUG}}/CONTEXT.md`, dove metti il nome dello studio nel titolo, la descrizione (domanda 3) in «Chi è» e **sostituisci** gli esempi di «Gusto e regole visive» con le risposte della domanda 7 (se non ha risposto, lascia gli esempi e scrivi in testa «da compilare») |

Usa uno script (es. Python) che legga ogni file, sostituisca e scriva: non a mano file per file. Dopo, verifica con grep che in `~/.claude/agents/`, `~/.claude/studio/` e nelle skill copiate non resti nessun `{{`.

## 4. Dipendenze

Gli agenti nominano anche skill di terzi. Controlla quali mancano: cartelle in `~/.claude/skills/` e plugin elencati in `~/.claude/plugins/installed_plugins.json` (o con `claude plugin list`). Proponi all'utente i comandi; **qui, durante l'installazione, non installare nulla senza un sì** (la frase di `STUDIO.md` «li usi senza chiedere» vale per gli agenti al lavoro, dopo che gli strumenti sono stati installati):

- **Higgsfield** (foto, video, audio AI): CLI `npm i -g @higgsfield/cli` poi `higgs auth login`; skill ufficiali `npx skills add higgsfield-ai/skills -g -a claude-code`; skill di prompt esperti `git clone https://github.com/OSideMedia/higgsfield-ai-prompt-skill ~/.claude/skills/higgsfield`. Serve un account Higgsfield a pagamento.
- Plugin Claude Code: `/plugin install <nome>@<marketplace>` dopo `/plugin marketplace add <repo>`, con i repository elencati nel README.
- Gli altri (design, sviluppo, ricerca) sono elencati nel `README.md` del kit, sezione «Requisiti e dipendenze». Senza di loro gli agenti funzionano lo stesso: usano gli strumenti di base.

## 5. Chiudi

Riassumi in poche righe: cosa è stato installato, cosa è stato saltato, quali dipendenze mancano, e il prossimo passo: «Riavvia Claude Code, poi chiedi a `studio-lead` il primo lavoro». Ricorda di compilare `~/.claude/studio/benchmarks/listino.md` prima di fare preventivi.

## Aggiornare un'installazione

1. **Le risposte non si richiedono:** ricavale dall'installazione esistente. `{{STUDIO}}` dal titolo di `~/.claude/studio/STUDIO.md` (prima di « — Standard operativi»); `{{DESCRIZIONE}}` dalla prima riga di «Chi siamo»; `{{TITOLARE}}`, `{{LINGUA}}`, `{{ALTRE_ATTIVITA}}`, `{{CANALE_NOTIFICHE}}` dalla sezione «Configurazione»; `{{STUDIO_SLUG}}` dal nome della cartella in `~/.claude/studio/clients/` diversa da `_esempio`. Se qualcosa non si trova, chiedi solo quello.
2. **Confronta** ogni modello (con i segnaposto già sostituiti) con il file installato e dividi in tre gruppi: **uguali**, **diversi**, **nuovi nel kit** (mancano nell'installazione).
3. **Mostra il riepilogo** con i numeri dei tre gruppi. Se diversi e nuovi sono zero, di' «lo studio è già aggiornato» e fermati.
4. **Diversi:** mostra le differenze file per file e aggiorna solo quelli che l'utente approva (la skill non sa quali file l'utente ha modificato: chiedi sempre; prima di sovrascrivere, copia `.bak`). **Nuovi:** elencali e chiedi se aggiungerli.
5. **I playbook dell'utente non si sovrascrivono mai**: sono la sua memoria. Proponi solo di aggiungere in fondo i pattern nuovi del kit che mancano.

Se in `installed_plugins.json` la voce `studio-kit@studio-kit` ha più installazioni (es. utente e progetto), usa quella con `scope` uguale a `user`; se non c'è, la più recente.
