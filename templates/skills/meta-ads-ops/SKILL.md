---
name: meta-ads-ops
description: >-
  Usala per impostare, correggere o diagnosticare account Meta Ads (Facebook/Instagram): struttura campagne e Advantage+, Conversions API e deduplicazione eventi, catalogo prodotti, audience e lookalike, limiti post-ATT e Aggregated Event Measurement, specifiche asset, diagnosi di consegna.
---

# Meta Ads — operatività

Skill per operare su account Meta Ads senza browser automation. Copre impostazione, tracciamento server-side, diagnosi.
Prima di toccare un account vivo: leggi `STUDIO.md`, il playbook dell'agente, e il `CONTEXT.md` del cliente.

## Prima di implementare: verifica la documentazione

I nomi dei campi, le versioni del Graph API e le feature di Advantage+ cambiano più volte all'anno. Non fidarti di quello che segue come riferimento API letterale: è il *metodo*, non la firma.

Verifica sempre con WebFetch/WebSearch, prima di scrivere codice o di promettere una feature al cliente:
- `developers.facebook.com/documentation/ads-commerce/marketing-api/advantage-campaigns` — le tre leve di Advantage+ e la migrazione delle ASC/AAC legacy
- `developers.facebook.com/docs/marketing-apis` — struttura, campi campagna/adset/ad, versione corrente del Graph API e data di deprecazione di quella che usi
- `developers.facebook.com/docs/marketing-api/conversions-api` — payload eventi, parametri di matching, deduplicazione
- `developers.facebook.com/docs/marketing-api/catalog` — feed e campi prodotto
- `facebook.com/business/help` e `transparency.meta.com/policies/ad-standards` — policy, categorie speciali
- Guida ufficiale alle specifiche creative per rapporti e lunghezze testo correnti

Regola: se il cliente deve prendere una decisione di budget su una feature, cita la pagina ufficiale con la data di consultazione.

## Struttura campagne

Decidi la struttura partendo dall'evento di conversione e dal volume, non dalla segmentazione di marketing.

- Un adset ha bisogno di volume per uscire dalla fase di apprendimento. Meta (Business Help Center, «About the learning phase», consultata 2026-11-04) dice circa 50 risultati nella settimana dopo l'ultima modifica significativa, e per le Shops ads almeno 17 acquisti sul sito e 5 su Meta: **rileggila prima di citarla**. Se il cliente non può generarla, consolida gli adset invece di segmentare.
- Frammentare in molti adset piccoli con lo stesso pubblico produce sovrapposizione d'asta interna e apprendimento mai concluso. Consolida.
- Una campagna è Advantage+ (sales, leads, app) solo se sono attive tutte e tre le leve: budget a livello campagna, audience Advantage+ (o nessun targeting oltre alla geografia), placement Advantage+ senza restrizioni. Se ne spegni una è manuale con lo stesso obiettivo. Le ASC/AAC legacy non si creano più via API (da v24.0) e dalla v26.0 non si modificano: si migrano, e la migrazione riavvia l'apprendimento (Meta, Marketing API, Advantage campaigns, consultata 2026-11-04).
- Usa Advantage+ sales/leads quando: catalogo ampio, segnale di conversione pulito, nessun vincolo di esclusione forte. Usa struttura manuale quando: pochi SKU, pubblici da escludere per ragioni di business, test creativo controllato, o audience B2B ristretta.
- Non far convivere la stessa audience in una campagna automatizzata e una manuale sullo stesso obiettivo: competono.
- CBO (budget a livello campagna) quando vuoi che Meta allochi; budget per adset quando devi garantire spesa minima a un segmento per ragioni contrattuali.
- Ogni modifica a target, offerta o evento di ottimizzazione riapre l'apprendimento. Accorpa le modifiche in una finestra sola e dichiaralo nel report.

## Eventi e Conversions API

Il pixel da solo non basta più: perdita di segnale da ITP, blocker e opt-out ATT. Lo standard operativo dello studio è **doppio invio**: pixel browser + Conversions API server-side, con deduplicazione.

Metodo:
1. Definisci la lista eventi minima legata al business: tipicamente view contenuto, add to cart, inizio checkout, acquisto per e-commerce; lead e stadi di qualifica per lead gen. Non implementare eventi che nessuno userà per ottimizzare o per riportare.
2. Usa i nomi evento standard di Meta dove esiste l'evento standard: gli eventi custom non alimentano le stesse ottimizzazioni. Eventi custom solo per ciò che non ha un corrispondente standard.
3. Invia valore e valuta su ogni evento monetizzabile. Senza valore non puoi ottimizzare a ROAS né calcolare nulla di difendibile.
4. Deduplicazione: lo stesso evento inviato da browser e server deve portare **lo stesso identificativo di evento e lo stesso nome evento**, generato una volta e condiviso fra i due invii. Se gli ID divergono conti doppio e il ROAS riportato è falso in alto.
5. Passa i parametri di matching che hai legalmente il diritto di passare (email, telefono, identificativi di click e browser), hashati secondo la specifica corrente della piattaforma. Il tasso di match determina quanto Meta attribuisce: è la leva più sottovalutata.
6. Base giuridica prima dell'invio: consenso raccolto e registrato, DPA in piedi, nessun dato di categoria particolare. Se il cliente non ha il consenso, non inviare e metti per scritto perché.
7. Verifica nello strumento diagnostico di Meta: eventi ricevuti, qualità del match, duplicati, parametri mancanti. Non chiudere l'implementazione senza aver guardato quel pannello.

Attribuzione: Meta riporta su finestre proprie e su modello proprio. I suoi numeri non coincideranno con GA4 né con il backend del cliente, mai. Scegli **una** fonte di verità per il reporting (di norma il backend) e usa Meta come fonte di ottimizzazione. Scrivilo nel documento di setup, prima che il cliente lo scopra da solo.

## Post-ATT e Aggregated Event Measurement

- Su iOS gli eventi web passano per Aggregated Event Measurement (aggregazione e latenza nel reporting). Per le campagne web Meta dice che non c'è alcuna azione di setup da fare («There are no actions you need to take», Business Help Center, consultata 2026-11-04): la configurazione delle priorità per dominio non è più il lavoro da fare. Per le app serve ancora l'idoneità o SKAdNetwork.
- Il dominio verificato nel Business Manager resta buona pratica per altri motivi (controllo dei link negli annunci), ma non promettere al cliente che serva a recuperare l'ottimizzazione iOS: rileggi la pagina Help prima di citarlo.
- Le dimensioni di breakdown sono limitate o assenti per il traffico aggregato: non promettere al cliente report per piazzamento/età/genere su quelle conversioni.
- Conseguenza pratica: le finestre di attribuzione brevi sottostimano gli acquisti a considerazione lunga. Confronta con i dati del backend prima di dichiarare una campagna fallita.

## Catalogo prodotti

- Il catalogo è un asset di performance, non un adempimento tecnico. Feed sporco uguale copertura ridotta e ADV che spinge prodotti esauriti.
- Fonte unica: il feed deve derivare dallo stesso database che serve il sito. Due fonti divergono sempre.
- Obbligatori e sempre corretti: identificativo stabile, disponibilità, prezzo, link, immagine, condizione. L'identificativo deve coincidere con quello inviato negli eventi: se non coincide, il retargeting dinamico non aggancia nulla.
- Frequenza di aggiornamento proporzionata alla volatilità di prezzo e stock. Per cataloghi volatili valuta aggiornamenti via API oltre al feed programmato.
- Usa i set di prodotti per separare margini, stagionalità o linee, non per replicare la tassonomia del sito.
- Controlla gli errori di diagnostica del catalogo prima di lanciare, non dopo.

## Audience

- Custom audience da eventi del sito: utili quanto è pulito il tracciamento. Se gli eventi sono rotti, le audience sono rotte.
- Liste caricate: hashate lato cliente secondo la specifica corrente, con base giuridica documentata. Il tasso di match è basso su liste vecchie o parziali: non costruire un piano su una lista che non hai verificato.
- Lookalike: la qualità della sorgente conta più della percentuale di somiglianza. Preferisci una sorgente piccola ma di clienti ad alto valore a una grande e indifferenziata. Non costruire lookalike su una sorgente sotto la soglia minima dichiarata dalla piattaforma: verificala.
- Le percentuali di somiglianza più ampie si avvicinano al pubblico generale: oltre un certo punto stai facendo prospecting a freddo con un passaggio in più.
- Le esclusioni valgono più delle inclusioni: escludi acquirenti recenti quando l'offerta è un'acquisizione, escludi i convertiti dal retargeting.
- Con targeting automatizzato, le esclusioni hanno applicabilità limitata: verifica cosa è ancora supportato nella versione corrente prima di prometterlo.
- Categorie speciali (credito, lavoro, casa, e dove previsto temi sociali/politici): dichiarale. Restringono le opzioni di targeting e la mancata dichiarazione è una violazione che può costare l'account.

## Formati e asset

- Produci per il formato verticale a piena altezza come default, con ritagli sicuri per i rapporti quadrato e orizzontale. Non consegnare un unico asset orizzontale e sperare nel ritaglio automatico.
- Verifica le specifiche correnti (rapporti supportati, limiti di peso, durata video, lunghezze di testo prima del troncamento) sulla guida ufficiale: cambiano e variano per piazzamento.
- Primi secondi di video: il messaggio deve passare senza audio. Sottotitoli sempre.
- Non mettere testo critico nelle zone coperte dall'interfaccia (in alto e in basso nei formati full-screen).
- Varia il concetto, non il colore del bottone. Più varianti dello stesso concetto consumano budget di apprendimento senza produrre informazione.
- Prepara catalogo e creatività per il formato collection/dinamico solo se il catalogo è pulito: altrimenti mostri prodotti sbagliati.

## Diagnosi di consegna

Procedi in quest'ordine. Fermati al primo blocco trovato.

1. **L'annuncio è approvato?** Rifiuti e revisioni fermano la consegna senza avvisare l'operatore.
2. **L'account è sano?** Limiti di spesa, metodo di pagamento, restrizioni account o dominio non verificato bloccano tutto a monte.
3. **Spende?** Se la spesa è zero: offerta troppo bassa, pubblico troppo piccolo, schedulazione, o adset in competizione con un altro dello stesso account.
4. **Spende ma non converte?** Separa: il problema è prima o dopo il click? Guarda CTR e rapporto fra click e sessioni (se diverge forte, il problema è tecnico o è traffico non valido), poi il tasso di conversione della landing page.
5. **Converte ma Meta non lo vede?** Diagnostica eventi: match quality, duplicati, parametri mancanti, consenso che blocca l'invio.
6. **Performance in calo senza cambi?** Controlla frequenza e saturazione del pubblico, stagionalità, azione dei concorrenti sull'asta, e se qualcuno ha modificato l'account (controlla il registro modifiche: lo fa sempre qualcuno).
7. **Fase di apprendimento mai conclusa?** Troppi adset, troppo pochi eventi, modifiche continue. Consolida e congela.

Prima di cambiare qualsiasi cosa, verifica se la differenza che stai guardando è rumore: un confronto su pochi giorni e pochi eventi non è un segnale.

## Errori che costano

- **Doppio conteggio da deduplicazione mancante.** Il ROAS risulta gonfiato, il cliente alza il budget su una campagna che non rende, e la scoperta arriva a chiusura trimestre. Il peggiore di tutti.
- **Ottimizzare su un evento proxy.** Ottimizzare su add to cart quando il business ha bisogno di acquisti porta Meta a cercare persone che aggiungono al carrello e non comprano. Ottimizza sull'evento che paga, se il volume lo consente.
- **Ottimizzare su un lead non qualificato.** Lead gen senza rimando dello stadio qualificato produce volumi alti e pipeline vuota. Rimanda al sistema l'evento di lead qualificato.
- **Identificativo prodotto diverso fra eventi e catalogo.** Il retargeting dinamico smette di funzionare silenziosamente: la campagna gira, la rilevanza è zero.
- **Dare per scontato lo stato di una funzione senza rileggerlo.** Advantage+, Aggregated Event Measurement e le finestre di reporting sono cambiati più volte nel 2025-2026: controlla la pagina ufficiale e la data.
- **Riportare i numeri di Meta come fatturato.** Confrontali col backend prima di scriverli in un documento che il cliente mostra al suo capo.
- **Riavviare l'apprendimento ogni due giorni.** Ogni ritocco azzera; l'operatore interpreta l'instabilità come un problema creativo e cambia di nuovo.
- **Categoria speciale non dichiarata.** Rischio di sospensione dell'account, e il recupero non è nelle tue mani.
- **Pubblici sovrapposti nello stesso account.** Fai salire il tuo stesso costo d'asta.
- **Inviare dati senza base giuridica.** Esposizione GDPR sul cliente, e la responsabilità arriva a chi ha implementato.

## Quando NON usare Meta

- Domanda già esistente e intenzionale su una query specifica: la ricerca intercetta meglio quell'intento. Meta genera domanda, non la cattura.
- Target B2B definito per azienda, ruolo o seniority: il targeting professionale di LinkedIn è più diretto. Vedi `tiktok-linkedin-ads-ops`.
- Vendita su marketplace dove la conversione avviene fuori dal sito del cliente e non puoi tracciarla: valuta prima il retail media. Vedi `retail-media-amazon`.
- Budget troppo sottile per uscire dall'apprendimento sull'evento che conta: pochi euro al giorno frazionati su più adset non producono nessun apprendimento. Concentra o rimanda.
- Tracciamento impossibile per vincoli legali o tecnici del cliente e nessun proxy accettabile: la piattaforma funziona male alla cieca, e non puoi difendere il risultato.
- Settori con policy restrittive (salute, finanza, adulti e affini): verifica l'ammissibilità sulle policy ufficiali prima di vendere il lavoro, non dopo.

## Controlli prima di dare per lanciata una campagna

Non dichiarare un setup completo senza aver verificato, uno per uno:
- dominio verificato nel Business Manager, se serve ad altro (vedi sopra);
- evento di ottimizzazione che riceve dati, visibile nella diagnostica, senza duplicati;
- valore e valuta presenti sugli eventi monetizzabili;
- parametri UTM coerenti con il modello di reporting del cliente, così che il backend possa riconciliare;
- escluse le audience che devono essere escluse, e verificato che l'esclusione sia effettivamente supportata nel tipo di campagna scelto;
- creatività presenti in tutti i rapporti necessari ai piazzamenti attivi;
- limite di spesa dell'account e metodo di pagamento adeguati al budget pianificato;
- categoria speciale dichiarata se applicabile;
- accessi: lo studio opera su un Business Manager del cliente, mai su uno proprio intestato al cliente. Un asset pubblicitario intestato allo studio è un problema contrattuale che emerge alla fine del rapporto.

## Chiusura di ogni task

Dichiara esplicitamente: quali numeri vengono da Meta e quali dal backend, quale finestra di attribuzione è in uso, cosa non hai verificato, e quale rischio porta.
