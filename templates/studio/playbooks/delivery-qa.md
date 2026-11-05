# Playbook — delivery-qa

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-10-29] Frasi scartate: grep sul deliverable e sulle fonti a monte

**Pattern:** il cliente a volte scarta una frase che resta "attiva" nei documenti sorgente (verbale, messaggi, tono di voce, posizionamento). Ogni deliverable derivato la ripesca. Va fatto un grep di ogni frase scartata sia nel deliverable sia nelle fonti, e va segnalata la fonte ancora attiva come causa.
**Evidenza:** il QA del brand aveva dato OK su "nessuna frase scartata attiva". Poi una tagline scartata è comparsa come H2 del sito, perché era ancora elencata due volte nei messaggi, nel tono di voce e nel posizionamento.
**Quando non vale:** quando la fonte segna la frase come scartata in modo esplicito. Il grep va letto, non solo contato.
**Cliente/progetto:** generale.

## [2026-10-29] Un "[da confermare]" in testa non neutralizza le frasi che seguono

**Pattern:** un prefisso o una nota tra parentesi sopra un paragrafo copre solo sé stessa. Il template rende il resto come testo pieno, e chi toglie la nota lascia il claim inventato. Va controllato frase per frase cosa finisce dentro `[...]` e come lo rende il template, sulla cattura e non nel sorgente.
**Evidenza:** in un sito c'era, per esempio, "[da confermare: risultato] … [risultato inventato]". I paragrafi "What we did" erano in nero serif sotto una sola nota grigia che diceva "tutto il blocco è un'ipotesi".
**Quando non vale:** se il template applica lo stile placeholder all'intero blocco, cosa che va vista sulla cattura.
**Cliente/progetto:** generale.

## [2026-10-29] Immagini AI nei casi cliente = lavoro inventato, anche con il README in regola

**Pattern:** per ogni immagine dentro un caso, OG compresa, si confronta il contenuto reale con didascalia e alt. Un'immagine AI con didascalia specifica del cliente ("the launch poster", "the day of the opening") afferma un lavoro che non esiste. Anche un alt generico come "cover of the case" fa intendere un materiale del cliente.
**Evidenza:** in un caso reale le regole interne vietavano di mostrare immagini AI come lavori per clienti, eppure copertine e gallerie di alcuni casi erano generate; una didascalia non corrispondeva all'immagine.
**Quando non vale:** pagine non di caso con didascalia neutra o dichiarata AI.
**Cliente/progetto:** generale.

## [2026-10-29] L'evidenza può essere più vecchia del sorgente: confronta gli orari

**Pattern:** prima di giudicare sulle catture, si confronta l'orario delle catture con il sorgente del copy e con la build (`stat`). Se il sorgente è più recente, si rifà l'evidenza o si verifica sul `dist/`, perché la cattura non mostra il sito che si consegna.
**Evidenza:** catture delle 14:34–14:37, file dei testi delle 14:40, didascalie diverse tra la cattura e `dist/`.
**Quando non vale:** quando la cattura è generata dalla stessa build in una pipeline unica.
**Cliente/progetto:** generale.

## Pattern ricorrenti (QA di siti)
- Confronta il sito con la pagina del book dedicata al sito, non solo con le regole generali: piè, primo schermo e numero di campi di colore derivano lì.
- Art direction: i `media` dei `<source>` devono coincidere con i breakpoint CSS (768 vs 767 = immagine mobile in cornice desktop a 768 px). Cattura sempre esattamente 768.
- Primo schermo desktop a 1440×900 e 1024×768: verifica che l'H1 sia sopra la piega.
- Form mailto: dopo l'invio serve un messaggio in pagina, altrimenti chi non ha un client di posta non vede nulla. Senza JS: niente `novalidate` nel markup e oggetto nell'action.
- Sito IT con frasi firma in inglese: serve `lang="en"` sull'elemento (WCAG 2.2, criterio 3.1.2, livello AA; W3C, verificato il 2026-11-01). axe non lo segnala.
- Nascondere il marchio con `visibility:hidden` sul link toglie il link alla home anche alla tastiera: nascondi l'immagine, non il link.

## [2026-10-31] Cattura di un'animazione: l'attesa deve superare ritardo + durata massimi

**Pattern:** prima di giudicare menu, titoli a righe o reveal su una cattura, si leggono i token di motion (durata, stagger, delay) e si calcola quando finisce l'ultimo elemento. Se lo script cattura prima, quella cattura è da rifare, non da giudicare.
**Evidenza:** menu catturato a 1,2 s; con apertura 1400 ms, voci a 500 ms + i·140 + 1100 ms e il marchio a ~2,6 s, la cattura mostrava voci 03-04 vuote e il marchio assente, a 320 e 375.
**Quando non vale:** con `prefers-reduced-motion` forzato nella cattura, perché lì i token vanno a 0.
**Cliente/progetto:** generale.

## [2026-10-31] A 320 px la lingua con l'etichetta più lunga fa collidere i comandi flottanti

**Pattern:** i bottoni fissi ancorati a sinistra e a destra si controllano a 320 px nella lingua con l'etichetta più lunga. Un fix di allineamento verificato solo in EN o solo a 375 non basta.
**Evidenza:** per esempio un'etichetta IT lunga («[etichetta lunga]») + «Menu» a 320 px che si toccano senza spazio, mentre in EN e a 375 sono separati.
**Quando non vale:** quando i comandi vanno a capo o si accorciano con una media query sotto i 360 px.
**Cliente/progetto:** generale.

## [2026-10-31] Catture di overlay animati: confronta l'attesa dello script con le durate CSS

**Pattern:** prima di giudicare menu o overlay su una cattura, si leggono le durate nel CSS di motion (apertura + ritardo ultimo elemento + durata) e si confrontano con il `waitForTimeout` dello script. Se l'attesa è più corta, la cattura è a metà animazione: voci mancanti e strisce scoperte non sono bug, e la cattura va rifatta.
**Evidenza:** script con attesa di 1200 ms, sipario di 1400 ms e voci finite a circa 2,6 s. In cattura c'erano solo 1,5 voci su 4 e 8 px di hero scoperti in alto.
**Quando non vale:** con reduced-motion attivo, o quando l'animazione è più corta dell'attesa.
**Cliente/progetto:** generale.

## [2026-10-31] Campi obbligatori del form contro l'elenco "necessari" dell'informativa

**Pattern:** si confronta l'attributo `required` di ogni campo del form con la frase dell'informativa su quali dati servono. Un campo obbligatorio che l'informativa non elenca rende l'informativa inesatta.
**Evidenza:** Company/Azienda era `required`, ma l'informativa diceva che servono solo nome, email e messaggio.
**Quando non vale:** quando l'informativa elenca tutti i campi obbligatori.
**Cliente/progetto:** generale.

## [2026-10-31] Orizzontale a 343 px: object-position e gallerie con colonne fisse

**Pattern:** in orizzontale su telefono (circa 734×343) si guarda ogni media full-bleed in cerca di volti, loghi o prodotti tagliati: un `object-position: center` che a verticale funziona taglia teste e marchi quando la fascia diventa bassa. Poi si guardano le gallerie: una griglia con larghezze fisse da mobile e `space-between` lascia miniature piccole agli estremi, un vuoto bianco al centro e l'ultima immagine fuori dal margine.
**Evidenza:** volti tagliati agli occhi o al naso nella hero e nei poster, il logo di un cliente tagliato della prima lettera, poster larghi circa 140 px con quello a destra a filo del bordo.
**Quando non vale:** quando il sito blocca l'orientamento, o quando i media hanno un'altezza minima con un crop dedicato per l'orizzontale.
**Cliente/progetto:** generale.

## [2026-10-31] Desktop 1920: container centrato contro header ai bordi, e crop dei poster

**Pattern:** a 1920 si confronta il margine dell'header con quello del contenuto: se il contenuto resta a max-width centrato e l'header resta a 64 px, la pagina sembra due griglie. Poi si controllano le file di poster o di immagini con testo: un crop pensato per 1440 può tagliare titoli e date a 1920.
**Evidenza:** header a 64 px e contenuto a 304 px. Nella home e nell'anteprima del caso successivo i poster laterali tagliavano il nome del cliente e la data dell'evento.
**Quando non vale:** quando l'header usa lo stesso container del contenuto, o quando le immagini non contengono testo.
**Cliente/progetto:** generale.

## [2026-10-31] Didascalie staccate dai numeri grandi

**Pattern:** sotto ogni numero grande si misura la distanza fino alla sua didascalia. Oltre circa 80 px, o se la didascalia finisce in un'altra schermata, il lettore non le legge più insieme.
**Evidenza:** in una pagina caso due numeri grandi stavano a 220–300 px dalle loro didascalie a 1920.
**Quando non vale:** mai.
**Cliente/progetto:** generale.

## [2026-10-31] Reveal che non scatta sul primo schermo: si misura, non si rifà la cattura

**Pattern:** se un testo della hero manca in una cattura, prima di dare la colpa al tempo di attesa si legge nel browser la classe e il `transform` delle righe dopo 5 s, poi dopo uno scroll di 80 px. Se le righe restano spostate finché non si scorre, l'IntersectionObserver non vede l'elemento che sta negli ultimi 100–150 px del primo schermo: il visitatore vede un buco sotto il titolo.
**Evidenza:** a 834×1194 il sottotitolo della hero resta a `translateY(35px)` senza classe `.in` dopo 5 s, e compare solo dopo lo scroll. A 768×1024 sta più in alto e si vede.
**Quando non vale:** quando il reveal parte a tempo e non allo scroll.
**Cliente/progetto:** generale.

## [2026-10-31] Tablet verticale 768–834: colonne strette della griglia a 12 e asset sostituiti

**Pattern:** appena scatta la griglia a 12 colonne, si guardano le colonne di 2–3 span: CTA che vanno a capo, date su quattro righe, liste di tag che iniziano con un separatore orfano. Poi si confronta ogni immagine con la stessa a 656: un asset art-direction che cambia a ≥768 può arrivare a bassa risoluzione o con una cornice nera incorporata.
**Evidenza:** per esempio etichette spezzate su più righe («[parola] / [parola]», «[data] / [stato]»), un poster sfocato e con cornice a 768 e 834, nitido a 656.
**Quando non vale:** sotto 768, o quando le colonne meta passano sotto al titolo fino a circa 1024.
**Cliente/progetto:** generale.

## [2026-11-04] Etichetta AI: l'art. 50 dell'AI Act vale già per chi pubblica

**Pattern:** dal 2 agosto 2026 vale l'art. 50 del Reg. (UE) 2024/1689. Il rinvio al 2 dicembre 2026 (Reg. UE 2026/1744, art. 111(4), GUUE 24.7.2026) riguarda solo i fornitori di sistemi già sul mercato e solo la marcatura dell'art. 50(2): chi usa lo strumento e pubblica deepfake deve già etichettare (art. 50(4)). Per opere evidentemente artistiche, creative o di finzione l'obbligo si limita a dichiarare l'esistenza del contenuto generato «in modo adeguato che non ostacoli la fruizione dell'opera». Il Codice di condotta (10.6.2026, non vincolante) chiede metadati firmati e filigrana, e per i video l'icona all'inizio, ripetuta a intervalli; non nomina C2PA. In QA: un media AI realistico senza etichetta visibile è un rilievo bloccante; forma e sufficienza dell'etichetta le giudica `compliance-rights-officer`.
**Evidenza:** [P] testo AI Act e Reg. 2026/1744 su Cellar; Linee guida C(2026) 5054 del 20.7.2026 (non vincolanti, art. 96(1)(d)); Codice di condotta. Letti il 2026-11-04. «I titoli di coda non bastano» NON è una frase dei documenti: non citarla come norma.
**Quando non vale:** contenuti chiaramente non realistici (il giudizio resta a compliance); il rinvio di dicembre vale per i fornitori dei modelli, non per {{STUDIO}}.
**Cliente/progetto:** generale.

## [2026-11-04] Accessibilità: WCAG 2.1 AA è l'obbligo, WCAG 2.2 AA la progettazione

**Pattern:** il riferimento legale per l'EAA resta EN 301 549 v3.2.1, cioè WCAG 2.1 AA; le linee guida AgID (det. 38/2026 del 4.3.2026, GU n. 69 del 24.3.2026) seguono la v3.2.1. La v4.1.1 (settembre 2026) si basa su WCAG 2.2 ma dà presunzione di conformità solo dopo la citazione in Gazzetta UE. In QA: si boccia sotto 2.1 AA; i criteri nuovi di 2.2 AA (2.4.11 Focus Not Obscured, 2.5.8 Target Size) si segnalano come rilievi di progettazione, e nessun testo per il cliente presenta WCAG 2.2 come obbligo. 2.5.8: target di almeno 24×24 px CSS, salvo spaziatura (cerchio di 24 px centrato che non tocca altri target), controllo equivalente nella pagina, target dentro una frase, dimensione decisa dal browser, presentazione essenziale. WCAG 3.0 è Working Draft (10.9.2026): non è un riferimento.
**Evidenza:** [P] ETSI EN 301 549 v4.1.1 (prefazione), AccessibleEU 7.9.2026, AgID v1.0, W3C WCAG 2.2 (REC 12.12.2024) e Understanding 2.4.11; testo di 2.5.8 letto sulla pagina Understanding del W3C il 2026-11-04.
**Quando non vale:** se la v4.1.1 è stata citata in Gazzetta UE dopo il 7.9.2026 (non controllato); microimprese che forniscono servizi, esentate (D.Lgs. 82/2022, art. 3 c. 3): l'esenzione la valuta compliance, il QA segnala comunque.
**Cliente/progetto:** generale.

## [2026-11-04] Core Web Vitals: soglie al 75° percentile, mobile e desktop separati

**Pattern:** LCP ≤ 2,5 s, INP ≤ 200 ms, CLS ≤ 0,1, al 75° percentile dei caricamenti, mobile e desktop separati. Le varianti con soft navigation per le SPA aggiunte a CrUX (dataset di settembre 2026) sono sperimentali: non sono il criterio. Una misura di laboratorio (Lighthouse) su un sito non ancora online non è il p75 dei visitatori: nel report si scrive come stima di laboratorio.
**Evidenza:** [P] web.dev/articles/vitals (pagina del 31.10.2024), note di rilascio CrUX del 13.10.2026. I blog SEO con «LCP 2,0 s dal 2026» non hanno riscontro nelle fonti Chrome.
**Quando non vale:** deliverable che non sono pagine web (deck, video, PDF).
**Cliente/progetto:** generale.

## [2026-11-04] Claim ambientali: dal 27 settembre 2026 i generici sono vietati

**Pattern:** la Dir. (UE) 2024/825, recepita dal D.Lgs. 20.2.2026 n. 30 (GU n. 56 del 9.3.2026, in vigore dal 24.3.2026), si applica dal 27.9.2026. Vieta i claim ambientali generici («eco-friendly», «green») senza prestazione ambientale eccellente riconosciuta, e i claim sull'intero prodotto o sull'intera attività quando riguardano solo un aspetto. In QA: ogni claim ambientale nel deliverable è un punto da passare a `compliance-rights-officer`, anche se ha una fonte.
**Evidenza:** [P] Cellar 32024L0825 (Allegato I) e Normattiva D.Lgs. 30/2026. Vigilanza AGCM: [S], da una sintesi non riletta sulla fonte.
**Quando non vale:** claim non ambientali (prezzo, primati, confronti): restano nel controllo 2 con `ad-claims-disclosure`.
**Cliente/progetto:** generale.

## [2026-11-04] Comando di pausa video: stato vero in ogni combinazione e in ogni percorso

**Pattern:** quando cambia la condizione che mostra un comando video, provalo con movimento ridotto e con risparmio dati, su touch e con il mouse, in ogni pagina: un comando che compare dove nulla si muove mente sul proprio stato. Poi cerca con grep ogni `.play()` fuori dal modulo che gestisce lo stato: mettere in pausa e poi passare dal player con audio è il percorso che fa ripartire i video.
**Evidenza:** su un sito, in una pagina su touch con movimento ridotto e risparmio dati, compariva «Video: Play» e non partiva nulla, più un errore JS (gli elementi video erano stati tolti dal modulo delle animazioni). A fine video con audio, il codice della home chiamava `v.play()` e il giro muto ripartiva dopo la pausa.
**Quando non vale:** siti con un solo punto che avvia i video e senza varianti per movimento ridotto o risparmio dati.
**Nota di metodo:** `python3 -m http.server` non serve le richieste Range, quindi `currentTime = duration - x` riporta il video quasi all'inizio e `ended` non scatta mai. Per provare la fine di un video lascialo arrivare in fondo da solo, oppure usa un server che supporta Range.
**Cliente/progetto:** generale.

## [2026-11-05] Kit: un file nuovo deve entrare nella tabella di copia, e non rompere ciò che l'aggiornamento deduce
**Pattern:** per ogni file nuovo del kit cerca la riga della tabella di copia dell'installer che lo porta a destinazione (un `chmod` sul file non lo copia). Poi chiediti se la funzione nuova riempie cartelle che l'aggiornamento usa per dedurre le risposte. Gli script che ricavano una sigla dal nome di una cartella vanno provati con un nome di soli caratteri non ASCII e con un simbolo in mezzo («Cognome ★ Città»), accanto a un cliente esistente con la stessa prima parola: `iconv //TRANSLIT` di macOS si ferma al primo carattere che non sa convertire e butta il resto (serve `-c`). Le voci di playbook riscritte da un modello vanno confrontate per contenuto con quelle già nel file: l'aggiornamento confronta solo i titoli.
**Evidenza:** in una versione del kit, uno script per i nuovi clienti era stato reso eseguibile ma mancava dalla tabella, quindi l'hook sarebbe fallito senza errori; lo slug dello studio era dedotto da «l'unica cartella clienti diversa da quella di esempio», condizione che le cartelle progetto facevano saltare; un nome di sole lettere accentate dava una sigla vuota e un percorso con un segmento mancante; una voce di compliance su C2PA ripeteva due voci con titoli diversi. Nella versione successiva, un nome con un simbolo in mezzo veniva accorciato alla prima parola e caricava in silenzio il contesto di un cliente esistente; nomi che iniziavano con un'emoji o con caratteri non latini non facevano nulla.
**Quando non vale:** installer che copiano l'intera cartella dei modelli senza un elenco.
**Cliente/progetto:** generale.

## Da verificare

(ipotesi non ancora dimostrate)
