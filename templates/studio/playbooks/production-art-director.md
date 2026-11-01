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

## Da verificare

(ipotesi non ancora dimostrate)
