---
name: rights-licensing-clearance
description: Usa quando un deliverable contiene font, foto stock, musica, volti, luoghi o asset generati con AI — e prima di ogni consegna. Copre licenze font (desktop/web/app/logo), limiti stock, sync musicale, release, diritti su output AI, titolarità finale e clearance. Non è parere legale.
---

**Checklist operativa, non consulenza legale.**

# Diritti e licenze — clearance prima della consegna

**Questa skill non è consulenza legale.** Produce checklist operative e segnala i rischi contrattuali e di licenza: le decisioni, i contratti e le garanzie verso il cliente vanno validate da un legale. Il valore di questa skill è impedire che un asset non licenziato esca dallo studio, non interpretare una licenza al posto di un avvocato.

Regola madre: **la licenza non si deduce, si legge.** Ogni affermazione su cosa è permesso deve poter essere ricondotta al testo dell'EULA o della licenza specifica acquistata, con riferimento al file o all'URL. Se non hai il documento, non hai la licenza.

## Verifica delle fonti

Non citare a memoria termini di licenza: cambiano, e cambiano per versione del prodotto. Usa `WebFetch` su:

- l'**EULA ufficiale della foundry** (il PDF o la pagina legale del venditore del font, non un riassunto di un marketplace);
- i **termini di licenza del fornitore stock** per il tipo di licenza effettivamente acquistato (standard/estesa/editoriale);
- i **termini della libreria musicale** e, per uso sui social, la documentazione della piattaforma sulla musica;
- i **termini di servizio del fornitore AI** per la sezione su titolarità dell'output, uso commerciale e indennizzo.

Riporta URL e data di consultazione. Dove la licenza è ambigua, scrivi "ambiguo, da chiarire con la foundry/il fornitore per iscritto": una mail di conferma del licenziante vale più di un'interpretazione.

## Font — l'errore più costoso

I font sono software. Una licenza copre un **tipo d'uso**, un **numero di postazioni o pageview** e una **durata**. Le foundry controllano, e il contenzioso font è l'incidente più frequente e più caro negli studi.

Separa sempre questi perimetri, perché sono licenze diverse e vanno acquistate separatamente:

- **Desktop**: installazione sui computer per creare artwork. Conta le postazioni reali, incluse quelle del cliente se l'artwork lo modifica lui. Un file aperto da un freelance esterno è una postazione in più.
- **Webfont**: servire il font da un sito. Spesso limitata a pageview mensili o a domini elencati. Un webfont servito oltre soglia è una violazione silenziosa che emerge mesi dopo.
- **App / software embedded**: app mobile, videogiochi, chioschi, software. Quasi sempre licenza dedicata e più costosa. Il font nel bundle di un'app non è coperto dalla desktop.
- **ePub / documenti embedded**: PDF con font incorporato, presentazioni distribuite, ebook. Verifica se l'embedding è permesso e in quale forma (subset, protezione).
- **Broadcast / video / OOH**: molte EULA pongono soglie legate all'audience o all'investimento media. Verifica prima di un lancio con grande copertura.
- **Loghi e marchi**: il punto più sottovalutato. Usare un font retail per disegnare un logo che verrà **registrato come marchio** è spesso escluso o richiede una licenza specifica, perché il cliente rivendica diritti esclusivi su una forma derivata dal font. Prima di depositare, verifica l'EULA e, se non è chiaro, ottieni conferma scritta dalla foundry o passa a un lettering disegnato ex novo.

Checklist font per progetto:

- [ ] Elenco di ogni famiglia e peso usato, con foundry e numero d'ordine.
- [ ] Tipo d'uso coperto per ciascuno: desktop, web, app, embedded, broadcast, logo.
- [ ] Numero di postazioni e di pageview coperte, confrontato con l'uso reale previsto.
- [ ] Titolare della licenza: studio o cliente. Se è lo studio, il cliente **non** la eredita alla consegna.
- [ ] Durata e rinnovo: le licenze a canone scadono e il sito smette di essere coperto.
- [ ] Modifiche al font (crenature custom, glifi ridisegnati, conversione formati) permesse o vietate.
- [ ] File font **non** inclusi nella consegna se la licenza non ne permette il trasferimento. Passa il link all'acquisto, non lo .otf.
- [ ] Alternativa open source identificata (con licenza verificata, tipicamente SIL OFL) come piano B di budget.

## Stock fotografico e video

Le licenze standard sono più strette di come vengono vendute. Da verificare caso per caso:

- **Uso editoriale**: vietato l'uso pubblicitario e promozionale. Le immagini editoriali sono quelle con persone, eventi, marchi o luoghi riconoscibili senza release. Non usarle in una campagna, mai.
- **Tirature e soglie**: molte licenze standard limitano le copie stampate, l'uso in prodotti destinati alla rivendita, l'affissione, l'uso televisivo.
- **Merchandise e print-on-demand**: quasi sempre escluso dalla standard; richiede licenza estesa.
- **Uso in logo o marchio**: praticamente sempre vietato. Un'immagine stock dentro un logo è un difetto che il cliente scoprirà quando proverà a registrarlo.
- **Esclusività**: le licenze standard non sono esclusive. Il concorrente del cliente può usare la stessa foto. Dillo prima, non dopo.
- **Sensibilità**: molte licenze vietano usi che accostano le persone ritratte a temi sensibili (salute, sessualità, politica, criminalità) senza cautele.
- **Prova d'acquisto**: conserva fattura, licenza e ID dell'asset nel progetto. Le richieste di risarcimento arrivano per asset usati anni prima.
- **Asset "gratuiti"**: verifica la licenza effettiva (CC0, CC-BY, licenza proprietaria del sito). La dicitura "free for commercial use" non è una licenza: trova il testo.

## Musica e sincronizzazione

Distingui sempre **due diritti**: la composizione (autore/editore) e la registrazione (fonogramma, etichetta). Servono entrambi.

- **Sincronizzazione** con immagini in movimento: richiede licenza sync esplicita. Non è coperta da nessun abbonamento di streaming consumer.
- **Librerie production music**: la via normale. Verifica perimetro (territorio, media, durata), se copre il paid media e se copre il broadcast.
- **Musica delle librerie delle piattaforme social**: concessa per contenuti **organici di account personali**, con restrizioni frequenti per account aziendali e quasi sempre non utilizzabile in paid. Verifica la documentazione corrente della piattaforma: un brand che usa un brano trend su un post sponsorizzato è un rischio reale, oltre al rischio di muting del contenuto.
- **Cover, remix, campioni**: diritti ulteriori. Non si risolvono in un progetto di studio.
- **Diritti connessi e collecting**: per usi in pubblico o in broadcast possono servire adempimenti verso gli enti di gestione collettiva. Verifica chi è obbligato — di norma il cliente o l'emittente — e mettilo per iscritto.
- **Musica generata con AI**: verifica i termini del fornitore su uso commerciale ed esclusività, e se il fornitore dichiara i dati di addestramento. Non garantire al cliente che il brano sia "libero da pretese di terzi" se il fornitore non lo garantisce a te.

## Model e property release

- Serve una **model release** per ogni persona riconoscibile in un uso promozionale. Firmata, con perimetro: media, territorio, durata, usi esclusi.
- **Minori**: release firmata da chi esercita la responsabilità genitoriale. Nessuna eccezione, nessuna foto "carina" senza carta.
- **Property release** per edifici riconoscibili e distintivi, interni privati, opere d'arte, marchi e prodotti inquadrati in modo evidente, animali di proprietà. In Italia e in UE la fotografia di beni culturali può avere vincoli propri: verifica presso l'ente che ha in consegna il bene.
- **Dipendenti del cliente** usati come talent: release comunque. Il rapporto di lavoro non implica il consenso all'uso dell'immagine.
- **Shooting in luoghi pubblici o commerciali**: permessi di ripresa e autorizzazioni locali. Sono responsabilità del produttore: accertati che ci sia un produttore.
- **Scadenze**: una release a termine fa scadere la campagna. Metti le date in un registro e controlla prima di ogni riuso.

## Contenuti generati con AI — cosa puoi garantire

Non promettere ciò che nessun fornitore ti promette.

- La **titolarità** sull'output generato non è assimilabile a quella di un'opera creata da una persona: in diverse giurisdizioni la protezione per un output puramente automatico è dubbia o esclusa. Conseguenza pratica: un asset chiave del brand (logo, personaggio proprietario) **non** va generato interamente da un modello se il cliente deve poterlo difendere. In Italia, dal 10/10/2025, l'art. 1 della L. 633/1941 protegge le opere dell'ingegno «umano», anche create con l'aiuto dell'AI, purché siano il risultato del lavoro intellettuale dell'autore (modifica dell'art. 25 della L. 132/2025; Normattiva, 2026-11-01). La giurisprudenza non è stata verificata: controllala prima di scriverne.
- Il **rischio di somiglianza**: un output può riprodurre elementi protetti, uno stile riconoscibile di un artista vivente, un marchio o un volto esistente. Controlla visivamente ogni output destinato alla pubblicazione, e fai una verifica inversa sulle immagini chiave.
- **Indennizzo**: alcuni fornitori offrono garanzie di indennizzo su piani specifici, con condizioni (uso delle funzioni indicate, filtri attivi, nessun prompt che evoca terzi). Verificale sul contratto del piano effettivamente in uso dallo studio, non sul materiale marketing.
- **Input**: non caricare materiale di terzi, asset di altri clienti o immagini di persone per generare derivati senza averne i diritti.
- **Dichiarazione al cliente**: dichiara quali asset sono AI-generated, con quale strumento e quale piano. Se il cliente chiede una garanzia di esclusività o di assenza di pretese di terzi, non concederla senza legale.
- Dove serve robustezza giuridica, la via è il **contributo umano documentato**: direzione, selezione, rielaborazione, con file di lavoro conservati.

## Chi detiene cosa alla fine del progetto

Scrivilo nel contratto prima, non nella mail di consegna dopo.

- **Cessione vs licenza**: il cliente ottiene la cessione dei diritti di utilizzazione economica sui deliverable finali, oppure una licenza con perimetro. Devono coincidere con il prezzo: la cessione totale e perpetua su tutti i media costa più di una licenza per un mercato e due anni.
- **Diritti morali** dell'autore: non si cedono. Puoi regolare la menzione e il consenso alle modifiche.
- **Asset di terzi**: font, stock, musica, plugin, librerie, template non diventano del cliente. Elenca esplicitamente ciò che il cliente deve licenziare in proprio e a partire da quando.
- **File sorgente**: stabilisci se sono inclusi. Non sono scontati e spesso non lo sono nel prezzo.
- **Strumenti e metodo** dello studio (framework, componenti riusabili, boilerplate) restano dello studio con licenza d'uso al cliente.
- **Portfolio e casi studio**: ottieni il diritto a mostrare il lavoro, con eventuale embargo e NDA rispettato.
- **Pagamento**: lega il trasferimento dei diritti al saldo. Un deliverable consegnato e non pagato deve restare non licenziato.

## Processo di clearance prima della consegna

Esegui e allega l'esito al pacchetto di consegna.

1. **Inventario asset**: ogni file che esce, con origine. Nessuna voce "non so da dove viene": se non lo sai, l'asset non esce.
2. **Mappa licenza per asset**: fornitore, tipo di licenza, ID/ordine, perimetro, scadenza, titolare della licenza.
3. **Confronto perimetro reale vs licenza**: media previsti, territori, durata, paid vs organico, stampa, OOH, app. Qui emergono le lacune.
4. **Release**: tutte presenti, firmate, in corso di validità, archiviate nel progetto.
5. **Verifica AI**: quali asset sono generati, con quale strumento e piano, controllo visivo di somiglianza, dichiarazione pronta.
6. **Verifica font nel codice**: file serviti dal nostro dominio, CDN della foundry, fallback, pageview stimate.
7. **Nome e marchio**: se il deliverable include un naming o un logo destinato a registrazione, segnala che serve una ricerca di anteriorità da parte di un consulente marchi. Lo studio non fa quella ricerca.
8. **Lacune**: elenco esplicito di cosa manca, con il rischio e l'azione (acquistare licenza, sostituire asset, ottenere release, fermare la consegna).
9. **Archivio**: cartella `rights/` nel progetto con licenze, fatture, release, email di conferma. Deve essere leggibile da chi non c'era.

## Errori che costano

1. **Font retail usato in un logo che il cliente registra.** Il danno emerge al deposito o quando la foundry contesta, e la correzione implica ridisegnare l'identità.
2. **Consegnare i file font al cliente** nel pacchetto brand. Distribuzione non autorizzata di software, nera su bianco nella cartella.
3. **Webfont oltre soglia pageview** dopo che il sito è andato bene. La licenza era giusta al lancio e sbagliata sei mesi dopo.
4. **Immagine editoriale in una campagna.** Violazione piana, spesso scoperta dall'agenzia di monitoraggio del fornitore stock.
5. **Brano trend della libreria social su un post sponsorizzato.** Contenuto mutato o rimosso nel migliore dei casi.
6. **Nessuna model release** perché "era un amico". L'amico cambia idea quando la foto è su un'affissione.
7. **Licenza intestata allo studio** e cliente che continua a usare l'asset dopo la fine del rapporto, convinto di esserne titolare: non hai scritto chi deteneva cosa.
8. **Mockup e asset del template di presentazione** finiti nel deliverable finale: i template hanno licenze che non coprono l'uso pubblico.
9. **Garantire al cliente che un asset AI è "nostro al 100%"**. Non lo puoi sapere e non ti è stato garantito.
10. **Archivio diritti inesistente.** Due anni dopo arriva una richiesta e nessuno trova la licenza: paghi anche quando eri in regola.

## Quando fermarsi e chiamare un legale

- Arriva una **lettera di contestazione o una richiesta di risarcimento** da foundry, fornitore stock, etichetta o autore. Non rispondere mai direttamente, non ammettere nulla, non rimuovere in silenzio prima di un parere: conserva tutto.
- Il cliente vuole **registrare come marchio** qualcosa che include asset di terzi o output AI.
- Il progetto richiede l'uso di un **marchio o personaggio di terzi** (co-branding, parodia, riferimento culturale riconoscibile).
- Si negoziano **cessioni totali, esclusività, indennizzi o manleve** verso il cliente.
- Un **collaboratore o freelance** ha prodotto parte del lavoro senza un contratto che ceda i diritti allo studio: il cliente non può ricevere ciò che lo studio non ha.
- Un cliente chiede di **usare un asset senza licenza** "perché nessuno se ne accorge". Metti il rifiuto per iscritto.

## Output atteso

Chiudi con: **tabella asset/licenza/perimetro**, **lacune con azione e costo stimato**, **cosa non hai potuto verificare e quale rischio porta al cliente**. Se esiste una sola lacuna bloccante, dillo in prima riga: la consegna non parte.
