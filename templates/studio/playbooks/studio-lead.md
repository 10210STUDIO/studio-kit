# Playbook — studio-lead

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-10-28] Riferimento citato per nome: controllare gli omonimi prima di analizzarlo

**Pattern:** quando il cliente cita un riferimento solo per nome ("come X"), cercare gli omonimi e fargli confermare quale intende, dentro il questionario e non con una domanda separata.
**Evidenza:** il nome di uno studio citato dal cliente corrispondeva sia a uno studio di branding sia a un'agenzia di creator TikTok. Registri opposti.
**Quando non vale:** quando il cliente dà un URL.
**Cliente/progetto:** generale

## [2026-10-28] Linguaggio visivo di un riferimento: lo screenshot, non il markup

**Pattern:** per giudicare tipografia, colore e layout di un sito di riferimento si fa uno screenshot (`npx playwright screenshot`, `npx playwright install chromium` se manca il browser). WebFetch restituisce il CSS della piattaforma che ospita la pagina, non quello del brand.
**Evidenza:** le pagine Awwwards e Behance di uno studio di riferimento hanno restituito font e colori di Awwwards e Behance (Inter Tight, #0057ff). Lo screenshot ha mostrato un sistema monocromatico con etichette in monospace.
**Quando non vale:** quando serve solo il testo (copy, servizi, clienti): lì WebFetch basta.
**Cliente/progetto:** generale

## [2026-10-28] Prima di promettere un dispatch, verificare di avere lo strumento

**Pattern:** a inizio task controllare che la sessione abbia lo strumento per lanciare sub-agenti. Se manca, dirlo subito a {{TITOLARE}} ed eseguire il pacchetto seguendo la definizione dell'agente (`~/.claude/agents/<nome>.md`) e il suo playbook, dichiarando che il giudizio non è indipendente.
**Evidenza:** una sessione di territori aveva solo strumenti di file, shell e web. Il pacchetto del creative-director è stato eseguito dal lead.
**Quando non vale:** nelle sessioni in cui lo strumento Agent/Task è disponibile.
**Cliente/progetto:** generale

## [2026-10-28] Board visive da HTML: pipeline e revisione

**Pattern:** board in HTML statico generato da un solo script Python (componenti per territorio), con export PNG tramite `npx playwright screenshot --full-page --wait-for-timeout=3500` e Google Fonts OFL. Per rivederle, Read rifiuta immagini oltre i 2000 px: ridurle con `sips --resampleHeight 1990` (i ritagli con `sips -c --cropOffset` non partono dove ci si aspetta). Il primo render ha sempre difetti: in questo caso un titolo uscito dal formato, superfici bianche senza bordo, una colonna che sfondava la griglia, gli spazi tra le parole schiacciati da un tracking troppo negativo.
**Evidenza:** quattro difetti trovati al primo render e corretti nel secondo.
**Quando non vale:** quando la direction è approvata e serve un layout di produzione, che passa a `ui-designer` e Figma.
**Cliente/progetto:** generale

## [2026-11-01] Lavoro di immagini AI: generare in parallelo, giudicare a tornate
**Pattern:** lanciare tutte le candidate in un solo script con thread (6 job alla volta), poi giudicare per tornate e rigenerare solo gli scarti. Con un tetto di 200 crediti, il budget realistico è circa 2 generate per ogni candidata tenuta (qui 23 generate per 12 tenute, 92 crediti). Se manca lo strumento per i sub-agenti, il giudizio del creative-director va eseguito come passaggio separato e dichiarato non indipendente.
**Evidenza:** due slot fotografici di un sito, tre tornate in circa 15 minuti di generazione.
**Quando non vale:** serie con volti ricorrenti, dove servono immagini di riferimento e più tornate.
**Cliente/progetto:** generale.

## [2026-11-04] ERRORE: senza lo strumento Agent il lead eseguiva i pacchetti da solo. Ora restituisce il piano e si ferma
**Pattern:** a inizio task controlla se hai lo strumento Agent. Da sotto-agente non ce l'hai mai, anche se è nella tua lista (provato il 2026-11-04; con `claude --agent studio-lead` come sessione principale invece c'è). Se manca, non esegui nessun pacchetto di mestiere: scrivi la tabella ondata → agente → pacchetto → input → output e la restituisci. La vecchia regola del 2026-10-28 («esegui il pacchetto seguendo la definizione dell'agente») è smentita dalle regole 12-14 di STUDIO.md.
**Evidenza:** 2026-10-28 e 2026-11-01 il lead ha fatto da solo creative-director e art director: foto Method/Studio bocciate e giudizio non indipendente.
**Quando non vale:** quando giri come sessione principale e Agent c'è: allora lanci.
**Cliente/progetto:** generale

## [2026-11-09] Agente che «cade» con l'output troncato: prima guardo maxTurns
**Pattern:** se un agente chiude con un risultato che è una frase a metà, o la sua prima riga («Parto leggendo…»), confronto il numero di tool_uses con il `maxTurns` del suo file di definizione. Se sono vicini, l'agente non è caduto: ha finito i turni. In quel caso alzo il limite, oppure restringo il pacchetto e chiedo di scrivere il registro dopo ogni passo.
**Evidenza:** 2026-11-09, uno spot. L'agente di motion video si è fermato tre volte (maxTurns 60, 68-89 tool_uses), quello del regista due (maxTurns 80, 93 tool_uses). Li ho portati tutti e due a 150, come quello del fotografo.
**Quando non vale:** quando i tool_uses sono pochi. Allora è un errore del provider (vedi la voce del 2026-11-08).
**Cliente/progetto:** generale.

## [2026-11-09] Router: per escludere DeepSeek si cambia modo, non si spegne il processo
**Pattern:** quando il titolare chiede di «spegnere il router», si usa lo script che lo porta in modo `claude` e a fine sessione lo si rimette in modo `auto`. Non si uccide il processo, per due motivi: anche la sessione in corso passa dal router tramite `ANTHROPIC_BASE_URL`, e launchd con KeepAlive lo riavvierebbe comunque.
**Evidenza:** sessione di lavoro su uno spot, 2026-11-09.
**Quando non vale:** se il titolare vuole togliere il router da settings.json in modo permanente.
**Cliente/progetto:** generale.

## [2026-11-09] Se un agente muore per un errore di modello, si rilancia dicendogli di guardare cosa ha lasciato su disco
**Pattern:** un agente può chiudere con «The model claude-opus-5-5 is not available on your ollama deployment» dopo molti turni utili e senza scrivere né registro né report. Il lavoro su disco però di solito c'è. Nel brief di ripresa si dice: quanti passaggi ha fatto, che è morto prima del report, dove guardare per capire cosa esiste già, e di riprendere da lì senza ripagare. In più: meglio un registro corto di un silenzio, quindi si ordina di chiudere presto anche lasciando punti aperti.
**Evidenza:** regista, verifica dell'allungamento Seedance, 2026-11-09: 20 passaggi e nessun output scritto.
**Quando non vale:** se l'agente aveva già scritto il registro prima di morire.
**Cliente/progetto:** generale.

## [2026-11-09] Agente che muore con «model … not available»: passa il modello nella chiamata
**Pattern:** se un agente muore subito con «model … not available on your … deployment», passa `model: "opus"` (o `"sonnet"`) nella chiamata Agent. Il frontmatter `model: opus` viene tradotto in un nome che il provider non ha.
**Evidenza:** dopo il cambio di account e di /model sono morti l'agente regista, il fotografo e quello di compliance. Con `model` esplicito, il controllo di override è passato e gli agenti sono ripartiti.
**Aggiornamento 9/11:** `model: "opus"` non basta più: il fotografo è morto con lo stesso errore sullo stesso alias. `claude --model opus` e `--model sonnet` dalla shell rispondono OK, quindi l'alias è buono e il problema è la mappatura del frontmatter. Finché non si corregge, passare `"sonnet"`, che ha retto tutto il giorno.
**Causa vera (verificata in un'altra sessione, 9/11):** la sessione girava con una versione vecchia del client, senza la correzione per gli agenti. Con ogni probabilità la versione vecchia instrada la richiesta dell'agente al servizio sbagliato. Rimedio: riaprire la sessione con la versione aggiornata del client. **Non toccare il frontmatter.** Dopo il riavvio è stato verificato che l'agente creative director, lanciato senza `model:`, gira su opus senza errori. Prima di riavviare, aspettare che gli agenti in background chiudano oppure annotare cosa riprendere.
**Quando non vale:** quando il frontmatter degli agenti è stato corretto.
**Cliente/progetto:** generale.

## Da verificare

- Questionario di discovery con un'ipotesi di default per ogni domanda ("OK o correggi"): dovrebbe accorciare il giro di risposte rispetto a domande aperte. Primo dato: 11 OK su 15, ma le 4 risposte modificate erano proprio quelle che cambiano i territori (logo, colore, significato, riferimenti). Sembra che il formato faccia emergere le domande che contano, non che spinga a confermare in automatico. Serve un secondo caso.
