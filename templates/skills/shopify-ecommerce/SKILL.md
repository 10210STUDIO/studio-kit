---
name: shopify-ecommerce
description: Usa quando il progetto è un e-commerce su Shopify — nuovo store, tema, struttura di catalogo, app, checkout, performance, tracking revenue o migrazione da altra piattaforma. Copre le decisioni di architettura che si pagano per anni e gli errori ricorrenti.
---

# E-commerce su Shopify

## Regola zero: verifica la documentazione

Shopify cambia in continuazione: API versionate con deprecazioni periodiche, estensibilità del checkout, limiti di varianti e metafield, funzionalità riservate ai piani alti, pricing. **Qualunque limite, nome di API o capacità tu stia per affermare, verificalo su `shopify.dev` e sull'help center ufficiale con WebFetch prima di scriverlo in un deliverable.** Non riportare numeri da articoli di terzi: invecchiano male e il cliente progetta su quelli.

Scrivi nel deliverable la data della verifica e la versione di API presupposta. Senza data, l'informazione non è usabile tra sei mesi.

## 1. Dove finisce il tema e dove inizia l'app

Decisione architetturale di partenza. Sbagliarla produce costi ricorrenti permanenti.

- **Tema** (Liquid, sezioni, blocchi, asset, Online Store 2.0): presentazione, layout, contenuti modificabili dal merchant, logica leggera. È tuo, lo versioni, lo controlli.
- **App**: funzionalità che richiede logica server, dati propri, integrazioni esterne, job pianificati, webhook. Può essere di terzi o custom.
- **Shopify Functions / estensioni**: logica nativa in punti dove Shopify non ti lascia mettere codice (sconti, validazioni, logiche di spedizione, personalizzazioni del checkout). Verifica su `shopify.dev` cosa è estendibile oggi e con quali vincoli.

Criteri di scelta:
- Se è aspetto, copy o disposizione → tema.
- Se è calcolo che deve valere anche fuori dal browser (checkout, API, ordini da canali terzi) → non può stare nel tema. Un prezzo calcolato in JavaScript nel tema è un prezzo che nel checkout non esiste.
- Se serve a un solo cliente e esiste un'app di terzi decente → valuta l'app prima di costruire. Ma leggi la sezione costi.

Non mettere mai nel tema: credenziali, chiavi API con permessi di scrittura, logica di prezzo o di sconto autoritativa, dati di business. Il tema è pubblico: tutto il codice che ci metti è leggibile da chiunque.

## 2. Architettura del tema

- Parti da un tema base solido (Dawn o un tema commerciale ben manutenuto) e **personalizzalo, non riscriverlo**. Un tema da zero costa il triplo e la manutenzione è a carico tuo per sempre.
- Costruisci in **sezioni e blocchi** con impostazioni esposte nel theme editor. Se il merchant deve chiamarti per cambiare un titolo, hai fatto un lavoro sbagliato. Vedi anche la skill `cms-architecture`: i principi di modellazione valgono identici qui.
- Vincola le impostazioni: lunghezze massime nei testi, scelte da elenco per i colori di marca, immagini con proporzioni dichiarate. Libertà totale nel theme editor significa che il cliente romperà il design nella prima settimana.
- **Non modificare i file del tema direttamente in produzione.** Lavora su un tema non pubblicato, versiona in Git, pubblica consapevolmente. Le modifiche dirette in produzione si perdono al primo aggiornamento del tema e non sono tracciabili.
- Quando aggiorni il tema base, le tue modifiche ai file core vanno rifatte a mano. Per questo: isola le personalizzazioni in file propri, tocca i file core il minimo possibile, e **documenta ogni file core modificato** in un file di note nel repo.
- Le app di terzi iniettano script e snippet nel tema. Quando disinstalli un'app, i residui restano. Tieni traccia di cosa ogni app ha toccato.

## 3. Struttura del catalogo: la decisione che si paga per anni

Qui si fanno i danni duraturi, perché cambiare struttura dopo richiede migrare dati, rifare URL, rifare i feed, rifare l'analytics storico.

**Prodotti e varianti.** Una variante è una combinazione di opzioni dello stesso prodotto, con proprio prezzo, SKU, inventario, codice a barre. Prima di definire le opzioni chiediti:
- l'acquirente percepisce questi oggetti come lo stesso prodotto in versioni diverse, o come prodotti distinti? Se cerca "maglietta rossa" come cosa autonoma, forse va separata.
- esiste un limite di varianti e di opzioni per prodotto, e quanto ci sei vicino? **Verifica il limite attuale su documentazione ufficiale**, non assumerlo. Superarlo impone soluzioni di ripiego costose.
- l'inventario è gestito per variante, e per la logistica quella granularità è giusta?

**Metafield e metaobject.** Sono il modo corretto per dati strutturati che non sono prezzo o inventario: materiali, dimensioni, schede tecniche, allergeni, riferimenti a entità (designer, collezione editoriale, taglia). Definiscili con tipo e validazione, non come testo libero. Un metafield testo libero diventa in sei mesi dieci modi di scrivere la stessa cosa, e non è filtrabile.

Nomina namespace e chiavi con una convenzione e documentala. Rinominare un metafield dopo significa ri-popolarlo su tutto il catalogo.

**Collezioni.** Manuali per curatela editoriale, automatiche per regole. Le automatiche hanno bisogno di dati puliti su tag/metafield: se i dati sono sporchi, la regola non funziona. Progetta prima i dati, poi le collezioni.
- I **tag** non sono un sistema di classificazione: sono etichette senza tipo né validazione. Usali per cose volatili (promo, stagione), non come sostituto dei metafield.
- Le collezioni determinano URL e navigazione: trattale come architettura dell'informazione e SEO, non come filtro tecnico. Coordina con la skill `seo`.

**SKU.** Devono essere decisi da chi gestisce il magazzino, non da chi fa il sito, e devono coincidere con il gestionale/ERP. Uno SKU inventato in Shopify e diverso da quello del magazziniere produce errori di spedizione per anni.

## 4. Checkout: cosa si può toccare e cosa no

- Il checkout di Shopify è **largamente non modificabile**. Non è un limite da aggirare: è dove Shopify garantisce conversione, pagamenti e conformità. Le vie legittime di personalizzazione (estensioni, branding, funzioni per sconti e validazioni) sono circoscritte e **dipendono dal piano**: le capacità più ampie sono storicamente riservate ai piani enterprise. **Verifica su documentazione ufficiale cosa è disponibile per il piano del cliente prima di promettere qualunque cosa.**
- Se il cliente chiede un checkout "come lo vogliamo noi", la risposta è no, e la risposta giusta è lavorare su carrello, pagina prodotto e post-purchase, dove hai controllo reale e dove il margine di miglioramento è comunque maggiore.
- Metodi di pagamento, tasse, spedizioni e accelerated checkout vanno verificati **sul mercato di destinazione**: cambiano per paese.
- Qualunque personalizzazione del checkout fatta con hack (script iniettati, override) si rompe a un aggiornamento e non è supportata. Non proporla.
- Testa il checkout reale con ordini di prova su tutti i metodi di pagamento attivi, su mobile, e in ogni paese e valuta che il cliente vende.

## 5. Il costo reale delle app

L'errore economico più comune nel progetto Shopify. Il costo di un'app non è il suo abbonamento.

Il costo totale di un'app è:
1. abbonamento mensile, che scala su ordini/traffico/SKU e cresce col cliente;
2. peso aggiunto alla pagina (script, CSS, chiamate di rete) e conversione persa;
3. codice iniettato nel tema che va rimosso a mano alla disinstallazione;
4. dipendenza: se l'app chiude, aumenta i prezzi o si rompe a un aggiornamento, il problema è del cliente;
5. sovrapposizione: tre app che fanno in parte la stessa cosa, tutte pagate;
6. conflitti fra app, che consumano ore di debug non preventivate.

Regole operative:
- Fai l'**inventario delle app** a inizio progetto: nome, costo mensile, cosa fa, chi l'ha installata e perché, se è ancora usata. Metti il totale annuo su una riga sola. È il numero che fa prendere decisioni.
- Prima di installare, chiedi: questo si fa con una funzione nativa, con il tema, o con venti righe di Liquid? Se sì, niente app.
- Disinstalla le app non usate, e pulisci i residui nel tema. Non lasciare script orfani.
- Valuta la qualità dell'app: data dell'ultimo aggiornamento, risposta del supporto, come inietta codice, se usa l'app embed o modifica i file del tema.
- Riporta al cliente il costo app come **spesa ricorrente**, non come dettaglio tecnico. È marginalità del suo e-commerce.

## 6. Performance

- La performance su e-commerce è denaro, non estetica: si misura in conversione sul mobile.
- Il contributo peggiore alla performance in Shopify sono tipicamente **le app e gli script di terzi** (tracking, chat, recensioni, popup, A/B testing), non il tema.
- Misura su device e rete reali, non solo con punteggi sintetici, e misura **prima e dopo** ogni installazione di app. Senza misurazione prima, non puoi attribuire il peggioramento.
- Leve concrete: ridurre il numero di app, caricare gli script di terzi in modo differito dove possibile, immagini nelle dimensioni servite e in formati moderni, evitare librerie JavaScript duplicate introdotte da app diverse, limitare il numero di prodotti e sezioni renderizzati in homepage e collezioni.
- Non sacrificare l'accessibilità per la performance. Nessuna delle due si negozia con l'altra.
- Dichiara al cliente che ogni app futura peggiora la performance: è una regola, non un sospetto.

## 7. Tracking e-commerce: il revenue è la fonte di verità

- Il dato autoritativo di vendite è **Shopify**, non l'analytics e non la piattaforma pubblicitaria. Quando i numeri divergono, Shopify vince e gli altri si riconciliano.
- Metti in piedi una **riconciliazione periodica**: ordini e revenue di Shopify contro quelli dell'analytics, contro quelli delle piattaforme ads. Documenta lo scostamento accettabile e indaga quando lo supera.
- Gli scostamenti hanno cause strutturali note: consenso negato, modelli di attribuzione diversi, finestre di conversione, deduplica, ordini annullati o rimborsati, test, blocco degli script. Spiegale al cliente **una volta all'inizio**, non ogni mese in emergenza.
- Rimborsi e cancellazioni raramente tornano indietro nelle piattaforme ads: il ROAS dichiarato è lordo. Se il cliente ha resi significativi, calcola il ROAS su revenue netto da Shopify.
- Per l'implementazione degli eventi (data layer, naming, consenso, server-side, debug) usa la skill `gtm-tracking-implementation`. Per i dati personali e il consenso, `gdpr-marketing-consent` è obbligatoria: su e-commerce stai trattando dati di clienti reali.
- Verifica il tracking con ordini di prova end-to-end: evento sparato, parametri corretti, valore e valuta corretti, ordine presente in Shopify, nessun doppio conteggio.

## 8. Migrazioni e redirect

Una migrazione si rompe sui dettagli, e il danno (perdita di traffico organico) si manifesta con settimane di ritardo.

Checklist:
1. **Esporta e verifica i dati prima**: prodotti, varianti, SKU, inventario, clienti, ordini storici, contenuti. Decidi cosa si migra e cosa non si migra, per iscritto.
2. **Mappa tutti gli URL vecchi sui nuovi**, uno per uno: prodotti, collezioni, pagine, articoli, pagine filtro indicizzate. Niente redirect di massa verso la homepage: è equivalente a cancellare quelle pagine.
3. Implementa redirect **permanenti** su ogni URL che cambia, e verificali con un crawl prima e dopo il lancio.
4. Preserva i dati SEO: titoli, descrizioni, canonical, dati strutturati, sitemap, hreflang se multilingua.
5. Rifai i **feed** (Google Merchant, Meta): identificativi di prodotto cambiati significano storico delle campagne azzerato. Pianificalo, non scoprilo.
6. Account cliente, password e wishlist non si migrano sempre: verifica cosa è possibile e comunica in anticipo ai clienti finali cosa dovranno rifare.
7. Email transazionali, notifiche, integrazioni ERP/magazzino/fatturazione: ognuna è un punto di rottura. Testane una per una con un ordine reale.
8. Fai un **baseline misurato prima del lancio** (traffico, revenue, conversione per canale) da confrontare dopo. Senza baseline non sai se la migrazione è andata bene e non puoi difenderti.
9. Lancia in un periodo di traffico basso, non in campagna attiva, non il venerdì.

## Errori che costano

Questa è la sezione più importante della skill.

- **Struttura di varianti sbagliata.** Scelta in un pomeriggio, si paga per anni: inventario ingestibile, filtri impossibili, URL da rifare, limiti di piattaforma raggiunti. Correggerla dopo è una migrazione.
- **Dati di prodotto in testo libero invece che in metafield tipizzati.** Catalogo non filtrabile, feed sporco, contenuti incoerenti. Ripulirlo richiede toccare ogni prodotto a mano.
- **SKU inventati dal web, diversi dal magazzino.** Spedizioni sbagliate e inventario che non torna, per sempre.
- **Modifiche al tema fatte in produzione, senza Git.** Si perdono all'aggiornamento, nessuno sa chi ha cambiato cosa, il rollback non esiste.
- **App accumulate senza inventario.** Centinaia di euro al mese di abbonamenti che nessuno ha deciso, più script orfani nel tema che rallentano il sito.
- **Promettere personalizzazioni del checkout non disponibili sul piano del cliente.** Venduto, non consegnabile. Verifica il piano *prima* del preventivo.
- **Prezzi o sconti calcolati nel tema in JavaScript.** Il checkout non li conosce: il cliente finale paga un importo diverso da quello mostrato. È un problema legale, non un bug estetico.
- **Nessun redirect dopo la migrazione.** Crollo del traffico organico, visibile dopo settimane, recuperabile in mesi.
- **Identificativi di prodotto cambiati senza avvisare chi gestisce le ads.** Storico delle campagne azzerato e disapprovazioni di feed in massa.
- **Tracking non verificato con un ordine reale.** Si scopre a budget speso che le conversioni erano doppie o assenti, e le decisioni di spesa erano basate su un numero falso.
- **Dare per autoritativo il revenue della piattaforma ads.** Decisioni di budget su numeri gonfiati; il conto lo scopre il commercialista.
- **Nessun ambiente di prova.** Cambi testati in diretta sullo store che incassa.
- **Lanciare senza testare il pagamento reale in ogni paese e valuta.** Lo store sembra funzionare e non prende ordini da metà dei mercati.
- **Credenziali o chiavi API nel codice del tema.** Il tema è pubblico. È una fuga di dati.
- **Non misurare prima.** Senza baseline di performance e conversione, ogni discussione successiva sul "prima funzionava meglio" si perde.

## Chiusura

Ogni deliverable Shopify chiude con: data di verifica della documentazione ufficiale e versione di API presupposta, piano Shopify del cliente e cosa ne dipende, inventario app con costo annuo, cosa non è stato testato. Passa da `delivery-qa`.
