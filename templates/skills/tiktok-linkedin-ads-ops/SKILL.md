---
name: tiktok-linkedin-ads-ops
description: >-
  Usala per impostare, correggere o valutare campagne TikTok Ads e LinkedIn Ads: struttura, pixel ed eventi server-side, targeting per interesse/comportamento su TikTok e per azienda/ruolo su LinkedIn, formati nativi, e criteri per scegliere fra le due.
---

# TikTok Ads e LinkedIn Ads — operatività

Due piattaforme nello stesso file perché occupano gli estremi opposti dello stesso asse: TikTok compra attenzione a basso costo unitario su pubblico ampio, LinkedIn compra precisione professionale a costo unitario alto. La scelta fra le due si fa sul valore del cliente acquisito, non sulle preferenze del cliente.
Prima di toccare un account vivo: leggi `STUDIO.md`, il playbook dell'agente, e il `CONTEXT.md` del cliente.

## Prima di implementare: verifica la documentazione

Entrambe le piattaforme cambiano nomi di prodotto, campi API e opzioni di targeting con frequenza. Quanto segue è metodo, non riferimento API letterale.

Verifica con WebFetch/WebSearch prima di implementare o di quotare:
- `business-api.tiktok.com/portal/docs` — Marketing API TikTok: struttura, eventi, Events API
- `ads.tiktok.com/help` — policy, formati, specifiche creative correnti
- `learn.microsoft.com/linkedin/marketing` — LinkedIn Marketing API: campagne, Conversions API, matched audiences
- `business.linkedin.com/marketing-solutions/ads` e il centro assistenza campagne — formati, opzioni di targeting, requisiti minimi di dimensione pubblico
- Policy pubblicitarie di entrambe, per il settore del cliente

Le soglie (dimensione minima del pubblico, budget minimo per campagna, limiti di caratteri) **vanno lette nella documentazione corrente**. Non riportarle a memoria.

## Quale delle due: criterio di decisione

Scegli LinkedIn quando **tutte** queste sono vere:
- il cliente vende a organizzazioni, e la decisione d'acquisto coinvolge un ruolo identificabile;
- il valore di un cliente acquisito regge un costo per lead alto (LinkedIn è strutturalmente più caro per click e per impressione di quasi tutto il resto: verifica l'ordine di grandezza con dati reali dell'account o un benchmark citato);
- esiste un ciclo di vendita con un umano dentro, quindi un lead vale più di una vendita diretta.

Scegli TikTok quando:
- il prodotto si capisce guardandolo in movimento;
- il target è consumer e definibile per interesse o comportamento, non per ruolo;
- il cliente può produrre creatività a ritmo continuo (vedi sotto: senza questo, non partire);
- il margine unitario regge un modello di acquisizione a volume.

Non usare nessuna delle due se il cliente ha un solo asset creativo e nessuna capacità di produrne altri. È la condizione che fa fallire più campagne su TikTok di qualunque errore di targeting.

| | TikTok | LinkedIn |
|---|---|---|
| Unità di targeting | interesse, comportamento, audience da eventi, lookalike | azienda, settore, dimensione azienda, ruolo, seniority, competenze, gruppi |
| Intento dell'utente | assente, in intrattenimento | professionale, variabile |
| Costo unitario relativo | basso | alto — fra i più alti del mercato |
| Ritmo di consumo creativo | alto: la creatività si esaurisce rapidamente | moderato |
| Obiettivo tipico sensato | vendita diretta, installazione app, awareness a volume | lead qualificato, contenuto gated, ABM, recruiting |
| Formato che regge | video verticale nativo, non pubblicitario | documento, single image, video breve, messaggio |

## LinkedIn — operatività

**Struttura.** Un gruppo di campagne per obiettivo di business, campagne separate per cluster di targeting che vuoi leggere separatamente nel report. Non segmentare oltre la soglia minima di pubblico dichiarata dalla piattaforma: sotto quella, la campagna non consegna.

**Targeting.** Parti dalla definizione di account target, non dalla persona.
- Targeting per elenco di aziende caricato (ABM) quando il cliente ha una lista nominativa: è il caso d'uso in cui LinkedIn vale il prezzo.
- Combina attributo di azienda (settore + dimensione) con attributo di persona (funzione + seniority). Non combinare più di due o tre dimensioni: ogni filtro aggiunto riduce il pubblico più di quanto migliori la qualità.
- Il titolo di lavoro è dichiarato dall'utente e incoerente fra aziende. Preferisci funzione e seniority al titolo letterale.
- Disattiva l'espansione automatica del pubblico quando il valore della campagna sta nella precisione: altrimenti paghi il prezzo di LinkedIn per un targeting che non hai scelto.
- Escludi i dipendenti del cliente e, se necessario, i concorrenti.

**Formati.**
- Lead gen form nativo quando il contenuto è scaricabile e il lead va nel CRM: riduce la frizione. Richiede integrazione CRM o scarico via API, altrimenti i lead muoiono nella piattaforma.
- Il formato documento/carousel di documenti funziona per contenuto professionale densissimo: consente di dare valore dentro il feed.
- Messaggi sponsorizzati: alta invadenza, soggetti a limiti di frequenza per utente e a restrizioni in alcune giurisdizioni. Verifica l'ammissibilità nel mercato del cliente prima di pianificarli.
- Thought leadership da profilo personale di un dirigente: di norma rende più dell'identico contenuto da pagina aziendale. Richiede l'autorizzazione della persona.

**Conversioni.** Imposta il tracciamento con tag sul sito e, in aggiunta, invio server-side delle conversioni offline: su un ciclo B2B la conversione che conta (opportunità, contratto) avviene settimane dopo il click e solo nel CRM. Senza rimando offline ottimizzi su un lead che non sai se vale.

## TikTok — operatività

**Struttura.** Pochi gruppi di inserzioni, molte creatività. L'opposto dell'istinto di chi viene dalla search. Il sistema impara dalla creatività più che dal targeting: dagli margine di esplorazione invece di stringere.

**Targeting.** Targeting ampio come punto di partenza, con l'ottimizzazione guidata dall'evento di conversione. Restringi per interesse o comportamento solo quando hai evidenza che un cluster rende diversamente. Audience da eventi del sito e lookalike funzionano: liste caricate hanno di norma tassi di match bassi, verifica prima di costruirci un piano.

**Eventi.** Pixel + invio server-side (Events API) con **deduplicazione tramite identificativo di evento condiviso**, esattamente come su Meta. Valore e valuta su ogni evento monetizzabile. Base giuridica e consenso prima dell'invio, come sempre.

**Creatività — la parte che decide il risultato.**
- Nativo, non pubblicitario. Un adattamento di uno spot TV non consegna.
- Audio presente e scelto: su TikTok l'audio è parte del messaggio, non un accessorio. Verifica i diritti: la musica disponibile nell'app di consumo non è automaticamente licenziata per uso pubblicitario. Usa la libreria commerciale della piattaforma o musica licenziata.
- Il gancio nei primissimi istanti decide tutto. Testa i ganci, non le code.
- Contenuto generato da creator e da utenti rende di norma più della produzione di studio. Mettilo nel preventivo come voce a sé: licenze e compensi inclusi.
- Pianifica la rotazione creativa come costo ricorrente. Se il cliente non lo accetta, dillo in fase di preventivo: la campagna avrà vita breve.

## Errori che costano

**LinkedIn**
- **Over-targeting.** Cinque filtri sovrapposti riducono il pubblico sotto la soglia di consegna: la campagna spende poco e male, e sembra un problema di offerta.
- **Pagare il premium di LinkedIn con l'espansione automatica attiva.** Compri pubblico generico al prezzo del pubblico professionale.
- **Lead gen form senza integrazione CRM.** I lead si accumulano nella piattaforma, nessuno li chiama, il cliente conclude che LinkedIn non funziona.
- **Ottimizzare sul lead invece che sull'opportunità.** Volumi alti e pipeline vuota. Rimanda le conversioni offline.
- **Mandare traffico freddo a una richiesta di demo.** Su LinkedIn il contatto è raramente in fase d'acquisto: chiedi il passo successivo plausibile, non l'ultimo.
- **Targeting per titolo letterale.** Perdi i decisori che si chiamano in un altro modo nella loro azienda.

**TikTok**
- **Riciclare asset orizzontali o spot TV.** Consegna scarsa e CTR basso: il sistema penalizza il contenuto che sembra pubblicità.
- **Non pianificare la rotazione creativa.** La performance decade e l'operatore attribuisce il calo all'algoritmo.
- **Musica non licenziata per uso commerciale.** Esposizione legale sul cliente e rimozione dell'annuncio.
- **Stringere il targeting per "risparmiare".** Impedisci l'ottimizzazione sull'evento e paghi di più.
- **Eventi duplicati fra pixel e server.** Stessa patologia di Meta: ROAS falso in alto e decisioni di budget sbagliate.
- **Giudicare su finestre troppo brevi e volumi troppo bassi.** Stai leggendo rumore e lo chiami risultato.

**Entrambe**
- **Promettere una soglia o un costo per lead letto a memoria.** Prendi i dati storici dell'account o una fonte citata, oppure dichiara l'incertezza. Mai un numero senza provenienza.
- **Riportare i numeri della piattaforma come fatturato.** Scegli il backend o il CRM come fonte di verità e dichiaralo nel setup.

## Controlli prima di dare per lanciata una campagna

Su entrambe, verifica uno per uno:
- evento di conversione che riceve dati, senza duplicati fra browser e server;
- dimensione del pubblico sopra la soglia minima dichiarata dalla piattaforma, con margine;
- UTM coerenti con il modello di reporting del cliente;
- su LinkedIn: espansione automatica del pubblico decisa consapevolmente, e destinazione dei lead verificata end-to-end con un invio di prova;
- su TikTok: diritti sulla musica documentati, e almeno tre concetti creativi distinti pronti alla partenza;
- policy del settore verificata sulla documentazione ufficiale;
- accessi su account pubblicitario del cliente, non dello studio.

## Quando NON usare queste piattaforme

**LinkedIn, no se:**
- il prodotto è consumer, o il decisore non è identificabile per ruolo;
- il valore per cliente acquisito non regge un costo per lead alto — fai il conto prima di vendere il lavoro;
- il budget è così sottile che la campagna raccoglie troppi pochi eventi per decidere qualsiasi cosa;
- il cliente non ha un processo di vendita che prende in carico il lead. Senza quello, stai comprando righe in un foglio.

**TikTok, no se:**
- il cliente non può produrre creatività nuova con continuità;
- il prodotto richiede spiegazione testuale lunga o una valutazione razionale complessa;
- il target è una fascia professionale ristretta: paghi reach che non ti serve;
- il brand ha vincoli che impediscono un linguaggio nativo. Un marchio che non può permettersi di sembrare informale non ha niente da fare qui;
- il settore è soggetto a restrizioni di policy: verificalo prima, non dopo l'approvazione del budget.

**Entrambe, no se:** la domanda è già esistente e intenzionale su query specifiche (usa la ricerca), o se il tracciamento è impossibile e non esiste un proxy accettabile per misurare.

## Chiusura di ogni task

Dichiara: quale fonte di dati stai usando per i costi citati, quale finestra di attribuzione, cosa non hai verificato e quale rischio porta.
