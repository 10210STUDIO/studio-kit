# Tecnica della fotografia — luce ed esposizione

Manuale tecnico (il mestiere, non i riferimenti): come si controlla la luce in uno scatto reale e come si descrive a un modello generativo. Serve a dirigere foto AI e shooting veri con il vocabolario di un fotografo di moda e di still life.
Nei manuali tecnici i nomi di prodotti (flash, modificatori, pellicole) possono entrare nel prompt; i nomi di autori no. Per camere, ottiche, pellicole e post-produzione vedi `tecnica-fotografia-camere-ottiche.md`; per la luce da set cinematografico vedi `tecnica-cinema-luce-ottiche.md`.
Redatto 2026-11-08. Ogni `##` chiude con «Fonti:» (data di lettura, [P] primaria letta, [S] secondaria). Dove non c'è una fonte letta la riga lo dice: «conoscenza consolidata» = fisica o pratica di mestiere standard, non riletta su una pagina in questa sessione.

**Legenda del campo Higgsfield.** «Verificato (skill)» = il comportamento del modello è scritto nei file della skill higgsfield (vocab.md, image-models.md, moodboard, style) letti il 2026-11-08. «Ipotesi non testata» = formula coerente con quei file ma mai provata con una generazione: va testata prima di consegnarla a un cliente. Regola generale verificata (skill): descrivi la sorgente (posizione, qualità, direzione, rimbalzo, geometria dell'ombra), non l'umore; «dramatic lighting» da solo dà la media.

---

## 1. Esposizione

Il triangolo (diaframma, tempo, ISO) è una sola quantità di luce distribuita su tre effetti diversi: profondità di campo, mosso, rumore. Uno stop è un raddoppio o dimezzamento della luce. Tutto il resto del manuale (flash, modificatori, rapporti) si misura in stop.

#### Stop ed EV
- **Cos'è:** 1 stop = fattore 2 sulla luce che arriva al sensore. Si ottiene con: un passo di tempo (1/125 → 1/250), un passo di diaframma pieno (f/2.8 → f/4, che divide l'area per 2), un raddoppio di ISO. EV (exposure value) = combinazione di diaframma e tempo che dà la stessa esposizione: EV = log2(N²/t) riferito a ISO 100; ogni +1 EV dimezza la luce.
- **Si vede:** gli stop sono l'unità con cui si descrivono rapporti di luce (2:1 = 1 stop, 4:1 = 2 stop, 8:1 = 3 stop), il «meno 2 stop» di un look scuro, la perdita dell'HSS.
- **Quando:** sempre, come lingua comune fra fotografo, assistente e retoucher.
- **Higgsfield:** non si prompta in stop. Si traduce il risultato: «exposed one stop under, rich shadows, highlights held» è un'ipotesi che i modelli leggono come «scuro»; meglio descrivere il rapporto: «bright side of the face roughly three times brighter than the shadow side, shadow still holds detail». Modello: ipotesi non testata; i generatori non misurano gli stop, interpretano l'aggettivo.
- **Errore comune:** confondere stop di luce e stop di diaframma: aprire di uno stop il diaframma raddoppia la luce, ma riduce anche la profondità di campo.

#### Misurazione: riflessa e incidente
- **Cos'è:** l'esposimetro della macchina (misurazione riflessa) legge la luce riflessa dalla scena e la porta a un grigio medio (convenzionalmente 18%, la «zona V»). Un esposimetro a luce incidente (con calotta bianca puntata verso la fonte) misura la luce che cade sul soggetto, indipendente dal colore del soggetto. Sekonic descrive l'esposimetro riflesso così: «They are merciless in recording all things as a medium tone.»
- **Si vede:** con la riflessa, un abito bianco o una neve escono grigi (sottoesposti) e un fondo nero esce grigio (sovraesposto); con l'incidente il bianco resta bianco e il nero resta nero.
- **Quando:** incidente per studio, flash, ritratto, moda, still life con superfici di toni estremi; riflessa per reportage veloce, luce naturale che cambia. Lo spot meter (misura riflessa su un angolo di pochi gradi) serve per misurare un punto: pelle, un'alta luce da proteggere.
- **Higgsfield:** non applicabile come comando. Effetto utile: per ottenere «bianco su bianco» realistico descrivere «white garment on white backdrop with visible tonal separation, fabric folds readable». Modello: ipotesi non testata.
- **Errore comune:** fidarsi della misurazione matrix/valutativa con un soggetto scuro su fondo chiaro o viceversa: la macchina «corregge» verso il grigio e uccide la chiave voluta.

#### Modalità di misurazione: matrix, media ponderata al centro, spot
- **Cos'è:** matrix (valutativa) confronta la scena con un archivio di casi e sceglie; media ponderata al centro dà peso a un cerchio centrale; spot legge un'area ridotta. I dettagli (percentuali di area, banche dati) dipendono dal produttore.
- **Si vede:** matrix tende alla scena «normale»; spot dà controllo e responsabilità.
- **Quando:** spot sul volto in controluce o su un palco; matrix per scene medie.
- **Higgsfield:** n/a.
- **Errore comune:** spot sull'ombra in un controluce: il fondo brucia, e se non è voluto è un errore, non uno stile.

#### Gamma dinamica, istogramma, ETTR
- **Cos'è:** la gamma dinamica è l'intervallo di luminosità fra nero utile e bianco senza dettaglio che il sensore (o la pellicola) registra, espresso in stop; varia da camera a camera, quindi il numero va letto dalle schede del produttore o da test indipendenti. L'istogramma mostra la distribuzione dei toni: a destra le alte luci, a sinistra le ombre. ETTR (expose to the right) = esporre il più possibile a destra senza bruciare le alte luci, perché nel file raw la maggior parte dei dati sta nelle alte luci e il rumore sta nelle ombre; poi si abbassa in post.
- **Si vede:** ETTR dà ombre pulite; una sovraesposizione oltre il bianco di sensore dà alte luci piatte e irrecuperabili («clipping»).
- **Quando:** ETTR per paesaggio, still life, moda in studio con file raw; non per lo stile «scuro e pieno» dove si vuole che le ombre chiudano.
- **Higgsfield:** «highlights held, no clipped whites, soft roll-off into white» e «shadows crushed to near black with a trace of detail». Modello: ipotesi non testata. Verificato (skill): per Nano Banana Pro il contrario del look di plastica è «light atmospheric haze, film grain, crush blacks, shadow depth»; se il modello restituisce un'immagine «piatta e perfetta», aggiungere questi elementi.
- **Errore comune:** giudicare l'esposizione dal display LCD luminoso; si guarda l'istogramma e l'avviso di alte luci.

#### Bracketing
- **Cos'è:** più scatti identici a esposizioni diverse (es. -2, 0, +2 EV) per coprire una scena più ampia della gamma del sensore, uniti poi in post (HDR/blend) o scelti.
- **Si vede:** interni con finestre luminose leggibili dentro e fuori; con cavalletto.
- **Quando:** architettura e interni, location con finestre; in moda raramente, perché la luce si controlla.
- **Higgsfield:** «interior with window view fully readable, balanced exposure between room and exterior» (ipotesi non testata); i modelli tendono a bilanciare da soli e a produrre l'effetto «HDR» gonfio se non lo si frena: aggiungere «natural, no HDR look».
- **Errore comune:** bracketing su soggetti che si muovono: i fantasmi.

#### Sovra e sottoesposizione come stile
- **Cos'è:** esposizione volutamente fuori dal grigio medio. High-key = scena luminosa, ombre aperte, rapporto di luce basso, istogramma a destra. Low-key = scena scura, istogramma a sinistra, pochi punti luce. Sovraesposizione di 1-2 stop sul negativo colore è un look classico (pelle luminosa, ombre dense in colore); la sottoesposizione del digitale produce rumore.
- **Si vede:** high-key = pulito, farmaceutico, beauty; low-key = misterioso, lusso scuro, drammatico.
- **Quando:** beauty e skincare high-key; profumeria, orologeria, alcolici low-key.
- **Higgsfield:** high-key «bright airy exposure, lifted shadows, luminous skin, clean white background, no deep blacks»; low-key «dark exposure, single small source, deep black falloff, most of the frame in shadow». Modello: ipotesi non testata; il generatore tende a «illuminare» un low-key, quindi vincolare con «most of the frame in near black».
- **Errore comune:** low-key ottenuto abbassando l'esposizione globale invece di togliere luce dal fondo: sembra una foto sbagliata, non scura.

#### Regola «Sunny 16»
- **Cos'è:** regola pratica per luce solare diretta a cielo sereno: diaframma f/16 e tempo uguale al reciproco dell'ISO (ISO 100 → 1/100 circa). Si scala di uno stop per condizione (f/11 sole debole e velato, f/8 nuvoloso luminoso, f/5.6 molto coperto o ombra aperta; tabella Kodak F-4017, Tri-X 400, a 1/500 s, letta 2026-11-08 [P]). Correzione del 2026-11-08: la versione precedente dava f/4 per l'ombra aperta, ma nella colonna Tri-X 400 l'ombra aperta è f/5.6 (f/4 compare solo nella colonna Tri-X 320).
- **Si vede:** serve per scatto senza esposimetro e per calibrare l'occhio.
- **Quando:** reportage, pellicola con macchine manuali.
- **Higgsfield:** n/a.
- **Errore comune:** applicarla a luce bassa o di tramonto.

**Fonti:** Sekonic, «The Benefits of Using Light Metering» (sekonic.com/classroom/the-benefits-of-using-light-metering/), citazione «They are merciless in recording all things as a medium tone.» riferita agli esposimetri a luce riflessa, letta raw 2026-11-08 [P]. Sunny 16: Kodak Professional Tri-X 320 e 400, scheda F-4017 (febbraio 2016, PDF business.kodakmoments.com letto con PDFKit 2026-11-08): per Tri-X 400, a 1/500 s, f/22 su sabbia chiara o neve, f/16 sole forte o velato con ombre nette, f/11 sole debole velato, f/8 nuvoloso luminoso, f/5.6 molto coperto o ombra aperta; f/8 per soggetti in controluce ravvicinati [P]. Nota: per ISO 400 Kodak usa 1/500 s, non 1/400, quindi «tempo = reciproco ISO» è un'approssimazione al tempo disponibile. EV = log2(N²/t): formula letta su Wikipedia «Exposure value» 2026-11-08 [S]. ETTR: Cambridge in Colour, «Digital Exposure Techniques» (aperta con Chrome 2026-11-08; curl e lettore davano Cloudflare): l'ETTR sposta l'istogramma a destra senza tagliare le alte luci e poi si compensa in sviluppo; riduce il rumore perché i toni chiari sono meno rumorosi; con raw a 14 bit il vantaggio sui toni conta meno; il rischio è il taglio dei singoli canali colore [S]. Wikipedia «Exposing to the right» concorda (maggiore rapporto segnale/rumore, più gamma nelle ombre) [S]: due secondarie concordi, ETTR passa a [S] confermata. Triangolo, zona V, bracketing: conoscenza consolidata, non riletta. Gamma dinamica in stop per modello: non verificata (dipende dalla camera). Comportamento dei modelli generativi: vedi legenda.

---

## 2. Luce naturale

La luce naturale non si controlla ma si sceglie: ora, orientamento, distanza dalla finestra, riflettore. Il sole è una sorgente piccola e dura nel cielo; le nuvole e le finestre la trasformano in una sorgente grande.

#### Ora del giorno: luce di mezzogiorno, ora dorata, ora blu
- **Cos'è:** la qualità cambia con l'altezza del sole. Alto (mezzogiorno): luce dura, ombre corte e verticali, sotto gli occhi e il naso. Basso (prime/ultime ore): luce radente, calda (alba e tramonto con cielo sereno 3000-4000 K secondo Cambridge in Colour; Wikipedia «Golden hour» indica invece circa 2000 K subito dopo l'alba o prima del tramonto e circa 3500 K nell'ora dorata: le due secondarie non coincidono, la cifra dipende da latitudine, stagione e meteo), ombre lunghe. Ora blu: dopo il tramonto o prima dell'alba, con il sole circa 3-10° sotto l'orizzonte (Wikipedia «Golden hour», secondo la definizione usata), luce indiretta a dominante blu, nessuna ombra netta, si bilancia con luci artificiali calde. Il valore in kelvin dell'ora blu non è stato trovato su nessuna fonte letta: la cifra «circa 10000 K e più» della versione precedente è tolta (ombra o cielo molto coperto è 9000-10000 K per Cambridge in Colour, ma non è l'ora blu).
- **Si vede:** ora dorata = pelle calda, bordi luminosi, atmosfera nostalgica e pubblicitaria; ora blu = fredda, urbana, vetrine accese; mezzogiorno = contrasto, sguardi socchiusi.
- **Quando:** ora dorata per moda lifestyle, abbigliamento, auto, turismo; ora blu per architettura, hotel, orologeria in esterni.
- **Higgsfield:** «low sun just above the horizon, long soft shadows, warm side light grazing the skin» / «blue hour, deep blue ambient sky, warm practical windows glowing, no direct sun». Verificato (skill): la palette di default dei generatori è già dorata (muro chiaro, luce dorata di finestra); per un risultato non scontato cambiare almeno un asse. Modello: Soul Cinema per location e ambienti, «most cinematic frames» (verificato, skill: image-models.md, tabella per classe di asset; correzione del 2026-11-08, la riga diceva «esterni cinematografici»); GPT Image tende al giallo (verificato, skill, stessa riga).
- **Errore comune:** «golden hour» in ogni prompt: è la media del genere.

#### Cielo coperto come softbox
- **Cos'è:** una nuvolosità uniforme diffonde il sole in una sorgente grandissima: luce morbida, ombre quasi assenti, contrasto basso, colore neutro-freddo.
- **Si vede:** volti puliti, colori saturi, riflessi vetro/acqua senza punti caldi; luce «da catalogo» o «nordica».
- **Quando:** moda minimale, cosmetica, prodotto all'aperto, ritratti ambientati.
- **Higgsfield:** «overcast sky acting as a giant softbox, soft diffuse light from above, almost no shadows, low contrast, true colors». Verificato (skill): la riga «overcast as softbox» esiste nella skill higgsfield-style (lines 160-171). Modello: ipotesi non testata sul rendimento per modello.
- **Errore comune:** cielo bianco bruciato dietro il soggetto; si espone sul volto e si accetta, o si scurisce in post.

#### Luce di finestra e distanza
- **Cos'è:** una finestra è una sorgente grande; la morbidezza dipende dal rapporto fra dimensione della sorgente e distanza dal soggetto. Più il soggetto è vicino alla finestra, più la luce è morbida e il decadimento (caduta di luce) è rapido (legge dell'inverso del quadrato: raddoppiando la distanza la luce cala di 2 stop). Allontanandosi, la luce è più uniforme e meno intensa, e l'ombra più netta.
- **Si vede:** vicino alla finestra: lato luminoso e lato in ombra con un passaggio morbido, sfondo scuro; lontano: luce piatta.
- **Quando:** ritratto, still life di cibo, editoriale intimo.
- **Higgsfield:** «single large window to camera-left, soft directional daylight, gentle falloff into shadow on the far side, dark room behind». Verificato (skill): la finestra a luce dorata è la scelta di default; per attrito scegliere finestra fredda, nord, o vetro sporco. Modello: ipotesi non testata.
- **Errore comune:** finestra + luce da soffitto accesa: due temperature di colore non volute.

#### Ombra aperta (open shade) e luce riflessa
- **Cos'è:** il soggetto sta all'ombra di un edificio o albero ma illuminato dall'intero cielo: luce morbida, direzionale dall'alto, più fredda del sole; il muro chiaro vicino rimbalza luce calda sul soggetto.
- **Si vede:** pelle pulita senza ombre dure, occhi aperti, leggero tono blu.
- **Quando:** ritratti in esterni a mezzogiorno.
- **Higgsfield:** «in open shade beside a building, soft skylight, subtle bounce from a pale wall on the shadow side». Modello: ipotesi non testata.
- **Errore comune:** soggetto mezzo in sole e mezzo in ombra: macchie di luce sul volto.

#### Controluce
- **Cos'è:** il sole o la sorgente dietro il soggetto, verso la camera. Si espone per il soggetto (spot o compensazione di +1/+2 stop) o si riempie con un pannello o flash.
- **Si vede:** contorno luminoso (rim), capelli luminosi, aloni e flare, ombra verso la camera; look nostalgico o «estate».
- **Quando:** moda estiva, beauty luminosa, eventi.
- **Higgsfield:** «strong backlight from low sun behind the subject, luminous rim on hair and shoulders, gentle haze, soft fill on the face». Verificato (skill): le righe backlight/rim stanno nella skill higgsfield-style. Modello: ipotesi non testata.
- **Errore comune:** volto nero e cielo corretto, quando si voleva il contrario.

#### Sole duro di mezzogiorno come stile
- **Cos'è:** scelta deliberata di sole alto e diretto: ombre nere e nette, contrasto massimo, colori saturi, riflessi duri su pelle e vetro.
- **Si vede:** estetica da fotografia di moda mediterranea, flash-like, grafica.
- **Quando:** costumi, occhiali da sole, calzature, accessori: marchi con carattere diretto.
- **Higgsfield:** «hard direct midday sun, crisp black shadows with sharp edges, high contrast, saturated colors, squinting-free styling with sunglasses». Modello: ipotesi non testata.
- **Errore comune:** non gestire le ombre sotto occhi e naso: cappelli, occhiali o una posa che le giustifichi.

#### Riflettori e rimbalzi naturali
- **Cos'è:** pannello bianco, argento, oro o un muro che riflette il sole sul lato in ombra del soggetto. Bianco = morbido e neutro, argento = più forte e freddo, oro = caldo, pannello nero (flag) = sottrae luce.
- **Si vede:** riduzione del contrasto, luce nei sottocchi, riflessi negli occhi.
- **Quando:** ritratto e still life in esterni.
- **Higgsfield:** «a large white reflector just below frame bouncing soft light into the shadows» (ipotesi non testata).
- **Errore comune:** riflettore argento troppo vicino: occhi socchiusi, pelle lucida.

**Fonti:** Cambridge in Colour, «White Balance» (tabella dei kelvin, aperta con Chrome 2026-11-08): alba/tramonto sereno 3000-4000 K, cielo moderatamente coperto 6500-8000 K, ombra o cielo molto coperto 9000-10000 K [S, tabella «rule-of-thumb»]; Wikipedia «Golden hour» e «Blue hour», lette raw 2026-11-08 [S]. Elinchrom, Lighting Guide (elinchrom.com/en/Home/Discover/Educational/Lighting_Guide, letta raw 2026-11-08): softbox a mezzo metro dà ombre più morbide, a due metri o più ombre più definite [P, guida del produttore]: conferma il rapporto fra dimensione, distanza e morbidezza, non il «2 stop per raddoppio» (inverso del quadrato: fisica standard, non riletta). Altezza del sole e nuvolosità come diffusore: conoscenza consolidata. Righe «overcast as softbox», «backlight», «rim» della skill higgsfield-style lette 2026-11-08 [P interna].

---

## 3. Flash e strobo

Il flash dà luce a colore costante (circa 5000-6000 K: tubo flash Godox AD600ProII 5800±200 K [P]; la cifra varia con marca, potenza e modalità), potenza controllabile e un tempo di emissione molto più breve dell'otturatore: la durata dell'impulso, non il tempo di scatto, ferma il movimento.

#### Flash a slitta e flash da studio (monotesta e generatore)
- **Cos'è:** speedlight a slitta: batterie, potenza bassa (poche decine di Ws), leggero. Monotesta da studio (monolight): alimentatore e lampada nella stessa testa, 200-1200 Ws tipici (es. Godox AD600ProII, 600 Ws, GN 87 a ISO 100 in metri con riflettore efficiente [P, scheda Godox letta 2026-11-08]). Generatore (pack) + teste (es. Broncolor, Profoto Pro): alimentatore separato, potenza alta (migliaia di Ws), stabilità di colore e tempi di ricarica migliori, durata di flash controllabile.
- **Si vede:** il flash piccolo dà luce dura e a bassa potenza; lo studio permette modificatori grandi a diaframmi chiusi.
- **Quando:** slitta per reportage, eventi, estetica diretta; monotesta per la maggior parte dello studio; generatore per cataloghi ad alto volume, auto, grandi set, mosso congelato.
- **Higgsfield:** non serve nominare l'attrezzatura; il risultato: «studio strobe lighting, clean consistent color, crisp detail». Modello: ipotesi non testata.
- **Errore comune:** equiparare i Ws fra marche diversi: i Ws sono energia in ingresso, non luce in uscita; per confrontare servono il numero guida o le misure con l'esposimetro.

#### Numero guida e legge dell'inverso del quadrato
- **Cos'è:** il numero guida (GN) = distanza × diaframma, a ISO 100 e con un'impostazione di riflettore. Es. GN 87 (metri, ISO 100) significa f/8 a circa 10,9 m (87 / 8). Con la legge dell'inverso del quadrato la luce cala di 2 stop ogni raddoppio di distanza. Il GN cresce con la radice dell'ISO (Wikipedia «Guide number», letta 2026-11-08 [S]).
- **Si vede:** il lato vicino della scena è molto più luminoso del lontano: i gruppi si illuminano da lontano e con modificatori grandi.
- **Quando:** per calcolare se il flash «arriva».
- **Higgsfield:** «light falling off quickly across the frame, foreground bright, background dropping into darkness» come traduzione del decadimento (ipotesi non testata).
- **Errore comune:** confrontare i GN senza guardare ISO, unità (metri o piedi) e posizione dello zoom.

#### Durata del flash: t0.5 e t0.1
- **Cos'è:** la durata di un lampo si misura come t0.5 (tempo in cui la luce resta sopra il 50% del picco) o t0.1 (sopra il 10% del picco). Valori letti: Profoto A2 (pagina modificata 30 giugno 2025): t0.1 da 1/350 s (100 Ws) a 1/26.000 s (0,1 Ws); t0.5 da 1/1200 s (100 Ws) a 1/56.000 s (0,1 Ws) [P]. Sekonic: un t0.5 di 1/2000 s o più veloce «will be more than adequate for most photographers» [P]. Dai dati A2 la durata si accorcia al calare della potenza: la potenza bassa è la via per i lampi brevi.
- **Si vede:** un lampo breve congela un getto d'acqua, polvere, capelli; un lampo lungo lascia mosso nel soggetto.
- **Quando:** beauty con capelli al vento, bevande che schizzano, ballerini; la modalità «Freeze» nei Profoto serve a questo.
- **Higgsfield:** «frozen mid-air splash, every droplet sharp, strobe-frozen motion, no motion blur». Modello: ipotesi non testata; i generatori tendono a congelare tutto, quindi la difficoltà è semmai ottenere un mosso controllato.
- **Errore comune:** credere che un tempo di otturatore di 1/200 congeli: l'otturatore decide l'ambiente, il lampo decide il soggetto illuminato da flash.

#### Sincronizzazione, HSS
- **Cos'è:** tempo di sincronizzazione normale: circa 1/200 s sulla maggior parte delle digitali (Profoto, articolo del 19 maggio 2020, letto 2026-11-08 [P, produttore]); oltre, l'otturatore a tendina non scopre tutto il sensore. HSS (high-speed sync): il flash emette una serie di impulsi che copre la scansione dell'otturatore; permette tempi più brevi (1/1000-1/8000) con diaframmi aperti in pieno sole. Costo: Profoto — «In general HSS will remove 2-3 stops of light compared to normal flash, dependent on the HSS duration used.» (pagina modificata 16 agosto 2023) [P]. Profoto sconsiglia di usare l'HSS per congelare il movimento: «Avoid using HSS to try to freeze motion. Use Freeze mode for best results» (articolo 2020) [P]; una pagina Profoto di supporto (modificata 26 gennaio, anno non indicato nella pagina) precisa che con l'HSS attivo la modalità Freeze viene scavalcata [P].
- **Si vede:** fondo scuro, sole domato, sfondo sfocato con luce di riempimento in esterni.
- **Quando:** ritratto e moda in esterni a diaframma aperto con sole forte.
- **Higgsfield:** «shot at f/1.8 in strong sun, fill flash lifting the face, sky deeper blue, shallow depth of field». Modello: ipotesi non testata.
- **Errore comune:** HSS con potenza al massimo: si perdono 2-3 stop, la luce non arriva.

#### Tendina posteriore e «drag the shutter»
- **Cos'è:** sincronia sulla seconda tendina: il lampo parte alla fine dell'esposizione, quindi la scia luminosa del movimento precede il soggetto congelato. «Drag the shutter»: tempo lungo (1/15-1 s) con flash: il flash illumina e congela il soggetto, l'ambiente si registra con mosso e luci ambientali.
- **Si vede:** soggetto nitido con scie colorate dietro; ambiente caldo e vivo; effetto «notte in città».
- **Quando:** moda street, eventi, copertine musicali, notte.
- **Higgsfield:** «sharp flash-lit subject with streaking city lights and motion blur trailing behind, long exposure ambient glow». Verificato (skill): la skill descrive lo strobo come evento e un registro notte; l'effetto specifico dei tempi lunghi: ipotesi non testata. Modello: Soul 2.0 funziona con preset più che con testo (verificato, skill); per questo effetto servono modelli guidati da prompt.
- **Errore comune:** scie davanti al soggetto invece che dietro (prima tendina).

#### Flash diretto sulla camera come estetica
- **Cos'è:** flash a slitta orientato dritto sul soggetto: luce frontale, piatta, dura, ombre nette dietro il soggetto sul muro, riflesso rosso negli occhi e sovraesposizione del primo piano rispetto al fondo scuro.
- **Si vede:** look «paparazzo», notte, party, editoriali diretti, fotografia compatta anni '90-2000. Verificato (skill): la preset «Flash editorial» in higgsfield-moodboard è definita «On-camera flash, oversaturated, candid».
- **Quando:** campagne giovani, street, moda con attitudine (non per lusso discreto).
- **Higgsfield:** «direct on-camera flash, harsh frontal light, flat skin with a slight sheen, hard-edged shadow on the wall behind, dark background falling off, candid framing». Modello: ipotesi non testata; i generatori tendono a ripulire la pelle e a ammorbidire l'ombra: ripetere «hard-edged shadow».
- **Errore comune:** pulire l'immagine: il fascino è nell'imperfezione.

#### Flash ad anello
- **Cos'è:** sorgente circolare intorno all'obiettivo: luce quasi coassiale, ombre attorno al soggetto sottili e uniformi, un riflesso ad anello negli occhi.
- **Si vede:** pelle piatta, riempita, effetto «alone» sul fondo vicino, riflesso circolare negli occhi e sulle superfici lucide.
- **Quando:** beauty e moda anni '70-'90 e il loro ritorno; dentale/medicale; macro.
- **Higgsfield:** «ring flash, circular catchlight in the eyes, shadowless frontal light, thin halo shadow around the subject on the wall». Modello: ipotesi non testata.
- **Errore comune:** confonderlo con un anello luminoso continuo da influencer (catchlight simile ma luce più morbida e meno piatta).

#### Flash e luce ambiente insieme
- **Cos'è:** l'esposizione ha due componenti indipendenti: il diaframma e l'ISO regolano il flash e l'ambiente; il tempo regola solo l'ambiente (entro il tempo di sincronia). Quindi: si fissa il tempo per decidere quanto fondo, il diaframma per la quantità di flash.
- **Si vede:** cielo scurito (sottoesposto di 1-2 stop) con volto illuminato dal flash: effetto «cielo drammatico»; oppure ambiente caldo e flash pulito.
- **Quando:** ritratti ambientati in esterni, moda su location.
- **Higgsfield:** «subject lit by strobe, sky exposed two stops under for a deep saturated backdrop, ambient glow preserved». Modello: ipotesi non testata.
- **Errore comune:** regolare il tempo pensando di cambiare la luce del flash.

#### Gel di bilanciamento
- **Cos'è:** filtri colorati davanti al flash. CTO (arancione) porta il flash (circa 5500-5800 K) verso il tungsteno (3200 K) per mescolarsi con lampade; CTB fa il contrario; verde (plus green) per fluorescenti. Si applicano al flash e si imposta il bilanciamento del bianco sull'ambiente.
- **Si vede:** flash invisibile e coerente con l'ambiente.
- **Quando:** interni con luci tungsteno, hotel, ristoranti.
- **Higgsfield:** «strobe warmed to match the warm practical lamps, single unified color temperature». Modello: ipotesi non testata.
- **Errore comune:** mezza correzione: pelle arancione e sfondo blu senza che siano scelti.

**Fonti:** Profoto Support, «Why is the relative power output lower when shooting in HSS mode?» (support.profoto.com, modificata 16 ago 2023: «2-3 stops»), letta raw 2026-11-08 [P]; Profoto Support, «Does HSS impact the different modes (ECO, BOOST, FREEZE)?» (Freeze scavalcato dall'HSS), letta 2026-11-08 [P]; Profoto, «What is High-Speed Sync and when should you use it?» (profoto.com, 19 maggio 2020: 1/200 s normale, consiglio Freeze), letto raw 2026-11-08 [P]; Profoto A2, pagina specifiche con t0.1/t0.5 (modificata 30 giu 2025), letta raw 2026-11-08 [P]; Sekonic, «Understanding Flash Duration» (sekonic.com/classroom/understanding-flash-duration/), letta raw 2026-11-08 [P]; Godox AD600ProII (godox.com/product-b/Flash/AD600ProII.html: 600 Ws, GN 87 ISO 100 in metri con riflettore efficiente, tubo flash 5800±200 K, t0.1 da 1/220 a 1/20400 s), letta raw 2026-11-08 [P, scheda del produttore: i valori sono dichiarati, non misurati]. Wikipedia «Guide number» (GN ∝ √ISO) letta 2026-11-08 [S]. Definizione del numero guida, tendine, gel: conoscenza consolidata, non riletta su fonte primaria. Il rapporto t0.1 ≈ 3 × t0.5 sentito in commenti [S] non è stato riportato come regola. Il 5000-5500 K del flash in generale (Cambridge in Colour) è [S]. Correzione del 2026-11-08: «circa 5600 K» sostituito da un intervallo, perché la cifra puntuale non era sostenuta da una fonte. Definizione del numero guida, tendine, gel: conoscenza consolidata, non riletta su fonte primaria. Il rapporto t0.1 ≈ 3 × t0.5 sentito in commenti [S] non è stato riportato come regola.

---

## 4. Luce continua

Luce sempre accesa: si vede l'effetto prima dello scatto, a costo di potenza e di calore. Tre famiglie: LED, HMI, tungsteno.

#### LED
- **Cos'è:** pannelli o teste LED con bilanciamento regolabile (bicolore, 2700-6500 K tipico) o RGB. Il «2700-6500 K tipico» è un ordine di grandezza di mestiere, non da una fonte letta (un tubo LED Godox TL60 con gamma di temperatura regolabile è emerso solo da snippet di rivenditori: da verificare). Correzione del 2026-11-08: la versione precedente attribuiva «5800 ± 200 K» ai tubi LED Godox; quel valore sulla pagina Godox letta è la temperatura di colore del tubo flash dell'AD600ProII (flash, sezione 3), non di un tubo LED. Poco calore, basso consumo, potenza limitata rispetto al flash (a parità di prezzo).
- **Si vede:** ombre e riflessi visibili in tempo reale; consente di lavorare con ISO alto/diaframmi aperti; la qualità del colore (CRI/TLCI) varia molto fra lampade economiche e cinema.
- **Quando:** video e foto ibridi, still life con mosso controllato, ritratti dove il soggetto non sopporta il flash, tubi come luce di bordo o d'effetto.
- **Higgsfield:** «continuous LED panel light, soft even illumination, slightly cool white, visible tube light in frame» (ipotesi non testata).
- **Errore comune:** LED economico con colore sbilanciato (tinta verde/magenta) su pelle e prodotto: misurare con colorimetro o usare un riferimento grigio.

#### HMI
- **Cos'è:** lampada a scarica a ioduri metallici, circa 5600 K (ARRI [P]), ad alta efficienza (grande luce per watt), con alimentatore; usata sui set cinematografici e per grandi set fotografici in esterni/studi.
- **Si vede:** simula il sole attraverso una finestra, con colore coerente con il giorno.
- **Quando:** film, auto, grandi ambienti; foto su set con luce di finestra «da sole» potente.
- **Higgsfield:** «hard directional sun-like light streaming through a window, 5600 K, dust in the beam» (ipotesi non testata).
- **Errore comune:** non usare un'alimentazione senza sfarfallio (flicker-free) con tempi brevi o slow-motion.

#### Tungsteno (alogena)
- **Cos'è:** lampada a incandescenza, circa 3200 K, spettro continuo, molto caldo da toccare, potenza limitata. Bilanciata per pellicola tungsteno.
- **Si vede:** pelle calda, contrasto dolce, riflessi arancioni nei cromati; effetto «interno anni '70».
- **Quando:** still life con atmosfera calda, cinema, interno retrò.
- **Higgsfield:** «warm tungsten lamp light around 3200 K, orange cast on highlights, soft falloff» (ipotesi non testata).
- **Errore comune:** mescolarla senza intenzione con luce di finestra.

#### Quando preferire continua rispetto al flash
- **Cos'è:** scelta fra visibilità e potenza.
- **Si vede:** continua = si vede il risultato, nessun lampo sul modello (comfort per bambini, animali, occhi), adatta al video; flash = potenza, congela, colore costante.
- **Quando:** continua per set ibridi foto/video, riprese di cibo, lavoro rapido con più prove; flash per ritratti con diaframma chiuso, movimento, esterni in pieno sole.
- **Higgsfield:** n/a (il modello non distingue l'attrezzatura, ma solo l'effetto).
- **Errore comune:** scegliere la continua e poi alzare l'ISO fino a perdere qualità.

**Fonti:** ARRI Lighting Handbook, quarta edizione (2016, testo di B. Holshevnikoff, PDF del produttore letto 2026-11-08): le lampade tungsteno del kit ARRI sono a 3200 K; le HMI ARRI producono uno spettro diurno di circa 5600 K [P, produttore, per i propri apparecchi]. Cambridge in Colour, «White Balance» (lampadina domestica a tungsteno 2500-3500 K: valore diverso dal 3200 K delle lampade da set) letta con Chrome 2026-11-08 [S]. Il testo della sezione dice «circa 3200 K» per il tungsteno da set e va letto così. Gamma 2700-6500 K dei LED bicolore, CRI/TLCI, flicker-free: conoscenza consolidata, non riletta. Godox TL60 (tubo LED): non verificato, metodi provati: ricerca web (solo snippet di rivenditori), nessuna pagina Godox del tubo LED aperta.

## 5. Modificatori

Un modificatore cambia dimensione apparente, forma e direzione della sorgente. Regola base: la morbidezza dipende dalla dimensione della sorgente rispetto al soggetto, non dal materiale. Una sorgente grande e vicina è morbida; la stessa lontana, relativamente piccola, è dura. Avvicinare il modificatore ammorbidisce e aumenta la caduta di luce sullo sfondo; allontanarlo indurisce e uniforma.

#### Softbox e octabox
- **Cos'è:** scatola con interno riflettente e frontale diffusore. Rettangolare = riflesso rettangolare negli occhi e sulle superfici; octabox (ottagonale) = riflesso tondo, più naturale negli occhi. Dimensioni tipiche da 60 cm a oltre 2 m; con griglia a nido d'ape si restringe la dispersione.
- **Si vede:** luce morbida, passaggio graduale, ombre aperte; riflesso quadrato nelle superfici lucide.
- **Quando:** ritratto, moda, prodotto; l'octa per ritratti e beauty, il rettangolare per ritratti a figura intera e per prodotti.
- **Higgsfield:** «large octagonal softbox close to the subject, soft wrap-around light, round catchlights in the eyes» / «rectangular softbox, soft highlight with a clean rectangular reflection on the glossy surface». Modello: ipotesi non testata; i modelli rispettano di solito la forma del catchlight solo se la si dichiara.
- **Errore comune:** softbox grande ma lontano: diventa dura senza che nessuno se ne accorga.

#### Striplight
- **Cos'è:** softbox stretto e alto (es. 30 × 120 cm). Usato in coppia ai lati o da solo.
- **Si vede:** linea di luce lunga e sottile sul lato del corpo o del prodotto; bordi definiti; riflesso lineare su vetro, metallo, carrozzeria.
- **Quando:** rim light su ritratto, silhouette del corpo, bottiglie, auto, elettronica.
- **Higgsfield:** «two tall narrow strip lights behind-left and behind-right, thin bright rim lines along the contour, dark center» (ipotesi non testata).
- **Errore comune:** posizionarli troppo davanti: perdono l'effetto contorno e danno luce piatta.

#### Beauty dish
- **Cos'è:** piatto parabolico (circa 40-70 cm) con deflettore centrale, interno bianco o argento; la luce è fra dura e morbida, con punto luce definito e caduta rapida.
- **Si vede:** pelle con texture e plasticità, zigomi e ossa marcati, ombra morbida ma leggibile, riflesso ad anello negli occhi (con deflettore).
- **Quando:** beauty, moda, ritratto con carattere.
- **Higgsfield:** «beauty dish high and frontal, crisp but soft-edged light, defined cheekbones, ring catchlight, skin texture visible» (ipotesi non testata).
- **Errore comune:** retino/filtro bianco sopra che lo trasforma in softbox senza che lo si voglia.

#### Ombrelli: riflettente, in trasparenza, parabolico
- **Cos'è:** ombrello bianco in riflessione (luce rimbalzata, morbida, dispersa), in trasparenza (shoot-through: luce che attraversa il tessuto, più diffusa e meno controllabile), argento (più contrasto, più resa). Gli ombrelli parabolici profondi sono zoomabili e danno luce ampia con controllo del fascio.
- **Si vede:** luce più economica e leggera, dispersione in tutta la stanza; ombre morbide ma con meno direzione di un softbox.
- **Quando:** location veloci, gruppi, ritratti ambientati.
- **Higgsfield:** «large white umbrella fill, broad soft light spilling around the room» (ipotesi non testata).
- **Errore comune:** non vedere la dispersione sul fondo: lo sfondo si illumina e il soggetto perde separazione.

#### Parabolici profondi (Para, Briese)
- **Cos'è:** riflettori parabolici di grandi dimensioni (in alcuni casi oltre 1,5 m) con la testa al fuoco, la luce esce parallela; si può mettere a fuoco (più concentrata o più diffusa). Broncolor Para 177 (scheda del kit senza adattatore): massimo 3200 J, diaframma f/128 a 2 m e f/45 a 10 m (valori dichiarati dal produttore, con il riflettore a fuoco), dimensioni aperto Ø 170 × 95 cm di profondità, 9,4 kg per il kit (riflettore, 4 cavi di sospensione, cavo di sicurezza, testa inclinabile, sistema di messa a fuoco) [P]; Para 133 (kit): Ø 120 × 77 cm aperto, 2,9 kg con riflettore, 4 cavi e Flash Bag 2, f/90 a 2 m e f/22 a 10 m [P]. Correzione del 2026-11-08: i pesi sono del kit, non del solo riflettore; il «170 × 95» è diametro per profondità.
- **Si vede:** luce molto morbida in apparenza ma con un carattere direzionale e contrasto elevato, penombre luminose, ombre nette e riflessi quasi senza dispersione; riconosciuto in ambito moda per l'ombra tagliente con luminosità ampia (associazione storica: conoscenza consolidata, non verificata su fonte).
- **Quando:** moda ad alto livello, ritratti di bellezza, campagne; richiede spazio e budget.
- **Higgsfield:** «huge parabolic reflector light from the front, luminous glow with crisp directional shadows, soft but contrasty, rich shadow edge on the wall» (ipotesi non testata).
- **Errore comune:** trattarlo come un softbox: ha un controllo del fascio e una resa diversa.

#### Fresnel
- **Cos'è:** testa con lente Fresnel (anelli concentrici) che permette di regolare il fascio da stretto a largo; luce dura e direzionale con bordo netto.
- **Si vede:** ombre nette, cerchio di luce, effetto «sole» o faro.
- **Quando:** sole simulato, spot sul prodotto, luce teatrale.
- **Higgsfield:** «hard spotlight with a crisp circular edge, clean sharp shadows, theatrical beam» (ipotesi non testata).
- **Errore comune:** usarlo senza un diffusore quando serve ammorbidire.

#### Snoot e nidi d'ape (grid)
- **Cos'è:** lo snoot è un tubo che restringe il fascio a un cerchio piccolo. La griglia a nido d'ape limita l'angolo di dispersione senza cambiare la morbidezza della sorgente: ad esempio la Elinchrom Rotagrid Octa 100 cm ha un angolo di fascio di 30° [P, pagina del produttore, letta 2026-11-08]. Griglie più strette (10°, 20°) concentrano ancora di più.
- **Si vede:** luce che cade su un'area precisa, sfondo scuro, contrasto di scena; si mantiene la morbidezza ma si evita che la luce disperda sul fondo.
- **Quando:** low key, rim, gioielli, accenti su un dettaglio.
- **Higgsfield:** «gridded light, tight pool of light on the face, dark surroundings, no spill on the background» (ipotesi non testata).
- **Errore comune:** credere che la griglia indurisca la luce: restringe la direzione, non la qualità.

#### Barndoors, bandiere e gobo
- **Cos'è:** i barndoors sono alette sul bordo della testa; bandiere (flag) pannelli neri che bloccano la luce; il gobo è un pannello sagomato (anche rami, tende, veneziane) che proietta ombre a forma.
- **Si vede:** bordi della luce definiti, luce mascherata dagli oggetti, ombre di persiane o foglie sul volto.
- **Quando:** ritratti con «luce da finestra» costruita, atmosfere, nero profondo su prodotto.
- **Higgsfield:** «venetian blind shadow stripes across the face and wall, hard directional light» (verificato (skill) solo come tipo di luce da descrivere per sorgente e geometria dell'ombra; la resa precisa: ipotesi non testata).
- **Errore comune:** striature irregolari e finte; meglio un'ombra comprensibile (finestra con veneziana) che un pattern casuale.

#### Diffusori, pannelli e V-flat
- **Cos'è:** il diffusore (telo traslucido) allarga la sorgente. Il pannello riflettore (bianco, argento, oro, nero) restituisce luce nelle ombre. Il V-flat sono due pannelli di polistirolo incernierati (bianco da un lato e nero dall'altro), alti circa 2,4 m, con rimbalzo morbido molto ampio o assorbimento.
- **Si vede:** riempimento delicato, rapporto di luce più basso, o negativa che scurisce un lato.
- **Quando:** quasi sempre, in tutti i set; il V-flat è nello studio di moda e di still life il modo più economico per una grande sorgente morbida.
- **Higgsfield:** «large white bounce wall to camera-right, soft fill, shadow side lifted to a mid-tone» / «black flag to the left, deep shadow side, strong edge definition» (ipotesi non testata).
- **Errore comune:** riempire troppo: il volto perde volume (vedi rapporti di luce nella sezione 6).

#### Dimensione relativa e distanza della sorgente
- **Cos'è:** la morbidezza dipende dall'angolo che la sorgente copre visto dal soggetto. Un softbox da 1 m a 1 m dal volto è molto più morbido dello stesso a 4 m; il sole (angolo di circa 0,5°) è duro anche se gigantesco. Avvicinare la sorgente ammorbidisce ma aumenta anche la caduta di luce (inverso del quadrato): il lato vicino del soggetto diventa molto più luminoso del lato lontano.
- **Si vede:** il passaggio fra luce e ombra; sorgente grande e vicina = transizione lunga; piccola e lontana = netta.
- **Quando:** per decidere fra «morbido» e «scolpito».
- **Higgsfield:** descrivere dimensione e distanza: «very large soft source very close to the subject» vs «small distant source». Verificato (skill): vocab.md di higgsfield insiste su sorgente, posizione e geometria dell'ombra; l'efficacia della distinzione dimensione/distanza: ipotesi non testata.
- **Errore comune:** parlare di «luce morbida» senza dire quanto grande e quanto vicina.

**Fonti:** Broncolor, pagine prodotto «Para 177 Kit without adapter» e «Para 133 Kit without adapter» (broncolor.swiss/products/...; f/128 a 2 m e f/45 a 10 m; Ø 170 × 95 cm, 9,4 kg, 3200 J; Ø 120 × 77 cm, 2,9 kg), lette raw 2026-11-08 [P]; Elinchrom, pagina Rotagrid Octa 100 cm (30°), letta raw 2026-11-08 [P]. Le descrizioni qualitative dei modificatori (softbox, octabox, beauty dish, ombrelli) restano non rilette su pagina del produttore: conoscenza consolidata, non verificata; V-flat, fresnel, snoot, flag, gobo: conoscenza consolidata. Dimensioni tipiche (60 cm-2 m, 2,4 m): ordini di grandezza di mestiere, non da una fonte letta.

---

## 6. Schemi di ritratto e moda

Uno schema è una posizione della sorgente rispetto al volto e alla camera. Gli schemi sotto sono nomi di mestiere; angoli e rapporti sono indicativi. I rapporti di luce si leggono in stop, ma esistono due convenzioni (Wikipedia «Lighting ratio», letta 2026-11-08 [S]): nel metodo «source» (chiave e riempimento misurati separatamente) 2:1 = 1 stop, 4:1 = 2 stop, 8:1 = 3 stop; nel metodo additivo (quello definito dall'ASC: (chiave+riempimento):riempimento) una chiave di 1 stop sopra il riempimento dà 3:1, non 2:1. Prima di usare un numero di rapporto bisogna sapere quale convenzione lo ha prodotto. Le soglie «morbido/drammatico» sono convenzioni da manuale. Correzione del 2026-11-08: la versione precedente elencava «3:1 circa 1,6 stop» senza dichiarare la convenzione.

| Schema | Posizione sorgente | Ombra caratteristica | Uso |
|---|---|---|---|
| Rembrandt | circa 45-60° di lato e alta | triangolo di luce sulla guancia in ombra | ritratto drammatico ma naturale |
| Loop | circa 30-45° di lato, poco sopra gli occhi | piccola ombra del naso che scende verso la guancia | ritratto generale |
| Butterfly / Paramount | frontale e alta, sopra la camera | ombra a farfalla sotto il naso, sotto il mento | beauty, glamour |
| Split | 90° di lato | metà volto in luce, metà in ombra | dramma, carattere |
| Clamshell | una sorgente sopra e una riflettente sotto, frontali | ombre minime, occhi luminosi | beauty, cosmetica |
| Broad / Short | sul lato rivolto alla camera (broad) o sul lato opposto (short) | broad allarga il volto; short lo snellisce | correzione di forma |
| Rim / hair light | dietro e di lato, sopra | contorno luminoso su capelli e spalle | separazione dal fondo |
| Luce frontale piatta | dietro la camera, alta | pochissima ombra | moda diretta, editoriale |
| Dal basso | sotto il volto | ombre innaturali verso l'alto | horror, effetto speciale |

#### Rembrandt
- **Cos'è:** sorgente a circa 55-60° rispetto all'asse della camera e alta (ombrello a circa 6 piedi di altezza per un soggetto seduto, puntato in basso di 45°); sulla guancia in ombra, la più lontana dalla sorgente, si forma un piccolo triangolo di luce (B&H Explora, ritratto con un ombrello, letto con lettore r.jina.ai 2026-11-08 [S]; Elinchrom Portrait Lighting Guide concorda sul triangolo sulla guancia [P, guida del produttore]). B&H lo definisce una versione «più estrema» del setup 45/45 e dà per il 45/45 un lato luminoso «probabilmente due o tre volte» più luminoso dell'ombra; per il Rembrandt non dà un rapporto. Correzione del 2026-11-08: la cifra «da 2:1 a 4:1» attribuita a B&H non compare nella pagina ed è tolta; nessun rapporto verificato per il Rembrandt.
- **Si vede:** volume, atmosfera pittorica, pelle con modellato.
- **Quando:** ritratti di carattere, editoriali, maschile.
- **Higgsfield:** «key light high at about 45 degrees to one side, small triangle of light on the shadow-side cheek, soft shadow under the nose, dark background». Verificato (skill): i modelli rispondono a posizione e geometria dell'ombra descritte; il triangolo specifico: ipotesi non testata.
- **Errore comune:** triangolo troppo grande o chiuso perché la sorgente è troppo bassa o troppo laterale.

#### Loop
- **Cos'è:** sorgente a 30-45° di lato e leggermente sopra l'altezza degli occhi; l'ombra del naso forma un piccolo cappio verso la guancia senza toccare l'ombra della guancia.
- **Si vede:** volto gradevole, naturale, buon modellato.
- **Quando:** ritratto aziendale, uso generale.
- **Higgsfield:** «soft key light slightly above eye level 35 degrees to the side, small nose shadow loop on the cheek» (ipotesi non testata).
- **Errore comune:** se l'ombra tocca quella della guancia diventa Rembrandt; se sparisce, piatta.

#### Butterfly / Paramount
- **Cos'è:** sorgente frontale, alta e centrata sopra la camera; ombra a farfalla sotto il naso; spesso con riflettore sotto il mento.
- **Si vede:** zigomi e occhi in evidenza, mento in ombra morbida; look «golden age».
- **Quando:** beauty, glamour, cosmetica. Verificato (skill): la riga butterfly è nella skill higgsfield-style.
- **Higgsfield:** «beauty dish directly above the camera axis, symmetrical light, butterfly shadow under the nose, white reflector below the chin». Modello: ipotesi non testata.
- **Errore comune:** su volti con naso pronunciato o occhi infossati appiattisce o scava.

#### Split
- **Cos'è:** sorgente a 90° laterale: metà volto in luce, metà in ombra.
- **Si vede:** dramma, tensione, maschera.
- **Quando:** copertine musicali, profumi maschili, ritratti d'autore.
- **Higgsfield:** «hard side light at 90 degrees, face split exactly in half between light and shadow, deep black shadow side». Modello: ipotesi non testata.
- **Errore comune:** non lasciare dettaglio nell'ombra se il cliente lo vuole.

#### Clamshell
- **Cos'è:** due fonti sul piano verticale: una sopra il volto (softbox o beauty dish) e una riflettente o secondaria sotto, che riempie.
- **Si vede:** ombre quasi annullate, occhi luminosi, pelle liscia, doppio catchlight.
- **Quando:** beauty e cosmetica high-key.
- **Higgsfield:** «clamshell lighting, large soft source above and a white reflector below, even luminous skin, two catchlights stacked in the eyes» (ipotesi non testata).
- **Errore comune:** riempimento troppo forte: pelle senza volume.

#### Luce larga (broad) e corta (short)
- **Cos'è:** con volto ruotato rispetto alla camera, la luce broad illumina il lato rivolto alla camera; la short illumina il lato lontano.
- **Si vede:** broad = volto più largo e aperto; short = più snello, più drammatico.
- **Quando:** short per volti pieni, broad per volti magri.
- **Higgsfield:** «short lighting, the far side of the face lit, near side in shadow» (ipotesi non testata).
- **Errore comune:** confondere i due termini, che si riferiscono al lato rivolto verso la camera.

#### Rim light / hair light
- **Cos'è:** una o due sorgenti dietro e di lato (strip o griglie) che disegnano il contorno.
- **Si vede:** linea luminosa su capelli, spalle, guance; separazione dal fondo scuro.
- **Quando:** low key, moda, musica. Verificato (skill): rim è nella skill higgsfield-style.
- **Higgsfield:** «thin bright rim light on the hair and shoulder edge, dark background, face lit softly from the front» (ipotesi non testata).
- **Errore comune:** rim troppo forte che brucia i capelli.

#### Luce frontale piatta di moda
- **Cos'è:** sorgente grande e frontale, vicino alla camera, spesso con riflettore sotto; pochissime ombre.
- **Si vede:** pelle e abito leggibili, aspetto grafico, colore puro, quasi da catalogo/editoriale diretto.
- **Quando:** moda commerciale, e-commerce, editoriale minimale.
- **Higgsfield:** «flat frontal fashion lighting, large soft source behind the camera, minimal shadows, clean pure colors, garment details fully readable». Modello: ipotesi non testata; è la luce che i generatori producono per default, quindi serve scegliere una variante con attrito (vedi atlante, controllo della palette di default).
- **Errore comune:** confondere piatto con amatoriale: la piattezza voluta ha fondo e posa curati.

#### Sole simulato duro
- **Cos'è:** una sorgente piccola e potente (fresnel, testa nuda con riflettore) a distanza, per simulare il sole in studio con ombre nette.
- **Si vede:** ombra netta sul fondo, aspetto «estate in studio».
- **Quando:** moda estiva, costumi, accessori.
- **Higgsfield:** «single hard light from a high corner like direct sun, crisp shadow of the subject on a painted wall» (ipotesi non testata).
- **Errore comune:** riempire e perdere l'effetto.

#### High key su bianco infinito
- **Cos'è:** fondo bianco illuminato a parte (circa 1-2 stop sopra il soggetto per avere bianco puro), soggetto illuminato in modo morbido.
- **Si vede:** immagine pulita, soggetto «sospeso», nessun ambiente.
- **Quando:** e-commerce, beauty, farmaceutica, tech.
- **Higgsfield:** «pure white seamless background, soft even light, subject separated cleanly, no floor shadow or only a soft contact shadow». Modello: ipotesi non testata.
- **Errore comune:** fondo non abbastanza illuminato: grigio sporco; o troppo luminoso: alone sul soggetto (flare).

#### Low key
- **Cos'è:** fondo nero, una o due sorgenti piccole o con griglia, rapporto di luce elevato (8:1 e oltre).
- **Si vede:** dramma, volume, mistero.
- **Quando:** profumi, orologi, alcolici, ritratto d'autore.
- **Higgsfield:** «single gridded light from one side, black background, deep shadows, rich skin tones, most of the frame in shadow» (ipotesi non testata).
- **Errore comune:** illuminare il fondo per sbaglio; il nero vero richiede distanza dallo sfondo e flag.

#### Luce incrociata (cross light)
- **Cos'è:** due sorgenti ai lati opposti che sfiorano il soggetto da dietro/di lato, senza luce frontale.
- **Si vede:** contorni su entrambi i lati, volumi scolpiti, centro più scuro.
- **Quando:** sportivo, tessuti, corpi, prodotto con contorni.
- **Higgsfield:** «two opposite strip lights from behind-left and behind-right, sculpted contours, dark center of the form» (ipotesi non testata).
- **Errore comune:** centro del volto troppo scuro per un uso commerciale.

**Fonti:** B&H Explora, articolo sugli schemi di ritratto con un ombrello (Rembrandt 55-60° fuori asse, ombrello a circa 6 piedi puntato in basso di 45°; split a 90°; 45/45 con lato luminoso «two to three times brighter»; nessuna cifra 2:1-4:1), letto per intero con r.jina.ai 2026-11-08 [S, rivenditore con firma editoriale]; Elinchrom, «Portrait Lighting Guide» (elinchrom.com/en/Home/Discover/Educational/Lighting_Guide: Rembrandt con triangolo sulla guancia, loop con ombra del naso verso l'angolo della bocca, butterfly con luce sopra e in asse, split con linea d'ombra al centro, clamshell con due sorgenti sopra e sotto al centro, broad con il lato verso la camera illuminato), letta raw 2026-11-08 [P, guida del produttore]; Wikipedia «Lighting ratio» (due convenzioni, source e additiva/ASC), letta 2026-11-08 [S]. Il «rapporto 8:1 e oltre» del low key e il «1-2 stop sopra» del fondo bianco restano convenzioni di mestiere non verificate. Light: Science and Magic non letto [S]. Righe butterfly e rim della skill higgsfield-style lette 2026-11-08 [P interna]. Gli angoli in tabella sono indicativi.

## 7. Luce per still life e prodotto

Nel prodotto la luce decide la materia: una superficie si vede per ciò che riflette. Per un oggetto lucido si illumina l'ambiente che si riflette (grandi superfici, strisce, pannelli), non l'oggetto. Per una superficie opaca si decide l'angolo della luce rispetto alla texture.

#### Luce radente per la texture
- **Cos'è:** sorgente molto bassa, quasi parallela alla superficie, spesso dura o ristretta da bandiere.
- **Si vede:** ogni rilievo proietta una piccola ombra: grana di tessuto, pelle conciata, carta, pane, intonaco.
- **Quando:** tessili, pelletteria, carta, ceramica ruvida, cibo con crosta.
- **Higgsfield:** «raking light grazing the surface from a very low angle, every fiber and pore casting a tiny shadow, strong texture relief». Modello: ipotesi non testata; verificato (skill) che i generatori tendono alla texture «di plastica» se non si forza il rilievo (Nano Banana Pro): contrasto con «film grain, crush blacks, shadow depth».
- **Errore comune:** luce frontale piatta che cancella la materia.

#### Luce di bordo per vetro e liquidi: campo chiaro e campo scuro
- **Cos'è:** campo scuro (dark-field): fondo nero con strisce luminose ai lati: i contorni del vetro si vedono come linee luminose su nero. Campo chiaro (bright-field): fondo luminoso dietro l'oggetto, contorni scuri definiti da bandiere nere ai lati. Liquidi e trasparenze si illuminano da dietro o da sotto.
- **Si vede:** forma del vetro disegnata da linee pulite, liquido luminoso, assenza di riflessi dell'ambiente.
- **Quando:** bottiglie, bicchieri, profumi, cosmetici trasparenti.
- **Higgsfield:** dark-field «black background, two thin vertical strip reflections tracing the edges of the glass bottle, liquid glowing from behind»; bright-field «luminous white background, glass outlined by crisp dark edges». Modello: ipotesi non testata; la skill photo-illustration-direction indica che la generazione AI non è affidabile su testi nell'immagine e sulla fedeltà di un prodotto reale: per il prodotto vero partire dalla foto del prodotto (skill higgsfield-product-photoshoot) e non far descrivere l'etichetta al modello.
- **Errore comune:** punti luce piccoli e duri sul vetro: riflessi bruciati senza forma.

#### Luce graduata su superfici riflettenti
- **Cos'è:** una grande sorgente (softbox o pannello) con gradazione di luminosità (per esempio un telo con gradiente o una sorgente posta in modo che la superficie rifletta un passaggio da chiaro a scuro).
- **Si vede:** metallo e plastica lucida con un riflesso liscio e continuo, senza macchie; forma sottolineata.
- **Quando:** orologi, elettronica, auto, cosmetici metallici.
- **Higgsfield:** «smooth gradient reflection sweeping across the brushed metal, light to dark, no hotspots» (ipotesi non testata).
- **Errore comune:** sorgente con bordi netti che si riflettono come un rettangolo sporco.

#### Tenda di diffusione (light tent)
- **Cos'è:** cubo di tessuto bianco traslucido attorno al prodotto, illuminato dall'esterno su più lati.
- **Si vede:** luce avvolgente, riflessi morbidi e uniformi, nessun riflesso netto; look da catalogo.
- **Quando:** oggetti piccoli e lucidi, gioielli, e-commerce, volumi alti.
- **Higgsfield:** «fully enclosed soft light, even wrap-around illumination, soft white reflections» (ipotesi non testata).
- **Errore comune:** risultato piatto e senza carattere; una tenda risolve i riflessi ma toglie la forma.

#### Luce dall'alto per il cibo
- **Cos'è:** scatto dall'alto (flat lay) con sorgente laterale o dall'alto e pannello di riempimento opposto; oppure luce da finestra laterale o in controluce parziale, ombre morbide.
- **Si vede:** composizione grafica, texture leggibili, ombre che danno volume ai piatti.
- **Quando:** ricettari, packaging, social.
- **Higgsfield:** «top-down view, soft window light from the left, white card fill on the right, gentle shadows beneath each item, visible texture and steam». Modello: ipotesi non testata; verificato (skill): Nano Banana rende i luoghi troppo puliti, aggiungere imperfezioni (briciole, macchie).
- **Errore comune:** luce frontale che appiattisce: il cibo sembra di plastica.

#### Controluce per la trasparenza
- **Cos'è:** sorgente diffusa dietro il prodotto (liquido, tessuto sottile, foglia, petalo) per far brillare il materiale per trasparenza.
- **Si vede:** colore luminoso dal di dentro, venature, volume interno.
- **Quando:** bevande, tè, miele, tessuti leggeri, fiori.
- **Higgsfield:** «strong diffused backlight passing through the liquid, luminous color from within, glowing edges» (ipotesi non testata).
- **Errore comune:** luce posteriore troppo forte che brucia i contorni senza riempimento frontale.

#### Gestione dei riflessi su metallo e plastica lucida
- **Cos'è:** una superficie lucida riflette ciò che sta davanti: si controlla con pannelli neri (bandiere) per creare bordi scuri e con pannelli bianchi per riempire; si cambia angolo di camera o si elimina il riflesso con polarizzatore (polarizzatore sulla camera e sulla luce, tecnica di mestiere). Spesso si compongono più scatti (focus stacking, light painting, blend di riflessi).
- **Si vede:** forma pulita, bordi neri definiti, assenza di riflessi indesiderati (camera, fotografo).
- **Quando:** posate, orologi, pentole, elettronica.
- **Higgsfield:** «black card edges on the metal, controlled reflections, no reflection of the photographer or room» (ipotesi non testata).
- **Errore comune:** riflesso del fotografo o del set in superficie: si controlla con un telo nero davanti.

#### Bandiere per i neri profondi
- **Cos'è:** i pannelli neri accanto al prodotto assorbono luce ambiente e creano neri veri sulle superfici lucide e a bordo degli oggetti.
- **Si vede:** neri pieni, contorni netti, contrasto elevato.
- **Quando:** profumi, alcolici, orologi di lusso.
- **Higgsfield:** «deep black edges, absolute black reflections, high contrast outline» (ipotesi non testata).
- **Errore comune:** stanza chiara attorno al set che riempie il nero di grigio.

#### Fondali infiniti e graduati
- **Cos'è:** fondale in carta o curva (cyc) senza spigolo; fondale graduato: luce che cade sul fondo creando passaggio da chiaro a scuro (si ottiene allontanando il soggetto e variando la distanza e la luce sul fondo).
- **Si vede:** orizzonte assente, soggetto sospeso, sfumature morbide sul fondo.
- **Quando:** prodotto, moda, beauty.
- **Higgsfield:** «seamless paper sweep with a soft vertical gradient from light grey at the top to darker at the bottom, no horizon line». Modello: ipotesi non testata.
- **Errore comune:** gradiente a bande (banding) visibile in stampa: si evita con grana o file a 16 bit.

**Fonti:** conoscenza consolidata di mestiere (campo chiaro/scuro, luce radente, tenda, polarizzazione, flat lay). Nessuna fonte primaria è stata letta in questa sessione per questa sezione; affidabilità: media, non verificata. Riferimenti interni controllati 2026-11-08: la skill photo-illustration-direction (SKILL.md) dice che la generazione AI non è affidabile sulla fedeltà di un prodotto reale e sui testi nell'immagine, e di guardare a monitor e non sul display della macchina [P interna]; la skill higgsfield-product-photoshoot (SKILL.md, Type C) chiede di caricare una foto del prodotto («preferred — much higher fidelity») [P interna]. Comportamento dei modelli: righe della skill higgsfield (image-models.md, vocab.md) lette 2026-11-08 [P interna].

---

## 8. Colore della luce

La temperatura di colore descrive il colore di una luce bianca in kelvin: basso = caldo (arancione), alto = freddo (blu). La macchina la compensa con il bilanciamento del bianco; il fotografo la sceglie e la mescola per scelta.

#### Temperatura di colore e bilanciamento del bianco
- **Cos'è:** riferimenti: tungsteno da set 3200 K (ARRI [P]), lampadina domestica 2500-3500 K, flash elettronico 5000-5500 K, cielo sereno con sole alto 5000-6500 K, cielo moderatamente coperto 6500-8000 K, ombra o cielo molto coperto 9000-10000 K (Cambridge in Colour [S]); HMI circa 5600 K (ARRI [P]). Il bilanciamento del bianco imposta quale kelvin deve diventare neutro. Lo spettrofotometro Sekonic C-800-U misura la luce ambiente da 1.600 a 40.000 K e il flash da 2.500 a 40.000 K [P]. Correzione del 2026-11-08: la versione precedente scriveva «flash e luce diurna circa 5500-5600 K» e attribuiva 1.600-40.000 K al flash; le fonti dànno intervalli, e 2.500 K è il limite inferiore sul flash.
- **Si vede:** impostando 5600 K sotto una lampada a 3200 K, tutto vira all'arancione.
- **Quando:** sempre; per prodotto e moda si lavora con una carta grigia o un target colore.
- **Higgsfield:** «neutral white balance, accurate skin tones» o «warm 3200K tungsten cast» (ipotesi non testata). Verificato (skill): GPT Image vira al giallo; per un neutro vero correggere nel prompt («neutral, no yellow cast»).
- **Errore comune:** bilanciamento automatico che «corregge» un tramonto in una luce neutra.

#### Luce mista come scelta
- **Cos'è:** lampade calde (3200 K) nell'ambiente e flash o finestra freddi (5600 K) nella stessa inquadratura, senza gel di correzione.
- **Si vede:** pelle fredda e ambiente caldo, oppure l'inverso: separazione cromatica, atmosfera cinematografica.
- **Quando:** moda notturna, editoriali urbani, hotel.
- **Higgsfield:** «cool daylight-balanced key light on the face, warm tungsten practical lamps in the background, deliberate two-color contrast» (ipotesi non testata).
- **Errore comune:** miscele non intenzionali che sporcano la pelle.

#### Gel creativi
- **Cos'è:** filtri colorati (rosso, blu, magenta, verde, ambra) sul flash o sulla luce continua per colorare luce o fondo, anche per colorare solo il fondo.
- **Si vede:** colore saturo sul fondo o sul contorno; pelle neutra al centro.
- **Quando:** musica, moda sperimentale, cosmetica con colore, tech.
- **Higgsfield:** «magenta gelled strobe on the background, cyan rim light from behind, skin lit neutrally in the center» (ipotesi non testata).
- **Errore comune:** gel sulla luce principale che copre i colori del prodotto.

#### Contrasto caldo-freddo
- **Cos'è:** luce chiave calda con riempimento freddo (o viceversa), colori complementari arancio/blu.
- **Si vede:** volume cromatico, profondità, impatto da cinema.
- **Quando:** campagne con attitudine, fotografie di strada, auto.
- **Higgsfield:** «warm key light from the left, cool blue fill and shadows from the right, orange-teal separation» (ipotesi non testata; è anche il cliché dei generatori: usarlo con moderazione).
- **Errore comune:** orange-teal da preset: uniforma tutto.

#### Colori saturi da flash con gel
- **Cos'è:** flash gelato con colori forti (rosso, giallo, verde) usato come luce principale o sul fondo.
- **Si vede:** colore puro e uniforme, estetica pop e grafica.
- **Quando:** pop, street, musica, moda giovane.
- **Higgsfield:** «saturated red gelled strobe flooding the scene, hard shadows tinted in the complementary hue, bold graphic color» (ipotesi non testata).
- **Errore comune:** colore del gel che sovrappone il colore del prodotto, alterandolo: il colore mostrato del prodotto è un claim visivo (vedi ad-claims-disclosure).

**Fonti:** Sekonic C-800-U (sekonic.com/sekonic-c-800-u-spectrometer/: ambiente 1.600-40.000 K, flash 2.500-40.000 K), pagina letta raw 2026-11-08 [P]; ARRI Lighting Handbook, 4ª ed. 2016 (3200 K, 5600 K), letto 2026-11-08 [P, produttore, per i propri apparecchi]; Cambridge in Colour, «White Balance», aperta con Chrome 2026-11-08 [S, tabella «rule-of-thumb»]; 5600 K cade dentro l'intervallo diurno di CiC (5000-6500 K): nessun conflitto, ma la cifra unica «5500-5600 K» per flash e luce diurna era una convenzione, non un dato, e per il flash in generale CiC dà 5000-5500 K. GPT che vira al giallo e Nano Banana: skill higgsfield (image-models.md) letta 2026-11-08 [P interna].

---

## 9. Set e attrezzatura di studio

#### Fondo infinito (cyc) e carta
- **Cos'è:** cyc = parete curva che unisce muro e pavimento senza spigolo. Carta in rotolo (Savage, Colorama): ad esempio la Savage da 107" × 36' (= 12 yd, circa 272 cm × 11 m) è, secondo la guida Savage riportata dalla scheda B&H, la larghezza adatta a gruppi di circa quattro persone; per sei persone la guida indica la larghezza 140" (non disponibile in tutti i colori). Grammatura sulle pagine Savage: 163 gsm per Super White e Pure White, 145 gsm per Black [P, produttore]. Correzione del 2026-11-08: la versione precedente scriveva «107" × 12 yd minimo per gruppi di 5-6 adulti, 145 gsm (Super White 163 gsm)»; la cifra «5-6 adulti» non compare per il 107" e i 145 gsm sono del nero, non un valore generale.
- **Si vede:** orizzonte assente, colore uniforme, soggetto isolato.
- **Quando:** moda, prodotto, ritratto.
- **Higgsfield:** «seamless colored paper backdrop curving into the floor» (ipotesi non testata).
- **Errore comune:** carta sporca o segnata dai piedi; si taglia la parte rovinata.

#### Stativi, boom e C-stand
- **Cos'è:** stativi leggeri per le teste; C-stand a tre gambe con braccio e testa (grip head) per fissare modificatori, bandiere, gobo; boom (braccio) per luci sopra il soggetto.
- **Si vede:** nulla: permettono posizioni di luce che altrimenti non esistono (luce sopra il volto, bandiera vicino al prodotto).
- **Quando:** studio e location.
- **Higgsfield:** n/a.
- **Errore comune:** stativi senza zavorra.

#### Sacchi di sabbia
- **Cos'è:** zavorra sui piedi degli stativi, soprattutto con modificatori grandi o boom.
- **Si vede:** nulla.
- **Quando:** sempre, soprattutto con ombrelli e softbox grandi.
- **Higgsfield:** n/a.
- **Errore comune:** non usarli «perché è solo un attimo»: una caduta rovina una testa o ferisce il modello.

#### Sincronizzazione e trigger
- **Cos'è:** il trigger radio trasmette il segnale di scatto alle teste (o l'ottico o cavo di sincronismo). Compatibilità e velocità (HSS, TTL) dipendono dal sistema.
- **Si vede:** nulla; ma una sincronizzazione instabile dà fotogrammi neri o con lampo parziale (banda scura).
- **Quando:** sempre in studio.
- **Higgsfield:** n/a.
- **Errore comune:** mischiare sistemi radio senza verificare la compatibilità.

#### Esposimetro (flashmeter)
- **Cos'è:** esposimetro a luce incidente con misurazione del flash (es. Sekonic) che dà diaframma e tempo, rapporto fra luci, e le temperature di colore.
- **Si vede:** nulla in immagine: garantisce rapporti di luce ripetibili.
- **Quando:** studio con più luci, repliche di uno schema nei mesi.
- **Higgsfield:** n/a.
- **Errore comune:** misurare con la calotta in direzione sbagliata (verso la camera per il rapporto totale, verso ogni luce per misurarla separatamente, secondo la pratica).

#### Tethering
- **Cos'è:** camera collegata a un computer con cavo o wireless: le immagini appaiono subito su un monitor grande, nell'applicazione di cattura (Capture One, Lightroom).
- **Si vede:** fuoco, colore, ombre e riflessi si giudicano a monitor, non sul display della macchina; il cliente approva sul set.
- **Quando:** moda, prodotto, campagne.
- **Higgsfield:** n/a.
- **Errore comune:** approvare a monitor non calibrato.

**Fonti:** Savage Universal, pagine prodotto «Super White», «Pure White» e «Black Seamless Background Paper (107" W x 36' L)» (savageuniversal.com/us-en/...: 163 GSM, 163 GSM, 145 GSM; 107" × 36'), lette raw 2026-11-08 [P, produttore]; B&H, scheda «Savage #01 Super White Seamless Background Paper (107" x 36')», aperta con Chrome 2026-11-08 (con la guida alle larghezze: 107" circa quattro persone, 140" fino a sei) [S, rivenditore che riporta la guida del produttore]; «Colorama» non verificato; attrezzatura di studio (stativi, boom, zavorre, trigger, tethering): conoscenza consolidata di mestiere. Tethering e direzione del monitor in studio: regola del skill photo-illustration-direction (guardare a monitor, non sul display) [P interna].

---

## Cosa non è stato verificato

- Aggiornato il 2026-11-08 dopo la verifica sotto. Nessuna fonte primaria letta per: definizione del numero guida (solo Wikipedia [S]), rapporti di luce in *Light: Science and Magic*, rapporto 8:1 del low key, tabella degli angoli di ritratto (solo B&H [S] e Elinchrom [P] per Rembrandt, loop, butterfly, split, clamshell), regola del 2 stop per raddoppio di distanza (fisica standard), gamma 2700-6500 K dei LED, Godox TL60, descrizioni qualitative dei modificatori, sezioni 7 e 9 per la parte di mestiere.
- Il campo Higgsfield è «ipotesi non testata» salvo dove scritto «verificato (skill)»: nessuna formula è stata provata con una generazione.
- La verifica del 2026-11-08 è fatta da un'istanza diversa dall'autore ma non da un terzo indipendente sul merito: resta consigliato un secondo controllo sulle cifre corrette.

## Verifica del 2026-11-08

- Verificatore: istanza «Insight & Research» diversa dall'autore del file; non indipendente nel senso pieno (stessa catena di strumenti). Letture con curl+user-agent, r.jina.ai (B&H), Chrome headed (Cambridge in Colour, B&H, Sekonic), PDFKit (Kodak, ARRI).
- Controllati circa 40 dati/fonti (incluso un campione di 12 già [P]: Profoto A2 t0.1/t0.5, Profoto HSS 2-3 stop, Sekonic t0.5, Broncolor Para 177/133, Elinchrom Rotagrid e guida, Sekonic C-800-U, Kodak F-4017, ARRI, Savage, skill higgsfield). Tutti i [P] già presenti confermati, salvo le correzioni sotto.
- Promossi a [P]: Profoto 1/200 s e consiglio Freeze, Godox AD600ProII (600 Ws, GN 87, tubo 5800±200 K), ARRI 3200 K e HMI 5600 K, Savage gsm, Rotagrid 30°, Sekonic C-800-U (ambiente e flash), Kodak F-4017. [S] confermata da due fonti indipendenti: solo ETTR (Cambridge in Colour + Wikipedia). GN∝√ISO e lighting ratio restano [S] con una sola fonte (Wikipedia).
- Corretti: Sunny 16 ombra aperta f/5.6 (non f/4); kelvin alba/tramonto discordanti tra CiC e Wikipedia, cifra ora blu tolta; flash «5600 K» → 5000-6000 K; «tubi LED Godox 5800 K» era il tubo flash; Rembrandt «2:1-4:1 B&H» non presente nella pagina; rapporti di luce senza convenzione; pesi Para = kit; Savage «5-6 adulti» (107" ≈ 4 persone) e 145 gsm (è il nero); C-800-U flash 2.500 K minimo; Soul Cinema «location e ambienti».
- Citazione Sekonic «merciless…» riguarda gli esposimetri a luce riflessa, non l'incidente. Nessuna riga «Nota» su accuse nel file; descrizioni visive non applicabili.
- Aperti: Godox TL60 e gamma kelvin dei LED (ricerca web, solo snippet di rivenditori; nessuna pagina del produttore aperta); angoli e rapporti di Light: Science and Magic (libro non accessibile); altezza del sole nell'ora dorata; «Colorama». Rischio: cifre di mestiere nei prompt non verificate.
