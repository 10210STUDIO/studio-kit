---
name: programmatic-ctv-dooh
description: >-
  Programmatic, Connected TV e Digital Out Of Home: scelta della DSP, deal types (open, PMP, programmatic guaranteed), brand safety e qualità dell'inventory, misurazione senza click, e il criterio per capire quando questi canali hanno senso per uno studio piccolo e quando sono una perdita di tempo.
---

# Programmatic, CTV e DOOH — operatività

Canali di acquisto media dove compri impressioni su inventory di terzi tramite un'asta o un accordo, e dove nella maggior parte dei casi **non esiste un click utile da misurare**. Questo cambia tutto: la pianificazione, la misurazione, e il modo in cui vendi il lavoro al cliente.
Prima di toccare un account vivo: leggi `STUDIO.md`, il playbook dell'agente, e il `CONTEXT.md` del cliente.

## Leggi questa sezione prima di tutto: ha senso per noi?

Questa è la domanda che decide il task. Rispondila prima di qualunque lavoro di pianificazione.

Il programmatic diretto ha senso **solo se tutte** queste sono vere:
- il budget per il canale regge i minimi di spesa reali, che includono la soglia della DSP, il costo dei dati di terze parti, le fee di verifica e il tempo dello studio. **Verifica i minimi con il fornitore: non assumerli** — variano per DSP, per mercato e per tipo di contratto, e sono materia di negoziazione;
- il budget è sufficiente a raggiungere una copertura e una frequenza utile nel target: una campagna che tocca pochissime persone poche volte non produce nulla, su nessun canale di awareness;
- esiste un obiettivo di awareness, copertura o presidio reale, non solo un desiderio di "fare brand";
- il cliente accetta una misurazione per copertura, frequenza, lift e correlazione, **non per conversione attribuita all'impressione**;
- c'è un periodo abbastanza lungo da leggere un effetto. Una flight di pochi giorni non si misura.

Se una manca: non vendere il canale. Le alternative, in ordine di convenienza per uno studio piccolo:
1. **Rivendere l'inventory CTV tramite le piattaforme self-service** già disponibili (le piattaforme video dei grandi operatori, le app dei broadcaster con self-service, i canali CTV accessibili dalle piattaforme social e di search). Si ottiene buona parte dell'inventory premium senza DSP e senza minimi.
2. **Appoggiarsi a un trading desk o a un partner specializzato** come fornitore, con un margine dichiarato al cliente. Lo studio tiene la strategia e la misurazione, non l'esecuzione.
3. **DOOH tramite un concessionario o una piattaforma self-service DOOH** per campagne locali: spesso più semplice ed economico che passare da una DSP.
4. **Non farlo.** Per la maggior parte dei clienti di uno studio piccolo, il budget rende più in canali con intento o in paid social.

Dire al cliente che non ha senso, con il motivo, è un deliverable. Montare un programmatic sottofinanziato è il modo più rapido di produrre un report che nessuno può difendere.

## Prima di implementare: verifica la documentazione

Nomi delle DSP, modelli di fee, disponibilità dei prodotti di misurazione e regole sull'identità cambiano rapidamente — e la deprecazione dei cookie di terze parti ha reso instabile buona parte della letteratura esistente. Quanto segue è metodo.

Verifica con WebFetch/WebSearch prima di pianificare o quotare:
- documentazione ufficiale della DSP che stai valutando (inventory disponibile, modello di fee, soluzioni di identità supportate, prodotti di misurazione)
- documentazione di Google DV360 se l'operazione passa dall'ecosistema Google, che per questo studio è il percorso più probabile dato lo stack esistente
- documentazione dei fornitori di verifica (brand safety, visibilità, traffico non valido) per capire cosa misurano davvero e come
- IAB e IAB Europe per le specifiche correnti di formato, DOOH programmatico e framework di consenso
- il framework di consenso applicabile nel mercato del cliente, e lo stato corrente delle soluzioni di identità alternative ai cookie: è l'area che cambia di più

Nessun numero di CPM, visibilità o lift va scritto in un documento senza fonte e data. Chiedi i dati storici al fornitore o alla DSP, e cita chi te li ha dati.

## DSP e stack

- La DSP è lo strumento di acquisto; l'inventory è ciò che compri. Due DSP sulla stessa inventory danno risultati diversi per algoritmo, dati e fee: valuta entrambe le cose, non solo l'interfaccia.
- Chiedi, prima di firmare: struttura delle fee (sulla spesa, sui dati, sulle integrazioni di verifica), minimi, accesso ai log a livello impressione, inventory CTV e DOOH disponibile nel mercato del cliente, soluzioni di identità supportate.
- **Trasparenza della filiera**: chiedi quanto della spesa arriva al publisher. La quota trattenuta dalla catena intermedia è significativa e variabile; esiste ricerca di settore sul tema, ma **non citare percentuali senza una fonte datata**. Chiedi i dati di filiera del fornitore specifico.
- Preferisci inventory acquistata il più direttamente possibile e publisher identificabili per nome.
- Liste di inclusione invece di liste di esclusione: parti da dove vuoi essere, non da dove non vuoi essere. La lista di esclusione è infinita per costruzione.

## Deal types

| Tipo | Come funziona | Quando usarlo |
|---|---|---|
| Open exchange | asta aperta su inventory ampia | copertura a costo basso quando l'ambiente conta poco; richiede controlli di qualità stretti |
| PMP (private marketplace) | asta su inventory riservata di publisher selezionati, via ID di deal | default per la maggior parte dei casi: qualità nota, flessibilità di prezzo |
| Programmatic guaranteed | volume e prezzo fissati in anticipo con il publisher | quando serve la certezza di apparire: posizione premium, evento, lancio con data |
| Preferred deal | prezzo fissato, primo accesso, nessun obbligo di volume | presidio di un publisher specifico senza impegno di volume |

Pratica: su CTV l'inventory premium è di norma PMP o guaranteed, non open. Se qualcuno ti offre CTV premium a prezzo da open exchange, verifica cosa stai comprando davvero — l'inventory CTV è un'area con problemi noti di misrappresentazione.

## CTV

- È televisione comprata con strumenti digitali. Non è video digitale: non si salta, l'audio è presente, lo schermo è condiviso in una stanza, e **il click non esiste come azione sensata**.
- Produci per lo schermo grande: orizzontale, qualità di produzione adeguata, audio progettato. Un verticale riadattato si vede che è riadattato.
- Il controllo della frequenza è il problema tecnico principale: su CTV l'identificativo è a livello di dispositivo e la deduplicazione fra app e fornitori diversi è imperfetta. Senza un tetto di frequenza efficace bruci budget colpendo lo stesso nucleo familiare fino al danno reputazionale. Chiedi alla DSP come gestisce la frequenza cross-publisher, e verifica il risultato nel report.
- Verifica la completezza di visione, non le impressioni servite.
- Attenzione all'inventory dichiarata CTV che è in realtà video su app mobile a basso valore. Pretendi la lista di app e canali per nome.
- Chiedi al fornitore il dato di co-viewing che applica: incide direttamente sulla copertura dichiarata, e la metodologia varia. Non riportare la copertura come un fatto senza dire da dove viene la stima.

## DOOH

- Schermi digitali comprati a impressione, con stima della audience derivata da modelli di traffico. L'impressione non è un individuo identificato: è una stima.
- La geografia è la leva: compra la prossimità a punti vendita, snodi di mobilità, luoghi di consumo.
- Attivazione contestuale (orario, meteo, evento, disponibilità di stock) è la sola cosa che il DOOH programmatico fa meglio del DOOH tradizionale. Se non la usi, il concessionario tradizionale è probabilmente più conveniente.
- Creatività: pochissime parole, leggibili a distanza e in movimento, un solo messaggio. Il tempo di esposizione reale è brevissimo.
- Misurazione: nessun click. Si misura con lift sulle ricerche di marca, traffico nei punti vendita, o incrementi di vendita per area geografica confrontati con aree di controllo. Progetta il metodo **prima** di comprare.
- Chiedi la metodologia di stima dell'audience del fornitore e come verifica che la creatività sia andata in onda. Senza prova di messa in onda non hai niente.

## Misurazione senza click

Costruisci il piano di misurazione prima di comprare. Senza, consegnerai un report di impressioni e il cliente non rinnoverà.

- **Non usare l'attribuzione da visualizzazione come prova di efficacia.** Attribuire la conversione a chi ha solo visto un'impressione misura principalmente la correlazione con la propensione all'acquisto. Non è una misura di incrementalità e non va presentata come tale.
- **Il metodo corretto è il confronto con un controllo.** In ordine di robustezza: test geografico (aree esposte contro aree di controllo comparabili), studio di lift su conversioni o ricerca, holdout di pubblico dove la piattaforma lo consente.
- **Metriche di processo accettabili** nel frattempo: copertura e frequenza nel target, completezza di visione su CTV, visibilità, quota di traffico non valido, prova di messa in onda su DOOH.
- **Proxy di effetto:** volume di ricerca sul nome del marchio, traffico diretto, sessioni per area geografica, quota di nuovi clienti. Nessuno è una prova; insieme, in corrispondenza temporale con la flight, sono un indizio difendibile.
- Dichiara in anticipo quale evidenza considererai sufficiente e quale periodo serve per averla. Metterlo nel documento di setup evita la conversazione peggiore: "quante vendite ha fatto?" a flight chiusa.
- Richiedi i report di verifica (visibilità, traffico non valido, adiacenza di contenuto) come parte della fornitura, non come extra.

## Errori che costano

- **Vendere programmatic a un budget che non lo sostiene.** Le fee e i minimi divorano la spesa, la copertura è irrilevante, non si misura niente. Il cliente paga per un'esperienza di apprendimento dello studio.
- **Presentare l'attribuzione da visualizzazione come conversioni.** È il modo più diretto di perdere credibilità quando il cliente confronta con il conto economico. Tecnicamente difendibile come segnale, indifendibile come risultato.
- **Nessun tetto di frequenza efficace.** Spesa concentrata su pochi individui, saturazione e fastidio. Su CTV è particolarmente visibile e particolarmente dannoso.
- **Comprare open exchange senza liste di inclusione.** Inventory di bassa qualità, adiacenze imbarazzanti, traffico non valido. Il danno di brand safety ricade sullo studio.
- **Accettare "CTV" senza la lista di app e canali.** Paghi prezzi da televisione per video su app mobile.
- **Non contrattare la trasparenza delle fee.** Non sai quanto della spesa del cliente arriva al publisher, quindi non puoi difendere il CPM che hai pagato.
- **Comprare DOOH programmatico senza usare l'attivazione contestuale.** Stai pagando il premium del programmatico per ciò che il tradizionale fa a meno.
- **Creatività DOOH con troppo testo.** Nessuno la legge. Il budget è speso, il messaggio non è passato.
- **Progettare la misurazione dopo l'acquisto.** Senza area di controllo definita prima, non c'è modo di dimostrare nulla a posteriori.
- **Citare un CPM, un tasso di visibilità o un lift a memoria.** Nel programmatic i numeri variano per mercato, formato e periodo in modo enorme. Chiedi i dati al fornitore e cita la fonte con la data.
- **Non verificare la conformità del consenso per il mercato del cliente.** Rischio sanzionatorio sul cliente, responsabilità su chi ha pianificato.

## Controlli prima di comprare

Non impegnare budget del cliente senza aver verificato, uno per uno:
- piano di misurazione scritto e accettato dal cliente, con l'evidenza che considererete sufficiente e il periodo necessario;
- lista di inclusione di publisher, app o schermi, per nome;
- tetto di frequenza impostato, e il meccanismo con cui il fornitore lo applica fra publisher diversi;
- fee e minimi messi per scritto dal fornitore, con la data;
- report di verifica inclusi nella fornitura;
- conformità del consenso nel mercato del cliente;
- creatività prodotta per il canale reale, non adattata;
- su DOOH: prova di messa in onda prevista come deliverable del fornitore.

## Quando NON usare questi canali

- Budget insufficiente ai minimi reali o a una copertura utile. Il caso più frequente. Reindirizza su canali con intento o su CTV via self-service.
- Nessuna capacità o volontà di misurare con un controllo, e un cliente che pretenderà conversioni dirette. Rifiuta o riqualifica l'aspettativa per scritto prima di partire.
- Target molto ristretto e definibile con precisione: paghi un targeting approssimativo quando un canale con intento o professionale colpisce direttamente.
- Domanda esistente non ancora saturata nei canali con intento. Prima satura ricerca e paid social, poi parla di awareness. È quasi sempre l'ordine corretto.
- Il cliente ha bisogno di risultati entro poche settimane: questi canali producono effetti su orizzonti più lunghi, e non c'è modo di accorciarli.
- Vendita su marketplace dove la leva è la scheda prodotto. Vedi `retail-media-amazon`.
- Produzione video non adeguata allo schermo grande e nessun budget per rifarla: su CTV la qualità di produzione è un prerequisito, non un miglioramento.

## Chiusura di ogni task

Dichiara: la fonte e la data di ogni cifra citata su fee, minimi, CPM o copertura; il metodo di misurazione concordato; cosa non hai verificato e quale rischio porta.
