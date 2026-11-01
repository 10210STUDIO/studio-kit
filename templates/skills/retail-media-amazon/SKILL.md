---
name: retail-media-amazon
description: >-
  Usala per impostare, correggere o valutare advertising su marketplace. Amazon Ads: Sponsored Products/Brands/Display, struttura campagne e harvesting dei termini di ricerca, scheda prodotto come fattore di conversione, ACOS e TACOS, e il principio di retail media trasferibile ad altri retailer.
---

# Retail media e Amazon Ads — operatività

Il retail media è pubblicità dentro un ambiente dove l'utente è già in fase d'acquisto e la conversione avviene sulla piattaforma. Le conseguenze pratiche: l'intento è il più alto di tutto il paid, ma non controlli la pagina di destinazione, e quindi la variabile che decide il risultato è la scheda prodotto, non l'annuncio.
Prima di toccare un account vivo: leggi `STUDIO.md`, il playbook dell'agente, e il `CONTEXT.md` del cliente.

## Prima di implementare: verifica la documentazione

Nomi di prodotto, tipi di campagna, tipi di corrispondenza e campi API cambiano, e variano per marketplace e per tipo di venditore (Seller Central vs Vendor Central). Quanto segue è metodo.

Verifica con WebFetch/WebSearch prima di implementare o quotare:
- `advertising.amazon.com/API/docs` — Amazon Ads API: tipi di campagna, reportistica, disponibilità per marketplace
- `advertising.amazon.com` (centro assistenza) — tipi di campagna disponibili e requisiti di ammissibilità
- Centro assistenza di Seller Central o Vendor Central per i requisiti di contenuto della scheda prodotto nel marketplace specifico
- Per altri retailer (es. reti retail media di catene europee): la documentazione del retailer stesso, perché ognuno ha regole proprie

**Verifica sempre l'ammissibilità prima di vendere il lavoro**: alcuni tipi di campagna richiedono registrazione del marchio o lo stato di vendor, e la disponibilità differisce per paese.

## Prerequisito: niente ADV su una scheda che non converte

Fai questo controllo **prima** di aprire una campagna. Spendere su una scheda debole è il modo più rapido di bruciare budget nel retail media.

- Titolo che contiene il termine con cui la gente cerca davvero il prodotto, non il nome commerciale interno.
- Immagine principale conforme ai requisiti del marketplace e leggibile in miniatura.
- Immagini secondarie che mostrano uso, scala, contenuto della confezione.
- Bullet point che rispondono alle obiezioni d'acquisto, non che elencano feature.
- Contenuto arricchito del marchio dove disponibile.
- Recensioni: presenti, e con valutazione non penalizzante. Una scheda con poche recensioni o valutazione bassa converte peggio a parità di traffico. Non c'è offerta che compensi.
- Disponibilità e prezzo competitivo nella sua categoria. Prodotto esaurito o non in evidenza nella casella d'acquisto: la campagna paga click che non possono convertire.
- Varianti collegate correttamente, così che le recensioni si consolidino.

Se uno di questi è rotto, la raccomandazione corretta al cliente è sistemare la scheda prima di aumentare la spesa. Mettilo per scritto.

## Tipi di campagna: a cosa servono

- **Sponsored Products** — annunci sul singolo prodotto nei risultati di ricerca e nelle pagine prodotto. È la spina dorsale: il volume e la maggior parte della conversione diretta stanno qui. Parti sempre da qui.
- **Sponsored Brands** — formato di marchio con più prodotti, in posizioni prominenti nella ricerca. Serve a presidiare il termine di categoria e il proprio nome di marca. Richiede di norma registrazione del marchio: verifica.
- **Sponsored Display** — retargeting su chi ha visto la scheda, pubblici per interesse, e posizionamento su schede di prodotti concorrenti o complementari. Utile per difesa e per recupero, non come motore primario di acquisizione.
- **Formati video e DSP di Amazon** — valutali solo quando le campagne di ricerca sono già sature e il cliente ha un budget separato per la parte alta del funnel. Vedi anche `programmatic-ctv-dooh`.

## Struttura campagne e term harvesting

Il meccanismo centrale: le campagne automatiche scoprono i termini, le campagne manuali li sfruttano. Costruisci questo ciclo e lavoralo con regolarità.

1. **Campagna di scoperta automatica** per ogni gruppo di prodotti omogeneo. Budget contenuto, offerte moderate. Serve a produrre dati sui termini di ricerca, non a fare fatturato.
2. **Leggi il report dei termini di ricerca** a cadenza fissa. È il documento più importante dell'account.
3. **Promuovi** i termini che convertono in una campagna manuale a corrispondenza esatta, con un'offerta che riflette il valore osservato per quel termine.
4. **Escludi** in negativo, nella campagna automatica, i termini già promossi: altrimenti competi con te stesso sullo stesso termine.
5. **Escludi** in negativo i termini che spendono senza convertire oltre una soglia che definisci tu sui dati dell'account. Non usare una soglia letta a memoria: calcolala dal margine del prodotto e dal valore del cliente.
6. Ripeti. L'account migliora per accumulo di esclusioni e di termini esatti, non per micro-ottimizzazione delle offerte.

Organizzazione:
- Separa le campagne per **intento del termine**: marca propria, categoria generica, marca concorrente. Hanno economia diversa e vanno valutate con obiettivi diversi. Mescolarle rende illeggibile ogni metrica aggregata.
- Separa per **margine di prodotto**: non puoi avere lo stesso obiettivo di efficienza su un prodotto a margine alto e uno civetta.
- Pochi prodotti per gruppo di annunci, così che l'offerta sul termine abbia senso per tutti i prodotti dentro.
- Il termine di marca propria ha di norma l'efficienza apparente migliore dell'account: in parte è domanda che avresti ottenuto comunque. Valutalo come difesa (impedire ai concorrenti di intercettare il tuo nome), non come fonte di crescita. Se vuoi quantificare l'incrementalità, serve un test di sospensione controllato, non un confronto di metriche.

## Metriche

- **ACOS** — spesa pubblicitaria diviso fatturato generato dalla pubblicità. Metrica di efficienza della campagna. Il suo complemento è il ROAS; sono la stessa informazione.
- **TACOS** — spesa pubblicitaria diviso fatturato **totale** del prodotto, pubblicitario e organico. È la metrica che conta per il business: dice quanto l'azienda dipende dalla pubblicità. Un TACOS che scende mentre il fatturato cresce significa che l'organico si sta rafforzando.
- L'obiettivo di ACOS si **deriva dal margine di contribuzione** del prodotto, non si copia da un benchmark. Calcolo: prezzo meno costo del prodotto, meno commissioni del marketplace, meno logistica, meno resi attesi. Quello che resta è il massimo spendibile per non perdere denaro. L'obiettivo di ACOS si colloca sotto quella soglia, di quanto lo decide il cliente in base al profitto che vuole. **Chiedi i dati di costo al cliente: se non li hai, non dichiarare un obiettivo di ACOS.**
- Attribuzione: Amazon attribuisce la conversione su una propria finestra e include di norma l'acquisto di prodotti diversi da quello pubblicizzato. Verifica la definizione corrente nella documentazione prima di interpretare uno scostamento rispetto al conto economico del cliente.
- L'obiettivo di un lancio non è l'ACOS: è la velocità di vendita e le prime recensioni. Dichiara il cambio di obiettivo per fase, con il periodo in cui accetti un'efficienza peggiore.

## Il principio generale del retail media

Vale su Amazon e trasferibile a qualunque altro marketplace o rete retail media (altri marketplace, catene con rete propria, piattaforme di delivery).

- **Non controlli la pagina di destinazione.** La conversione dipende da contenuto, prezzo, disponibilità, recensioni: quattro cose su cui l'advertising non può nulla. Questa è la differenza strutturale rispetto a tutto il resto del paid.
- **Il dato è della piattaforma.** Hai quello che la piattaforma decide di darti, aggregato come decide lei, ed è difficile portarlo fuori per analisi incrociate. Pianifica il reporting su quello che la piattaforma esporta davvero: verifica prima.
- **La pubblicità e l'organico sono accoppiati.** La velocità di vendita generata dalla pubblicità influenza il posizionamento organico, che genera vendite che migliorano ancora il posizionamento. Per questo il TACOS è più informativo dell'ACOS.
- **La concorrenza è presente sulla stessa pagina.** Il tuo annuncio compare accanto all'alternativa. Il prezzo e la valutazione relativi, non assoluti, decidono.
- **Il ciclo operativo è il report dei termini di ricerca.** Qualunque rete retail media con una ricerca interna si lavora con lo stesso ciclo: scopri, promuovi, escludi.
- Quando valuti una rete retail media nuova per un cliente, chiedi tre cose prima di tutto: quali dati esporta, quali controlli di esclusione dà, e se il formato ha una posizione di ricerca o solo display. Senza esclusioni e senza report dei termini non è ottimizzabile.

## Ciclo operativo e controlli

Il retail media non si imposta e si lascia andare: è un lavoro a cadenza fissa. Definisci con il cliente la frequenza e mettila nel contratto, perché è la voce di tempo che determina il margine dello studio.

A ogni revisione, in questo ordine:
1. **Stock e posizione nella casella d'acquisto** su ogni prodotto pubblicizzato. Metti in pausa ciò che non è acquistabile. Prima di qualunque analisi.
2. **Nuovi termini di ricerca** dal report: promuovi quelli che convertono, escludi in negativo quelli che spendono senza convertire.
3. **Offerte** sui termini a corrispondenza esatta, in base all'efficienza osservata e al margine del prodotto.
4. **Budget**: redistribuisci verso le campagne dentro l'obiettivo, non verso quelle con il volume più alto.
5. **TACOS per prodotto**, non solo ACOS per campagna. È dove si vede se il lavoro sta funzionando per il business.
6. **Recensioni e valutazione**: un calo di valutazione si manifesta come calo di conversione e sembra un problema di campagna. Controllalo prima di toccare le offerte.
7. Prezzo dei concorrenti sugli stessi termini, quando il cliente è sensibile al prezzo.

Non cambiare offerte e esclusioni nella stessa revisione se poi devi attribuire l'effetto a una delle due. Se il volume è basso, cambia una cosa per volta e concedi tempo.

Prima di dare per lanciato un account, verifica: accessi sull'account pubblicitario del cliente e non dello studio, ammissibilità dei tipi di campagna richiesti, lista di esclusioni iniziale già popolata con i termini manifestamente irrilevanti, obiettivo di ACOS derivato da un margine che il cliente ti ha dato per scritto.

## Errori che costano

- **Spendere su una scheda prodotto debole.** Compri click che non possono convertire. È l'errore più frequente e più costoso del retail media.
- **Pubblicizzare un prodotto esaurito o senza posizione di rilievo nella casella d'acquisto.** La spesa gira, la conversione è prossima a zero. Imposta un controllo di stock prima di ogni revisione di budget.
- **Mescolare termini di marca propria, generici e di concorrenti nella stessa campagna.** L'ACOS aggregato diventa privo di significato e nasconde che i generici stanno perdendo denaro.
- **Fissare un obiettivo di ACOS senza conoscere il margine.** Puoi dichiarare un successo su una campagna che distrugge profitto. Nessun numero di efficienza vale senza il margine.
- **Non costruire la lista di esclusioni in negativo.** Le campagne automatiche pescano termini irrilevanti indefinitamente. È spesa pura.
- **Non escludere in negativo i termini promossi a esatta.** Competi contro te stesso e alzi il tuo costo per click.
- **Guardare solo l'ACOS e ignorare il TACOS.** Non vedi che il cliente sta sostituendo fatturato organico con fatturato pagato, a margine inferiore.
- **Trattare l'efficienza sulla marca propria come crescita.** Il cliente alza il budget sul termine che avrebbe convertito comunque e la crescita reale non arriva.
- **Promettere un tipo di campagna non ammissibile per quel cliente o quel marketplace.** Verifica registrazione marchio, stato vendor/seller e paese prima di metterlo nel preventivo.
- **Lanciare su una scheda appena pubblicata senza recensioni.** Paghi il traffico nella fase in cui converte peggio. Se il lancio è necessario, dichiara in anticipo che l'efficienza della prima fase non è l'indicatore da guardare.
- **Lasciare attive campagne automatiche senza revisione per settimane.** È il modo più silenzioso di perdere budget: nessun allarme scatta, la spesa gira regolarmente su termini irrilevanti.
- **Ottimizzare sulle vendite lorde ignorando i resi.** In alcune categorie il tasso di reso cambia il conto in modo sostanziale. Chiedi il dato al cliente.

## Quando NON usare il retail media

- Il prodotto non è venduto sul marketplace, o il cliente non ne controlla la scheda. Senza controllo della scheda non puoi rispondere del risultato.
- La scheda è debole e il cliente non intende sistemarla. Rifiuta il lavoro o vendi prima il lavoro sulla scheda.
- Margine di contribuzione troppo sottile per sostenere un costo per click in un'asta affollata. Fai il conto prima.
- Categoria dominata da pochi grandi con budget incomparabile e nessuna differenziazione di prodotto: compri posizioni che non trattieni.
- Servizi, B2B complessi, prodotti configurabili o a trattativa: il marketplace non è il canale.
- Il cliente vuole costruire una relazione diretta e dati propri: nel retail media il cliente finale è della piattaforma. Se la priorità strategica è il dato di prima parte, dillo e proponi un canale diretto.
- Rete retail media che non espone report dei termini né esclusioni: non è ottimizzabile, quindi non è un canale di performance. Trattala come display e prezzala come tale.

## Chiusura di ogni task

Dichiara: da dove vengono i dati di margine usati per fissare l'obiettivo (cliente, stima, assenti), quale finestra di attribuzione della piattaforma è in uso, cosa non hai verificato e quale rischio porta.
