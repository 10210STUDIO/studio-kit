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

## Da verificare

(ipotesi non ancora dimostrate)
