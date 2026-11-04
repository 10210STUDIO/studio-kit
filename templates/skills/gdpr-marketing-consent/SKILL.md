---
name: gdpr-marketing-consent
description: Usa quando tocchi dati personali nel marketing — liste contatti, consenso, cookie e tracciamento, consent mode, retention, DPA col cliente, o upload di liste verso Meta/Google (customer match, custom audience). Produce checklist e rischi, non parere legale.
---

**Checklist operativa, non consulenza legale.**

# GDPR applicato al marketing

**Questa skill non è consulenza legale.** Produce checklist operative, mappe dei rischi e domande da girare a un legale. Nessun output di questa skill autorizza una pratica: autorizza al massimo una proposta da validare. Ogni volta che la risposta dipende da un numero, una scadenza, un articolo o una posizione di un'autorità, **verifica la fonte ufficiale corrente** prima di scrivere — non ricostruirla a memoria.

## Prima di toccare qualsiasi cosa

Non rispondere senza aver stabilito questi cinque fatti. Se mancano, chiedili o dichiarali come assunzione esplicita:

1. **Chi è il titolare** del trattamento di cui stiamo parlando: il cliente, lo studio, o entrambi in modo autonomo.
2. **Dove sono stati raccolti i dati** e con quale informativa. Senza questo, qualunque riuso è indifendibile.
3. **Cosa è stato detto all'utente** al momento della raccolta: testo del consenso, finalità elencate, destinatari menzionati.
4. **Quali strumenti toccano i dati**: CRM, ESP, pixel, CDP, piattaforme ads, tool AI. Ognuno è un destinatario e va a contratto.
5. **Se esiste un DPA** fra studio e cliente, e chi l'ha redatto.

## Verifica obbligatoria delle fonti

Quando serve precisione normativa, usa `WebSearch` / `WebFetch` e cerca, in quest'ordine:

- il **testo normativo ufficiale** (EUR-Lex per il regolamento e le direttive UE; Normattiva per il recepimento italiano);
- le **linee guida e i provvedimenti dell'autorità competente**: Garante per la protezione dei dati personali per l'Italia, EDPB per il livello europeo (cookie, consenso, pay-or-ok, trasferimenti);
- la **documentazione ufficiale della piattaforma** per gli obblighi contrattuali: termini di Customer Match di Google, Custom Audience Terms di Meta, documentazione Consent Mode, condizioni di trasferimento dati.

Cita la fonte con URL e data di consultazione. Se non trovi conferma, scrivi "da verificare con legale" e vai avanti: **non riempire il buco con un numero di articolo plausibile.**

## Basi giuridiche per il marketing diretto

Mappa, non scorciatoia. Per ogni attività stabilisci la base e scrivila:

- **Email e SMS commerciali a liste proprie**: la regola è il consenso preventivo (art. 130, commi 1 e 2, D.Lgs. 196/2003, testo letto su Normattiva il 2026-11-01). L'eccezione (il cosiddetto soft opt-in, art. 130, comma 4, letto su Normattiva il 2026-11-04) vale solo per l'email fornita dall'interessato nel contesto di una vendita, solo per servizi analoghi a quelli venduti, e solo se l'interessato, informato, non si oppone, con la possibilità di opporsi ricordata a ogni invio. Trattala come eccezione, non come default.
- **Profilazione** (segmentazione comportamentale, scoring, personalizzazione spinta): richiede base propria e informativa dedicata. Non è coperta dal consenso all'invio di newsletter.
- **Legittimo interesse**: non copre email, SMS e chiamate automatiche promozionali, che restano nel regime a consenso anche verso un professionista persona fisica (Garante, provv. n. 285 del 17/04/2026, [doc-web 10252188](https://www.garanteprivacy.it/home/docweb/-/docweb-display/docweb/10252188): un caso singolo, non una linea guida). Un indirizzo trovato su LinkedIn o con un tool di enrichment non è un consenso. Per altri trattamenti B2B e per l'analytics è possibile, ma solo se documentato in un bilanciamento scritto (LIA) e se c'è opposizione facile. Un legittimo interesse non scritto è, in pratica, un legittimo interesse che non esiste.
- **Cookie e identificatori sul dispositivo**: regime proprio, più rigido della sola logica del GDPR. Leggere o scrivere informazioni sul dispositivo richiede il consenso, salvo che serva solo a trasmettere la comunicazione o a erogare il servizio chiesto dall'utente (art. 122, comma 1, D.Lgs. 196/2003, Normattiva, 2026-11-01). Il consenso serve anche quando la finalità successiva sarebbe coperta da un'altra base.

Se una campagna regge solo su una base giuridica che non riesci a scrivere in una frase, fermati.

## Consenso valido — come si raccoglie davvero

Checklist da applicare a ogni form, popup e checkbox:

- [ ] Azione positiva: nessuna casella pre-flaggata, nessun consenso implicito dallo scroll.
- [ ] Granulare: una finalità, un consenso. Newsletter, profilazione, cessione a terzi sono tre consensi distinti.
- [ ] Non condizionato: il download del whitepaper non può richiedere il consenso marketing, se il consenso non serve per erogarlo.
- [ ] Informato prima del click: informativa raggiungibile, destinatari e trasferimenti dichiarati.
- [ ] Revocabile con la stessa facilità con cui è stato dato. Se il consenso si dà in due click, non può richiederne otto per essere ritirato.
- [ ] **Provabile**: conserva timestamp, testo esatto mostrato, versione dell'informativa, sorgente, IP se previsto. Un consenso che non puoi ricostruire a posteriori vale zero in un'ispezione.

Doppio opt-in: non è un obbligo universale ma è la forma di prova più solida. Raccomandalo per default.

## Cookie, tracciamento e consent mode

- Rifiuto significa **rifiuto**: nessun cookie non necessario, nessun pixel in lettura/scrittura, nessun identificatore pubblicitario.
- Rifiutare deve essere facile quanto accettare. Le linee guida cookie del Garante del 10/06/2021 ([docweb 9677876](https://www.garanteprivacy.it/home/docweb/-/docweb-display/docweb/9677876), par. 7.1, lette il 2026-11-01) non impongono un pulsante «Rifiuta» nel primo livello del banner. Chiedono una X di chiusura che lasci le impostazioni di default, cioè nessun cookie non tecnico, con un'evidenza grafica pari a quella degli altri comandi. Lo scroll da solo non è mai consenso (par. 6.1). Scelta prudente: X **e** «Rifiuta», con la stessa gerarchia visiva di «Accetta». Il dark pattern è il motivo di contestazione più ricorrente.
- **Consent Mode e modalità analoghe**: con il consenso negato le piattaforme possono ricevere comunque segnali (ping senza identificatori, dati aggregati, modellazione delle conversioni). Operativamente: (a) non dire al cliente "se rifiuta non va niente" se non è vero; (b) verifica sulla documentazione ufficiale della piattaforma cosa viene trasmesso nello stato "denied", perché cambia nel tempo; (c) la modellazione delle conversioni è una stima — non presentarla al cliente come misurazione.
- Il **server-side tagging non crea una base giuridica**. Spostare la raccolta dal browser al server cambia l'architettura, non la liceità.
- **Registrazioni di sessione e heatmap** (Hotjar, Clarity e simili): leggono e scrivono sul dispositivo e registrano il comportamento di una persona, quindi vanno trattate come tracciamento a consenso (art. 122). Se e come l'equiparazione ai cookie tecnici prevista dalle linee guida del Garante per gli analytics si estenda a questi strumenti va riletto sulla fonte: una registrazione individuale non è un dato aggregato. In ogni caso: mascheramento di tutti i campi di input, pagine di account, checkout e salute escluse, durata di conservazione breve e dichiarata, fornitore nell'elenco dei sub-responsabili, finalità nell'informativa.
- Le piattaforme di consenso (CMP) vanno configurate e testate: verifica che il blocco preventivo degli script funzioni davvero, non che il banner compaia.

## Upload di liste clienti verso le piattaforme pubblicitarie

Punto a più alto rischio del lavoro quotidiano. Customer Match, Custom Audience, liste per lookalike: trattali come un **trasferimento di dati personali a un terzo**, perché è quello che sono.

Condizioni da verificare, tutte, prima di caricare:

- [ ] **L'informativa resa al momento della raccolta menziona questa finalità** e questa categoria di destinatari (piattaforme pubblicitarie / social). Se parla solo di "invio di comunicazioni commerciali", l'upload è fuori perimetro.
- [ ] Esiste un **consenso o una base giuridica documentata specifica** per la comunicazione a terzi per finalità di advertising. Il consenso alla newsletter non copre l'upload.
- [ ] La lista è **filtrata**: esclusi i revocati, i cancellati, i mai-consenzienti, i minori, le categorie particolari di dati. L'upload si fa da una query documentata, non da un export "tutti i contatti".
- [ ] Il **rapporto con la piattaforma** è inquadrato: le piattaforme impongono termini specifici per queste funzioni (dichiari di avere i diritti e il consenso necessari) e configurano il proprio ruolo in modo autonomo. Leggi i termini correnti della piattaforma, non la tua memoria di due anni fa.
- [ ] Chi carica: se lo fa lo studio sull'account del cliente, serve il mandato scritto e il DPA. Lo studio non "presta" liceità al cliente.
- [ ] **Trasferimento verso paesi terzi**: i principali destinatari sono soggetti statunitensi. Verifica il meccanismo di trasferimento su cui si poggia oggi il fornitore (schemi di adeguatezza, clausole contrattuali standard, misure supplementari). Questo è un ambito che cambia per decisioni giudiziarie e politiche: **verifica lo stato attuale con fonte ufficiale, non assumerlo**.

**L'hashing non sana nulla.** È la trappola. L'hash di un indirizzo email è pensato per essere ricongiunto a una persona — è esattamente la sua funzione nel matching. Un identificatore che serve a identificare resta un dato personale: l'hashing è una misura di sicurezza in transito, non un'anonimizzazione, e non trasforma un upload illecito in un upload lecito. Se un cliente o un fornitore ti dice "sono hashati quindi è a norma", è il segnale che la base giuridica non è stata esaminata.

## Informativa, retention, diritti

- L'**informativa** deve dire: chi tratta, per quali finalità, su quale base, a chi comunica, dove trasferisce, per quanto conserva, con quali diritti e come esercitarli. Scritta in italiano leggibile, non tradotta da template inglese.
- **Retention**: ogni categoria di dato ha una durata dichiarata e un meccanismo che la applica. "Fino a revoca" è accettabile per il consenso marketing solo se accompagnato da una pulizia periodica degli inattivi. Un database che non cancella mai nulla è una passività, non un asset.
- **Diritti degli interessati**: accesso, rettifica, cancellazione, opposizione, portabilità. Verifica che esista un canale operativo e un tempo di risposta, e che i tool usati permettano davvero la cancellazione — inclusi i backup e i segmenti già caricati sulle piattaforme.

## Titolare, responsabile, DPA

- Il cliente è di norma **titolare** dei dati dei propri contatti. Lo studio agisce da **responsabile** quando tratta quei dati solo su istruzione del cliente: gestione CRM, invio campagne, caricamento audience, gestione account ads.
- Lo studio è **titolare autonomo** per i propri dati: lead dello studio, contatti dei referenti del cliente, dati di dipendenti e fornitori. Non confondere i due cappelli nello stesso documento.
- In alcuni scenari (uso di dati del cliente per migliorare modelli, benchmark propri, casi studio) lo studio esce dal ruolo di responsabile. Se ti accorgi di volerlo fare, fermati: serve una base propria e un accordo diverso.
- **DPA** fra studio e cliente: oggetto e durata, finalità, istruzioni, misure di sicurezza, elenco dei **sub-responsabili** (ogni tool SaaS lo è, inclusi i tool AI), regole sui trasferimenti, obblighi in caso di data breach, cosa accade ai dati alla fine del contratto.
- Nessun tool nuovo entra nel flusso senza essere aggiunto all'elenco dei sub-responsabili e senza che il cliente ne sia informato secondo quanto previsto dal DPA.

## Igiene operativa dello studio

Il rischio quotidiano non è l'interpretazione della norma: è la gestione sciatta dei file.

- [ ] Nessun export di contatti in Drive condivisi, Slack, email o Downloads. I dati del cliente stanno dove il DPA dice che stiano.
- [ ] Accessi agli strumenti **nominali** e revocati quando una persona esce dal progetto. Nessuna credenziale condivisa.
- [ ] **Registro degli upload**: data, piattaforma, account, criterio di selezione della lista, numero di record, chi ha eseguito. Senza questo non puoi ricostruire nulla sei mesi dopo.
- [ ] Alla **fine del rapporto**: cancellazione o restituzione secondo il DPA, incluse le audience caricate sulle piattaforme e i dati nei tool intermedi.
- [ ] Nessun dato personale di clienti in prompt verso tool AI non coperti da DPA. Anonimizza o non farlo.
- [ ] Dati di clienti diversi **mai nello stesso file o nello stesso tool non segmentato**, nemmeno temporaneamente.

## Errori che costano

1. **Upload di liste con un consenso che non copre l'advertising.** L'errore più frequente e il più facile da contestare, perché la prova è il testo dell'informativa del cliente.
2. **Confondere hashing con anonimizzazione.** Vedi sopra. Lo dicono i commerciali delle piattaforme e lo ripetono gli studi.
3. **Pixel che spara prima del consenso.** Succede quasi sempre per un tag inserito a mano fuori dal tag manager, o per un embed di terze parti (video, mappa, chat).
4. **Banner con "Rifiuta" nascosto** in un secondo livello o reso grigio. Dark pattern documentabile con uno screenshot.
5. **Importare una lista acquistata o scrapata.** Nessun consenso, nessuna informativa, nessuna difesa possibile. Rifiuta il lavoro, non cercare di farlo bene.
6. **Riutilizzare dati di un cliente per il lavoro di un altro** — anche solo come benchmark o esempio. Viola il GDPR e gli standard di studio insieme.
7. **Informativa copiata da un altro sito**, con nomi di tool che il cliente non usa e assenza di quelli che usa.
8. **Dare come fatto uno schema di trasferimento verso gli USA** senza verificarne lo stato corrente.
9. **Incollare dati personali di clienti in tool AI** non coperti da DPA. È una comunicazione a terzi non autorizzata.
10. **Nessun registro dei consensi esportabile.** Alla prima richiesta di accesso, il problema diventa visibile.

## Quando fermarsi e chiamare un legale

Interrompi e segnala, senza proporre una soluzione tecnica:

- Si parla di **dati particolari** (salute, orientamento, convinzioni, dati di minori) in qualunque forma di targeting.
- Il cliente chiede di caricare liste di cui **non può documentare la provenienza**.
- C'è un **data breach** sospetto o accertato: i tempi di notifica sono stretti, la gestione non è un lavoro da studio creativo.
- Arriva una **richiesta del Garante**, un reclamo di un interessato gestito male, o una contestazione.
- Il progetto prevede **decisioni automatizzate** con effetti rilevanti sulle persone (credito, prezzi personalizzati su base individuale, selezione).
- Si valuta un modello **pay-or-ok** / consenso a pagamento.
- Il cliente **chiede di procedere comunque** dopo che hai segnalato il rischio: metti per iscritto l'avvertimento e fermati lì.

## Output atteso

Chiudi sempre con tre blocchi espliciti: **cosa è verificato e con quale fonte** (URL e data), **cosa resta da validare dal legale** come lista di domande secche, **quale rischio corre il cliente se procede così com'è**. Nessuna rassicurazione generica: se non sai, scrivi che non sai.
