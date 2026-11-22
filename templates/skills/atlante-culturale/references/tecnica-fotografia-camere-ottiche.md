# Tecnica della fotografia — camere, obiettivi, pellicola, post

Manuale del mestiere: il corpo macchina, l'ottica, il supporto sensibile, il gesto, la post-produzione. Serve per tradurre un'intenzione («intimo», «clinico», «da rivista anni 90») in scelte fotografiche precise e poi in un prompt Higgsfield. La luce (esposizione, flash, modificatori, schemi) sta in `tecnica-fotografia-luce.md`; i riferimenti d'autore stanno in `fotografia.md`.
Nomi di prodotti (pellicole, obiettivi, camere, software) possono entrare nel prompt; nomi di fotografi no (`regole.md`). Gli autori compaiono solo in «Si vede», uso interno.
Stato di verifica (lettura del 2026-11-08, aggiornata nella verifica indipendente dello stesso giorno, vedi in fondo): catalogo Kodak, Fujifilm (Velvia 50/100, Provia 100F, Pro 400H, simulazioni), Ilford, CineStill e Polaroid letti sulle pagine dei produttori [P]; sensori e megapixel di Fujifilm GFX100 II, Hasselblad X2D 100C, Phase One IQ4 150MP e Fujifilm X-T5 letti sulle pagine/schede dei produttori [P]. Riletti nella stessa verifica anche Leica M11, Canon EOS R7, Nikon (Z MC 105, PC-E 45), Canon EF 135 Softfocus e la documentazione Adobe/Capture One [P]; restano [S] Zeiss/Contax/Yashica (solo camera-wiki), Sony, Canon FD/TS-E e i caratteri delle ottiche vintage (mestiere). I comportamenti dei modelli Higgsfield sono «verificato» solo dove citano i file della skill `higgsfield` ([V] = ritrovato nei file della skill il 2026-11-08); il resto è inferenza da provare con una generazione.

---

## 1. Formati e camere

Principio: il formato decide tre cose insieme: quanto spazio ha la stessa luce per descrivere il soggetto (dettaglio e transizioni), quanto è sottile il fuoco a parità di inquadratura, e quale gesto permette la macchina (veloce a mano, lento su treppiede). Tabella di riferimento (dimensioni nominali; il fotogramma reale varia di qualche mm per modello).

| Formato | Area nominale | Fattore di crop vs 35mm | Obiettivo «normale» | Carattere |
|---|---|---|---|---|
| 35mm / full frame | 36 x 24 mm | 1,0 | 50 mm | veloce, grana visibile, reportage, versatile |
| APS-C | circa 23,5 x 15,7 mm (Fujifilm X-T5, [P] scheda tecnica; Canon circa 22,3 x 14,8, EOS R7 [P, canon-europe.com, letto 2026-11-08]) | circa 1,5 (Canon 1,6, [P] «equivalent to 1.6x», scheda EOS R7) | circa 33 mm | più profondità di campo a parità di inquadratura |
| Medio formato 6x4,5 | circa 56 x 41,5 mm | circa 0,62 | 75-80 mm | ritratto/moda, ottimo equilibrio |
| Medio formato 6x6 | circa 56 x 56 mm | circa 0,55 | 80 mm | quadrato, sguardo dall'alto (pozzetto) |
| Medio formato 6x7 | circa 56 x 69 mm | circa 0,50 | 90-105 mm | dettaglio e transizioni molto ampi |
| Medio formato 6x9 | circa 56 x 84 mm | circa 0,45 | 105 mm | paesaggio, telemetro folding |
| Digitale medio formato 44x33 (Hasselblad X, Fujifilm GFX) | 43,8 x 32,9 mm | circa 0,79 | circa 55-63 mm | 102 MP effettivi, dettaglio da pellicola con pulizia digitale |
| Digitale medio formato grande (Phase One) | 53,4 x 40 mm | circa 0,65 | circa 80 mm | fino a 151 MP (IQ4 150MP), campagne e riproduzione |
| Grande formato 4x5 | 102 x 127 mm | circa 0,27 | 150 mm | movimenti di corpo, profondità di campo sottilissima a distanza ravvicinata |
| Grande formato 8x10 | 203 x 254 mm | circa 0,14 | 300 mm | transizioni quasi tridimensionali, rituale lento |

Regola pratica: un formato più grande, a parità di inquadratura e di diaframma, ha meno profondità di campo. Il «look medio formato» è tonalità morbide, transizioni lente dal fuoco allo sfocato e dettaglio non contrastato; non è nitidezza.

#### Full frame 35mm (35mm / full frame)
- **Cos'è:** fotogramma 36 x 24 mm, rapporto 3:2, il riferimento per cui sono pensate le focali comuni.
- **Si vede:** grana evidente in pellicola (soprattutto sopra ISO 400), prospettiva e sfocato «da reportage», sensazione di istante colto. Il linguaggio visivo dominante della fotografia di moda editoriale, dello street e del documentario.
- **Quando:** quasi tutto: lookbook, editoriale, ritratto ambientato, social, backstage. È il default sicuro quando serve velocità.
- **Higgsfield:** `shot on 35mm full frame camera, 50mm lens, natural perspective, visible fine grain`. Modello: Soul Cinema o Nano Banana Pro, perché rendono bene lo spontaneo e la grana quando è nel prompt; non c'è prova che il modello distingua il formato dal solo nome (inferenza, da provare).
- **Errore comune:** usarlo per tutto. Per il fotografo: tenere f/1.4 aperto per sembrare «cinematico» e perdere la pulizia; per il modello: scrivere «35mm» e ottenere una semplice grana generica senza coerenza di prospettiva.

#### APS-C (APS-C)
- **Cos'è:** sensore più piccolo (23,5 x 15,7 mm per Fujifilm X-T5 [P, fujifilm-x.com, letto 2026-11-08]; Sony e Nikon DX circa 23,5 x 15,6 [S, non riletti]; circa 22,3 x 14,8 mm per Canon EOS R7 [P, canon-europe.com, letto 2026-11-08; correzione: era 14,9]), fattore di crop 1,5-1,6.
- **Si vede:** a parità di inquadratura e diaframma più profondità di campo, a basse luci più rumore. Una 50 mm si comporta come una circa 75 mm come angolo.
- **Quando:** documentazione, social, strumenti leggeri (Fujifilm X) con simulazioni di film integrate; viaggio, street.
- **Higgsfield:** non ha un token proprio; descrivi l'effetto: `deeper depth of field, everything in the mid-ground reasonably sharp, compact camera snapshot feel`. Modello: Nano Banana 2 per il «tutto a fuoco» pulito.
- **Errore comune:** aspettarsi lo sfocato di un full frame con lo stesso numero di diaframma; per il modello: nessun controllo reale del sensore, resta una resa media.

#### Medio formato pellicola 6x4,5 / 6x6 / 6x7 / 6x9 (medium format film)
- **Cos'è:** pellicola 120 (o 220) con fotogramma largo 56 mm e lungo 41,5 (6x4,5), 56 (6x6), 69 (6x7) o 84 mm (6x9). Corpi tipici: reflex 6x7, biottica e reflex a pozzetto 6x6, telemetro folding 6x9.
- **Si vede:** transizioni tonali ampie, dettaglio fine ma «morbido», sfocato lento, pelle che regge senza esser dura. Il 6x6 si guarda dall'alto (pozzetto): soggetto che guarda in su, postura frontale; il 6x7 ha la proporzione da stampa, quasi 4:5.
- **Quando:** ritratto e moda di alto livello, beauty, campagne che vogliono presenza fisica senza digitale; inclusi gli ottimi 6x9 da paesaggio.
- **Higgsfield:** `shot on medium format film camera, 80mm lens, shallow depth of field, smooth tonal transitions, fine grain, Portra 400 color, Frontier scan` (per il 6x6: `square 1:1 frame, waist-level viewpoint, subject looking slightly down toward the lens`). Modello: Soul Cinema o Nano Banana Pro; per il quadrato usa il rapporto d'aspetto 1:1 come parametro, non solo come testo.
- **Errore comune:** il fotografo usa f/2.8 con 6x7 e il fuoco taglia il viso; il modello trasforma «medium format» in una vignettatura e una sfocatura generica, senza la pulizia dei toni.

#### Digitale medio formato (Hasselblad X, Fujifilm GFX, digital medium format)
- **Cos'è:** sensore 43,8 x 32,9 mm, fattore 0,79. Fujifilm GFX100 II: «43.8mm×32.9mm … 102MP», 102 milioni di pixel effettivi, immagini a 16 bit (sensibilità standard estesa a ISO 80) [P, fujifilm-x.com, scheda tecnica e pagina prodotto, letto 2026-11-08]. Hasselblad X2D 100C: «102 effective megapixels», profondità colore 16 bit, 15 stop di gamma dinamica, otturatore a lamelle nell'obiettivo con sincro flash a tutti i tempi [P, hasselblad.com/x-system/x2d-100c, letto 2026-11-08; datasheet PDF cdn.hasselblad.com x2d_100c_datasheet_en.pdf letto 2026-11-08 [P]: «Sensor Dimensions 43.8 × 32.9mm», BSI CMOS 100 MP (11656 × 8742 px, pixel 3,76 µm), 16 bit, «dynamic range up to 15 stops», otturatore a lamelle fino a 1/4000 s con sincro flash a tutti i tempi, ISO nativo 64. Esiste anche il successore **X2D II 100C** (hasselblad.com/x-system/x2d-ii-100c/, pagina aperta 2026-11-08, 425 zone PDAF; specifiche complete non lette)]. Otturatore Fujifilm GFX100 II: a tendina sul piano focale, fino a 8 fps con otturatore meccanico [P].
- **Si vede:** gamma dinamica ampia, colore morbido ma preciso, dettaglio altissimo senza grana, profondità di campo sottile con lunghezze «normali». Il look «campagna di lusso pulita».
- **Quando:** beauty, gioielli, orologi, moda ad alta gamma, cataloghi di arte e di design; ritocco pesante.
- **Higgsfield:** `shot on a digital medium format camera, 100 megapixel, 80mm lens at f/4, extremely smooth tonal transitions, clean file, no grain, accurate skin tones`. Modello: Nano Banana Pro (struttura a sei elementi, resa pulita); attenzione che l'effetto «troppo pulito» è il rischio (vedi sezione 9).
- **Errore comune:** il fotografo lo usa a mano in poca luce e perde nitidezza per micromosso; il modello dà un risultato liscio da rendering, senza imperfezioni.

#### Phase One (dorso digitale / digital back)
- **Cos'è:** sensore 53,4 x 40 mm; IQ4 150MP: 151 megapixel, CMOS BSI, 14204 x 10652 pixel attivi, 15 stop, 16 bit, otturatore a lamelle (correzione nella verifica del 2026-11-08: il valore «Leaf shutter (full res.) 1.2» sta nella riga «Captures per second», quindi circa 1,2 scatti al secondo a piena risoluzione, non un tempo di posa) [P, Phase One «IQ Camera System Overview» PDF, caricato 2021-12, letto 2026-11-08]. La pagina IQ4 Digital Backs di Phase One parla di «Capture One Inside», piattaforma Infinity, «full frame medium format», moduli XF e XT [P, letta 2026-11-08]; nessun numero di megapixel sulla pagina.
- **Si vede:** il massimo dettaglio disponibile a parità di condizioni, tonalità molto fini sulle superfici (pelle, tessuto, metallo); riproduzione per arte e opere.
- **Quando:** packshot di fascia alta, tessuti, riproduzione, grandi stampe.
- **Higgsfield:** `shot on a large digital medium format back, 150 megapixel detail, razor-sharp edge definition, extremely fine surface texture`. Modello: Nano Banana Pro o Nano Banana 2 (strutture e dettaglio). Nessun modello legge davvero «megapixel»: è un segnale di intenzione, non un parametro.
- **Errore comune:** sovra-nitidezza digitale; nel modello, iper-dettaglio plastico (testo, pori troppo regolari).

#### Grande formato e fotocamera a banco 4x5 / 8x10 (large format, view camera)
- **Cos'è:** camera a banco con soffietto, piano pellicola e piano obiettivo regolabili: decentramenti, basculaggi e inclinazioni; fotogramma 102 x 127 mm (4x5) o 203 x 254 mm (8x10), lastra singola. Focale normale 150 mm (4x5) e 300 mm (8x10).
- **Si vede:** la fotografia più lenta e meno spontanea: soggetto immobile o in posa lunga, fuoco con piani inclinati (Scheimpflug), transizioni tonali quasi tridimensionali, in 8x10 una lieve non-uniformità del bordo (vignettatura, bordi chimici) che si apprezza come «materia». Autori tipici della ritrattistica frontale e dell'architettura.
- **Quando:** ritratto monumentale, still life, architettura con linee verticali corrette, progetti d'arte e d'archivio.
- **Higgsfield:** `shot on a large format 8x10 view camera, extremely shallow depth of field, sharp subject plane falling to soft focus, frontal static pose, visible film edge`. Modello: Soul Cinema o Nano Banana Pro; dichiara il piano di fuoco in una frase concreta.
- **Errore comune:** il modello applica «sfocato» uniforme invece del piano inclinato; il fotografo non ha il tempo di far posare il soggetto e ottiene un fermo immagine irrigidito.

#### Pellicola istantanea (Polaroid / instant film)
- **Cos'è:** pellicola integrale che si sviluppa da sola. Formati prodotti oggi da Polaroid: Go, i-Type, 600, SX-70 e 8x10 integrale («Polaroid currently produces 5 distinct integral film formats») [P, support.polaroid.com «Unsupported Polaroid cameras and film formats» e «What film do I use with Polaroid cameras?», letti 2026-11-08; l'indicazione «Updated 2 years ago» sulle pagine di assistenza dice che non sono recenti, ma il negozio Polaroid EU elenca ancora le stesse cinque famiglie: i-Type, 600, Go, SX-70, 8x10, letto 2026-11-08]. Non più prodotti: pellicola a strappo (Type 100/80), roll film, 35 mm, Super 8, iZone, 500, Spectra/Image, 4x5. Instax è di Fujifilm, formati propri. SX-70 «circa un quarto della sensibilità» della 600 [P]. «Paesi Bassi» (Polaroid B.V.) non è sulle pagine lette: [S].
- **Si vede:** cornice bianca, colori caldi e a basso contrasto, saturazione irregolare, bordo chimico, sfocato morbido, luce a 4000-5000K spesso sbilanciata sul verde in giorni freddi.
- **Quando:** backstage, test di luce, set da lookbook intimi, serie a basso profilo; estetica «effimera».
- **Higgsfield:** `instant film photograph, white square border, soft low-contrast colors, slight chemical color shift toward yellow-green, shallow focus, imperfect exposure`. Modello: Soul 2.0 con preset a bassa fedeltà o Soul Cinema; il bordo bianco lo gestisce meglio una cornice aggiunta in post che il modello.
- **Errore comune:** cornice troppo perfetta e colori troppo vivaci; nel modello, un finto «filtro Polaroid» da app.

#### Compatta a pellicola (point-and-shoot: Contax T2, Yashica T4)
- **Cos'è:** compatta a pellicola 35mm con ottica fissa (T2: Zeiss Sonnar 38 mm f/2.8, 5 lenti in 4 gruppi; T4: Zeiss Tessar 35 mm f/3.5, 4 lenti in 3 gruppi [S, camera-wiki.org «Contax T2» e «Yashica T4», letti 2026-11-08; nessuna pagina del produttore, marchi dismessi]), esposizione automatica, flash incorporato.
- **Si vede:** flash frontale duro con sfondo scuro, pelle lucida, colori saturi, vignettatura leggera, un po' di morbidezza sugli angoli, composizione casuale. L'estetica della «nightlife» e del «snapshot di lusso».
- **Quando:** campagne giovani, lifestyle, backstage, lookbook con aria di appunto personale.
- **Higgsfield:** `shot on a compact 35mm point-and-shoot film camera, 35mm lens, direct on-camera flash, shiny skin highlights, dark background falloff, mild vignette, saturated color, slightly crooked framing`. Modello: Soul Cinema (look spontaneo), con Soul 2.0 come alternativa se ti serve il preset; verifica con una generazione di prova.
- **Errore comune:** flash frontale sul prodotto di precisione e ombre indesiderate; per il modello: pelle «bruciata» a tutti i costi, perdendo la costruzione del volto. Dettagli del flash in `tecnica-fotografia-luce.md`.

#### Fotocamera usa e getta (disposable camera)
- **Cos'è:** plastica con ottica a menisco fisso (circa 27-35 mm), diaframma e otturatore singoli, flash a condensatore; pellicola a 27/39 pose (Kodak Funsaver, Fujifilm QuickSnap) [S, da verificare: pagine Kodak FunSaver su kodak.com e kodakmoments.com in 404 il 2026-11-08, lettore r.jina.ai idem].
- **Si vede:** fuoco morbido, angoli scuri, contrasto basso, colori caldi e un po' slavati, flash netto sul primo piano. Autenticità «da evento».
- **Quando:** eventi, party, call to action rivolte a pubblici giovani. Meno adatta a prodotti.
- **Higgsfield:** `disposable camera photo, plastic lens softness, corner vignetting, harsh flash on subject, washed warm colors, 400-speed grain`. Modello: Soul Cinema; Soul 2.0 preset «snapshot» se disponibile (non ho letto i nomi dei preset in questa sessione).
- **Errore comune:** esagerare il difetto, con un risultato da effetto-app; per il fotografo, non esporre abbastanza i neri.

#### Telemetro Leica (Leica rangefinder)
- **Cos'è:** fotocamera a telemetro (mirino separato dall'obiettivo) con ottiche corte a 28, 35, 50, 75, 90 mm; mirino con cornici luminose, nessuna visione attraverso l'obiettivo. Leica M11: cornici a coppie 35/135, 28/90, 50/75 mm con commutazione automatica e compensazione della parallasse; sensore circa 23,9 x 35,8 mm, 60,3 MP [P, leica-camera.com, scheda tecnica M11, letta 2026-11-08]. Le Summilux-M 35 e 50 f/1.4 sono a catalogo Leica [P, stessa data].
- **Si vede:** composizione precisa a distanza ravvicinata, ottiche piccole e discrete, profondità di campo ampia di default, profilo «umano» della scena. Per la moda: il passaggio del fotografo vicino alle persone.
- **Quando:** street, reportage, ritratto ambientato; marchi che vogliono discrezione.
- **Higgsfield:** `shot on a 35mm rangefinder camera, 35mm lens, f/2.8, close distance, natural perspective, candid framing`. Modello: Soul Cinema.
- **Errore comune:** impossibile mettere a fuoco macro/tele; il modello riduce la parola a «vintage».

#### Reflex e mirrorless (DSLR vs mirrorless)
- **Cos'è:** la reflex mostra la scena attraverso l'obiettivo con specchio e prisma; la mirrorless la mostra sul mirino elettronico. Differenza pratica: la mirrorless anteprima l'esposizione, ha il fuoco sull'occhio e il flange più corto (adattabile a ottiche vintage con anelli).
- **Si vede:** nessuna differenza nell'immagine finale a parità di sensore e ottica; cambia il flusso di lavoro (sicurezza del fuoco, silenzio, video).
- **Quando:** mirrorless per set veloci, video, adattamento di ottiche vintage; reflex per set di lunga durata.
- **Higgsfield:** non influisce; descrivi l'ottica, non il corpo.
- **Errore comune:** attribuire all'una o all'altra un «look». Il look è nell'ottica e nel profilo colore.

#### Smartphone e fotografia computazionale (smartphone, computational photography)
- **Cos'è:** sensore piccolo, ottica fissa (più moduli 13-120 mm equivalenti), unione di più esposizioni (HDR), ritratto con mappa di profondità, riduzione del rumore e nitidezza sintetici, profili colore proprietari.
- **Si vede:** nitidezza uniforme, ombre aperte, cielo detagliato, pelle levigata, sfocato artificiale con bordi spesso imprecisi, colore «gradevole» uniforme. Con flash, un look di immediatezza.
- **Quando:** contenuti nativi per i social, UGC, brief che chiedono «come sul telefono dell'amico».
- **Higgsfield:** `smartphone photo, wide 24mm-equivalent lens, deep depth of field, heavy HDR tone mapping, slight oversharpening, auto-white-balance, vertical 9:16`. Modello: Soul 2.0 o Nano Banana 2 per la pulizia; Soul Cinema se vuoi il tocco amatoriale.
- **Errore comune:** confondere «iPhone» con «bassa qualità»; è un look molto lavorato. Per il fotografo, il formato 9:16 pensato dopo.

#### Simulazioni di pellicola Fujifilm (Fujifilm film simulations)
- **Cos'è:** profili colore nei corpi Fujifilm che riproducono l'aspetto di pellicole reali. La scheda tecnica dell'X-T5 elenca 19 modalità: PROVIA/Standard, Velvia/Vivid, ASTIA/Soft, Classic Chrome, PRO Neg.Hi, PRO Neg.Std, Classic Neg., Nostalgic Neg., ETERNA/Cinema, ETERNA BLEACH BYPASS, ACROS (con filtri Ye, R, G), Black & White, Sepia, con grana Roughness STRONG/WEAK/OFF [P, fujifilm-x.com, letto 2026-11-08]. Sono curve colore e tono applicate al JPEG o allo sviluppo del RAW.
- **Si vede:** Velvia saturo e contrastato, Classic Chrome desaturo e con ombre fredde, Classic Neg morbido e caldo con i verdi spostati, Eterna morbido tipo cine, Acros B/N con grana opzionale. Il file RAW non porta il profilo, serve la conversione.
- **Quando:** documentazione e brand con uno stile uniforme senza post-produzione pesante.
- **Higgsfield:** non esistono token verificati: traduci la resa. Esempio `muted desaturated color, cool shadows, soft contrast, slightly lifted blacks`.
- **Errore comune:** attribuire al nome un colore preciso: ogni versione del profilo varia.

Fonti: [P, letto 2026-11-08] fujifilm-x.com/en-us/products/cameras/gfx100-ii/ e /specifications/ (sensore 43,8 x 32,9 mm, 102 MP, 16 bit); fujifilm-x.com/en-us/products/cameras/x-t5/specifications/ (APS-C 23,5 x 15,7 mm; 19 simulazioni); hasselblad.com/x-system/x2d-100c/ (102 MP, 16 bit, 15 stop, otturatore a lamelle); phaseone.com/wp-content/uploads/2021/12/IQ_Camera_System_Overview_Flyer.pdf (53,4 x 40 mm, 151 MP, 16 bit); phaseone.com/iq4-digital-backs/; support.polaroid.com (due articoli) e negozio Polaroid EU. Calcoli dei fattori di crop e delle aree: geometria standard dalle dimensioni, [S] dove la dimensione non è su una pagina letta (medio formato pellicola 6x4,5/6x6/6x7/6x9, grande formato). Verifica del 2026-11-08 (Chrome vero): canon-europe.com/cameras/eos-r7/specifications/ (22,3 x 14,8 mm, 1,6x, X-sync 1/250) [P]; leica-camera.com scheda tecnica M11 (cornici, sensore) [P]; camera-wiki.org Contax T2 e Yashica T4 [S, una secondaria]. Nikon e Sony APS-C non riletti [S]. Dettaglio dei metodi in fondo, sezione Verifica.

---

## 2. Obiettivi

Principio: la **focale** decide l'angolo (e quindi la distanza necessaria per un'inquadratura data); è la **distanza di ripresa** a decidere la prospettiva (rapporti di scala tra naso e orecchie, tra primo piano e fondo). Un 24 mm vicino deforma; un 24 mm lontano e poi ritagliato dà la stessa prospettiva di un 85 mm lontano. Per questo «le focali lunghe appiattiscono» è vero solo perché le usi da lontano.

| Focale (full frame) | Angolo diagonale | Effetto | Uso tipico |
|---|---|---|---|
| 14-24 mm | 114°-84° | dilata lo spazio, linee convergenti, primo piano enorme | architettura, interni, sport estremo |
| 28 mm | 75° | ambientato, un po' di dilatazione | reportage, street, moda con ambiente |
| 35 mm | 63° | «occhio umano allargato», narrazione | lookbook, documentario, ritratti ambientati |
| 50 mm | 47° | naturale, neutro | ritratto 3/4, prodotto, quotidiano |
| 85 mm | 28° | ritratto classico, sfocato morbido | beauty, ritratto, moda |
| 105 mm | 23° | più compressione, macro media | beauty, still life, macro |
| 135 mm | 18° | compressione e isolamento | ritratto stretto, sport, moda con sfondo isolato |
| 200 mm e oltre | 12° e meno | forte compressione, piani «impilati» | street rubata, sport, moda con spazio ridotto |

#### Ultra grandangolo 14-24 mm (ultra-wide 14-24mm)
- **Cos'è:** angolo di campo 84°-114°; la distorsione dei bordi (allungamento) si accentua fuori dal centro.
- **Si vede:** primo piano che sovrasta, ambiente enorme, linee che cadono verso il centro se la camera è inclinata. Un volto vicino diventa caricatura.
- **Quando:** architettura, interni, spazi, immagini d'impatto (sport, moda street).
- **Higgsfield:** `shot on a 16mm ultra-wide lens, low angle, strong foreground, converging lines, slight edge stretching`. Modello: Soul Cinema o Nano Banana Pro; Nano Banana 2 tende a rendere spazi troppo puliti (da `image-models.md`; [V] riga 88: «Nano Banana makes locations too clean and too symmetrical»).
- **Errore comune:** inclinare la camera e distorcere le verticali; il modello applica la distorsione barile come se fosse un fisheye.

#### 28 mm (28mm)
- **Cos'è:** angolo 75°; la focale della fotografia ambientata e della compatta.
- **Si vede:** il soggetto e il contesto, un lieve allargamento del primo piano. Con persone, serve distanza di almeno 1-1,5 m per evitare la deformazione.
- **Quando:** reportage, street, moda con luogo come co-protagonista.
- **Higgsfield:** `28mm lens, subject at medium distance, environment visible, mild perspective stretch on the foreground`. Modello: Soul Cinema.
- **Errore comune:** avvicinarsi troppo e deformare il volto; nel modello, il token focale spesso non cambia nulla se non c'è anche la distanza.

#### 35 mm (35mm lens)
- **Cos'è:** angolo 63°, la focale del documentario e del cinema umanista.
- **Si vede:** prospettiva «onesta», relazione soggetto-ambiente chiara, profondità di campo moderata a f/2-2.8.
- **Quando:** quasi sempre per immagini che vogliono sembrare vissute; lookbook, campagne con la gente.
- **Higgsfield:** `35mm lens, eye-level, subject and surroundings both readable, natural perspective`. Modello: Soul Cinema; Nano Banana Pro per scene composte.
- **Errore comune:** usarlo per ritratti stretti (naso grande); il modello lo mescola con 50.

#### 50 mm (50mm lens)
- **Cos'è:** angolo 47°, vicino al campo percepito dall'occhio.
- **Si vede:** neutralità, nessuna enfasi, ottimo per prodotto e mezzo busto.
- **Quando:** prodotto, ritratto 3/4, scene quotidiane; la «voce senza accento».
- **Higgsfield:** `50mm lens, neutral perspective, f/2.8`. Modello: qualsiasi; Nano Banana 2 per la pulizia.
- **Errore comune:** pensarlo senza carattere: è il più difficile da rendere interessante, serve composizione.

#### 85 mm (85mm lens)
- **Cos'è:** angolo 28°, il ritratto classico; a f/1.4-1.8 profondità di campo di pochi cm a 2 m.
- **Si vede:** volto con proporzioni lusinghiere, fondo morbido, separazione dal fondo, bokeh rotondo.
- **Quando:** beauty, ritratto, moda.
- **Higgsfield:** `85mm portrait lens at f/1.8, subject isolated, creamy background blur, flattering facial proportions`. Modello: Soul 2.0 e Soul Cinema rendono bene i ritratti (da `image-models.md`).
- **Errore comune:** f/1.2 con il fuoco sul naso e occhi morbidi; il modello sfoca anche i capelli e l'orecchio in modo non coerente.

#### 105 mm e macro (105mm / macro)
- **Cos'è:** il 105 mm macro rende 1:1 (dimensione reale sul sensore) a circa 30 cm dal piano focale (Nikon Z MC 105mm f/2.8 VR S: distanza minima 0,29 m dal piano focale, rapporto massimo 1x, angolo FX 23°10' [P, imaging.nikon.com, scheda, letta 2026-11-08]; il vecchio AF-S VR Micro 105 f/2.8G, 0,314 m, non riletto: pagina Nikon in 404); la profondità di campo è pochi millimetri a 1:1.
- **Si vede:** dettaglio di pelle, tessuto, gioielli, gocce; sfondo completamente sciolto; una piccola parte a fuoco.
- **Quando:** beauty (occhio, labbra), gioielli, cibo, dettagli di prodotto.
- **Higgsfield:** `macro photograph, 100mm macro lens at 1:1, razor-thin plane of focus, extreme close-up of the surface texture, background dissolved`. Modello: Nano Banana Pro (dettaglio), con attenzione al rischio della texture plastica (`image-models.md`).
- **Errore comune:** non fare focus stacking e ottenere solo metà del prodotto a fuoco (vedi sezione 6); il modello rende i pori troppo uniformi.

#### 135 mm e 200 mm+ (telephoto)
- **Cos'è:** angolo 18° e meno; richiede distanza di ripresa (3-5 m per un ritratto a 135 mm); a 200 mm f/2.8 la profondità di campo è minima.
- **Si vede:** compressione dei piani (lo sfondo sembra più vicino e più grande), volti piatti, sfondo sfocato a disco, isolamento da lontano.
- **Quando:** moda in esterni, sport, street rubata, ritratti di grande formato visivo.
- **Higgsfield:** `200mm telephoto lens, strong background compression, subject isolated from far away, flattened planes`. Modello: Soul Cinema; verificare che le persone sullo sfondo non siano troppo nitide.
- **Errore comune:** micromosso (regola: tempo di posa almeno 1/focale); il modello non comprime davvero, sfoca soltanto.

#### Compressione e deformazione del volto (compression and facial distortion)
- **Cos'è:** la forma del volto dipende dalla distanza. Calcolo con ipotesi di circa 10 cm di profondità fra punta del naso e orecchio: a 0,5 m le due distanze stanno come 0,5 a 0,6 (il naso appare circa 1,2 volte più grande per scala); a 3 m come 3,0 a 3,1 (circa 1,03). Stima geometrica, non misurata su un volto.
- **Si vede:** vicino, naso e fronte enfatizzati; lontano, volto piatto e proporzionato.
- **Quando:** vicinanza per umorismo/intensità o per «grotesque editoriale»; lontananza per ritratto lusinghiero.
- **Higgsfield:** descrivi distanza e focale insieme: `shot from 3 meters away with an 85mm lens, flattering facial proportions` oppure `shot from 30cm with a 24mm lens, enlarged nose and forehead`.
- **Errore comune:** attribuire alla sola focale l'effetto, o chiedere «24mm» per un ritratto senza distorsione.

#### Diaframma e bokeh (aperture and bokeh)
- **Cos'è:** il diaframma (f/1.2-f/22) controlla la profondità di campo e la forma delle sfocature: dischi netti con diaframma a molte lamelle e senza difetti; «occhi di gatto» ai bordi (vignettatura meccanica); effetto «a bolle di sapone» o «a vortice» in ottiche speciali (Helios 44, Petzval).
- **Si vede:** f/1.2-2: ritaglio morbido sul fondo, volto separato; f/5.6-8: gruppi di persone a fuoco; f/11-16: massima nitidezza, diffrazione oltre f/16.
- **Quando:** ritratti con isolamento a f/1.4-2.8; prodotto a f/8-11; paesaggio a f/8-11.
- **Higgsfield:** `f/1.4, shallow depth of field, creamy round bokeh, only the eyes in sharp focus`; per il fondo nitido `f/8, deep focus, everything sharp from foreground to background`. Modello: Soul 2.0 e Soul Cinema; nei modelli il «bokeh» spesso diventa un blur uniforme senza dischi (inferenza, da provare).
- **Errore comune:** sfocare tutto il fondo e perdere il contesto (luogo del brand); per il modello, profondità di campo incoerente (sezione 9).

#### Obiettivi vintage (Helios 44, Leica Summilux, Canon FD, Contax Zeiss)
- **Cos'è:** ottiche del passato adattate a mirrorless. Helios 44-2 (58 mm f/2, sovietico, copia del Biotar Zeiss, bokeh «a vortice» [S, camera-wiki.org «Helios-44», letto 2026-11-08]; lamelle: camera-wiki dice 13 nelle prime versioni e «8 o 6» nelle successive, senza attribuirle alla 44-2: le 8 lamelle restano [S] da verificare sull'esemplare); Leica Summilux (35/50 mm f/1.4, nitido al centro, controllo morbido dei bordi); Canon FD (35 mm f/2, 50 mm f/1.4, caldo, contrasto basso, anelli per mirrorless); Contax Zeiss (Planar 50 mm f/1.4, colore saturo, tridimensionalità «plastica»). Le caratteristiche sono tratti di mestiere, variano per esemplare.
- **Si vede:** minor contrasto, flare, aberrazioni cromatiche, bordi morbidi, fuoco che respira. Identità non omologata.
- **Quando:** campagne «calde», moda con atmosfera, video dove il look sembra non digitale.
- **Higgsfield:** `vintage 58mm Helios lens, swirling bokeh at the edges, low contrast, soft flare, slightly warm color cast` (il nome dell'ottica è un prodotto e può entrare). Modello: Soul Cinema; per Helios il vortice è ricostruito dal modello con un effetto simile ma non fedele (inferenza).
- **Errore comune:** il fotografo non compensa il fuoco manuale; il modello esagera il vortice su tutta l'immagine.

#### Tilt-shift e Scheimpflug (tilt-shift / Scheimpflug)
- **Cos'è:** ottiche (24, 45, 90 mm; esempio letto: Nikon PC-E Micro NIKKOR 45mm f/2.8D ED, decentramento ±11,5 mm, basculaggio ±8,5°, rotazione ±90°, riproduzione massima 1:2 [P, imaging.nikon.com, letto 2026-11-08]; la gamma Canon TS-E non riletta: pagine canon-europe e usa.canon in 404) con spostamento (shift: corregge le verticali convergenti) e basculaggio (tilt: inclina il piano di fuoco). Il principio di Scheimpflug: piano pellicola, piano obiettivo e piano di fuoco si incontrano su una linea.
- **Si vede:** edifici dritti senza sovraccarico; con il tilt, un piano di fuoco inclinato che attraversa il soggetto (effetto «miniatura» se il tilt è forte e dall'alto).
- **Quando:** architettura, interni, packshot di oggetti inclinati (bottiglie in fila), look «diorama».
- **Higgsfield:** `tilt-shift lens, steeply tilted plane of focus, strong blur at the top and bottom of the frame, miniature effect` oppure `architectural photograph, shift lens, perfectly vertical lines`. Modello: Nano Banana Pro (struttura, verticali); verifica con una generazione.
- **Errore comune:** il modello confonde «tilt-shift» con un banale sfocato a gradiente; il fotografo corregge le verticali a metà.

#### Fisheye (fisheye)
- **Cos'è:** ottica con angolo 180° (diagonale) e distorsione a barile intenzionale; il «circolare» riempie il cerchio, il «full-frame» riempie il rettangolo.
- **Si vede:** orizzonti curvi, volti dilatati, un'ampiezza estrema. Skate, street, moda ironica.
- **Quando:** sport, pop, riferimenti anni 90-2000.
- **Higgsfield:** `fisheye lens, 8mm, strong barrel distortion, curved horizon, subject close to the lens` (`fisheye` è già in `vocab.md`, [V] riga 91 «Fisheye — wide distortion lens»). Modello: Soul 2.0 o Nano Banana Pro.
- **Errore comune:** usarlo senza un motivo concettuale; il modello esagera la curvatura su un soggetto lontano.

#### Soft focus, Lensbaby e ottiche creative (soft focus / creative lenses)
- **Cos'è:** ottiche con aberrazione sferica intenzionale (Canon EF 135mm f/2.8 with Softfocus: due livelli di morbidezza regolabili o uso nitido normale [P, canon.pl, scheda prodotto, letta 2026-11-08; il meccanismo «aberrazione sferica» non è sulla pagina, [S]], Lensbaby con zona nitida regolabile e sfocatura radiale), filtri di diffusione (nebbia, Pro-Mist).
- **Si vede:** alone morbido attorno alle luci, pelle luminosa, fuoco solo su una zona; il look «sognante», «onirico».
- **Quando:** beauty romantica, sposa, moda eterea.
- **Higgsfield:** `soft focus lens, glowing halation around highlights, dreamy diffusion, sharp in the center of the frame only`. Modello: Soul 2.0 e Soul Cinema.
- **Errore comune:** diffusione eccessiva che cancella i dettagli del prodotto.

#### Distanza di ripresa contro focale (shooting distance vs focal length)
- **Cos'è:** per mantenere la stessa inquadratura con una focale doppia devi raddoppiare la distanza: cambia la prospettiva, non l'inquadratura.
- **Si vede:** stesso soggetto a 35 mm da 1 m o a 85 mm da 2,4 m: nel secondo il fondo è più grande e vicino.
- **Quando:** per decidere quanto fondo mostrare senza cambiare il soggetto.
- **Higgsfield:** specifica sempre la distanza: `85mm lens from 3 meters`. Il modello da solo non lega i due.
- **Errore comune:** dire «cambia lente» quando serve «cambia posizione».

Fonti: [P, letto 2026-11-08, Chrome vero] imaging.nikon.com (Z MC 105mm f/2.8 VR S, PC-E Micro 45mm f/2.8D ED), canon.pl (EF 135mm f/2.8 with Softfocus), leica-camera.com (Summilux-M a catalogo). [S] camera-wiki.org (Helios-44). Non riletti: Zeiss/Contax Planar, Canon FD (pagina camera-wiki vuota), gamma Canon TS-E (404). Valori di angolo/focale e rapporti ottici sono geometria standard (calcolo mostrato dove serve). [S] caratteri delle ottiche vintage: conoscenza di mestiere, da verificare su una prova. [V] `fisheye` in `vocab.md` della skill `higgsfield` (riga 91, ritrovato 2026-11-08); «tilt-shift» non compare in `vocab.md` né in `image-models.md`. Data: 2026-11-08.

---

## 3. Inquadratura e composizione

Principio: l'inquadratura è la prima decisione e l'unica non correggibile in post senza perdita. Si decide con il formato di uscita in mente (feed 4:5, story 9:16, banner 16:9, stampa), non dopo.

#### Verticale, orizzontale, quadrato (portrait, landscape, square)
- **Cos'è:** proporzioni 9:16 (story/reel), 4:5 (feed), 1:1, 3:2, 16:9, 21:9. Il quadrato nasce dal 6x6.
- **Si vede:** il verticale sottolinea il corpo e la statura, l'orizzontale il contesto e il movimento, il quadrato la simmetria e la stabilità.
- **Quando:** verticale per social mobile e copertine; orizzontale per sito, campagne OOH e video; quadrato per griglie e pack.
- **Higgsfield:** imposta il rapporto d'aspetto come parametro (enum del modello; verifica in `specs/model-specs.yaml`). Nel testo, `vertical 4:5 composition`.
- **Errore comune:** generare in 16:9 e ritagliare a 9:16: il soggetto si perde.

#### Regola dei terzi e centro (rule of thirds / centered)
- **Cos'è:** il terzo divide il frame con linee a 1/3; il soggetto sull'intersezione crea equilibrio dinamico; il centro dà frontalità, simmetria, iconicità.
- **Si vede:** terzi: naturale, narrativo; centro: formale, ritratto, prodotto, design.
- **Quando:** terzi per lifestyle e reportage; centro per ritratto frontale e catalogo.
- **Higgsfield:** `subject placed on the left third, looking into open space` oppure `perfectly centered, symmetrical, frontal`. Modello: tutti; Nano Banana Pro rispetta meglio le posizioni (sei elementi).
- **Errore comune:** i modelli tendono a centrare tutto: chiedi la posizione in modo esplicito.

#### Spazio negativo (negative space)
- **Cos'è:** area vuota intenzionale, spesso un terzo o più del frame.
- **Si vede:** respiro, silenzio, spazio per il testo, scala del soggetto.
- **Quando:** lusso, minimal, banner con copy, brief con spazio per il logo.
- **Higgsfield:** `subject small in the lower right, two thirds of the frame empty and calm, clean background for text`. Modello: Nano Banana 2 / Pro.
- **Errore comune:** vuoto casuale al posto di un vuoto costruito; il modello riempie.

#### Ritaglio (crop)
- **Cos'è:** taglio dell'immagine in post; da evitare nel foto-ritratto con tagli alle articolazioni (polsi, ginocchia, caviglie).
- **Si vede:** testa tagliata a metà fronte = intimità; mani tagliate = tensione.
- **Quando:** campagne editoriali, close-up beauty.
- **Higgsfield:** `tight crop cutting the forehead and chin, intimate framing`.
- **Errore comune:** tagliare alle articolazioni senza intenzione.

#### Punto di vista alto e basso (high / low angle)
- **Cos'è:** la camera sopra o sotto l'altezza degli occhi.
- **Si vede:** dal basso: potenza, monumentalità, gambe lunghe; dall'alto: vulnerabilità, sguardo grafico; a livello occhi: parità.
- **Quando:** basso per moda e sneakers; alto per cibo, tavola, lookbook minimale.
- **Higgsfield:** `low angle shot from knee height, subject towering` / `high angle shot, subject looking up`.
- **Errore comune:** angolo basso con grandangolo troppo vicino.

#### Flat lay e dall'alto (flat lay / overhead)
- **Cos'è:** camera perpendicolare al piano, di norma a 50-85 mm per evitare distorsione.
- **Si vede:** composizione grafica, oggetti in ordine, ombre brevi.
- **Quando:** e-commerce, cibo, kit, social.
- **Higgsfield:** `overhead flat lay, camera perpendicular to the surface, soft shadow, objects arranged in an intentional grid`. Modello: Nano Banana 2 / Pro (struttura).
- **Errore comune:** oggetti troppo ordinati («da catalogo») e senza mano umana; il modello duplica oggetti.

#### Distanza e posa (distance and pose)
- **Cos'è:** primo piano, mezzo busto, 3/4, figura intera e distanza fra soggetto e camera; la posa dà postura (peso su un piede, mani occupate).
- **Si vede:** primo piano: emozione; figura intera: abito e ambiente; mani occupate: naturalezza.
- **Quando:** abiti → figura intera; beauty → primo piano.
- **Higgsfield:** `three-quarter body, weight on the back foot, one hand in a pocket, looking slightly off-camera`. Modello: Soul Cast per coerenza del personaggio.
- **Errore comune:** posa da catalogo; il modello fa mani anomale (verifica sempre).

#### Primo piano sfocato, riflessi e cornici (foreground blur / reflections / frames)
- **Cos'è:** elementi in primo piano fuori fuoco (piante, vetri, capelli), riflessi in specchi o finestre, cornici naturali (porte, finestre).
- **Si vede:** profondità, voyeurismo, strati.
- **Quando:** moda editoriale, immagini «rubate», architettura.
- **Higgsfield:** `out-of-focus foreground element framing the subject, reflection in a window, layered depth`.
- **Errore comune:** riflessi con fotografo visibile; nel modello, riflessi incoerenti con la scena.

#### Vetro o lente in scena davanti all'obiettivo (glass / lens in front of the camera)
- **Cos'è:** un oggetto ottico vero (lente, blocco di vetro, vetrina spessa, acqua) messo fra camera e soggetto come elemento della scena, non come filtro. Deforma ciò che sta dietro di lui e lascia il resto com'è (std).
- **Si vede:** materia ingrandita o piegata dentro il vetro, nitida fuori; sui bordi del vetro frange sottili di colore (aberrazione cromatica), il fondo capovolto in una lente convessa, un riflesso della stanza sulla superficie. Sono queste le prove fisiche che separano un vetro vero da un effetto applicato (std).
- **Quando:** quando l'immagine deve avere una seconda lettura che l'occhio decifra; still life e dettagli di gesto più che ritratti.
- **Higgsfield:** scrivere tre cose: cosa il vetro deforma, cosa resta nitido e non deformato (volto, mani, il gesto), e una prova fisica sul bordo. Es. `a thick optical glass block held in front of the lens; the wool texture behind it magnified and bent inside the glass; thin cool and warm fringes along its edges; fingers and gesture outside the glass stay sharp and undistorted`. Modello: **(da provare)**, nessuna generazione dello studio; il metodo viene da un prompt di terzi letto il 2026-11-21 [S, una sola fonte, non nostra], fiducia BASSA. Le forme rotonde e cave possono uscire come lettere.
- **Errore comune:** non dire cosa resta intatto, così il modello deforma anche il volto e l'immagine sembra AI; vetro senza frange né riflessi, che legge come filtro.

#### Carosello e sequenze per i social (carousel / sequences)
- **Cos'è:** serie 4:5 o 1:1 pensata con ritmo: apertura forte, dettaglio, ambiente, ritratto, chiusura. Stessa luce e stessa palette per la coerenza.
- **Si vede:** narrazione visiva; ripetizione di un elemento visivo come filo.
- **Quando:** feed, lancio prodotto, editorial.
- **Higgsfield:** genera in serie con Soul ID o Soul Cast e lo stesso prompt base, cambiando solo scala e angolo (verificato nei file: Soul Cast per personaggio). Nano Banana Pro per modifiche coerenti.
- **Errore comune:** variazioni troppo simili fra loro, o troppo diverse.

Fonti: [S] metodo compositivo di mestiere; formati: standard. Rapporti d'aspetto e modelli Higgsfield: file della skill `higgsfield` (`image-models.md`, letto 2026-11-08, [S, skill di terzi, ora archiviata]). Regole di direzione: skill `photo-illustration-direction` (letta).

---

## 4. Movimento e tempo

Principio: il tempo di posa è una lunghezza di narrazione. Un millesimo di secondo congela un istante; un secondo racconta una durata. Con le ottiche lunghe serve almeno 1/focale per evitare il micromosso.

| Tempo di posa | Effetto | Esempio |
|---|---|---|
| 1/4000-1/1000 | congela salti, schizzi, capelli | sport, splash, moda in movimento |
| 1/250-1/125 | congela passi lenti | street, ritratto in movimento |
| 1/60-1/15 | micromosso controllato, scia leggera | danza, passanti |
| 1/8-1 s | scie, panning, ICM | luci auto, ballerini, acqua |
| 2 s e oltre (treppiede) | acqua serica, luci tracciate | paesaggio notturno, light painting |

#### Tempo di posa (shutter speed)
- **Cos'è:** durata di esposizione, in frazioni di secondo. Sincronizzazione flash tipica 1/200-1/250 (più veloce con otturatore centrale nell'obiettivo). Esempi letti: Canon EOS R7 X-sync 1/250 s con otturatore meccanico, 1/320 s con prima tendina elettronica [P, canon-europe.com, letto 2026-11-08]; Hasselblad X2D 100C, otturatore a lamelle con sincro a tutti i tempi fino a 1/4000 s [P, datasheet, vedi sezione 1].
- **Si vede:** vedi tabella.
- **Quando:** scegli per intenzione narrativa, poi regola ISO e diaframma. Dettagli di esposizione in `tecnica-fotografia-luce.md`.
- **Higgsfield:** descrivi l'effetto, non la frazione: `motion frozen mid-air with every strand of hair sharp` oppure `soft motion blur on the hands, face sharp`. I modelli non leggono «1/500» in modo affidabile (inferenza).
- **Errore comune:** parlare di «velocità» invece del risultato.

#### Mosso creativo (creative blur)
- **Cos'è:** posa lenta con soggetto in movimento (1/8-1/2 s) per la scia, con flash a seconda tendina per un'immagine nitida con scia dietro.
- **Si vede:** energia, dinamismo, danza.
- **Quando:** moda dinamica, sneakers, danza.
- **Higgsfield:** `intentional motion blur on the dress, sharp face, ghosting trail behind the movement`. Modello: Soul Cinema; verifica se il volto resta nitido.
- **Errore comune:** il modello sfoca tutto, volto compreso.

#### Panning e inseguimento (panning)
- **Cos'è:** la camera segue il soggetto a 1/30-1/60 s; il soggetto è nitido e lo sfondo diventa linee.
- **Si vede:** velocità; sfondo a strisce orizzontali.
- **Quando:** auto, moto, bici, sport, corsa in città.
- **Higgsfield:** `panning shot, subject sharp, background streaked in horizontal motion lines`.
- **Errore comune:** soggetto morbido e sfondo morbido; il modello fa solo un blur radiale.

#### Lunga esposizione (long exposure)
- **Cos'è:** da 1 s a minuti con treppiede, con filtro ND (neutral density) di giorno.
- **Si vede:** acqua serica, nuvole strisciate, persone sparite in una piazza.
- **Quando:** architettura, paesaggio, notturni cittadini.
- **Higgsfield:** `long exposure, smooth silky water, streaked clouds, static architecture perfectly sharp`.
- **Errore comune:** persone semitrasparenti non volute.

#### Pittura con la luce (light painting)
- **Cos'è:** posa lunga al buio con una sorgente mobile (torcia, LED) che disegna.
- **Si vede:** tracce luminose, scritte, volumi.
- **Quando:** campagne creative, tech, moda fluo.
- **Higgsfield:** `light painting, long exposure, glowing neon trails in the dark, figure illuminated by drawn lines of light`.
- **Errore comune:** tracce incoerenti con la direzione del soggetto.

#### Movimento intenzionale della camera (ICM)
- **Cos'è:** *intentional camera movement*: spostare la camera durante la posa lunga (0,5-2 s).
- **Si vede:** pittura astratta, strisce di colore, abbandono della forma.
- **Quando:** lavori d'arte, copertine, atmosfere.
- **Higgsfield:** `intentional camera movement, abstract vertical streaks of color, painterly blur`. Modello: Soul 2.0 e Soul Cinema.
- **Errore comune:** troppo blur senza un punto di riferimento riconoscibile.

#### Flash che congela (flash freeze)
- **Cos'è:** il lampo dura 1/1000-1/20000 s e congela il soggetto in una posa lunga ambientale; con la seconda tendina si ottiene il soggetto nitido con la scia.
- **Si vede:** soggetto nitido nel buio, spesso con aloni di luce ambiente.
- **Quando:** feste, moda notturna, liquidi.
- **Higgsfield:** `flash-frozen subject against a motion-blurred ambient background`.
- **Errore comune:** flash frontale e nessuna luce ambiente: tutto nero attorno.

#### Raffica (burst)
- **Cos'è:** 10-30 fotogrammi al secondo (es. Canon EOS R7: fino a 15 fps, raffiche a 30 fps con otturatore elettronico [P, canon-europe.com, letto 2026-11-08]; il medio formato è più lento: GFX100 II circa 8 fps meccanico [P]); si scelgono i fotogrammi.
- **Si vede:** il momento esatto (capelli, sorriso, salto).
- **Quando:** moda in movimento, sport, bambini, animali.
- **Higgsfield:** serie di fotogrammi con Soul ID; non esiste un equivalente reale.
- **Errore comune:** non cercare il picco dell'azione.

Fonti: [S] conoscenza di mestiere per tempi ed effetti (tabella); valori di sincronizzazione flash e raffica dipendono dal corpo: esempi letti [P, 2026-11-08] su canon-europe.com (EOS R7), datasheet Hasselblad X2D 100C, fujifilm-x.com (GFX100 II). Data 2026-11-08. Luce e flash: rimando a `tecnica-fotografia-luce.md`.

---

## 5. Pellicola ed emulsioni

**Stato di produzione 2026-11-08** (riletto nella verifica indipendente del 2026-11-08, Chrome vero `-s=ver-fotocam2`; curl e r.jina.ai davano 403/404 su Ilford, Kodak e PetaPixel).
- [P, letto 2026-11-08] kodak.com/en/still-film/products/professional/: **Ektacolor Pro 160, 400, 800** (negativo colore), **Ektapan 100, 400, P3200** (B/N), **Ektar 100**, **Tri-X 320**, **Ektachrome E100**; la pagina professionale elenca 9 schede in prima pagina (pagina 2 non aperta); **Tri-X 400** ha scheda propria (aperta). Consumer (pagina aperta): **Gold 200, Kodacolor 100, Kodacolor 200, Ultramax 400**. Le pagine Ektacolor Pro 400 e Ektapan non nominano Portra né T-Max: Kodak non dichiara sul proprio sito la corrispondenza.
- [S+S] **Ektacolor Pro = Portra, Ektapan = T-Max, ma non è una «rinomina» pura.** Eastman Kodak ha annunciato le due famiglie il 24/3/2026; i marchi Portra e T-Max sono di Kodak Alaris, per questo Eastman Kodak ha dovuto cambiare nome (Fuji X Weekly 2026-03-26; Kosmo Foto 2026-03-24 «appear to be new branding» e 2026-04-21, entrambi letti 2026-11-08). Fuji X Weekly afferma «same emulsions»; Kosmo Foto e Leica Rumors usano «believed/essentially»; **nessuna nota Kodak letta** conferma la stessa emulsione. Kosmo Foto (2026-04-21): Kodak Alaris «continues to distribute its films ... as if nothing has changed», quindi **Portra e T-Max sono ancora in commercio con Alaris**: correzione alla frase «nome Portra fino al 2026». Il negozio CineStill (letto 2026-11-08) vende insieme «Portra 400/160/800» (pro pack) ed «Ektacolor Pro 800». Fiducia MEDIA per la corrispondenza (secondarie concordi, nessuna primaria), ALTA per i nomi sul catalogo Kodak.
- [P+S] **Fujifilm Pro 400H**: la pagina Fujifilm US «Professional Film» (letta 2026-11-08) la marca **«Discontinued»** [P]. PetaPixel 2025-06-27/06-30 conferma che 400H e Superia X-Tra non tornano [S, non riletta].
- [P, letto 2026-11-08] **Fujifilm Velvia 100**: la pagina dichiara «discontinue ... in the U.S. effective immediately (July 6, 2021)» (TSCA/EPA, PIP 3:1). La pagina indice la elenca ancora, come «Available in 35mm, 120 & Sheet»: è l'elenco dei formati, non una prova di disponibilità.
- [P, letto 2026-11-08] **Velvia 50** («Available in 35mm & 120 Format», niente grande formato) e **Provia 100F** («Available in 35mm, 120 & Sheet»): schede Fujifilm US attive e senza avviso di dismissione, mentre 400H porta «Discontinued». Nessuna dichiarazione di scorte sul sito Fujifilm (scheda Velvia 50 riaperta 2026-11-08: invariata). **Negozio** (B&H, bhphotovideo.com, Chrome, letto 2026-11-08): Velvia 50 in 35 mm e 120 a listino ma «Temporarily Out of Stock», rientro previsto «Nov 13, 2026» per il primo articolo; Provia 100F 35 mm, 120 e 4x5 «Temporarily Out of Stock», 8x10 su ordinazione («Special Order»). Quindi: ancora prodotte e vendute, scorte intermittenti (coerente con analogphotoday.com 2026-02-27 [S]: produzione contingentata dal 2023). Fiducia MEDIA-ALTA: in vendita, ma ordinare con anticipo.
- [P, letto 2026-11-08] **Ilford** (ilfordphoto.com, Chrome): in catalogo e «IN STOCK» sulle pagine prodotto HP5 Plus (ISO 400), FP4 Plus (ISO 125), Delta 100 e Delta 400 (35 mm); presenti anche Delta 3200, Pan F Plus, Ortho Plus, XP2 Super, SFX 200, Kentmere 100/200/400. **Harman Technology** (harmanphoto.co.uk, curl) pubblicizza anche le pellicole colore Harman Red, Phoenix, Phoenix II e Switch Azure (35 mm e 120).
- [P, letto 2026-11-08] **CineStill** (cinestillfilm.com, curl): in vendita 800Tungsten (EI 800, 3200K, 35 mm 36 pose, 17,99 USD) e 50Daylight (EI 50, 5500K, 17,99 USD) in 35 mm e 120, senza avviso di esaurimento sulla pagina.
- Polaroid: vedi sezione 1 (lette 2026-11-08).

Tabella (caratteri di mestiere; ISO nominali):

| Pellicola | Tipo | ISO | Carattere |
|---|---|---|---|
| Ektacolor Pro 160 (ex Portra 160) | negativo colore | 160 | pelle morbida, toni pastello, grana finissima |
| Ektacolor Pro 400 (ex Portra 400) | negativo colore | 400 | il default da ritratto: pelle calda, colore sobrio, latitudine ampia |
| Ektacolor Pro 800 (ex Portra 800) | negativo colore | 800 | più grana, serale, caldo |
| Ektar 100 | negativo colore | 100 | saturo, grana finissima, contrasto alto |
| Gold 200 | negativo colore | 200 | caldo, giallo, nostalgia, economico |
| Ultramax 400 | negativo colore | 400 | contrasto e grana evidenti, «famigliare» |
| Tri-X 400 | negativo B/N | 400 | grana espressiva, contrasto, reportage |
| Ektapan 100 / 400 / P3200 (ex T-Max) | negativo B/N | 100/400/3200 | grana fine (100), pulito, alta velocità (P3200) |
| Ektachrome E100 | invertibile | 100 | colori puliti e neutri, contrasto medio |
| Velvia 50 | invertibile | 50 | saturazione estrema, contrasto, verdi e rossi accesi |
| Provia 100F | invertibile | 100 | neutro, fine |
| Superia 400 | negativo colore | 400 | verdi freddi, ombre ciano |
| Ilford HP5 Plus | negativo B/N | 400 | versatile, grana classica |
| Ilford Delta 100 / 400 | negativo B/N | 100/400 | grana finissima, tecnologia Core-Shell dichiarata da Ilford [P], pulito |
| Ilford FP4 Plus | negativo B/N | 125 | fine, tonalità ricche |
| CineStill 800T | negativo colore (tungsteno) | 800 | halation rossa, notte, neon, grana |
| CineStill 50D | negativo colore (luce diurna) | 50 | fine, colori netti, halation |
| Polaroid | istantanea | 600 / i-Type | bassa saturazione, bordo |

#### Negativo colore da ritratto (Ektacolor Pro / Portra 160, 400, 800)
- **Cos'è:** negativo colore a latitudine ampia (sopra-esposizione di 2 stop tollerata), temperatura 5500K, grana fine; Ektacolor Pro è il nome sul sito Eastman Kodak; Portra resta il nome di Kodak Alaris (vedi Stato di produzione).
- **Si vede:** pelle calda e uniforme, ombre morbide, colori pastello e riservati, alte luci che sfumano senza bruciare.
- **Quando:** ritratto, moda editoriale, matrimonio, lifestyle, packaging che vuole «morbidezza».
- **Higgsfield:** `Portra 400 color negative film, fine grain, warm natural skin tones, soft contrast, Frontier scan`. «Portra 400» è in `vocab.md` (Film Stock Emulation, letto). Modello: Soul Cinema (grana e spontaneità), Nano Banana Pro.
- **Errore comune:** la palette di default del generatore (cammello, crema, luce dorata) coincide con questo look: cambia almeno un asse (regola in `SKILL.md`).

#### Ektar 100 (Ektar 100)
- **Cos'è:** negativo colore ISO 100 a saturazione alta e grana finissima, per luce diurna.
- **Si vede:** rossi e blu vivi, contrasto netto, cielo profondo, dettaglio molto fine.
- **Quando:** paesaggio, architettura, prodotto colorato, moda estiva.
- **Higgsfield:** `Ektar 100 color negative film, saturated vivid colors, extremely fine grain, high contrast, bright daylight`.
- **Errore comune:** su pelle porta a toni rossi/arancione.

#### Pellicola economica consumer (Gold 200, Ultramax 400)
- **Cos'è:** negativi consumer a contrasto più alto, colori caldi, grana evidente.
- **Si vede:** giallo sul cielo, ombre dense, impronta «famiglia/estate».
- **Quando:** nostalgia, lifestyle informale, social.
- **Higgsfield:** `Kodak Gold 200 warm yellow cast, visible grain, summer snapshot feel`.
- **Errore comune:** applicare lo stesso filtro giallo a tutto.

#### Bianco e nero (Tri-X 400, Ektapan 100/400/P3200 ex T-Max, Ilford HP5 Plus, Delta, FP4 Plus)
- **Cos'è:** negativi in argento. Tri-X: grana espressiva, contrasto netto, push facile a 1600. Ektapan/T-Max: grana tabulare («T-Grain», termine di mestiere [S]; la pagina Kodak Ektapan 400 dice «world's sharpest and finest grain 400 speed black-and-white film» [P, letta 2026-11-08]), per alte definizioni. HP5: versatile e tollerante. Delta: Ilford dichiara la tecnologia Core-Shell e grana finissima (non «tabulare», termine di mestiere non usato sulla pagina letta). FP4: fine, ISO 125.
- **Si vede:** Tri-X: neri profondi, grana visibile, drammaticità; T-Max/Delta: toni lisci e puliti; HP5: contrasto medio.
- **Quando:** reportage, ritratto sobrio, arte.
- **Higgsfield:** `black and white photograph, Tri-X 400 push-processed to 1600, strong visible grain, deep blacks, high contrast` (HP5 è in `vocab.md`). Modello: Soul Cinema, Nano Banana Pro.
- **Errore comune:** B/N come semplice desaturazione: manca il contrasto e il grano.

#### Invertibili / diapositive (Ektachrome, Velvia, Provia)
- **Cos'è:** pellicole positive (slide); si espongono per le alte luci, nessuna latitudine; scansione o proiezione.
- **Si vede:** colori puliti e saturi, neri profondi, alte luci facili da bruciare.
- **Quando:** moda dura, paesaggio, grafica.
- **Higgsfield:** `Ektachrome E100 slide film, clean saturated colors, deep blacks, bright highlights` / `Velvia color rendering, extremely saturated`. Ektachrome e Velvia sono in `vocab.md` ([V] righe 268 e 271, sezione Film Stock Emulation). Attenzione: Velvia 100 è fuori produzione negli USA dal 2021; Velvia 50 e Provia 100F in vendita ma spesso temporaneamente esaurite (B&H, 2026-11-08, vedi stato di produzione).
- **Errore comune:** pretendere ombre aperte da una slide.

#### CineStill 800T e 50D (CineStill 800T / 50D)
- **Cos'è:** pellicole colore da emulsioni per cinema, con supporto «Remjet backing free» e base in acetato, lavorabili in C-41 [P, cinestillfilm.com, schede 800Tungsten e 50Daylight, lette 2026-11-08]. 800T: EI 800, bilanciata tungsteno 3200K, push fino a 3200 ISO; 50D: EI 50, luce diurna 5500K, EI utile 12-100. Le schede non nominano Kodak: la derivazione dalle Vision3 compare solo in un handle di prodotto CineStill («50d ... vision3-7203», Super 8) [P indiretta] e in stampa [S].
- **Si vede:** **halation** rossa attorno alle luci puntiformi, notte turchese/ciano, ombre fredde, grana evidente (800T), colore pulito (50D).
- **Quando:** notte in città, neon, atmosfere cinematografiche.
- **Higgsfield:** `CineStill 800T, tungsten balance, red halation glow around bright lights, teal shadows, visible grain`. Modello: Soul Cinema; esagera facilmente l'alone.
- **Errore comune:** halation su luce diurna (cade l'effetto); il modello lo applica a tutto.

#### Spinta e ritiro (push / pull)
- **Cos'è:** sviluppo prolungato (push: +1, +2 stop; aumenta contrasto e grana) o ridotto (pull; riduce contrasto).
- **Si vede:** push: grana più grossa, neri densi; pull: toni morbidi.
- **Quando:** poca luce, look duro.
- **Higgsfield:** `pushed two stops, heavy grain, crushed blacks, high contrast`.
- **Errore comune:** applicarlo a pellicola già lenta e perdere ombre.

#### Sviluppo incrociato (cross-processing)
- **Cos'è:** sviluppo di una slide in chimica del negativo (C-41) o viceversa.
- **Si vede:** colori sbilanciati (verdi/ciano), contrasto alto.
- **Quando:** moda alternativa, copertine.
- **Higgsfield:** `cross-processed slide film, strong color shift to green and cyan, high contrast`.
- **Errore comune:** risultato imprevedibile: serve prova.

#### Grana (grain)
- **Cos'è:** struttura dei cristalli d'argento o dei coloranti; aumenta con ISO e sviluppo. Non è rumore digitale (luminanza e crominanza) che appare a blocchi.
- **Si vede:** grana: tessitura organica; rumore: puntini colorati.
- **Quando:** per un look analogico; mai per packshot.
- **Higgsfield:** `fine film grain, organic texture`. Modello: Soul Cinema.
- **Errore comune:** grana aggiunta come filtro uniforme.

#### Scansione (scanning: Frontier, Noritsu)
- **Cos'è:** i laboratori digitalizzano con scanner Fujifilm Frontier o Noritsu. Il tipo di scanner dà un'impronta: Frontier più contrasto e colori saturi e freddi, Noritsu più morbido e caldo (descrizione di mestiere, [S]).
- **Si vede:** il «look dei laboratori» differenza di colore, nitidezza e grana.
- **Quando:** per ottenere un look «da laboratorio» coerente.
- **Higgsfield:** `Frontier scan`, `Noritsu scan, slightly warm and soft` (non verificato come token: «Frontier» e «Noritsu» non compaiono in nessun file della skill `higgsfield`, controllato 2026-11-08).
- **Errore comune:** attribuire alla pellicola ciò che è dello scanner.

Fonti: [P, letto 2026-11-08] kodak.com/en/still-film (catalogo e pagine Ektacolor Pro 160/400/800, Ektapan 100/400/P3200, Ektar 100, Tri-X 400/320, Ektachrome E100, Gold 200, Ultramax 400, Kodacolor 200); fujifilm.com/us/en/business/professional-photography/film/velvia-100 [P, letto]; velvia-50 e provia-100f [P, lette, nessuna dichiarazione di disponibilità]. [S] petapixel.com/2026/03/24 (Ektacolor Pro, Ektapan; letti solo come sintesi di ricerca, la pagina ha risposto 403), fujixweekly.com/2026/03/26, petapixel.com/2025/06/30 (Fujifilm 400H e Superia), petapixel.com/2026/07/17 (CineStill 50D), pellica.app/blog/fujifilm-discontinuation-guide-2026. [P, solo anteprima] avviso Fujifilm Pro 400H. Ilford, CineStill, Polaroid: verificati il 2026-11-08 (vedi stato di produzione). Velvia 50 e Provia 100F: scheda Fujifilm e negozio B&H [P, letti 2026-11-08, Chrome vero]. [V] `vocab.md` della skill `higgsfield`, righe 266-271 (Portra 400, Velvia, Vision3 500T, HP5, Ektachrome).

---

## 6. Tecniche speciali

#### Focus stacking (focus stacking)
- **Cos'è:** più scatti con piano di fuoco diverso, fusi in un'immagine nitida da fronte a retro (software Helicon Focus, Photoshop, Capture One + rail). Da 5 a 100 scatti. In Photoshop: Modifica > Fusione automatica livelli, metodo «Stack Images» [P, helpx.adobe.com «Create a composite with extended depth of field», letto 2026-11-08]. Capture One non fonde: gestisce la sequenza in scatto e la esporta a Helicon Focus [P, support.captureone.com «Exporting sequences to Helicon Focus for focus stacking», letto 2026-11-08].
- **Si vede:** profondità di campo impossibile in uno scatto (macro, gioielli, prodotto).
- **Quando:** macro di gioielli, orologi, cosmetici, cibo.
- **Higgsfield:** `focus-stacked macro photograph, every part of the product in sharp focus from front to back`.
- **Errore comune:** giunzioni visibili sui bordi; il modello produce nitidezza «finta» e uniforme.

#### Fusione di esposizioni e HDR (exposure blending / HDR)
- **Cos'è:** più esposizioni (-2, 0, +2 EV) fuse per recuperare ombre e luci. Il blending manuale (maschere) è più naturale dell'HDR automatico. Lightroom Classic: Foto > Unione foto > HDR (Ctrl+H), con opzioni Auto Align e Auto Tone [P, helpx.adobe.com «HDR photo merge», letto 2026-11-08].
- **Si vede:** interni con finestre dettagliate; HDR eccessivo: aloni e colori surreali.
- **Quando:** immobiliare, architettura.
- **Higgsfield:** `balanced exposure, window view and interior both fully detailed, natural look`.
- **Errore comune:** HDR grigio e «dipinto».

#### Panorama e cucitura (panorama / stitching)
- **Cos'è:** più scatti sovrapposti (circa 30%) con camera ruotata sul punto nodale; cucitura in Lightroom o PTGui (Lightroom Classic: «Create panoramas and HDR panoramas» nell'indice dell'aiuto Adobe [P indiretto, 2026-11-08; la pagina panorama non ha caricato il testo]; Photoshop: Fusione automatica livelli, metodo «Panorama» [P, stessa pagina Adobe del focus stacking]).
- **Si vede:** risoluzione e angolo più ampi, prospettiva cilindrica.
- **Quando:** paesaggio, ampie strutture.
- **Higgsfield:** `ultra-wide panoramic composition, 21:9`.
- **Errore comune:** errori di parallasse.

#### Ripresa in tethering (tethered shooting)
- **Cos'è:** la camera collegata al computer (Capture One, Lightroom): le immagini appaiono subito sullo schermo, con profilo e griglie applicati in diretta. Lightroom Classic importa in tethering da corpi supportati Canon, Fujifilm, Nikon e Sony [P, helpx.adobe.com «Import photos from a tethered camera», aggiornata 13/8/2025, letta 2026-11-08]; Capture One ha una sezione «Tethered Capture» e il controllo remoto da iOS con Capture Pilot [P, support.captureone.com, letto 2026-11-08].
- **Si vede:** controllo del set, approvazione di cliente e art director in tempo reale.
- **Quando:** campagne, packshot, set con più decisori.
- **Higgsfield:** non applicabile.
- **Errore comune:** non salvare i RAW originali su due dischi.

#### Alta velocità e splash (high-speed / splash)
- **Cos'è:** flash a durata di 1/10000-1/40000 s su luce bassa, o triggering a sensore audio o ottico.
- **Si vede:** gocce, schizzi, polveri congelati a mezz'aria.
- **Quando:** bevande, cosmetici, cibo.
- **Higgsfield:** `high-speed photograph of a liquid splash frozen mid-air, crisp droplets, black background`.
- **Errore comune:** gocce con forma impossibile nel modello.

#### Liquidi (liquids)
- **Cos'è:** riprese di versamenti con sfondo nero o bianco e retroilluminazione; spesso composizione di scatti.
- **Si vede:** corone, filamenti, trasparenze.
- **Quando:** drink, profumi, skincare.
- **Higgsfield:** `liquid pour, backlit, glossy translucent liquid, black background`.
- **Errore comune:** il modello mescola fisicamente impossibile; verifica la coerenza.

#### Levitazione (levitation)
- **Cos'è:** oggetti sospesi con fili o supporti, rimossi in post o composti da scatti separati.
- **Si vede:** prodotto che fluttua, ingredienti in volo.
- **Quando:** pack con ingredienti, tech.
- **Higgsfield:** `product floating in mid-air, ingredients suspended around it, clean background`.
- **Errore comune:** ombre incoerenti con la luce.

#### Doppia esposizione (double exposure)
- **Cos'è:** due immagini sovrapposte su un fotogramma (pellicola) o con fusione in post (Screen o Lighten).
- **Si vede:** profilo + paesaggio, forme sovrapposte.
- **Quando:** copertine, moda concettuale.
- **Higgsfield:** `double exposure, portrait silhouette filled with a landscape`.
- **Errore comune:** immagine confusa senza gerarchia.

#### Infrarosso (infrared)
- **Cos'è:** sensore/pellicola sensibile a circa 720-900 nm; foglie bianche, cielo scuro.
- **Si vede:** vegetazione chiara, aspetto onirico.
- **Quando:** arte, campagne surreali.
- **Higgsfield:** `infrared photograph, white foliage, dark sky, dreamlike`.
- **Errore comune:** colori finti non coerenti.

#### Scanografia e fotogrammi (scanography / photograms)
- **Cos'è:** oggetti posti su uno scanner (scanografia) o sulla carta sensibile in camera oscura (fotogramma).
- **Si vede:** ombre nette, sagome, tonalità uniche.
- **Quando:** arte, packaging botanico, copertine.
- **Higgsfield:** `scanner photograph of flowers pressed against glass, black background, high detail` / `photogram, white silhouettes on deep blue cyanotype`.
- **Errore comune:** modelli che imitano senza la fisica.

Fonti: [S] tecniche: conoscenza di mestiere. [P, letto 2026-11-08, Chrome vero; r.jina.ai dava 422 su helpx] helpx.adobe.com (Auto-Blend Layers / extended depth of field; HDR Photo Merge; tethered capture), support.captureone.com (sequenze verso Helicon Focus; Tethered Capture). Helicon Focus, PTGui: siti non riletti. Data 2026-11-08.

---

## 7. Post-produzione e retouching

Principio: la post-produzione corregge e coordina, non salva. Il colore e la luce si decidono sul set (`photo-illustration-direction`). Le impostazioni qui sotto sono flussi di lavoro standard; i nomi di funzione dei software cambiano per versione.

#### Sviluppo del RAW (RAW development: Capture One, Lightroom)
- **Cos'è:** il RAW contiene i dati del sensore a 12-16 bit, non il look. Sviluppo in Capture One (preferito per tethering e colore) o Lightroom/Camera Raw con profilo e bilanciamento del bianco.
- **Si vede:** recupero di luci e ombre, controllo di colore.
- **Quando:** sempre; JPEG solo per social veloci.
- **Higgsfield:** non applicabile; per la coerenza di serie genera con lo stesso prompt base.
- **Errore comune:** modificare il JPEG.

#### Curve e color grading (curves / color grading)
- **Cos'è:** curve tonali (contrasto, punti nero/bianco), curve per canale, ruote colore su ombre, medi, luci.
- **Si vede:** palette coerente (ombre fredde, luci calde = split-toning).
- **Quando:** campagne con palette fissa.
- **Higgsfield:** `teal shadows, warm highlights, lifted blacks, gentle S-curve contrast`.
- **Errore comune:** grading che colora la pelle in modo innaturale.

#### Separazione di frequenze (frequency separation)
- **Cos'è:** divide l'immagine in livello a bassa frequenza (colore, tono) e ad alta frequenza (texture, pori) per ritoccare separatamente.
- **Si vede:** pelle uniforme con pori mantenuti.
- **Quando:** beauty.
- **Higgsfield:** `natural skin texture preserved with visible pores, even skin tone`.
- **Errore comune:** sfocare la bassa frequenza fino a perdere volume.

#### Dodge and burn (dodge and burn)
- **Cos'è:** schiarire e scurire selettivamente su livelli di curve per modellare il volto.
- **Si vede:** volume, zigomi, luci sulle labbra.
- **Quando:** beauty e moda di alta fascia.
- **Higgsfield:** `sculpted facial light and shadow, subtle contouring`.
- **Errore comune:** contorni dipinti.

#### Ritocco di alto livello e ritocco plastico (high-end vs plastic)
- **Cos'è:** il primo rimuove imperfezioni temporanee e mantiene texture; il secondo cancella pori e rughe.
- **Si vede:** pelle credibile contro «pelle di plastica».
- **Quando:** il primo per marchi di lusso e moda attuali.
- **Higgsfield:** `visible pores, fine vellus hair, natural skin sheen`; contro il plastico, usa la riga controcorrente di `image-models.md` per Nano Banana Pro.
- **Errore comune:** pelle e capelli senza rumore.

#### Liquify e compositing (liquify / compositing)
- **Cos'è:** deformazione controllata di forme; composizione di più scatti con maschere, ombre e luci coerenti.
- **Si vede:** correzione di una linea di tessuto; creazione di scene impossibili.
- **Quando:** moda, pack, scene costruite. Qui sono in gioco le norme sui claim e sul corpo (vedi `ad-claims-disclosure`).
- **Higgsfield:** composizione con più riferimenti in Nano Banana Pro.
- **Errore comune:** alterare il corpo oltre ogni verosimiglianza.

#### Pulizia di prodotto (product cleanup)
- **Cos'è:** rimozione di polvere, impronte, riflessi sulla confezione, riallineamento etichette, in genere con livelli separati.
- **Si vede:** prodotto perfetto, ma con ombre di contatto e riflessi plausibili.
- **Quando:** packshot.
- **Higgsfield:** `flawless product surface, accurate label, no fingerprints`; per etichette e testi il modello è inaffidabile.
- **Errore comune:** cancellare i riflessi che danno materia.

#### Colore del cliente e Pantone (client color matching)
- **Cos'è:** portare il colore di marca in foto con scheda colore (ColorChecker) a inizio set e profilo di camera; il Pantone si trasforma in valori Lab/RGB/CMYK documentati.
- **Si vede:** il rosso del brand identico fra scatti.
- **Quando:** packaging, e-commerce.
- **Higgsfield:** indica la tinta in parole e riferimento hex (`#C8102E` rosso); verifica a colpo d'occhio, i modelli non garantiscono la tinta esatta.
- **Errore comune:** approvare colore su monitor non calibrato (`print-packaging-production`).

#### Grana aggiunta ed emulazione della pellicola (added grain / film emulation: VSCO, Dehancer, RNI)
- **Cos'è:** plugin e preset che simulano curve, grana e halation di pellicole reali (VSCO, Dehancer, RNI Films).
- **Si vede:** una grana uniforme che non cambia con le luci come quella vera.
- **Quando:** quando non c'è budget per la pellicola.
- **Higgsfield:** prima genera pulito, poi applica emulazione in post: spesso meglio che nel prompt.
- **Errore comune:** grana su tutto con la stessa intensità; nelle ombre dovrebbe vedersi di più.

#### Spazi colore e profili (sRGB / Adobe RGB / ProPhoto / ICC)
- **Cos'è:** sRGB (web, social, gamut stretto), Adobe RGB (1998) (gamut più ampio, soprattutto nei ciano e nei blu, preferito per la stampa; sRGB per la visualizzazione online [P, helpx.adobe.com Photoshop «Color working spaces», letto 2026-11-08]), ProPhoto RGB [S: non nominato su quella pagina] (gamut molto ampio per l'editing a 16 bit). Il profilo ICC descrive come interpretare i valori.
- **Si vede:** colori spenti se il profilo manca o viene ignorato.
- **Quando:** edit in ProPhoto/Adobe RGB, export per web in sRGB; per stampa il profilo ICC lo dà lo stampatore (`print-packaging-production`).
- **Higgsfield:** non applicabile; i file generati sono in sRGB.
- **Errore comune:** consegnare RGB come CMYK.

#### Gestione del colore per stampa e web (color management)
- **Cos'è:** flusso: scatto → RAW → edit in ampio gamut → conversione al profilo di destinazione → prova.
- **Si vede:** corrispondenza fra schermo e stampa.
- **Quando:** sempre. Stampa: profilo ICC dello stampatore, prova contrattuale, nero ricco/K, abbondanza (`print-packaging-production`).
- **Higgsfield:** non applicabile.
- **Errore comune:** soft proof su monitor non calibrato.

Fonti: [S] flussi standard di ritocco (separazione di frequenze, dodge and burn, liquify: nessuna pagina letta). [P, letto 2026-11-08, Chrome vero] helpx.adobe.com/photoshop/desktop/adjust-color/color-effects-techniques/color-working-spaces.html (sRGB, Adobe RGB). Da verificare: pagina Adobe sul Color Grading di Lightroom Classic (l'URL helpx non ha restituito testo, Chrome) e ProPhoto RGB. Per la stampa: skill `print-packaging-production` [P interno], letta. Data 2026-11-08.

---

## 8. Estetiche di superficie che i brand chiedono

Principio: ogni «look» è la somma di camera, luce, pellicola/post e imperfezioni. Chi le chiede nomina l'effetto; tu devi sapere quali scelte lo producono e dove si rompe.

#### Flash diretto sulla camera (on-camera flash)
- **Cos'è:** flash frontale, spesso senza diffusione; 1/200 s.
- **Si vede:** pelle lucida, fondo scuro, ombre dure dietro il soggetto, occhi rossi se non ridotti.
- **Quando:** notte, party, moda «sporca» (Gen Z, streetwear).
- **Come ottenerlo davvero:** compatta o flash su camera, ISO 400, diaframma f/5.6, tempo 1/125-1/200, sfondo lontano (cade nel buio). Dettagli di luce: `tecnica-fotografia-luce.md`.
- **Higgsfield:** `direct on-camera flash, shiny skin highlights, hard shadow behind the subject, dark background falloff, 35mm film grain`. Modello: Soul Cinema.
- **Errore comune:** flash troppo morbido (da studio).

#### Aspetto iPhone e snapshot (iPhone / snapshot)
- **Cos'è:** scatto con telefono, HDR, 24 mm equivalente, verticale.
- **Si vede:** nitidezza elevata, ombre aperte, composizione scentrata.
- **Come ottenerlo:** scatta davvero con il telefono, formato 9:16, luce disponibile, nessuna sovra-direzione.
- **Higgsfield:** `candid smartphone photo, 24mm, slightly off-center, uneven lighting, no retouching`.
- **Errore comune:** modelli che producono immagini troppo «belle».

#### Sfocato e movimento (blur and motion)
- **Cos'è:** mosso e sfocato come estetica (sezione 4).
- **Come ottenerlo:** 1/15-1/4 s, camera in movimento, con soggetto riconoscibile.
- **Higgsfield:** `motion blur, ghosted figure, soft focus`.
- **Errore comune:** sfocato casuale, senza un punto nitido.

#### Sovrapposizioni e textura (overlays)
- **Cos'è:** livelli di polvere, graffi, luci (light leak), grana, timbro data in post.
- **Come ottenerlo:** livello in modalità Screen o Lighten a opacità 20-40%.
- **Higgsfield:** `light leak on the left edge, film dust and scratches`. Modello: Soul Cinema; spesso meglio in post.
- **Errore comune:** overlay uguali ovunque.

#### Editoriale anni 90 (90s editorial)
- **Cos'è:** flash diretto o luce naturale dura, sfondo semplice, ritratto frontale, colore saturo, pellicola 35mm o medio formato, styling minimale, posa neutra.
- **Come ottenerlo:** Ektacolor Pro 400 o Gold 200, 50 mm, f/4, flash o luce da finestra, fondale a tinta unita, modella senza trucco carico.
- **Higgsfield:** `1990s editorial photograph, medium format, plain seamless background, hard direct light, minimal styling, natural skin, slightly desaturated color`.
- **Errore comune:** costumi nostalgici e look «retro» da costume.

#### Nitidezza commerciale clinica (clinical commercial sharpness)
- **Cos'è:** fondo bianco o grigio, luce uniforme, ombre minime, alto dettaglio, colori esatti, focus stacking.
- **Come ottenerlo:** Phase One / GFX con 80-120 mm, f/8-11, luce soft box, tethering, retouching pulito.
- **Higgsfield:** `clinical product photography, pure white seamless background, even soft light, 100 megapixel detail, accurate color`. Modello: Nano Banana Pro / 2.
- **Errore comune:** eccessiva nitidezza digitale (pori finti).

#### Analogico digitale (digital analog)
- **Cos'è:** file digitale con emulazione di pellicola (grana, curve, halation).
- **Come ottenerlo:** scatto pulito RAW + emulazione (Dehancer, RNI) + piccole imperfezioni (vignettatura, dust).
- **Higgsfield:** `digital file with film-like grain and soft highlight roll-off`.
- **Errore comune:** effetto-filtro identico su tutto.

Fonti: [S] conoscenza di mestiere; `fotografia.md` (voci, lettura precedente). Data 2026-11-08.

---

## 9. Il look fotografico nei modelli AI

**Verificato nei file della skill `higgsfield`** (`image-models.md`, snapshot 2026-09-26): Soul 2.0 (preset; prompt = soggetto + scena + mood), Soul Cinema (frame più cinematografici, grana, look spontaneo, guidato dal solo prompt), Soul Cast, Soul Location, Nano Banana Pro (formula a sei elementi, modalità Thinking, difetto «texture plastica» e riga di contrasto), Nano Banana 2 (face match, edit, troppo pulito/simmetrico per i luoghi), GPT Image 2/2.5 (tinta gialla sui luoghi, testo, abiti, sfondo trasparente nella 2.5), Seedream 5.0 (stilizzato), FLUX.2, Kling O1, Z-Image. **Non verificato:** quanto ogni modello interpreti i token di camera, ottica e pellicola; tutto ciò che segue come comportamento è **inferenza da provare con una generazione di prova**.

#### Cosa rende finta una foto AI (what makes an AI photo look fake)
- **Cos'è:** i segnali ricorrenti: pelle cerosa senza pori; simmetria perfetta del volto; luce senza sorgente (viso illuminato ma nessuna finestra, nessun riflesso negli occhi); profondità di campo incoerente (capelli nitidi, orecchio sfocato; mani dietro il volto a fuoco diverso); testo e logo illeggibili; mani e orecchini anomali; sfondi troppo ordinati.
- **Si vede:** «bellezza da rendering», assenza di imperfezioni fisiche.
- **Quando:** da correggere sempre quando il brief chiede un look fotografico credibile.
- **Higgsfield:** inserisci imperfezioni fisiche: `visible pores, fine vellus hair, slight skin asymmetry, flyaway hairs, natural skin sheen`; una sorgente: `soft window light from camera left, visible catchlights in the eyes`; profondità coerente: `focus plane on the eyes, background falls off gradually`; ambiente vissuto: `slightly cluttered real environment`. Per il difetto di texture plastica di Nano Banana Pro, usa la riga di contrasto in `image-models.md` ([V] riga 387, «Plasticky-texture failure mode», riga finale con haze, film grain, crush blacks). Modello: Soul Cinema per spontaneità e grana; Nano Banana Pro con attenzione.
- **Errore comune:** dichiarare «photorealistic, 8k, ultra detailed»: spinge verso l'iper-dettaglio plastico.

#### Come scrivere un prompt camera + ottica + pellicola (camera + lens + film prompt)
- **Cos'è:** ordine consigliato: soggetto e scena → camera e formato → obiettivo e distanza → diaframma/profondità → luce (rimando a `tecnica-fotografia-luce.md`) → pellicola/colore → grana/scansione → imperfezioni. Esempio: `Woman seated by a window, three-quarter view. Shot on a medium format camera, 80mm lens from 2 meters, f/4, shallow depth of field with the eyes in focus. Soft window light from camera left. Portra 400 color negative, fine grain, Frontier scan, natural skin texture with visible pores, slight edge vignetting.` Meno di 200 parole per i prompt brevi ([V] `SKILL.md` riga 86: tetto morbido del regime breve; i prompt di produzione a blocchi seguono regole proprie).
- **Si vede:** coerenza fotografica: tutte le scelte puntano allo stesso mondo.
- **Quando:** ogni prompt fotografico.
- **Higgsfield:** vedi esempio; evita nomi di fotografi (`regole.md`). Nei video usa MCSLA (Model, Camera, Subject, Look, Action) ([V] `SKILL.md` riga 78). Nomi di pellicole e ottiche possono entrare.
- **Errore comune:** accumulare token di camere incompatibili (`8x10 view camera, GoPro, anamorphic`).

#### Quali modelli rendono meglio pellicola, grana e imperfezioni (which models render film best)
- **Cos'è:** sintesi dai file della skill. **Verificato:** Soul Cinema ha come punto di forza frame cinematografici, grana e look spontaneo, ed è guidato dal solo prompt; Soul 2.0 funziona con preset; Nano Banana Pro è il più preciso sul prompt strutturato ma tende alla texture plastica; Nano Banana 2 è pulito e simmetrico per i luoghi; GPT Image 2 e 2.5 tendono al giallo sui luoghi e sono forti sul testo; Seedream 5.0 è stilizzato. **Inferenza (da provare):** per pellicola e grana la scelta ragionevole è Soul Cinema; per packshot clinico Nano Banana Pro/2; per testo nell'immagine GPT Image 2.5.
- **Si vede:** vedi modelli.
- **Quando:** fai una prova a coppie con due modelli sullo stesso prompt prima di consegnare.
- **Higgsfield:** conserva il seed e il prompt; segnala nel report la coppia migliore (regola di aggiornamento in `SKILL.md`).
- **Errore comune:** fidarsi del nome della pellicola come se fosse un parametro: è un'indicazione di stile.

#### Dichiarazione e diritti (AI disclosure)
- **Cos'è:** i contenuti generati vanno dichiarati al cliente per iscritto (`photo-illustration-direction`, `regole.md`); non presentare come fotografia reale un prodotto, una sede o una persona che non esistono; per i deepfake e l'art. 50 AI Act vedi `regole.md`.
- **Si vede:** n/a.
- **Quando:** sempre.
- **Higgsfield:** n/a.
- **Errore comune:** consegnare un output AI come foto di un prodotto reale.

Fonti: [S, skill di terzi, ora archiviata] `image-models.md` e `SKILL.md` (lette, snapshot 2026-09-26; stale oltre 30 giorni: i parametri di modello vanno riverificati dal vivo prima di una produzione); `vocab.md` (Film Stock Emulation righe 266-271, Fisheye riga 91: [V] ritrovati 2026-11-08; Frontier, Noritsu, tilt-shift assenti dalla skill). [S] comportamento dei token di camera/pellicola nei modelli: nessuna fonte, inferenza. Data 2026-11-08.

---

## Cosa non è stato verificato (rischio)

- Specifiche di corpi e ottiche: lette il 2026-11-08 per Fujifilm, Hasselblad, Phase One, Leica M11, Canon EOS R7, Nikon Z MC 105 e PC-E 45, Canon EF 135 Softfocus. Restano [S]: Sony, Nikon DX, Zeiss/Contax Planar, Canon FD e TS-E, caratteri delle ottiche vintage, Hasselblad X2D II (specifiche complete). Rischio: un modello superato in un preventivo.
- Stato 2026 delle pellicole: Ilford, CineStill, Polaroid, Velvia 50 e Provia 100F verificati il 2026-11-08; Velvia 50 e Provia 100F spesso temporaneamente esaurite (B&H). Superia non riverificata. Rischio: ordinare tardi.
- Continuità Portra → Ektacolor Pro e T-Max → Ektapan: solo [S] (stampa). Rischio basso, ma non è una dichiarazione Kodak letta.
- Comportamento dei token di camera, ottica, pellicola nei modelli Higgsfield: non provato con generazioni. Rischio: aspettarsi un controllo che il modello non ha.
- Documentazione Adobe e Capture One: letta il 2026-11-08 per focus stacking, HDR, tethering, spazi colore; restano da leggere Color Grading di Lightroom e ProPhoto RGB. Rischio: nomi di funzioni superati.
- Verifica indipendente fatta il 2026-11-08 (vedi sotto).

## Verifica del 2026-11-08

Terza tornata indipendente (sessione Chrome `ver-fotocam3`, chiusa a fine lavoro). Non rifatte le voci già marcate «letto 2026-11-08» dalle tornate precedenti.
- Dati controllati: circa 45 (compreso il campione). Promossi a [P]: 22 (Canon EOS R7 sensore, 1,6x, X-sync, raffica; Leica M11 cornici e sensore; Summilux-M 35/50; Nikon Z MC 105 e PC-E 45; Canon EF 135 Softfocus; Velvia 50 e Provia 100F in negozio; Photoshop Stack Images e Panorama; Lightroom HDR e tethering; Capture One sequenze e tethering; spazi colore Adobe). Marcati [V] nella skill `higgsfield`: 7 (fisheye, Film Stock Emulation, Nano Banana 2 troppo pulito, riga anti-plastica NB Pro, MCSLA, tetto 200 parole). [S] con una secondaria: 3 (Contax T2, Yashica T4, Helios-44).
- Correzioni: (1) Phase One IQ4, «Leaf shutter (full res.) 1.2» è 1,2 scatti al secondo (riga «Captures per second»), non un tempo di posa; (2) Canon APS-C 22,3 x 14,8 mm, non 14,9; (3) Fujifilm APS-C 23,5 x 15,7, non 15,6; (4) macro 105 mm: 0,29 m dal piano focale sul Nikon Z MC 105 (31 cm era il vecchio F-mount, non riletto); (5) Helios 44-2 «8 lamelle» non confermato (camera-wiki: «8 o 6» nelle versioni tarde); (6) Velvia 50/Provia 100F: in vendita ma spesso esaurite; (7) frase duplicata nelle simulazioni Fujifilm; Capture One non fonde il focus stacking, esporta a Helicon Focus.
- Controllo a campione di 10 fonti [P] già presenti: X-T5 (23,5 x 15,7, 19 simulazioni), GFX100 II (43,8 x 32,9, 102 MP, 8 fps), Hasselblad X2D (102 MP, 16 bit, 15 stop, lamelle), PDF Phase One (PDFKit), Polaroid (5 formati), catalogo Kodak professionale, Ektapan 400 («world's sharpest...»), Velvia 100 (6/7/2021), Velvia 50, Ilford HP5 («IN STOCK», ISO 400): tutte confermate. CineStill 800T non riaperta (muro dei cookie in Chrome).
- Ancora aperti: FunSaver 27/39 pose (pagine Kodak in 404, lettore idem); gamma Canon TS-E e Canon FD (404, camera-wiki vuota); Zeiss/Contax Planar; Sony/Nikon DX; Color Grading di Lightroom e ProPhoto RGB (helpx senza testo); X2D II specifiche complete; sezioni 3 e 8 e caratteri delle ottiche vintage restano [S] mestiere (nessuna fonte autorevole cercata in questa tornata).
- Metodi: Chrome vero per Canon, Nikon, Leica, Adobe, Capture One, B&H, Kodak, Fujifilm (r.jina.ai dava 422 su helpx e 404/vuoto su Canon); r.jina.ai per camera-wiki; curl + PDFKit per il PDF Phase One; ricerche Google dentro Chrome per trovare gli URL.
