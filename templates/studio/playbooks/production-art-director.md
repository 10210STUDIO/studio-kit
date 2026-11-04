# Playbook — production-art-director

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-10-28] Lab dei Pantone sui siti aggregatori = conversione dell'HEX, non misura

**Pattern:** non calcolare ΔE tra un colore di marca e i "Lab Pantone" di colorxs, pantonetools e simili: per i coated sono l'HEX di schermo riconvertito in Lab D65. Per il CMYK usa i dati di caratterizzazione Fogra (registry.color.org/cmyk-registry/chardata/FOGRA39L.txt, FOGRA52.txt; una riga per ogni combinazione CMYK, es. C0 M100 Y100 K0 per il pieno M+Y) invece di cercare conversioni CMYK di terzi. Senza profili ICC sul Mac (c'è solo Generic CMYK) si leggono Lab dai file .txt.
**Evidenza:** per tre Pantone coated l'HEX pubblicato, riconvertito in Lab D65, coincide al centesimo con il Lab pubblicato: è una conversione, non una misura. Lo stesso pieno C0 M100 Y100 K0 vale FOGRA39 L47/a68/b48 e FOGRA52 L52,6/a56,0/b25,5 (croma 83 contro 62): su carta non patinata un colore saturo perde circa un quarto di croma.
**Quando non vale:** i Lab uncoated (Pantone U) non coincidono con l'HEX e sono probabilmente dati veri, ma si trovano solo copie di terzi. Per un ΔE di stampa reale serve la lettura dello spettrofotometro sul campione stampato.
**Cliente/progetto:** generale.

## [2026-10-29] Foto AI con luce dura leggibile: Nano Banana Pro, e i riquadri si ordinano al rapporto nativo

**Pattern:** per still life e ritratti con una sola luce dura (ombra netta, niente sorriso) in Higgsfield usa `nano_banana_pro` (2 crediti a 2k, 4 a 4k; 1:1, 3:2, 2:3, 4:3, 3:4, 4:5, 5:4, 9:16, 16:9, 21:9). Soul 2.0 e Seedream 5 Pro non fanno 4:5. Prima di generare leggi i riquadri reali del layout e ordina ogni scatto al suo rapporto nativo: per i panoramici estremi (4,5:1) chiedi 21:9 con il soggetto nella fascia centrale e ritaglia, non ritagliare un 16:9. Quattro varianti per scatto e una scelta: circa 177 crediti per 19 scatti finiti.
**Evidenza:** a parità di prompt Soul inventa testo nell'immagine, Seedream dà sorrisi e luce a chiazze, Nano Banana Pro regge luce e ombra. Un 16:9 ritagliato a 4,53:1 perde il 60% dell'altezza e la testa. Il 21:9 con soggetto centrale regge il ritaglio. Nessun seed: le varianti non sono riproducibili.
**Quando non vale:** confronto su due soli prompt per modello. Non verificato per prodotti reali di cliente (serve immagine di riferimento) né per testo leggibile.
**Cliente/progetto:** generale.

## [2026-10-29] Foto AI: controlla i finalisti a pieno formato, la scelta della variante pesa più della correzione colore

**Pattern:** ingrandisci i finalisti prima di scegliere: cunei scuri ai bordi del tavolo, vetri con sagome fantasma, retini e tessuti troppo regolari, fondo che vira da variante a variante (taupe, lilla, verde grigio). Il cuneo si toglie con un ritaglio di pochi punti; la deriva di colore non si corregge bene dopo, si evita scegliendo la variante.
**Evidenza:** su 19 scelte la neutralizzazione del bianco ha mosso i canali meno del 2%. In uno scatto la variante con vetro trasparente aveva una sagoma fantasma, quella con vetro piatto no.
**Quando non vale:** valutazione visiva su una sola serie.
**Cliente/progetto:** generale.

## [2026-10-29] Video hero da Seedance 2.0 su carta piegata: verifica primo contro ultimo fotogramma prima di tenerlo

**Pattern:** estrai inizio, metà e fine (ffmpeg -ss, scale 1200) e confronta la geometria degli oggetti rigidi e l'ombra. Un loop esiste solo se primo e ultimo fotogramma coincidono; un clip di 6 s non lo fa da solo.
**Evidenza:** due clip Seedance 2.0 21:9 (1470x630, 6 s, prompt "carta rigida, solo la luce si sposta") hanno cambiato ampiezza delle pieghe e fatto comparire cunei d'ombra scuri: scartati entrambi, slot lasciato scoperto.
**Quando non vale:** due soli clip, un solo prompt; non provato con image-to-video partendo da un fotogramma approvato né con soggetti non rigidi.
**Cliente/progetto:** generale.

## [2026-10-29] Foto AI per i casi cliente: prima i layout, poi la scelta si fa sul dettaglio ritagliato

**Pattern:** su ogni finalista ritaglia il soggetto a risoluzione piena (crop, poi riduzione a ≤1600 px) e cerca: geometrie incoerenti negli oggetti costruiti (scala, sgabello), vignette grigie o cornici dentro l'immagine (muro a secco inquadrato come foto incorniciata), fondo che vira tra varianti. Le varianti "riempi il fotogramma" (dettaglio) riescono più spesso di quelle con soggetto piccolo nello spazio vuoto.
**Evidenza:** su 35 PNG, 12 slot coperti con zero rigenerazioni; due varianti del muro a secco su tre avevano la foto inscatolata in un bordo grigio, una era a pieno formato.
**Quando non vale:** valutazione su una sola serie e un solo modello.
**Cliente/progetto:** generale.

## [2026-11-01] Foto AI "da reportage" con Nano Banana Pro: un sorgente 21:9 4k serve desktop e telefono, ma le cornici e il testo fantasma vanno tolti a mano

**Pattern:** per slot con ritaglio desktop (2,2:1 / 1,8:1) e telefono 4:5 genera un solo 21:9 4k (6336x2688) con il soggetto nella fascia centrale: il 4:5 centrale dà 2150x2688 (lato lungo ≥ 2400). I 4:5 nativi escono 3712x4608. Nel prompt "no border" non basta: il modello aggiunge comunque cornici bianche o nere di film (4-6% per lato), si tolgono con un trim fisso per file e poi si rifà il 4:5 esatto. Righelli, schede, fogli di musica e tovaglie con segni portano cifre o lettere inventate: ripulisci solo se la regione è una superficie uniforme (filtro mediano 31 + grana gaussiana σ=3 su un poligono interno ai bordi), altrimenti i rattoppi quadrati si vedono a 100% e si scarta la variante.
**Evidenza:** 29 immagini a 4 crediti = 116 crediti; 12 scartate (cornici troppo larghe, una tovaglia del colore vietato dal brand, portauova con posti tagliati, strumenti extra). Il filtro ha pulito un righello ma ha lasciato la grana a chiazze e, con i rattoppi puntuali, blocchi visibili su un secondo.
**Quando non vale:** il rilevatore automatico di margini scambia lo sfondo nero (tende, giacche) per cornice: ha dato falsi positivi su 4 file di 18, va verificato a occhio. Persone di spalle, flash e scene d'insieme reggono; volti, mani nei campi lunghi e strumenti musicali multipli no (un quinto musicista compare ai bordi nel 21:9 largo).
**Cliente/progetto:** generale.

## [2026-11-01] Bozze AI di 12 idee fotografiche (Nano Banana Pro): i difetti di concetto non sono quelli di mano

**Pattern:** su idee costruite su un gesto o su una cosa che non deve leggersi, i difetti arrivano dal concetto, non dalla mano o dal volto. Controlla prima: (1) il gesto richiesto è quello mostrato? ("tirare il colletto" esce come mano sul petto, "portare un peso" come tela appoggiata); (2) il numero di persone nel gruppo (chieste 5, uscite 6, con una testa nascosta contro una guancia); (3) la forma "illeggibile" non diventa una lettera (una banda curva ha fatto una U); (4) un libro bianco passa per rivista solo con dorso piatto e poche pagine. Con il soggetto fuori centro il 4:5 centrale taglia il gruppo: scegli il centro del ritaglio per file, non fisso. Mani e dita a 100% hanno retto in 5 casi su 5.
**Evidenza:** 12 bozze a 4 crediti + 3 rigenerazioni; le tre rifatte (lettera leggibile, quattro blocchi con cifre, due persone che guardano in camera) sono migliorate passando da "lettera enorme" a "banda curva astratta" e da "blocchi" a "cinque blocchi descritti uno a uno".
**Quando non vale:** una sola serie, un solo modello, nessun seed; ogni rigenerazione è un solo tentativo.
**Cliente/progetto:** generale.

## [2026-11-04] Stampa offset: condizioni Fogra e ISO 12647-2 [P]

**Pattern:** per colore in offset non esiste un profilo universale: chiedi allo stampatore la condizione di stampa e scrivila nella scheda di consegna. Sul sito Fogra le condizioni correnti per foglio sono FOGRA51 (carta patinata, «PS 1», profilo PSO Coated v3) e FOGRA52 (non patinata con sbiancanti ottici, «PS 5», PSO Uncoated v3), archivio V1.0 del 23.09.2020. FOGRA39 («PT1/2», carta patinata 115 g/m², profilo ISO Coated v2) è un set più vecchio, nell'archivio FOGRA39-FOGRA60 v2 del 02.06.2024. Dati di caratterizzazione: fogra.org/en/downloads/work-tools/characterisation-data.
**Evidenza:** pagina Fogra letta il 2026-11-04. La pagina avverte che le curve di aumento del punto per FOGRA51/52 «are different from ISO 12647-2:2007». ISO 12647-2:2013 (edizione 3) risulta «to be revised» (stadio 90.92 dal 2025-09-09) e sostituita da ISO/CD 12647-2 in sviluppo (pagina ISO, copia archiviata: iso.org rifiuta le richieste dirette).
**Quando non vale:** non ho letto cosa usa uno stampatore preciso: la pagina Fogra dà le condizioni, non chi le adotta. Digitale, flexo, serigrafia e grande formato hanno altri riferimenti, non cercati. Il «ΔE medio ≤ 3,0» per la certificazione PSO l'ho visto solo in una guida di terzi: non usarlo (vedi Da verificare).
**Cliente/progetto:** generale.

## [2026-11-04] PDF di stampa: livelli PDF/X [P]

**Pattern:** il livello PDF/X lo sceglie lo stampatore; chiedi quale per iscritto. Dalla tabella PDF Association: PDF/X-1a:2003 (ISO 15930-4:2003) = scambio completo, solo CMYK, nessun dato colour-managed, PDF 1.4 senza trasparenza. PDF/X-4 (ISO 15930-7:2010) = scambio completo, dati colour-managed ammessi (Gray, RGB, CMYK), PDF 1.6; PDF/X-4p = profilo ICC esterno. PDF/X-6 (ISO 15930-9:2020) = PDF 2.0.
**Evidenza:** pdfa.org/resource/iso-15930-pdfx letta in copia archiviata (richiesta diretta: 403). La pagina ISO di 15930-7:2010 dice «last reviewed and confirmed in 2026», stadio 90.93, quindi resta corrente.
**Quando non vale:** la tabella dice cosa permette ogni livello, non quale preferire né quale accettano gli stampatori: una frase «X-4 raccomandato, X-1a ancora il più richiesto» l'ho vista solo in un riassunto di motore di ricerca, non sulla pagina: non la considero provata. Se lo stampatore chiede X-1a, il colore va convertito in CMYK prima dell'esportazione.
**Cliente/progetto:** generale.

## [2026-11-04] Imballaggi: Regolamento (UE) 2025/40 (PPWR) [P]

**Pattern:** si applica dal 12 agosto 2026 (art. 71). L'etichetta armonizzata sulla composizione dei materiali (pittogrammi, art. 12(1)) scatta dal 12 agosto 2028 oppure 24 mesi dopo l'entrata in vigore degli atti di esecuzione, «whichever is the latest»: il 2028 è la data più vicina possibile, non certa. Le dichiarazioni ambientali sull'imballaggio (art. 14) sono ammesse solo per proprietà che superano i requisiti minimi del regolamento e devono dire se riguardano l'unità, una parte o tutto l'imballaggio. Gli obblighi sono del fabbricante (cliente o suo fornitore), non dello studio: lo studio chiede al cliente quale marcatura e quale claim sono approvati.
**Evidenza:** testo del regolamento letto su EUR-Lex/Cellar (celex 32025R0040), 2026-11-04: art. 71, art. 12(1), art. 14.
**Quando non vale:** letti solo questi tre articoli. Non letti i requisiti per tipo di imballaggio, le esenzioni e gli atti di esecuzione (pittogrammi non ancora definiti). Un claim «riciclabile» o «compostabile» sul pack va comunque a `compliance-rights-officer` (`ad-claims-disclosure`).
**Cliente/progetto:** generale.

## [2026-11-04] Asset AI in stampa e packaging: si passa da compliance, non si decide qui [P]

**Pattern:** ogni immagine AI che finisce su stampato, packaging o espositore va a `compliance-rights-officer` prima della preparazione definitiva dei file, con: strumento e modello, file originale, prompt, se mostra persone, oggetti o luoghi reali. Lo studio, di norma, usa lo strumento (utilizzatore), non lo fornisce. L'art. 50 dell'AI Act (Reg. UE 2024/1689) si applica dal 2 agosto 2026; il rinvio al 2 dicembre 2026 (Reg. UE 2026/1744, art. 111(4)) vale solo per i fornitori di sistemi già sul mercato e solo per la marcatura dell'art. 50(2): non per chi usa lo strumento. Se il contenuto è un'opera evidentemente artistica, creativa o di finzione, l'art. 50(4) limita l'obbligo alla «disclosure of the existence of such generated or manipulated content in an appropriate manner that does not hamper the display or enjoyment of the work». Le Linee guida C(2026) 5054 (20.7.2026) non sono vincolanti; il Codice di condotta (10.6.2026) chiede metadati firmati e filigrana e non nomina C2PA.
**Evidenza:** EUR-Lex/Cellar, 2026-11-04.
**Quando non vale:** non so se un'immagine AI su una scatola o una brochure ricada nell'art. 50(4) né in che forma vada dichiarata su carta: è la domanda per compliance, non una regola che ricavo. Il testo del packaging resta del cliente (vedi PPWR sopra).
**Cliente/progetto:** generale.

## [2026-11-04] Conservare l'originale AI con i suoi metadati [P]

**Pattern:** archivia accanto al file di stampa l'originale scaricato, senza ricodificarlo, con modello e prompt. La specifica C2PA corrente è la 2.5 (spec.c2pa.org). La documentazione C2PA dice che i metadati di provenienza si possono togliere (§7.2.3 dell'explainer): per questo esistono i Content Credentials «durevoli», con filigrana e impronta.
**Evidenza:** verifica del 2026-11-04: le specifiche non lo dicono, ma la misura sì: misurato il 2026-11-04 con `c2patool` 0.28.4: il sorgente Seedance ha un manifesto C2PA valido (firma non nella lista di fiducia di c2patool), il master ricodificato con ffmpeg non ha più nessun manifesto («No claim found»); vedi playbook di ai-film-director. Sulle immagini per la stampa non ancora provato.
**Quando non vale:** non provato se la conversione RGB→CMYK e l'esportazione in PDF/X mantengono il manifesto: per saperlo serve un file vero e `c2patool` (vedi Da verificare). SynthID è verificato solo per le API Google, non per le uscite passate da Higgsfield.
**Cliente/progetto:** generale.

## Da verificare

(ipotesi non ancora dimostrate)
