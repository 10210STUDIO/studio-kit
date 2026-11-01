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

## Da verificare

- Questionario di discovery con un'ipotesi di default per ogni domanda ("OK o correggi"): dovrebbe accorciare il giro di risposte rispetto a domande aperte. Primo dato: 11 OK su 15, ma le 4 risposte modificate erano proprio quelle che cambiano i territori (logo, colore, significato, riferimenti). Sembra che il formato faccia emergere le domande che contano, non che spinga a confermare in automatico. Serve un secondo caso.
