# Tecnica del cinema — luce, camere, obiettivi

Manuale tecnico dell'atlante: il mestiere del direttore della fotografia, tradotto per dirigere un set vero o un modello generativo. Non contiene riferimenti d'autore (stanno in `cinema.md`); l'inquadratura e il movimento sono in `tecnica-cinema-inquadratura.md`, VFX, color science e grading in `tecnica-cinema-vfx-colore.md`, luce e camere della fotografia ferma in `tecnica-fotografia-luce.md` e `tecnica-fotografia-camere-ottiche.md`.
Ogni voce ha: Cos'è, Si vede, Quando, Higgsfield, Errore comune. Gli esempi di film stanno solo in «Si vede» (uso interno, mai nel prompt né nel deliverable); nei prompt possono entrare nomi di prodotto (pellicole, obiettivi, camere), non di autori, e mai «in the style of» (`regole.md`).
Letto e redatto il 2026-11-08. Scadenza di revisione: 2027-02-06 (90 giorni), prima per le specifiche di prodotto.

**Legenda della provenienza.** [P] = pagina del costruttore letta il 2026-11-08 (ARRI, Kodak, Blackmagic). [S] = secondaria, citata ma non riletta alla fonte. **std** = definizione fisica o di mestiere consolidata (ottica, esposizione, uso di set), scritta senza una fonte aperta in questa sessione: fiducia MEDIA, da riconfrontare con ASC / American Cinematographer Manual prima di citarla a un cliente. **da verificare** = numero o specifica che non ho letto su pagina primaria; non usarlo in un preventivo né in una promessa.
**Legenda «Modello».** [V] = verificato nei file della skill `higgsfield` (SKILL.md, vocab.md, model-guide.md) letti il 2026-11-08. [I] = ipotesi di comportamento, non provata con una generazione: va testata prima di promettere il risultato. L'istantanea del catalogo modelli è del 2026-09-26 (più vecchia di 30 giorni): prima di eseguire, rileggere parametri e rapporti d'aspetto con `models_explore`.

---

## 1. Fondamenti della luce

#### Luce dura e luce morbida
- **Cos'è:** la qualità dipende dalle dimensioni apparenti della sorgente viste dal soggetto. Sorgente piccola o lontana rispetto al soggetto = dura (ombra con bordo netto, penombra stretta); sorgente grande o vicina = morbida (penombra larga, transizione graduale). Una sorgente di 1 m a 1 m dal volto è morbida; la stessa a 8 m è quasi dura. Il sole è duro perché sottende circa 0,5° (std). Una nuvola o un diffusore lo trasforma in una sorgente grande.
- **Si vede:** ombre del naso e delle ciglia nette o sfumate; texture della pelle e dei materiali esaltata (dura) o attenuata (morbida); volume del volto modellato (dura) o appiattito (morbida frontale).
- **Quando:** dura per tensione, materia, mezzogiorno, interrogatorio, prodotti con texture (metallo, pelle conciata); morbida per cura, bellezza, intimità, cosmetica, cibo. Nel brand: la morbida è il default «accessibile», la dura il default «autoriale».
- **Higgsfield:** `hard directional sunlight, small source, crisp shadow edges, deep shadow side` / `large soft overhead source, wrapping light, feathered shadow transitions, no hard shadows`. Modello: descrivere sorgente, direzione e geometria dell'ombra funziona meglio degli aggettivi d'umore [V: vocab.md, metodo «scene-physics» della skill]; la resa effettiva di «hard» vs «soft» per modello è [I].
- **Errore comune:** scrivere «dramatic lighting» o «soft cinematic light» senza sorgente: si ottiene la media. Credere che «morbida» significhi «fioca»: la qualità non è l'intensità.

#### Direzione della luce
- **Cos'è:** posizione della sorgente rispetto all'asse camera-soggetto: frontale (0°), tre quarti (30-60°), laterale (90°), controluce (oltre 120°), dall'alto, dal basso (std).
- **Si vede:** frontale schiaccia il volume e riduce la texture; laterale scolpisce e divide in due; controluce separa dal fondo e produce contorno e silhouette; dall'alto scava le orbite; dal basso rovescia le ombre e sa di innaturale.
- **Quando:** frontale per commercio e chiarezza; tre quarti è il default narrativo; laterale per conflitto e materia; controluce per ora magica e separazione.
- **Higgsfield:** `key light from camera left at roughly 45 degrees, shadow falling camera right` / `strong backlight from behind the subject, rim light along hair and shoulders`. Modello: [V] la direzione va nominata con la fisica dell'ombra («shadow falls…»); [I] i modelli video tendono a spostare la direzione quando il soggetto ruota.
- **Errore comune:** non specificare da che lato: il modello sceglie e cambia fra le inquadrature di una sequenza.

#### Temperatura colore in Kelvin
- **Cos'è:** il colore di una sorgente confrontato con un corpo nero riscaldato, in K. Più basso = più caldo (arancio), più alto = più freddo (blu). Valori convenzionali (tungsteno 3.200 K e la dispersione 5.500-5.700-6.500 K della «luce diurna» letti su schede LEE e Rosco il 2026-11-08 [P]; candela, incandescenza, sole e cielo letti nella tabella Kodak il 2026-11-08 [P], vedi tabella sotto): candela 1.850 K, lampadina a incandescenza 2.650-2.900 K (da 40 a 100 W), tungsteno da cinema 3.200 K, sole all'alba/tramonto 2.000 K e un'ora dopo l'alba 3.500 K, luce diurna e HMI 5.600 K, cielo coperto 6.000 K, ombra estiva 7.100-8.000 K, cielo azzurro 9.500-30.000 K. La differenza si misura anche in mired (1.000.000/K): un passo di 1 mired è lo stesso salto percettivo a ogni temperatura.
- **Si vede:** il bilanciamento del bianco della camera decide quale sorgente è «neutra»; le altre virano. Tungsteno con camera a 5.600 K = arancio; finestra con camera a 3.200 K = blu.
- **Quando:** miscelare 3.200 e 5.600 K nella stessa inquadratura dà profondità e separazione (interno caldo, finestra fredda); un solo bilanciamento dà uniformità.
- **Higgsfield:** `warm tungsten practical lamps around 3200K against cool daylight blue spill from a window` . Modello: i modelli rendono i contrasti caldo/freddo per nome più che per cifra Kelvin; i numeri in K sono [I] e non garantiti.
- **Errore comune:** correggere tutto al neutro e perdere il contrasto di colore che è già nella scena; confondere la temperatura colore con la tinta (verde/magenta, asse separato).

| Sorgente | K convenzionali | Nota |
|---|---|---|
| Fiammifero | 1.700 | [P] Kodak, «The Essential Reference Guide for Filmmakers», tabella «Color Temperature for Various Light Sources», p. 27, PDF 2012 (snapshot Wayback 2012-06-01 di motion.kodak.com), letto con PDFKit 2026-11-08 |
| Candela | 1.850 | [P] stessa tabella Kodak (corretto: prima ~1.900, std) |
| Incandescenza 40 / 75 / 100 W | 2.650 / 2.820 / 2.900 | [P] stessa tabella Kodak |
| Photoflood | 3.400 | [P] stessa tabella Kodak |
| Sole all'alba/tramonto; un'ora dopo l'alba; primo mattino e tardo pomeriggio | 2.000; 3.500; 4.300 | [P] stessa tabella Kodak (il file diceva «alba/tramonto 3.000-4.000 K»: Kodak dà 2.000 K al sorgere/tramonto) |
| Sole estivo a mezzogiorno (Washington, DC); sole diretto di mezza estate | 5.400; 5.800 | [P] stessa tabella Kodak |
| Tungsteno cinema | 3.200 | [P] LEE 204 e 201 («tungsten light (3200K)», lee filters, letti 2026-11-08); per 200T/500T Kodak indica il filtro 85 in luce diurna [P], il che le dà come bilanciate al tungsteno |
| Luce diurna / HMI | 5.600 | convenzione per HMI/Kodak; **discordanza tra le fonti primarie lette**: Rosco usa 5.500 K come luce diurna (Roscosun CTO: 5.500 → 2.900 K), LEE chiama «photographic daylight» 5.700 K (201) e usa 6.500 K come riferimento per la 204; per 50D/250D Kodak indica nessun filtro di bilanciamento in luce diurna [P] |
| Cielo coperto | 6.000 | [P] stessa tabella Kodak (corretto: prima ~6.500-7.000, std) |
| Sole estivo più cielo azzurro | 6.500 | [P] stessa tabella Kodak |
| Ombra estiva leggera / media | 7.100 / 8.000 | [P] stessa tabella Kodak |
| Luce del cielo estivo (skylight) | 9.500-30.000 | [P] stessa tabella Kodak; Kodak avverte: «sunlight» è solo il sole, «daylight» è sole più cielo. «Ora blu» come voce non c'è: la cifra 7.000-10.000+ resta std |

#### CRI e TLCI
- **Cos'è:** indici (0-100) di quanto bene una sorgente rende i colori rispetto a un riferimento. CRI (Ra) è l'indice classico basato su 8 campioni; TLCI (EBU) è tarato per telecamere. L'Academy ha proposto lo Spectral Similarity Index (SSI) come metrica più adatta al cinema (std, non verificato sulla fonte Academy). Valori dichiarati letti il 2026-11-08: Astera Titan Tube CRI(Ra)/TLCI ≥96 a 3.200-6.500 K [P: astera-led.com, valori «typical»]; Aputure STORM CS32 SSI 93 (P3200) e 91 (D5600) [P: aputure.com].
- **Si vede:** una sorgente a basso CRI (LED economici, vapori di sodio/mercurio) vira pelle e tessuti, specie rossi e magenta, anche se «bilanciata» a 5.600 K.
- **Quando:** sempre per volti, cibo, abiti e prodotti con colore di marca; per un look volutamente sporco si può cercare la bassa resa (neon, parcheggio).
- **Higgsfield:** non traducibile in prompt come cifra; per la resa «povera» usare `sodium vapor streetlight, orange cast, greenish fluorescent tubes`, per la resa piena `accurate natural skin tones, clean full-spectrum light`. Modello: [I].
- **Errore comune:** scegliere una luce LED dalla potenza dichiarata ignorando CRI/TLCI; scoprire in color l'arancio irrecuperabile sulla pelle.

#### Legge dell'inverso del quadrato
- **Cos'è:** l'illuminamento di un punto cala con il quadrato della distanza dalla sorgente puntiforme: E ∝ 1/d². Raddoppiare la distanza = un quarto della luce = 2 stop. Calcolo: sorgente a 1 m = 1; a 2 m = 1/4; a 4 m = 1/16 (4 stop). Vale per sorgenti piccole rispetto alla distanza (std).
- **Si vede:** vicino alla sorgente la luce cala molto sul soggetto che si muove; lontano è quasi costante. Per questo il sole (a 150 milioni di km) illumina uniformemente la scena, mentre una lampada a 1 m crea gradienti forti sul tavolo.
- **Quando:** avvicinare la sorgente per più caduta (sfondo scuro, vignettatura naturale, intimità); allontanarla e aumentare la potenza per uniformità.
- **Higgsfield:** `single practical lamp close to the subject, rapid light falloff into darkness behind` . Modello: [I] la caduta fisica viene resa come gradiente generico; spesso troppo uniforme.
- **Errore comune:** aspettarsi che una luce d'angolo illumini il fondo come il primo piano; il modello ignora la caduta e illumina tutto.

#### Rapporto key/fill e contrasto
- **Cos'è:** differenza di esposizione, in stop, tra il lato illuminato dal key e il lato in ombra (key + fill contro solo fill). Rapporto 2:1 = 1 stop, 4:1 = 2 stop, 8:1 = 3 stop, 16:1 = 4 stop (std). Il contrasto della scena è sempre da confrontare con la gamma dinamica del supporto (es. 17 stop per ALEXA 35, ARRI [P]).
- **Si vede:** 2:1 = volto quasi piatto, televisivo; 4:1 = naturale; 8:1 e oltre = drammatico, con ombra scura; il nero è uno spazio, non un errore.
- **Quando:** rapporti bassi per commedia, beauty, pubblicità; alti per thriller e drammatico. In digitale si decide in ripresa e si rifinisce in color (`tecnica-cinema-vfx-colore.md`).
- **Higgsfield:** `high contrast, deep unlit shadow side, no fill light` / `low contrast, generous fill, open shadows`. Modello: [I] i modelli tendono a riaprire le ombre; per tenere il nero scrivere `crushed blacks`, che è nel lessico della skill per il registro notte [V].
- **Errore comune:** alzare il fill per «vedere meglio» e perdere il volume; confondere «scuro» (poca luce) con «contrasto» (differenza).

#### Luce motivata
- **Cos'è:** luce che sembra provenire da una sorgente visibile o plausibile nella scena (finestra, lampada, schermo, fuoco), anche quando è costruita altrove. Principio di continuità illuminotecnica (std).
- **Si vede:** direzione e colore della luce sul volto coincidono con la sorgente in quadro; la scena sembra «vera» anche se illuminata con attrezzatura.
- **Quando:** realismo e drammaturgia; negli spot, per far sembrare la luce una scelta del luogo. Una luce non motivata (stilizzata) è una scelta forte: da fare apposta.
- **Higgsfield:** `window as the only motivated source, light direction matches the window, warm lamp on the table as secondary source`. Modello: nominare la sorgente in quadro e la direzione migliora la coerenza [V come metodo], la tenuta nei piani seguenti è [I].
- **Errore comune:** nominare sorgenti che non si vedono né si spiegano; luce che entra da un lato mentre la finestra sta dall'altro.

#### High key e low key
- **Cos'è:** high key = scena luminosa, rapporto basso, ombre aperte, toni medio-alti; low key = scena scura, rapporto alto, ombre dominanti, pochi punti di luce (std).
- **Si vede:** high key = leggero, pulito, ottimista (o clinico se freddo); low key = misterioso, cupo, intimo.
- **Quando:** high key per beauty, tech, salute, commedia; low key per noir, thriller, lusso notturno, profumeria, auto di sera.
- **Higgsfield:** `high-key lighting, bright even exposure, white seamless background` / `low-key lighting, single hard source, subject emerging from black`. Modello: high key è facile per tutti i modelli; low key vero (nero profondo) è spesso schiarito [I].
- **Errore comune:** low key = «scuro»: se non c'è un punto di luce leggibile, è solo sottoesposto.

#### Chiaroscuro
- **Cos'è:** modellazione del volume tramite forte contrasto luce/ombra, con ampie zone d'ombra e transizione marcata, dalla pittura (std).
- **Si vede:** metà del volto in ombra, occhi che si perdono, mani illuminate che parlano; sfondo scuro.
- **Quando:** quando l'ombra deve significare (potere, dubbio, segreto); lusso a effetto «museo».
- **Higgsfield:** `chiaroscuro lighting, single side source, half the face falling into darkness, dark background with no detail`. Modello: [I].
- **Errore comune:** aggiungere troppe luci di riempimento «per sicurezza».

**Fonti sezione 1:** Kodak, schede VISION3 50D/250D/200T/500T (kodak.com/en/motion/product/camera-films), letta 2026-11-08 [P]; ARRI, pagina ALEXA 35 (arri.com), letta 2026-11-08 [P]; skill `higgsfield`: SKILL.md, vocab.md, model-guide.md, lette 2026-11-08 [P per ciò che dicono sulla piattaforma]. Verifica 2026-11-08: tungsteno 3.200 K e luce diurna (LEE 204/201, Rosco Roscosun) [P]; CRI/TLCI Astera e SSI Aputure [P]. Candela 1.850, incandescenza, sole, cielo coperto, ombra: Kodak Essential Reference Guide (2012, Wayback) [P], letto 2026-11-08. Definizioni CRI/TLCI/SSI, legge dell'inverso del quadrato, rapporti in stop: std, non riletti su fonte (ASC/American Cinematographer Manual non raggiunto).

---

## 2. Schemi di illuminazione

Gli schemi sono configurazioni di sorgente, non ricette. Quasi tutti sono definiti in base alla direzione della luce principale sul volto.

#### Tre punti (three-point)
- **Cos'è:** key (principale, 30-45° a lato e leggermente sopra), fill (riempimento dal lato opposto, a intensità inferiore) e back/rim (da dietro e sopra, per staccare dal fondo) (std).
- **Si vede:** volto modellato, ombra morbida sul lato fill, bordo luminoso sui capelli.
- **Quando:** intervista, ritratto aziendale, schema base di ogni set; punto di partenza da cui allontanarsi.
- **Higgsfield:** `classic three-point lighting, soft key from camera left, gentle fill from camera right, hair light separating subject from background`. Modello: [I] tutti i modelli lo riconoscono come «look da intervista».
- **Errore comune:** è un punto di partenza, non lo stile: usato alla lettera fa televisione.

#### Rembrandt
- **Cos'è:** key a circa 45° laterale e in alto; sulla guancia in ombra resta un triangolo di luce sotto l'occhio (std).
- **Si vede:** triangolo luminoso sulla guancia in ombra, naso che proietta verso la bocca senza toccarla.
- **Quando:** ritratto drammatico ma elegante, personaggi con peso.
- **Higgsfield:** `Rembrandt lighting, small triangle of light on the shadow-side cheek, dark background`. Modello: [I] il termine è riconosciuto; il triangolo si perde se il soggetto è in movimento.
- **Errore comune:** il triangolo arriva alla bocca = diventa un loop.

#### Butterfly / Paramount
- **Cos'è:** key frontale e alta, centrata sull'asse; ombra del naso piccola e a farfalla sotto di esso (std).
- **Si vede:** zigomi accentuati, ombra sotto il mento, aspetto da glamour classico.
- **Quando:** beauty, cosmetica, ritratto di moda.
- **Higgsfield:** `butterfly lighting, high frontal key, small shadow under the nose, defined cheekbones, soft shadow under the chin`. Modello: [I].
- **Errore comune:** posizionare la luce troppo bassa = ombre da torcia.

#### Loop e split
- **Cos'è:** loop = key a 30-45° con piccola ombra del naso che «gira» verso la guancia senza toccare l'altro lato; split = key a 90°, esattamente metà volto illuminato (std).
- **Si vede:** loop naturale e favorevole; split drammatico, due metà del volto.
- **Quando:** loop per la maggior parte dei ritratti; split per dualità, minaccia, tensione.
- **Higgsfield:** `loop lighting, soft nose shadow curving toward the cheek` / `split lighting, one half of the face lit, the other half in shadow`. Modello: [I] split è generalmente reso bene; loop si confonde con tre quarti.
- **Errore comune:** confondere split con chiaroscuro: nello split la divisione è netta e geometrica.

#### Broad e short
- **Cos'è:** broad = si illumina il lato del volto più vicino alla camera; short = il lato lontano, con quello vicino in ombra (std).
- **Si vede:** broad allarga il volto, short lo assottiglia e scolpisce.
- **Quando:** short per volti pieni o per drammaticità; broad per aprire un viso stretto.
- **Higgsfield:** `short lighting, the side of the face turned toward camera in shadow, narrow modelled face`. Modello: [I].
- **Errore comune:** non conoscere da che lato è ruotato il soggetto, quindi non sapere cosa si ottiene.

#### Clamshell e book light
- **Cos'è:** clamshell = due sorgenti, una sopra e una sotto il volto, frontali, a conchiglia (key alto, fill basso); book light = sorgente dura riflessa su un pannello e poi diffusa, ottenendo una luce molto morbida e direzionale (std).
- **Si vede:** clamshell = occhi con due catch-light, pelle liscia, ombre ridotte; book light = luce da finestra «perfetta» e controllabile.
- **Quando:** beauty e cosmetica (clamshell); interviste e interni naturali costruiti (book light).
- **Higgsfield:** `beauty clamshell lighting, soft light from above and below, even skin, catchlights in both eyes` / `soft window-like light, very diffuse, gentle gradient across the face`. Modello: [I].
- **Errore comune:** clamshell troppo frontale = appiattimento «da catalogo».

#### Luce incrociata (cross light)
- **Cos'è:** due sorgenti laterali opposte, ciascuna da un lato, sul soggetto o sulla scena, entrambe di taglio (std).
- **Si vede:** entrambi i lati del volto o del corpo ben scolpiti, centro in ombra; molto volume.
- **Quando:** corpo in movimento, sport, danza, azione; prodotto con superfici (metalli, acqua).
- **Higgsfield:** `two crossing side lights from opposite sides, sculpted edges on both sides of the body, darker centre`. Modello: [I].
- **Errore comune:** un lato più forte dell'altro senza volerlo.

#### Controluce, rim ed edge
- **Cos'è:** sorgente dietro il soggetto; rim = bordo luminoso sul contorno; edge = sottile linea luminosa su un solo lato; silhouette = nessuna luce frontale (std).
- **Si vede:** contorno luminoso, separazione dal fondo; con fumo, raggi visibili; con camera in asse, alone (flare).
- **Quando:** ora magica, separazione di personaggi scuri su fondo scuro, momenti di rivelazione.
- **Higgsfield:** `strong backlight, thin rim light along the edge of the shoulders and hair, hazy air catching the beams`. Modello: [I] il controluce è tra i look più riusciti nei modelli video, ma tende a esagerare l'alone [I].
- **Errore comune:** richiedere controluce senza dire cosa succede al volto (silhouette o riempito).

#### Luce dall'alto (top light) e dal basso (underlight)
- **Cos'è:** top = sorgente sopra il soggetto, quasi verticale; underlight = sorgente sotto il volto (std).
- **Si vede:** top = occhi nell'ombra, naso e fronte illuminati, aspetto severo o scenico; under = ombre rovesciate, aspetto inquietante.
- **Quando:** top per interrogatori, potere, concerti; under per horror, torce, schermi, fuoco.
- **Higgsfield:** `overhead top light, eye sockets in shadow` / `lit from below, shadows cast upward over the face`. Modello: [I].
- **Errore comune:** usare l'underlight per qualcosa di «caldo»: risulta sempre minaccia.

#### Negative fill, bounce e luce ambiente morbida dall'alto
- **Cos'è:** negative fill = pannello nero (floppy, solid) che toglie luce da un lato per aumentare il contrasto; bounce = luce riflessa da superficie bianca, grigia o dorata (polistirolo, bandiera bianca, muro); ambient/soft source overhead = grande sorgente diffusa sopra la scena (std).
- **Si vede:** negative fill = ombra più profonda e modellata; bounce = riempimento morbido e colorato dalla superficie; ambiente morbido = base uniforme per scene ampie.
- **Quando:** negative fill per dare peso a un volto in finestra; bounce per correggere il colore o per ammorbidire; sorgente alta per scene con molti attori.
- **Higgsfield:** `deep shadow side, light absorbed on one side` / `warm bounce light from a cream wall softly lifting the shadows`. Modello: [V] nominare il rimbalzo è parte del metodo scene-physics della skill; la resa è [I].
- **Errore comune:** il negative fill è per sottrarre, non è «una luce nera».

#### Pratiche (practicals)
- **Cos'è:** lampade, schermi, fuochi, neon e candele visibili in quadro che contribuiscono realmente alla luce (std).
- **Si vede:** sorgenti nel fotogramma con alone, ombre e colore; autenticità del luogo.
- **Quando:** interni notturni, scene intime; fondamentali per il registro notte: se non si nominano le pratiche il modello produce una «notte luminosa» [V: vocab.md].
- **Higgsfield:** `night interior lit only by a warm table lamp and a TV glow, crushed blacks, no other light`. Modello: [V] il registro notte nella skill chiede di nominare le pratiche e schiacciare i neri.
- **Errore comune:** scrivere solo «night»: il modello illumina tutto come di giorno con cielo blu.

#### Luce di finestra
- **Cos'è:** una finestra come grande sorgente morbida e direzionale, la cui qualità dipende da orientamento, ora del giorno e tende (std).
- **Si vede:** gradiente dal vetro verso l'interno, ombre morbide, ombre dei telai solo con sole diretto.
- **Quando:** interviste, ritratti, ambienti domestici, food.
- **Higgsfield:** `soft north-facing window light from camera left, light falling off across the room, curtains diffusing the sun`. Modello: [I].
- **Errore comune:** non dire dove sia la finestra rispetto alla camera.

#### Giorno per notte (day for night)
- **Cos'è:** simulare la notte in riprese diurne o con luce controllata, sottoesponendo, virando verso il blu in ripresa/color e usando luce direzionale lunare (std). Il termine «notte americana» si usa in italiano.
- **Si vede:** ombre morbide ma scure, cielo escluso, colore freddo, contrasto controllato.
- **Quando:** quando non si può girare di notte (costi, bambini, luoghi pubblici) o per ottenere una notte leggibile.
- **Higgsfield:** `moonlit night look, cool blue key from high behind, deep shadows, sky not visible, practical lamps warm in contrast`. Modello: [V] la notte va costruita con le pratiche; [I] la resa «moonlight» tende al blu saturo.
- **Errore comune:** blu uniforme su tutto e cielo visibile con ombre di giorno.

#### Ora d'oro e ora blu
- **Cos'è:** ora d'oro = prima/dopo il sole basso (luce calda, bassa, direzionale, morbida); ora blu = crepuscolo, con il cielo azzurro e le luci artificiali già accese (std). La durata dipende da latitudine e stagione: da calcolare con un'app, non a memoria.
- **Si vede:** oro = contorni caldi, ombre lunghe, controluce; blu = cielo cobalto con finestre calde.
- **Quando:** oro per immagini «di marca» emotive; blu per città, tech, auto, lusso.
- **Higgsfield:** `low golden sun from behind, long warm shadows` / `blue hour, deep blue sky, warm lit windows`. Modello: [I]. Attenzione: la luce dorata di finestra è anche la palette di default del generatore (vedi SKILL.md dell'atlante, controllo della palette di default).
- **Errore comune:** usare l'oro d'ufficio: è ciò che il modello fa da solo.

**Fonti sezione 2:** definizioni degli schemi: std (mestiere, ASC / American Cinematographer Manual da consultare); metodo scene-physics e registro notte: skill `higgsfield` vocab.md / model-guide.md, lette 2026-11-08 [P]. Nessuna fonte secondaria usata.

---

## 3. Fonti e strumenti

#### HMI
- **Cos'è:** lampada a scarica di ioduri metallici, con alimentatore (ballast), bilanciata a circa 5.600 K, con alta efficienza luminosa (circa 3-4 volte il tungsteno per watt, std); esiste con flicker se non alimentata in modo adatto al frame rate (ballast flicker-free per alte frequenze).
- **Si vede:** luce dura, come il sole, per finestre, esterni e riempimento diurno.
- **Quando:** simulare sole, riempire in esterno, luce forte attraverso finestre.
- **Higgsfield:** `hard daylight-balanced source, strong beam streaming through a window`. Modello: [I].
- **Errore comune:** HMI con ballast non flicker-free a frame rate alti = pulsazioni.

#### Tungsteno (fresnel e open face)
- **Cos'è:** lampade a filamento a 3.200 K; fresnel = lente a gradini, fascio regolabile (spot-flood), bordo morbido; open face = senza lente, fascio più ampio e più duro (std).
- **Si vede:** calore e resa dei colori eccellente; la luce risulta morbida e continua; il bordo del fresnel si attenua.
- **Quando:** interni caldi, look tradizionale, dimmerabile senza cambiare colore in modo molto percepibile; consumo e calore alti.
- **Higgsfield:** `warm tungsten fresnel light, soft edge, warm 3200K colour`. Modello: [I].
- **Errore comune:** confrontare la potenza (W) di tungsteno e LED come se fossero equivalenti.

#### LED (SkyPanel, tubi, Titan/Astera)
- **Cos'è:** pannelli e tubi a LED; SkyPanel (ARRI) = pannello morbido a temperatura colore variabile e RGBW: la serie SkyPanel Classic (S30-C, S60-C, S120-C, S360-C) dichiara CCT da 2.800 a 10.000 K, regolazione di tinta e saturazione, selezione di gelatine, 16 effetti [P: arri.com, pagina SkyPanel Classic, letta 2026-11-08]. **Correzione:** Titan Tube (Astera) non è «un tubo grande» ma un tubo LED di tre lunghezze (550, 1.035 e 2.031 mm; Ø 42 mm; 36, 72, 144 W; 1.340, 2.900, 5.800 lm; 8, 16, 32 pixel; IP65; batteria fino a 20 h; CRI/TLCI ≥96 a 3.200-6.500 K, valori tipici) [P: astera-led.com/products/titan, letta 2026-11-08]. Aputure STORM CS32 (esempio di sorgente puntiforme potente): 3.200 W, CCT 1.800-20.000 K con regolazione verde/magenta, SSI 93 (P3200) e 91 (D5600), «as bright as a 4K HMI or 10K tungsten fresnel» secondo Aputure [P: aputure.com/products/storm-cs32, letta 2026-11-08; la frase è del costruttore, non misurata].
- **Si vede:** luce morbida controllabile in colore e intensità, spesso senza ombra netta; i tubi appaiono in quadro come luce pratica creativa.
- **Quando:** set agili, luce in movimento, effetti di colore, luci pratiche «finte» dentro l'inquadratura.
- **Higgsfield:** `LED tube light visible in frame, saturated colour wash, clean full-spectrum fill`. Modello: [I].
- **Errore comune:** LED economici a basso CRI/TLCI.

#### Dedolight e sorgenti con lente
- **Cos'è:** proiettore compatto con ottica asferica e sorgente piccola, fascio focalizzabile e molto preciso. Dedo Weigert Film descrive la serie LED 4 come «The old classic DLH4 as LED Light», con ottica «aspherics 2» brevettata, che «focuses like a true dedolight from wide 60° to extremely narrow 4°», «clean beam - no stray light», compatibile con barn door, scrim, filtri graduati e «imager» per proiettare gobo e luce a bordo sfumato; versione bicolore da 2.700 K a oltre 6.500 K [P: dedoweigertfilm.de, pagine «dedolight LED 40 W Light Heads • Series 4» e «Products Overview», lette 2026-11-08 nello snapshot Wayback del 2025-10-27 e 2025-10-07; il sito diretto non è raggiungibile (DNS: i nameserver rifiutano la query) e dedolight.com è un dominio parcheggiato con solo pubblicità]. Il DLH4 a tungsteno: Dedo Weigert lo descrive come «Low Voltage Tungsten Light Head» di quarta generazione con lenti Aspherics² e zoom di fuoco, focalizzazione 1:25 (contro 1:3 dei piccoli fresnel, secondo il costruttore), resa «approximately» pari a un fresnel tradizionale da 500 W (affermazione del costruttore, non misurata); alimentatori a 12 V 100 W o 24 V 150 W con temperatura selezionabile 3.000 / 3.200 / 3.400 K [P: dedoweigertfilm.de, pagina «Celebration Supersale II • Classic Series - DLH4», snapshot Wayback 2020-05-11, letta 2026-11-08]. Il fascio 5-48° resta solo B&H [S: bhphotovideo.com, snippet, non aperta]. dedolight.com riaperto in Chrome vero il 2026-11-08: ancora pagina parcheggiata vuota; dedoweigertfilm.de: ERR_NAME_NOT_RESOLVED anche in Chrome.
- **Si vede:** pennellate di luce su un dettaglio (occhi, prodotto) senza spargere la luce intorno.
- **Quando:** still life, prodotto, accenti sui volti.
- **Higgsfield:** `precise small pool of light on the product, surrounding darkness`. Modello: [I].
- **Errore comune:** usarlo come sorgente d'ambiente.

#### Sole e specchi
- **Cos'è:** il sole come sorgente primaria; specchi o pannelli riflettenti (es. speculari) per reindirizzarlo nell'interno o per sostituire un'ombra (std).
- **Si vede:** luce duramente direzionale nell'interno, con riflessi sul soffitto.
- **Quando:** quando il sole c'è ma non entra dove serve; luce da effetto «raggio».
- **Higgsfield:** `hard shaft of sunlight reflected into the room, bright patch on the wall`. Modello: [I].
- **Errore comune:** non seguire il sole: l'angolo cambia di 15° in un'ora (std).

#### Lanterna (china ball) e softbox/Chimera
- **Cos'è:** lanterna = sfera di carta o tessuto con lampada all'interno, luce morbida a 360°; softbox / Chimera = scatola con diffusione frontale per una luce direzionale morbida (std).
- **Si vede:** luce morbida e naturale a tavolo, luce circolare nella pupilla (china ball); luce direzionale con catch-light rettangolare (softbox).
- **Quando:** tavoli, cene, interni: luce che sembra «di ambiente».
- **Higgsfield:** `soft round paper-lantern light overhead, even warm glow` / `large softbox, rectangular catchlight in the eyes`. Modello: [I].
- **Errore comune:** lanterna troppo vicina alla pelle: eccesso di luminosità e perdita dei dettagli.

#### Griglie (egg crate), bandiere (flag), floppy, solid, net
- **Cos'è:** griglia = nido d'ape che stringe l'angolo del fascio (es. 40°); flag = pannello nero che toglie luce; floppy = flag con aletta pieghevole; solid = telaio con tessuto nero opaco; net = rete che riduce l'intensità (fino a uno stop ca., a seconda del tipo; da verificare sul prodotto) senza cambiare la qualità (std).
- **Si vede:** luce controllata, bordi puliti, l'ombra dove la si vuole; nessuna perdita di luce sul fondo.
- **Quando:** sempre. Il lavoro vero di un set sta nel togliere luce.
- **Higgsfield:** `light kept off the background, clean pool of light on the subject`. Modello: [I].
- **Errore comune:** aggiungere luci per correggere ciò che si risolve con una bandiera.

#### Telai: butterfly, overhead, 12x12 e 20x20
- **Cos'è:** telai con tessuto (diffusione o solid) montati sopra la scena; 12x12 e 20x20 sono le dimensioni in piedi (circa 3,7 e 6,1 m; conversione aritmetica) (std).
- **Si vede:** sole trasformato in luce morbida sul soggetto, con ombra del telaio che copre l'area; lo sfondo resta al sole.
- **Quando:** esterni di giorno: l'unica cosa che renda morbido il sole.
- **Higgsfield:** `harsh sun diffused by a large overhead silk, soft even light on the subject, bright sunlit background`. Modello: [I].
- **Errore comune:** non sovraesporre lo sfondo: il rapporto soggetto/sfondo cambia.

#### Diffusioni (silk, grid cloth, 216, 250) e gelatine
- **Cos'è:** tessuti e fogli che ammorbidiscono la sorgente: seta (silk), grid cloth (più bianca e più resistente), 216 (diffusione bianca densa), 250 (mezza diffusione bianca); le gelatine correggono o creano colore: CTO (da blu ad arancio), CTB (da arancio a blu), plus green / minus green (compensano le lampade fluorescenti o l'inclinazione verde/magenta). Dati dei costruttori letti il 2026-11-08 [P]: Rosco, Roscosun CTO converte 5.500 K in 2.900 K (trasmissione 47%); 3/4 CTO converte 5.500 K in 3.200 K (58%); 1/2 CTO porta a 3.800 K (73%), 1/4 CTO a 4.500 K (81%), 1/8 CTO a 4.900 K (92%) [us.rosco.com, Roscolux]. LEE, 204 Full C.T. Orange: «converte la luce diurna (6.500 K) in tungsteno (3.200 K)», trasmissione 62,8% (tungsteno), mired shift +159 [leefilters.com/colour/204-full-c-t-orange]; LEE 201 Full C.T. Blue: da tungsteno 3.200 K a «photographic daylight» 5.700 K, trasmissione 35% (la pagina riporta anche 34%, probabilmente per l'altra sorgente di misura), mired -137 [leefilters.com/colour/201-full-c-t-blue, riletta 2026-11-08]. **Correzione:** «CTO converte 5.600 in 3.200 K» vale per un taglio di CTO a 3/4 (Rosco) o per la 204 LEE misurata da 6.500 K; il CTO pieno Rosco da 5.500 K arriva a 2.900 K: il valore dipende da marca, numero e temperatura di partenza. Silk, grid cloth, 216 e 250 e le gelatine CTB/plus green/minus green Rosco non sono state lette (std).
- **Si vede:** luce più morbida con perdita di intensità; colore spostato.
- **Quando:** mescolare sorgenti per dare un colore comune o per distinguerle.
- **Higgsfield:** `warm orange gel on the practical lamps, cool blue ambient`. Modello: [I].
- **Errore comune:** gelatinare le luci e dimenticare di bilanciare la camera.

#### Cookie / cucoloris e fumo (haze)
- **Cos'è:** cucoloris = pannello sagomato che proietta ombre irregolari (foglie, persiane) davanti a una sorgente dura; haze = nebbia leggera (olio o glicole) che rende visibile il fascio (std).
- **Si vede:** cucoloris = pattern d'ombra naturale sulla parete o sul volto; haze = raggi luminosi, profondità atmosferica, ombre morbide e perdita di contrasto nei neri.
- **Quando:** per la profondità: sembra aria vera; foreste, interni industriali, luoghi sacri.
- **Higgsfield:** `leaf-shadow pattern across the wall, light shafts visible through light haze`. Modello: [I] l'haze è il tipo di dettaglio che i modelli rendono bene in 8 secondi di clip, ma lo aumentano nel tempo.
- **Errore comune:** troppa nebbia: i neri si alzano e il contrasto sparisce.

**Fonti sezione 3:** std per le definizioni di mestiere. Lette il 2026-11-08 [P]: ARRI SkyPanel Classic (arri.com), Astera Titan Tube (astera-led.com/products/titan), Aputure STORM CS32 (aputure.com/products/storm-cs32), Rosco Roscolux (us.rosco.com/en/products/catalog/roscolux), LEE 201 e 204 (leefilters.com/colour/). Dedolight: letto solo in snapshot Wayback (2020, 2025) [P]; sito vivo irraggiungibile (curl, Jina, DNS, Chrome vero). Non lette: ballast HMI (nessuna pagina cercata), efficienza HMI 3-4 volte il tungsteno (std), LEE: l'URL leefilters.com/lighting/colour-effects-lighting-filters.html dà 404.

## 4. Camere e sensori

Specifiche di prodotto: leggerle sempre sul sito del costruttore prima di una scheda tecnica per un cliente; qui sono marcate [P] solo se lette il 2026-11-08.

#### Formato del sensore: Super 35, full frame, large format
- **Cos'è:** la dimensione dell'area attiva del sensore. Super 35 = area vicina al fotogramma 35 mm cinema (larghezza circa 24-28 mm a seconda della modalità, da verificare per modello); full frame = 36 x 24 mm (Blackmagic PYXIS 6K/12K dichiarano 36 x 24 mm [P]); large format = più grande del full frame cinematografico. A parità di campo inquadrato, un sensore più grande richiede una focale proporzionalmente più lunga, con minore profondità di campo a parità di T-stop (std). Rapporto approssimato: larghezza 36 mm / circa 25 mm = circa 1,4x.
- **Si vede:** sensore più grande = fuoco più sottile a parità di campo, sfondi più sfumati, resa più «da stampa»; Super 35 = profondità maggiore, tradizione cinematografica.
- **Quando:** large format per ritratto e lusso (volti isolati); Super 35 per azione, tradizione e ottiche classiche.
- **Higgsfield:** `shot on a large-format sensor, very shallow depth of field, soft falloff` / `shot on Super 35, moderate depth of field`. Modello: [I] i modelli non simulano il formato del sensore, simulano la profondità di campo; scrivere la profondità di campo (`shallow depth of field`) è più affidabile. Nel Cinema Studio la scelta camera/lente è un menu a tendina, non testo del prompt [V: skill higgsfield-cinema].
- **Errore comune:** chiedere «full frame» e aspettarsi una focale diversa: il modello non ha un sensore.

#### ARRI ALEXA 35 e ALEXA 35 Xtreme
- **Cos'è:** camera ARRI con sensore Super 35, 17 stop di gamma dinamica, EI 160-6400, LogC4, colore REVEAL, modalità Open Gate 4,6K 3:2 [P: arri.com, 2026-11-08]. L'Xtreme arriva a 330 fps a piena gamma di 17 stop, e con Sensor Overdrive a 660 fps con 11 stop e EI base 1600 [P: arri.com, 2026-11-08].
- **Si vede:** pelle naturale, dettaglio nelle alte luci, neri puliti; è il riferimento «look cinematografico digitale».
- **Quando:** film, serie, spot premium; riprese ad alta frequenza di fotogrammi in Xtreme.
- **Higgsfield:** `shot on a digital cinema camera, wide dynamic range, natural skin tones, gentle highlight roll-off, fine grain`. Modello: [I] i nomi di camera nel prompt sono un'etichetta generica di look; l'effetto non è garantito.
- **Errore comune:** citare la camera nel prompt come se ne cambiasse la ottica.

#### ARRI ALEXA Mini LF e ALEXA 265
- **Cos'è:** ALEXA Mini LF = camera compatta large format: sensore ALEV III (A2X) 4448 x 3096 fotositi, 36,70 x 25,54 mm (Open Gate 3:2), 0,75-90 fps, circa 2,6 kg con attacco LPL [P: arri.com, Mini LF tech data e FAQ, letto 2026-11-08]. ALEXA 265 = camera digitale 65 mm: sensore A3X Rev.B 6560 x 3100, 54,12 x 25,58 mm (Open Gate 2,12:1), 0,75-60 fps, circa 3,3 kg, EI 160-6400; **gamma dinamica dichiarata 15 stop** (non 17: i 17 stop sono dell'ALEXA 35) [P: arri.com, ALEXA 265 tech specs, letto 2026-11-08].
- **Si vede:** campo ampio, fuoco sottile, resa morbida e «grande».
- **Quando:** paesaggi epici, ritratti di lusso, VFX su formato grande.
- **Higgsfield:** `shot on large-format digital cinema camera, expansive field of view, creamy shallow focus`. Modello: [I].
- **Errore comune:** confondere large format con anamorfico.

#### RED V-RAPTOR
- **Cos'è:** la pagina RED letta (via r.jina.ai, 2026-11-08) descrive la V-RAPTOR [X] 8K VV: sensore CMOS global shutter 35,4 MP, 8192 x 4320, 40,96 x 21,60 mm (diagonale 46,31 mm), 17+ stop dichiarati (fino a 20+ con Extended Highlights), fino a 120 fps a 8K 17:9, attacco Nikon Z o Canon RF, ottiche PL con adattatore RED [P: red.com]. Corpo base circa 4 lb (stessa pagina). Il modello originale V-RAPTOR (non X) non ha una scheda letta: le cifre valgono per la [X].
- **Si vede:** definizione elevata, alta frequenza di fotogrammi, resa più «nitida».
- **Quando:** azione, VFX, riprese ad alta risoluzione per reframing.
- **Higgsfield:** `sharp high-resolution digital image, crisp detail`. Modello: [I].
- **Errore comune:** equiparare nitidezza a cinema: spesso il look cinematografico viene da ottica e grana.

#### Sony VENICE 2 e Burano
- **Cos'è:** VENICE 2: sensore full frame CMOS 8,6K (8640 x 5760), 16 stop di latitudine, doppia sensibilità base 800/3200, ND integrati a 8 stop [P: sony-cinematography.com/venice2, 2026-11-08]; con il sensore 6K originale la base è 500/2500 [P: stessa pagina Sony, tabella Technical Data, riletta 2026-11-08]. Burano: sensore full frame «3,6 x 2,4 cm», risoluzione massima 8632 x 4856 (area attiva FF 8,6K 16:9: 35,9 x 20,2 mm; S35 5,8K: 24,0 x 13,5 mm), 16 stop di latitudine (misura Sony, S-Log3), doppia base ISO 800/3200 come VENICE 2, ND elettronico variabile, stabilizzazione IBIS con attacchi PL ed E, 33% più leggera della VENICE 2 [P: pro.sony, pagina Burano, letta via r.jina.ai il 2026-11-08].
- **Si vede:** neri molto puliti in condizioni di bassa luce (3200 base), pelle naturale.
- **Quando:** scene notturne con luce disponibile; set con poca luce.
- **Higgsfield:** `clean low-light image, minimal noise in the shadows, available practical light only`. Modello: [I].
- **Errore comune:** attribuire il pulito notturno al sensore anche quando manca la luce vera: senza pratiche il modello produce notte luminosa [V].

#### Blackmagic Design
- **Cos'è:** URSA Cine (modelli 12K full frame e 17K 65 mm, 16 stop di gamma dinamica) e PYXIS 6K/12K (sensore full frame 36 x 24 mm, fino a 12288 x 8040 per la 12K, 16 stop) con registrazione Blackmagic RAW [P: blackmagicdesign.com, 2026-11-08].
- **Si vede:** definizione alta e flessibilità in post; pelle e colore da lavorare in DaVinci Resolve.
- **Quando:** produzioni a basso budget con requisiti cinematografici, riprese per VFX.
- **Higgsfield:** `ultra-high-resolution cinema image, wide dynamic range, flexible grade`. Modello: [I].
- **Errore comune:** confondere i megapixel con la qualità dell'immagine cinematografica.

#### Canon e smartphone in produzione
- **Cos'è:** Canon (serie Cinema EOS) e iPhone/smartphone usati come camere B, per spazi stretti, riprese rubate, sociale (std). Canon EOS C400: sensore full frame 6K stacked CMOS retroilluminato, modi Full Frame 3:2, Super 35 e Super 16, triplo ISO base 800/3200/12.800, 16 stop dichiarati, ND meccanici 2/4/6/8/10 stop, attacco RF (PL via adattatore PL-RF), supporto anamorfico 2,0x / 1,8x / 1,3x, corpo RF circa 1.540 g (1.750 g le versioni EF e PL) [P: canon-europe.com/cameras/eos-c400, tabella specifiche, letta in Chrome vero il 2026-11-08; usa.canon.com/shop/p/eos-c400 letta lo stesso giorno in Chrome vero per sensore 6K, modi Full Frame 3:2 / Super 35 / Super 16, ISO base 800/3200/12.800, ND «up to ten stops»; curl dà 403 su entrambi]. **Correzioni:** il peso «circa 1.550 g» del file era sbagliato (1.540 g per RF secondo Canon Europe); «ND con estensore» non compare sulle pagine; «Discontinued» veniva dallo snapshot Wayback del 2026-07-20 ma né la pagina USA né quella europea lo riportano il 2026-11-08 (la scheda USA mostra l'articolo con opzioni body e kit): lo stato commerciale non è verificato. Apple iPhone 18 Pro: tre camere da 48 MP (24 mm f/1,48-4,0; ultra grandangolare 13 mm; tele 100 mm), video 4K Dolby Vision fino a 120 fps, ProRes fino a 4K 120 fps con registrazione esterna, ProRes RAW, Apple Log 2, supporto Genlock, modalità Cinematic fino a 4K 60 fps [P: apple.com, iPhone 18 Pro Technical Specifications, letto 2026-11-08].
- **Si vede:** smartphone = profondità di campo ampia, immagine molto nitida e digitale; Canon = resa colore morbida e pelle piacevole (opinione diffusa [S], non verificata).
- **Quando:** contenuti verticali, UGC, backstage, riprese in luoghi dove una camera grande non entra.
- **Higgsfield:** `shot on a smartphone, deep depth of field, sharp digital image, vertical 9:16, available light` . Modello: i look «smartphone» e UGC sono previsti dalla skill nel Marketing Studio [V per l'esistenza dei preset UGC]; la resa è [I].
- **Errore comune:** pretendere il look cinematografico da uno smartphone senza controllare luce e ottiche.

#### Gamma dinamica e latitudine
- **Cos'è:** gamma dinamica = rapporto fra il segnale massimo e il rumore del sensore, espresso in stop (1 stop = raddoppio della luce); latitudine = intervallo utilizzabile in cui si può esporre mantenendo dettaglio. Valori dichiarati: 17 stop (ALEXA 35, ARRI [P]), 15 stop (ALEXA 265, ARRI [P]), 17+ stop (RED V-RAPTOR [X] [P]), 16 stop (Sony VENICE 2 e Burano [P], Canon C400 [P], Blackmagic URSA Cine / PYXIS 12K [P]). I numeri dichiarati dai costruttori non sono confrontabili tra loro senza lo stesso metodo di misura (std).
- **Si vede:** alte luci che non bruciano bruscamente, nero con dettaglio; in una scena di 14 stop non si perde nulla, in una di 20 qualcosa sì.
- **Quando:** controluce, finestre, interni con esterno visibile.
- **Higgsfield:** `highlights rolling off gently, detail retained in both window and interior`. Modello: [I] i modelli tendono al contrasto «HDR»: se il risultato è piatto, chiedere `deeper blacks`.
- **Errore comune:** usare i stop dichiarati come garanzia di esposizione corretta.

#### RAW, log e codec
- **Cos'è:** RAW = dati del sensore non ancora trasformati in colore (esempio Blackmagic RAW [P]); log = curva che comprime la gamma dinamica in un file leggibile (LogC4 per ALEXA 35 [P]); codec = formato di compressione (ProRes, X-OCN per VENICE 2 [P]) (std).
- **Si vede:** il log appare grigio e senza contrasto fino al grading; il RAW dà più margine di correzione.
- **Quando:** RAW/log per cinema e spot con post; codec leggeri per notizie, sociale.
- **Higgsfield:** `flat log-style image` è una scelta di look per un grading successivo (vedi `tecnica-cinema-vfx-colore.md`). Modello: [I].
- **Errore comune:** consegnare il log come finale.

**Fonti sezione 4:** ARRI, pagine ALEXA 35 / Xtreme (arri.com), 2026-11-08 [P]; Sony, sony-cinematography.com/venice2, 2026-11-08 [P]; Blackmagic Design, pagina cameras (blackmagicdesign.com), 2026-11-08 [P]; verifica 2026-11-08, tutte lette: ARRI Mini LF e ALEXA 265 (arri.com/en/cine-systems), RED V-RAPTOR [X] (red.com, via r.jina.ai), Sony Burano (pro.sony, via r.jina.ai), Sony VENICE 2 incluso 6K 500/2500 (sony-cinematography.com/venice2), Canon EOS C400 (canon-europe.com e usa.canon.com lette in Chrome vero il 2026-11-08; curl 403; snapshot Wayback 2026-07-20 solo per confronto), Apple iPhone 18 Pro (apple.com). Da verificare: il modello RED V-RAPTOR originale (non [X]) e la larghezza esatta dell'area Super 35 per ogni camera.

---

## 5. Pellicola

Kodak: ogni scheda letta il 2026-11-08 su kodak.com/en/motion/product/camera-films [P]. I numeri di emulsione sono 35 mm / 16 mm.

| Pellicola | Codice 35 / 16 | Bilanciamento | Filtro diurno suggerito da Kodak [P] |
|---|---|---|---|
| VISION3 50D | 5203 / 7203 | luce diurna | nessuno (ND: nessuno-.6) |
| VISION3 250D | 5207 / 7207 | luce diurna | nessuno (ND .9) |
| VISION3 200T | 5213 / 7213 | tungsteno | 85 (ND .6-.9) |
| VISION3 500T | 5219 / 7219 | tungsteno | 85 (ND .9) |
| DOUBLE-X (b/n) | 5222 / 7222 | b/n | n/d; EI 200 in tungsteno (3.200 K), 250 in luce diurna [P: Kodak H-1-5222, marzo 2026] |

#### 35 mm
- **Cos'è:** pellicola larga 35 mm, formato storico del cinema; il fotogramma standard occupa 4 perforazioni in altezza (4-perf), esiste anche 3-perf per risparmiare pellicola. Aree di cattura secondo Kodak: 4-perf 24,90 x 18,70 mm; 3-perf 24,90 x 13,90 mm (25% di pellicola e sviluppo in meno, durata del rullo +33%); 2-perf 24,90 x 9,35 mm (metà pellicola, durata doppia, «native 2.35 aspect ratio»); 8-perf VistaVision (pellicola 35 mm trasportata in orizzontale) 37,72 x 24,92 mm; un rullo da 400 ft (122 m) a 24 fps dura 4 min 26 s in 4-perf, 5 min 55 s in 3-perf, 8 min 53 s in 2-perf [P: Kodak, «Film Formats for Every Look and Budget» / «Why Film?», PDF 2024, kodak.com/content/products-brochures/Film/Film-Format-Choices-Infographic.pdf, letto per testo e impaginazione 2026-11-08]. «Super 35» è la stessa area 4-perf: Kodak la chiama «The Standard 35mm Format»; il nome «Super 35» non compare nel PDF. SMPTE 59-1998 (stabile, «In Force») conferma e dà le aperture di camera: stile A (4-perf, sonoro non anamorfico, formato Academy) 22,0 x 16,0 mm; stile B (4-perf anamorfico) 22,0 x 18,59 mm; stile C (4-perf, «full-frame», senza traccia audio) 24,92 x 18,67 mm; stile D (3-perf) 24,92 x 13,87 mm [P: pub.smpte.org/pub/st59/st0059-1998_stable2015.pdf, letto 2026-11-08]. Kodak (24,90 x 18,70; 24,90 x 13,90) e SMPTE (24,92 x 18,67; 24,92 x 13,87) differiscono di 0,02-0,03 mm: arrotondamento.
- **Si vede:** grana organica, resa dei toni alti morbida, colore con una sua densità.
- **Quando:** film, spot ad alto valore, look «reale» senza dichiararsi vintage.
- **Higgsfield:** `shot on 35mm film, fine organic grain, soft highlight roll-off, natural colour`. Modello: la skill elenca nel vocabolario voci di stock e supporto (Super 8MM, VHS, Portra, Vision3 500T) [V]; la fedeltà è [I].
- **Errore comune:** grana digitale uniforme sovrapposta: la grana vera varia con la densità.

#### 16 mm e Super 8
- **Cos'è:** 16 mm = pellicola di formato ridotto (esiste Super 16 con più area); Super 8 = formato amatoriale su cartuccia (std). Aree di cattura secondo Kodak: Super 16 12,42 x 7,44 mm (400 ft a 24 fps = 11 min 06 s; Kodak indica nel disegno i rapporti 1,66, 1,78 e 1,85); Super 8 gate normale 5,79 x 4,01 mm, gate esteso 6,30 x 4,2 mm (50 ft = 3 min 20 s a 18 fps, 2 min 30 s a 24 fps) [P: Kodak, PDF «Film Formats for Every Look and Budget», letto 2026-11-08]. SMPTE 201M-1996 («type W», cioè il Super 16 per l'ingrandimento a 35 mm 1,66:1 o più largo) dà 12,35 x 7,42 mm [P: pub.smpte.org/pub/st201/st0201-1996_stable2015.pdf, letto 2026-11-08]: 0,07 mm più stretto e 0,02 più basso del valore Kodak (le due fonti discordano di poco; non so se per metodo di misura). 16 mm normale (non Super): apertura di camera 10,26 x 7,49 mm (0,404 x 0,295 in; rapporto 1,37), con emulsione verso l'obiettivo; la stessa norma fissa a 24 fps la cadenza standard di ripresa, ammettendo 24, 25 o 30 fps per la televisione [P: SMPTE ST 7-2004, stabile, pub.smpte.org/pub/st7/st0007-2004_stable2015.pdf, letto con PDFKit 2026-11-08]. Kodak: il 16 mm normale ha lo stesso rapporto dell'Academy 35 mm, il Super 16 ha la stessa altezza ma si allarga nell'area delle perforazioni, rapporto nativo 1,66:1 [P: Kodak Essential Reference Guide 2012, pp. 43-44].
- **Si vede:** 16 mm = grana evidente, immagine grezza ma elegante; Super 8 = grana spessa, instabilità, colori caldi, vignettatura.
- **Quando:** memoria, nostalgia, backstage, mondo indie; Super 8 per «filmino di famiglia».
- **Higgsfield:** `shot on 16mm film, visible grain, slightly soft, warm natural colour` / `Super 8MM home-movie look, heavy grain, gate weave, light leaks`. Modello: Super 8MM è nel vocabolario della skill [V]; l'intensità della grana è [I].
- **Errore comune:** Super 8 per un'emozione «romantica» in ogni brief: è diventato cliché.

#### 65/70 mm e IMAX 15/70
- **Cos'è:** negativo da 65 mm (proiezione su 70 mm), 5 perforazioni per fotogramma; IMAX 15/70 = 65 mm con 15 perforazioni orizzontali per fotogramma, proiezione a 1,43:1. Misure: 65 mm 5-perf, apertura di camera 52,48 x 23,01 mm [P: SMPTE ST 215-1995, stabile, pub.smpte.org/pub/st215/st0215-1995_stable2015.pdf, letto 2026-11-08; Kodak: 52,15 x 23,07 mm, PDF Film Formats 2024]; 15/70, apertura di camera 70,41 x 51,61 mm (2,772 x 2,032 in; rapporto del fotogramma 1,36), passo perforazioni 0,1866 in, 24 fps standard [P: SMPTE ST 417M-2005, pub.smpte.org/pub/st417/st0417-2005_stable2015.pdf, letto 2026-11-08]. **Tre fonti discordano sull'altezza del fotogramma IMAX:** SMPTE 51,61 mm; Kodak 56,62 mm (con l'etichetta «1.41», incoerente con le sue stesse misure: 70,41/56,62 = 1,24); fonti secondarie web 52,63 mm (cinematography.net, GCM Studio [S], solo in snippet di ricerca, non aperte). Si usa il valore SMPTE. Il rapporto 1,43:1 è quello della proiezione, non del fotogramma di camera. Un rullo IMAX da 1.000 ft a 24 fps dura 2 min 57 s [P: Kodak].
- **Si vede:** enorme dettaglio, quasi assenza di grana percepibile, campo ampio e immersivo.
- **Quando:** paesaggi, eventi, set-piece, opere di grande impatto.
- **Higgsfield:** `shot on 65mm large format film, extreme clarity, vast sense of scale, 1.43:1 IMAX framing`. Modello: 1,43:1 non è un rapporto d'uscita dei modelli (vedi sezione 6) [V per l'enum]; la sensazione di scala è un tema in cui Seedance 2.0 è indicato nel model-guide [V].
- **Errore comune:** attendersi un'immagine identica alla pellicola 65 mm da un rapporto 16:9.

#### Kodak VISION3 50D e 250D (diurne)
- **Cos'è:** negativi colore a luce diurna; la 50D è la meno sensibile e a grana più fine, la 250D è più sensibile (nome = sensibilità nominale) (std dal nome; lettura Kodak per il filtro suggerito [P]).
- **Si vede:** 50D = colori puliti, grana minima, sole; 250D = più versatile fra interno luminoso ed esterno.
- **Quando:** esterni, luce piena, look pulito.
- **Higgsfield:** `daylight-balanced 35mm negative film, clean saturated colour, fine grain`. Modello: [I].
- **Errore comune:** usare una pellicola a luce diurna con luce tungsteno senza filtro 80A/correzione.

#### Kodak VISION3 200T e 500T (tungsteno)
- **Cos'è:** negativi bilanciati a 3.200 K; la 200T è descritta da Kodak con «image structure of a 100 speed film with the versatility of a 200 speed»; la 500T è la più sensibile e ha la Dye Layering Technology, che secondo Kodak riduce la grana nelle ombre [P: kodak.com, 2026-11-08]. In esterno si usa il filtro 85 per correggere (Kodak [P]).
- **Si vede:** 200T = granulosità contenuta, nitidezza; 500T = grana più visibile, buon rendimento in bassa luce, colore versatile.
- **Quando:** interni, notte, luci miste, look «classico»; 500T è la scelta per notti urbane.
- **Higgsfield:** `shot on Vision3 500T, tungsten-balanced, visible fine grain, warm practicals, rich shadows`. Modello: Vision3 500T è nel vocabolario della skill [V]; il modello usa il nome come tendenza cromatica [I].
- **Errore comune:** usare la 500T senza il filtro 85 in esterno e trovare tutto blu.

#### Kodak DOUBLE-X (b/n)
- **Cos'è:** negativo bianco e nero 5222/7222 per luce bassa e profondità di campo [P: Kodak descrive uso con poca luce e maggiore profondità di campo, 2026-11-08]. EI 200 in tungsteno (3.200 K) e 250 in luce diurna, per sviluppo a gamma 0,65; indici da usare con esposimetro a luce incidente o riflessa, o su cartoncino grigio al 18% [P: Kodak, «EASTMAN DOUBLE-X Negative Film 5222/7222 Technical Data», pubbl. H-1-5222, marzo 2026, kodak.com/content/products-brochures/motion-picture/EASTMAN-DOUBLE-X-technical-information.pdf, letto con PDFKit 2026-11-08; link trovato con Chrome vero sulla pagina prodotto].
- **Si vede:** grana espressiva, neri densi, tonalità ricche di grigi.
- **Quando:** flashback, documentario, look senza tempo, prodotti iconici.
- **Higgsfield:** `black and white 35mm film, rich blacks, visible grain, wide tonal range`. Modello: [I].
- **Errore comune:** desaturare un'immagine a colori: non è b/n vero (il contrasto per canale differisce).

#### Grana e alone (halation)
- **Cos'è:** grana = particelle d'argento o coloranti che formano l'immagine, di dimensione crescente con la sensibilità; halation = alone rosso-arancio attorno alle alte luci, dovuto alla luce che attraversa l'emulsione e si riflette sul supporto. Kodak: la luce riflessa dal supporto dà una seconda esposizione attorno agli oggetti luminosi, che riduce la nitidezza; lo strato antihalation (remjet, sottostrato o supporto colorato) serve a impedirla [P: Kodak, «The Essential Reference Guide for Filmmakers», PDF 2012, snapshot Wayback di motion.kodak.com, letto con PDFKit 2026-11-08, p. 31]. Il colore rosso-arancio dell'alone non è descritto nella pagina: std.
- **Si vede:** grana che «vibra» in ombre e mezzitoni; alone caldo sulle luci nel buio (lampade, neon, finestre).
- **Quando:** per un look organico; notte con luci pratiche.
- **Higgsfield:** `film grain, soft red-orange halation glowing around bright practical lights`. Modello: «Halation Diffusion» è una voce del menu ottiche del Cinema Studio [V]; nel prompt libero è [I], tende a diventare bagliore generico.
- **Errore comune:** halation troppo estesa su tutta l'immagine: diventa un filtro «dream».

#### Push, pull, sviluppo e bleach bypass
- **Cos'è:** push = si espone a una sensibilità nominale più alta e si sviluppa più a lungo (+1 stop: per esempio 500T esposta a EI 1000); pull = il contrario; bleach bypass = si salta (parzialmente o totalmente) il passaggio di sbiancamento nel laboratorio, trattenendo l'argento (std).
- **Si vede:** push = più grana e contrasto, neri densi; pull = grana ridotta, contrasto più dolce; bleach bypass = bassa saturazione, alto contrasto, grana metallica. Esempio (uso interno): per Salvate il soldato Ryan Kamiński ha desaturato i colori con l'ENR di Technicolor (processo di ritenzione dell'argento, parente del bleach bypass) al 70%, e ha fatto togliere i trattamenti antiriflesso a una serie di Panavision Ultraspeed per un'immagine «foggy but still sharp» [P: theasc.com/article/saving-private-ryan-cinematography-kaminski (articolo di American Cinematographer, agosto 1998, ripubblicato dall'ASC), letto in Chrome vero 2026-11-08].
- **Quando:** push per notte e atmosfera sporca; bleach bypass per guerra, polizieschi, mondi desaturati.
- **Higgsfield:** `pushed one stop, grainy and contrasty, crushed shadows` / `bleach bypass look, desaturated, high contrast, silvery highlights`. Modello: [I] spesso si ottiene una semplice desaturazione.
- **Errore comune:** scambiare bleach bypass con filtro bianco e nero a basso contrasto.

**Fonti sezione 5:** Kodak, schede VISION3 50D, 250D, 200T, 500T e DOUBLE-X, kodak.com/en/motion/product/camera-films, 2026-11-08 [P]. Verifica 2026-11-08, tutte lette [P]: Kodak «Film Formats for Every Look and Budget» (PDF 2024); Kodak DOUBLE-X Technical Data H-1-5222 (marzo 2026, EI 200/250); Kodak «The Essential Reference Guide for Filmmakers» (PDF 2012, snapshot Wayback; il «Student Filmmaker's Handbook» non è più su kodak.com né in Wayback con gli URL provati); SMPTE ST 7 (16 mm), ST 59 (35 mm), ST 201 (Super 16), ST 215 (65 mm), ST 417 (15/70 IMAX) su pub.smpte.org (PDF stabili gratuiti, non a pagamento). Restano aperti: l'altezza del fotogramma IMAX (SMPTE e Kodak discordano, si usa SMPTE); il colore rosso-arancio dell'halation e le definizioni di push/pull/bleach bypass (std). ARRI Format & Lens Calculator: l'URL arri.com/…/format-lens-calculator dà 404 in Chrome vero (2026-11-08); non usato, le norme SMPTE bastano.

---

## 6. Formati e aspect ratio

L'aspect ratio finale è larghezza / altezza. Ricordare: i modelli generativi hanno un elenco chiuso di rapporti d'uscita per modello; gli altri rapporti sono solo un'etichetta di look nella linea «Look» [V: HARD RULE 7 della skill higgsfield e vocab.md]. Nel catalogo dell'istantanea 2026-09-26: Kling 3.0 = 16:9, 9:16, 1:1; Seedance 2.0 e 2.5 includono 21:9; Veo 3.1 = 16:9, 9:16; FLUX 3 Video include 2:1 [V: model-guide.md / specs, istantanea da riverificare].

| Rapporto | Valore | Uso | Output possibile nei modelli [V, istantanea 2026-09-26] |
|---|---|---|---|
| 1,33:1 (4:3) | 1,33 | Cinema muto, TV storica, look archivio | **4:3 nativo** in Seedance 1.5/2.0/2.5, FLUX 3 Video, Wan 2.7/3.0, MiniMax H3, Cinema Studio video; non in Kling e Veo [V: specs/model-specs.json, istantanea 2026-09-26, controllato 2026-11-08; corretto: prima «solo come look»] |
| 1,66:1 | 1,66 | Europa storica | solo come look |
| 1,85:1 | 1,85 | Cinema «piatto» standard | solo come look (16:9 = 1,78 è il più vicino) |
| 2,00:1 | 2,00 | Streaming e serie | FLUX 3 Video (2:1) |
| 2,39:1 | 2,39 | Cinemascope | 21:9 = 2,33 (Seedance) è il più vicino; il resto è look |
| 1,43:1 | 1,43 | IMAX 15/70 | solo come look |
| 9:16 | 0,5625 | Verticale social | tutti i modelli video del catalogo, Seedance compreso [V: specs/model-specs.json, controllato 2026-11-08] |
| 4:5 | 0,80 | Feed | nessun modello **video** del catalogo; sì nei modelli immagine (Nano Banana / 2 / Pro, GPT Image 2.5, Cinema Studio Image 2.5, Marketing Studio Image, Recraft V4.1) [V: specs/IMAGE-MODEL-SPECS.md, controllato 2026-11-08] |

#### 1,33 e 1,37:1
- **Cos'è:** il rapporto classico del cinema muto e poi del formato Academy (1,37), vicino al 4:3 della TV storica. Kodak: 1,37:1 è rimasto lo standard del 35 mm dall'arrivo del sonoro all'introduzione del CinemaScope nel 1953; 1,33:1 è il 4:3 della TV, basato sull'1,37, ed è anche il rapporto del 16 mm normale e del Super 8 [P: Kodak, «The Essential Reference Guide for Filmmakers», PDF 2012, snapshot Wayback di motion.kodak.com, letto con PDFKit 2026-11-08, pp. 37 e 44].
- **Si vede:** inquadratura quasi quadrata, volti ritti, poco spazio laterale.
- **Quando:** intimità, memoria, look archivio o ritratto.
- **Higgsfield:** `1.33:1 academy framing, near-square composition, vertical subjects`. Modello: 1,33 coincide con il 4:3, rapporto d'uscita nativo di Seedance, FLUX 3 Video, Wan 2.7/3.0 (non di Kling e Veo); 1,37 resta solo look, da ottenere con 4:3 e barre in post [V: specs/model-specs.json, controllato 2026-11-08].
- **Errore comune:** richiederlo come output e ricevere un 16:9 allargato.

#### 1,66 e 1,85:1
- **Cos'è:** rapporti «piatti» europei (1,66) e americani (1,85); 1,66 è più stretto del 16:9 (1,78), 1,85 un po' più largo (corretto: prima «poco più larghi del 16:9» per entrambi). Kodak: negli Stati Uniti i due rapporti di proiezione 35 mm sono 1,85:1 («flat», ottenuto tagliando sopra e sotto l'1,37) e 2,40:1 («scope»); 1,66:1 è comune in Europa perché è il rapporto nativo del Super 16 [P: Kodak, «The Essential Reference Guide for Filmmakers», PDF 2012, snapshot Wayback di motion.kodak.com, letto con PDFKit 2026-11-08, pp. 37-38 e 43].
- **Si vede:** respiro naturale, nessuna deformazione anamorfica.
- **Quando:** film d'autore e drammatici, spot sobri.
- **Higgsfield:** `1.85:1 flat widescreen framing`; output reale: 16:9. Modello: [V per l'enum].
- **Errore comune:** confondere rapporto e anamorfico.

#### 2,39:1 (scope) e 2,00:1
- **Cos'è:** 2,39:1 = formato anamorfico cinematografico (storicamente 2,35, 2,40 in uso); 2,00:1 (Univisium) = formato intermedio comune sui servizi di streaming (std; non verificato su fonte primaria: né Kodak né SMPTE lo nominano nei documenti letti). Kodak: il 2,40:1 deriva dal 2,35:1 del CinemaScope (ottiche anamorfiche in ripresa e in proiezione), poi portato a 2,40:1 [P: Kodak, «The Essential Reference Guide for Filmmakers», PDF 2012, snapshot Wayback di motion.kodak.com, letto con PDFKit 2026-11-08, p. 38]. Per il 2,39: SMPTE 195-2000 stile B (copia anamorfica) dà un'area proiettabile di 20,96 x 17,53 mm (rapporto 1,196 compresso: x 2 di desqueeze = 2,39, calcolo mio) [P: pub.smpte.org/pub/st195/st0195-2000.pdf, letto 2026-11-08]; Kodak indica il 2,35 come rapporto nativo del 2-perf (24,90 x 9,35 mm) [P: PDF Film Formats]. «2,39» come nome d'uso non è in questi documenti; Kodak usa «2.40:1».
- **Si vede:** 2,39 = orizzontalità, ambienti ampi, volti in primo piano con grande aria; 2,00 = compromesso fra 16:9 e scope.
- **Quando:** epica, paesaggio, cinema; 2,00 per serie.
- **Higgsfield:** `2.39:1 anamorphic widescreen, cinematic letterbox` . Modello: il rapporto d'uscita reale più vicino è 21:9 (2,33) con Seedance [V]; 2.39:1 resta una parola di look nella linea Look [V].
- **Errore comune:** chiedere 2.39:1 con un modello che accetta solo 16:9: si ottengono barre nere dipinte nell'immagine.

#### IMAX 1,43:1
- **Cos'è:** rapporto quasi quadrato del 15/70 IMAX (Kodak: «IMAX, which is 1.43:1»; il 70 mm normale è 2,2:1 [P: Kodak, «The Essential Reference Guide for Filmmakers», PDF 2012, snapshot Wayback di motion.kodak.com, letto con PDFKit 2026-11-08, p. 39]); esiste anche un formato IMAX digitale più largo, 1,90:1. IMAX: «In IMAX theatres featuring 15 perf / 70mm film, these scenes will expand images up to a 1.43:1 aspect ratio» [P: imax.com/news/oppenheimer-in-imax-70mm, letto in Chrome vero 2026-11-08; curl 403]; «Filmmakers shoot specifically with IMAX's 1.90:1 or 1.43:1 aspect ratios in mind, using expanded scenes that open vertically to fill the entire IMAX screen» [P: imax.com/en/us/filmed-for-imax, letto 2026-11-08]. Misure del fotogramma di pellicola: vedi sezione 5 (SMPTE ST 417).
- **Si vede:** altezza verticale gigantesca, immersione.
- **Quando:** scene spettacolari e verticali (montagne, skyline).
- **Higgsfield:** `1.43:1 tall IMAX framing`. Modello: solo look [V].
- **Errore comune:** ritagliare un 16:9 per fingere un 1,43.

#### 9:16 e 4:5 (verticale)
- **Cos'è:** 9:16 = schermo verticale a tutto schermo; 4:5 = feed verticale ridotto (std).
- **Si vede:** composizione centrata e alta; testo e volto nella zona sicura (area non coperta dall'interfaccia).
- **Quando:** reel, short, storie; 4:5 per feed.
- **Higgsfield:** `vertical 9:16 composition, subject centred with headroom, safe area for captions`. Modello: 9:16 è nativo in tutti i modelli video del catalogo, Seedance compreso; 4:5 solo nei modelli immagine [V: specs/model-specs.json e IMAGE-MODEL-SPECS.md, istantanea 2026-09-26, controllati 2026-11-08].
- **Errore comune:** girare in 16:9 e ritagliare in verticale: si perde la composizione.

#### Open gate e desqueeze
- **Cos'è:** open gate = si registra l'intera area attiva del sensore, senza ritaglio: ALEXA 35 ha una modalità Open Gate 4,6K 3:2 [P]; Canon C400 lo chiama «Full Frame 3:2 Open Gate» [P: usa.canon.com, letto 2026-11-08]; desqueeze = ripristino della larghezza dell'immagine anamorfica. Fattori: Canon C400 supporta 2,0x / 1,8x / 1,3x [P: canon-europe.com, tabella specifiche, 2026-11-08]; il «1,5x» scritto prima non è su quella pagina (resta std, non verificato).
- **Si vede:** open gate = più immagine per il reframing; desqueeze = proporzioni corrette da un'immagine «stretta».
- **Quando:** riprese pensate per più formati (cinema + verticale); anamorfico con sensori più alti.
- **Higgsfield:** non traducibile come prompt: è una decisione di ripresa e post. Modello: [I].
- **Errore comune:** dimenticare il desqueeze e consegnare volti stretti.

**Fonti sezione 6:** ARRI, ALEXA 35 [P]; skill higgsfield, HARD RULE 7, vocab.md, model-guide.md (rapporti per modello, istantanea 2026-09-26) [P per la skill]; valori storici dei rapporti (1,33, 1,37, 1,66, 1,85, 2,35/2,40, 2,2, 1,43): Kodak, «The Essential Reference Guide for Filmmakers», PDF 2012, snapshot Wayback di motion.kodak.com, letto con PDFKit 2026-11-08 [P]; SMPTE ST 59, 195, 201, 215, 417 (pub.smpte.org, PDF stabili gratuiti) [P], letti 2026-11-08; rapporti d'uscita dei modelli: specs/model-specs.json e IMAGE-MODEL-SPECS.md della skill higgsfield, controllati 2026-11-08 [V]. Resta std: 2,00:1 Univisium.

## 7. Obiettivi

Verifica 2026-11-08: le pagine ufficiali di Cooke, Zeiss (ARRI/ZEISS Master Prime), Panavision, ARRI Signature e Leitz sono state aperte e lette; le righe della tabella marcate [P] riportano come il costruttore descrive la propria ottica (è linguaggio di marketing: il costruttore dice «cosa vuole farti vedere», non una misura). Le righe senza [P] restano std/da verificare. Il carattere reale si verifica con un test di ripresa prima di prometterlo a un cliente.

#### Focale e prospettiva
- **Cos'è:** l'angolo di campo dipende dalla focale f e dalla larghezza w del sensore: AOV orizzontale = 2·atan(w / 2f). Per sensore full frame (w = 36 mm): 18 mm = 90°; 24 mm = 73,7°; 35 mm = 54,4°; 50 mm = 39,6°; 85 mm = 23,9°; 135 mm = 15,2° (calcolo mio, formula std). Su Super 35 (più stretto) gli angoli sono minori, quindi servono focali più corte per lo stesso campo. La prospettiva (rapporto fra primi piani e sfondo) dipende dalla distanza della camera dal soggetto, non dalla focale: la focale decide quanto si inquadra a quella distanza.
- **Si vede:** corte (14-24 mm) = spazio esteso, linee che convergono, volti deformati da vicino; medie (35-50 mm) = rapporto naturale; lunghe (85-200 mm) = piani compressi, sfondo ingrandito, isolamento.
- **Quando:** corto per ambienti e movimento; medio per dialogo; lungo per intimità e osservazione a distanza.
- **Higgsfield:** `wide 24mm lens, expansive space, slight perspective stretch` / `85mm portrait lens, compressed background, flattering facial proportions` / `200mm telephoto compression, stacked layers`. Modello: nel Cinema Studio la focale è un menu (8/14/35/50/75 mm) [V]; nel prompt libero l'effetto è [I]. Per volti da vicino i grandangoli deformano come nella realtà, ma i modelli tendono a correggere i volti.
- **Errore comune:** credere che la focale lunga «avvicini» il soggetto senza cambiare la prospettiva: è la distanza che la cambia.

| Focale (full frame) | AOV orizzontale | Effetto |
|---|---|---|
| 18 mm | 90° | spazio estremo, deformazione ai bordi |
| 24 mm | 73,7° | ambiente, ampio |
| 35 mm | 54,4° | naturale, reportage |
| 50 mm | 39,6° | neutro |
| 85 mm | 23,9° | ritratto, isolamento |
| 135 mm | 15,2° | compressione forte |

#### Sferiche e anamorfiche
- **Cos'è:** sferica = ottica con simmetria circolare, immagine con le proporzioni del sensore; anamorfica = ottica con elementi cilindrici che comprimono l'immagine in orizzontale (fattore tipico 2x, ma esistono 1,3x e 1,5x per sensori più larghi o alti) e richiedono il desqueeze (std).
- **Si vede:** anamorfica = flare orizzontali (spesso azzurri, dipende dai trattamenti), bokeh ovale (verticale), leggera distorsione a barilotto, campo orizzontale più ampio con la stessa altezza; sferica = flare circolari, bokeh tondo.
- **Quando:** anamorfica per «sapore cinema» e panoramiche; sferica per pulizia, prodotto, spazio stretto.
- **Higgsfield:** `shot on anamorphic lenses, horizontal blue lens flare streaks, oval bokeh, mild barrel distortion, 2.39:1 widescreen look` / `spherical prime lenses, round bokeh, clean flares`. Modello: Compact Anamorphic e Classic Anamorphic sono opzioni del menu ottiche del Cinema Studio [V]; nei prompt liberi lo streak orizzontale è tendenza ma spesso eccessiva [I]. 2.39:1 qui è parola di look, non rapporto d'uscita [V].
- **Errore comune:** flare azzurro su ogni luce, anche quando non ci sono sorgenti forti in quadro.

**Set di ottiche e carattere (tabella di confronto)**

| Set | Carattere | Fonte |
|---|---|---|
| Cooke S4/i (T2-T22, 12-300 mm, Super 35, PL) | Cooke descrive il «Cooke Look» come «sharp, subtle, smooth rendering» con dimensionalità, alto contrasto, visuali «warm and natural» | [P] cookeoptics.com, The Cooke Look e S4/i S35, letti 2026-11-08 |
| Cooke S4 FF/i (T2, 18-100 mm, full frame) | calore leggero, falloff di contrasto dolce, bokeh molto circolare a tutta apertura (a bordo quadro «cat's eye»), diaframma a 9 lame curve | [P] cookeoptics.com, S4 FF/i, letto 2026-11-08 |
| Cooke Panchro/i Classic (T2.2; S35 e FF, 12 ottiche 18-152 mm) | rifacimento moderno delle Speed Panchro anni '20-'60: «look» Speed Panchro, controllo di flare, distorsione e aberrazione sferica a tutta apertura | [P] cookeoptics.com, Panchro/i Classic S35 e FF, letti 2026-11-08 |
| ARRI/ZEISS Master Prime (T1.3-T22, 12-150 mm) | alta velocità, risoluzione «superiore a tutte le prime di velocità standard», pressoché senza focus breathing (Dual Floating Elements); angoli di campo dichiarati per l'apertura ANSI Super 35 (24,9 x 18,7 mm) | [P] zeiss.com, ARRI/ZEISS Master Prime, letta 2026-11-08 |
| Zeiss Super Speed | più morbide e luminose (std) | da verificare (pagina Zeiss non cercata per le Super Speed) |
| Panavision C-Series (anamorfiche, dal 1968, 9 focali, T2.3 la più luminosa) | profondità di campo graduale, flare anamorfico «pronunciato», bokeh gradevole, «sensazione organica» rispetto alle ottiche moderne «sterili» | [P] panavision.com, C Series, letta 2026-11-08 |
| Panavision E-Series (dagli anni '80, 9 focali, T2-T2.8) | look pulito «senza essere troppo clinico o troppo nitido»; flare orizzontali blu puliti, lieve distorsione a barilotto sui grandangoli | [P] panavision.com, E Series, letta 2026-11-08 |
| Panavision G-Series (dal 2007, 8 focali, T2.6 tipico) | alto contrasto, alta risoluzione, resistenza ai riflessi, breathing minimo; «otticamente paragonabili» alle Primo Anamorphic in formato compatto | [P] panavision.com, G Series, letta 2026-11-08 |
| Panavision Primo 65 (T2 tipico, 12 focali, attacco SP70) | «look» Primo spherical 35 mm esteso a sensori 65 mm; pulito, ad alto contrasto, «senza essere troppo nitido o clinico» | [P] panavision.com, Primo 65, letta 2026-11-08 |
| ARRI Signature Prime (12-280 mm; T1.8 fino a 150 mm, T2.5 il 200 mm, T2.8 il 280 mm) | ARRI scrive: «Warm, smooth skin; open shadows with crisp blacks; and bokeh like looking through a window in the rain» | [P] arri.com, Signature Prime, letta 2026-11-08 |
| Leitz Summilux-C (12 focali 16-135 mm, T1.4, Super 35) | Leitz: compatte e luminose, «rich, warm skin tones and gentle focus roll off», quasi nessuna distorsione, cerchio d'immagine maggiore del Super 35 | [P] leitz-cine.com, Summilux-C, letta 2026-11-08 |
| Leitz Thalia 65 (11 focali) | derivate dalle ottiche Leica S: aberrazioni e curvatura di campo volute, iris circolare a tutte le aperture, copertura fino ad ALEXA 65; la Thalia 65 T-90 mm si basa su un disegno Leica Thambar del 1935, con morbidezza «dreamy» | [P] leitz-cine.com, Thalia, letta 2026-11-08 |
| Canon K35 | anni '70, morbide, alone caldo, basso contrasto, flare | std, da verificare |
| Petzval | bokeh vorticoso, nitido al centro (std) | std |
| Vintage rehoused | ottiche storiche in montatura moderna, con difetti conservati | std |

#### Cooke, Zeiss e Panavision (carattere)
- **Cos'è:** tre famiglie di riferimento. «Cooke look»: Cooke lo definisce «sharp, subtle, smooth rendering» con dimensionalità e alto contrasto, ottiche tarate per immagini «warm and natural»; la pagina cita anche una citazione di Ed Lachman, ASC, su Erin Brockovich («balanced colour and smooth contrast») [P: cookeoptics.com/cooke-look, letta 2026-11-08]. Zeiss: la pagina Master Prime insiste su velocità (T1.3), risoluzione e assenza di breathing, non sul «neutro» (la parola «neutro» resta lettura di mestiere, std). Panavision: ottiche proprietarie; la pagina Panavision dice «Contact Us for Availability», cioè solo su contatto (la formula «a noleggio» è std, non riportata dalla pagina).
- **Si vede:** Cooke = volti piacevoli e leggermente caldi; Zeiss Master Prime = neutro e dettagliato; Panavision C = anamorfico vintage con aberrazioni.
- **Quando:** Cooke per ritratto e narrazione; Zeiss neutro per VFX e commerciale; Panavision per epica.
- **Higgsfield:** `warm creamy focus falloff, flattering skin, gentle contrast` / `clean neutral sharp optics, high micro-contrast` / `vintage anamorphic character, flares and edge softness`. Modello: voci Vintage Prime, Warm Cinema Prime, Clinical Sharp Prime, 70s Cinema Prime nel menu [V]; il testo libero è [I].
- **Errore comune:** attribuire il «Cooke look» solo alla lente: pesano luce, sensore, grading.

#### Macro, probe, tilt-shift/swing
- **Cos'è:** macro = riproduzione 1:1 o simile, distanza minima di fuoco molto corta; probe = lente allungata e sottile che entra in spazi stretti; tilt-shift / swing = inclinazione del piano focale (o spostamento della lente) per cambiare la zona a fuoco o correggere le linee verticali (std).
- **Si vede:** macro = dettagli giganti con fuoco sottilissimo; probe = prospettive impossibili; tilt = fuoco a fetta (look «miniatura»); swing/rotazione = fuoco che taglia obliquamente.
- **Quando:** macro per prodotto, cibo, texture; probe per interni di oggetti e cibo; tilt per effetti onirici o miniatura.
- **Higgsfield:** `extreme macro, razor-thin focus plane, tiny details huge in frame` / `tilt lens with a diagonal slice of sharpness, miniature-world look`. Modello: «Creative Tilt Lens» è una voce del menu del Cinema Studio [V]; il macro nei modelli è facile [I].
- **Errore comune:** richiedere profondità di campo in un macro: fisicamente quasi assente.

#### Split diopter
- **Cos'è:** mezza lente addizionale davanti all'obiettivo, che permette il fuoco simultaneo su un soggetto vicino e uno lontano, con una linea di transizione sfocata (std).
- **Si vede:** due piani a fuoco in un solo quadro, con una linea netta o morbida al centro.
- **Quando:** dialogo con due personaggi a distanze diverse, tensione, sguardi.
- **Higgsfield:** `split-focus composition, foreground subject and distant subject both sharp, soft blurred dividing line`. Modello: [I] i modelli faticano a mantenere i due piani a fuoco.
- **Errore comune:** aspettarsi che la linea di giunzione sia invisibile.

#### Zoom contro prime
- **Cos'è:** zoom = focale variabile; prime = focale fissa (std).
- **Si vede:** prime = più luminosi e con carattere; zoom = comodità, ma meno luminosità e un look «televisivo»; lo zoom in ripresa è diverso dal dolly (cambia il campo senza cambiare la prospettiva).
- **Quando:** zoom per documentario e sport; prime per dramma e pubblicità.
- **Higgsfield:** `slow optical zoom in, perspective unchanged, background growing larger` (vs) `dolly in, parallax between layers`. Modello: lo zoom e il dolly sono distinti nei preset di camera; in higgsfield-style/SKILL.md (riga 50) Kling 2.6/3.0 e Dolly In sono indicati come abbinamento per lo stile Cinematic [V solo come abbinamento; la frase «punto di forza di Kling» non è nelle file della skill: corretto il 2026-11-08]; la distinzione zoom/dolly nel prompt libero è [I]. Dettagli sui movimenti: `tecnica-cinema-inquadratura.md`.
- **Errore comune:** chiedere «dolly zoom» e ottenere un semplice avvicinamento.

#### T-stop e f-stop
- **Cos'è:** f-stop = rapporto geometrico focale/diametro del diaframma; T-stop = f-stop corretto per la trasmissione reale della lente: T = f / √τ, con τ trasmissione. Esempio: f/2 con τ = 0,8 → T ≈ 2,24 (calcolo mio, formula std). Ogni stop = fattore √2 sul numero (1,4 - 2 - 2,8 - 4 - 5,6 - 8 - 11).
  Kodak: un cambio di uno stop (f o T) raddoppia o dimezza la luce sulla pellicola; il T-stop si ottiene misurando la luce che attraversa davvero l'obiettivo, l'f-stop è una stima matematica [P: Kodak, «The Essential Reference Guide for Filmmakers», PDF 2012, snapshot Wayback di motion.kodak.com, letto con PDFKit 2026-11-08, p. 66]. La formula T = f/√τ resta std.
- **Si vede:** due lenti a f/2 possono dare esposizioni diverse; con i T-stop, no.
- **Quando:** il cinema usa i T-stop perché devono combaciare fra obiettivi diversi.
- **Higgsfield:** `wide open at T2` / `stopped down to f/8, deep focus`. Modello: nel Cinema Studio l'apertura è un menu (f/1.4, f/4, f/11) [V]; nel prompt libero conta come tendenza di profondità di campo [I].
- **Errore comune:** confondere f e T, o credere che un'apertura grande renda più nitida l'immagine.

#### Profondità di campo
- **Cos'è:** zona a fuoco accettabile. Aumenta chiudendo il diaframma, con focali più corte e a distanze maggiori; diminuisce con sensori più grandi a parità di campo (std). Calcolo di esempio (CoC 0,03 mm, convenzione full frame): 50 mm, T2, soggetto a 3 m → iperfocale H = f²/(N·c) = 2500/(2·0,03) ≈ 41,7 m; piano vicino ≈ 2,80 m, lontano ≈ 3,23 m, DoF ≈ 0,43 m (calcolo mio).
  Kodak conferma i quattro parametri (formato, diaframma, focale, distanza; per ridurre la DoF: formato più grande, diaframma più aperto, focale più lunga, soggetto più vicino) e la regola dell'iperfocale (a fuoco sull'iperfocale la DoF va da metà iperfocale all'infinito); per il 35 mm usa un circolo di confusione di 1/1000 di pollice (0,025 mm), da 1/2000 a 1/500 secondo ottiche e filtri [P: Kodak, «The Essential Reference Guide for Filmmakers», PDF 2012, snapshot Wayback di motion.kodak.com, letto con PDFKit 2026-11-08, pp. 68-70]. Il mio esempio usa 0,03 mm (convenzione full frame, std): con 0,025 mm la DoF è un po' più stretta.
- **Si vede:** DoF stretta = isolamento, sfondo morbido, rischio di fuoco mancato; DoF ampia = ambiente leggibile, look documentario.
- **Quando:** ritratto e lusso: stretta; prodotto con più elementi, documentari, spot dinamici: ampia.
- **Higgsfield:** `shallow depth of field, subject isolated, soft creamy background` / `deep focus, foreground and background both sharp`. Modello: [I] la DoF stretta è la media di internet: ritagliarla con una distanza e una focale precise.
- **Errore comune:** DoF stretta ovunque: nel prodotto tecnico nasconde il dettaglio che il cliente vuole vendere.

#### Fuoco, rack focus e focus pulling
- **Cos'è:** il fuoco è la distanza del piano nitido; il rack focus sposta il fuoco da un soggetto a un altro durante l'inquadratura; il focus puller (assistente alla camera) lo regola con il follow focus (std).
- **Si vede:** attenzione guidata da nitido a sfocato; respirazione dell'ottica (focus breathing: il campo cambia leggermente).
- **Quando:** rivelazione, sguardo, passaggio di attenzione fra volto e oggetto.
- **Higgsfield:** `rack focus from the foreground object to the face in the background, smooth transition over two seconds`. Modello: «Rack Focus» è nel vocabolario e la skill ha una Lens Behavior Sequence per gli eventi di fuoco [V]; la tenuta del soggetto durante lo spostamento è [I].
- **Errore comune:** non dire il punto di partenza e quello di arrivo.

**Fonti sezione 7:** lette il 2026-11-08 sulle pagine dei costruttori [P]: Cooke (cookeoptics.com: /cooke-look/, /lens/s4-i-prime/, /lens/s4-ff-i/, /lens/panchro-classic-i-s35/, Panchro Classic FF, Panchro 65/i); Zeiss (zeiss.com/photonics-and-optics/us/cinematography/lenses/master-prime-lenses.html); Panavision (panavision.com/camera-and-optics/optics/product-detail/c-c-series, e-e-series, g-g-series, 65p-primo-65); ARRI Signature Prime (arri.com); Leitz (leitz-cine.com/product/summilux-c e /thalia). Le descrizioni del carattere sono testo di marketing dei costruttori: marcate come tali. Le Zeiss Super Speed (zeiss.com: pagina non trovata via lettore, nessuno snapshot Wayback), le Canon K35, le Petzval e le ottiche vintage rehoused restano std, non lette. Skill higgsfield (vocab.md, SKILL.md, model-guide.md, skill cinema): [V]. Kodak Essential Reference Guide 2012 (T-stop, profondità di campo, circolo di confusione 1/1000", iperfocale) [P, letto 2026-11-08]. Formule di ottica e calcoli: std + calcolo mio (ricontrollati: AOV = 2·atan(w/2f) dà 90,0° a 18 mm, 73,7° a 24 mm, 54,4° a 35 mm, 39,6° a 50 mm, 23,9° a 85 mm, 15,2° a 135 mm su 36 mm). Rental house (camaleonrental.com, cinevisuals.com, direct-digital.com, movingpicture.com) [S]: non più usate come fonte delle righe in tabella.

---

## 8. Filtri in camera

I filtri valgono per ripresa vera. Nei modelli generativi sono tendenze di look, e il confine fra filtro, ottica e grading è sfocato.

#### ND e ND variabile
- **Cos'è:** filtro grigio neutro che riduce la luce. Densità 0,3 = 1 stop; 0,6 = 2 stop; 0,9 = 3 stop; 1,2 = 4 stop; Tiffen nomina così i propri IRND (0,3 = 1 stop, 0,6 = 2, 1,2 = 4 con fattore 16x, 1,5 = 5, 1,8 = 6, 2,1 = 7 stop) [P: tiffen.com, catalogo prodotti (products.json del negozio ufficiale), letto 2026-11-08]. Il variabile usa due polarizzatori contrapposti: può dare un viraggio di colore e a densità estreme una croce scura (std).
- **Si vede:** permette diaframmi aperti in pieno sole, con DoF stretta e otturatore corretto; l'ND variabile può cambiare il colore.
- **Quando:** esterni con ottiche luminose; Kodak suggerisce ND da .6 a .9 con 50D e 200T in luce diurna [P].
- **Higgsfield:** non traducibile direttamente: si scrive l'effetto (`shallow depth of field in bright sunlight`). Modello: [I].
- **Errore comune:** ND variabile e ottiche grandangolari: la croce di polarizzazione.

#### Polarizzatore
- **Cos'è:** filtro che blocca la luce polarizzata; l'effetto massimo si ottiene con la sorgente a circa 90° rispetto all'asse; assorbimento secondo Tiffen: polarizzatore lineare circa 40% di trasmissione, fattore 2,5x = 1,3 stop; il «Low Light Polarizer» è progettato per 1 stop; l'85 Ultra Pol (85 più polarizzatore circolare) ha fattore circa 6x = 2,6 stop e porta 5.500 K a 3.400 K [P: tiffen.com, catalogo prodotti (products.json del negozio ufficiale), letto 2026-11-08]. Il «1-2 stop» di prima è quindi confermato per i polarizzatori semplici.
- **Si vede:** riflessi ridotti su vetro e acqua, cielo più scuro, fogliame più saturo.
- **Quando:** auto, paesaggi, vetrine, acqua.
- **Higgsfield:** `polarised look, deep blue sky, reflections on glass suppressed, saturated foliage`. Modello: [I].
- **Errore comune:** usarlo con grandangoli ampi: cielo a macchie.

#### Black Pro-Mist, Glimmerglass, Hollywood Black Magic
- **Cos'è:** filtri di diffusione che ammorbidiscono le alte luci creando un alone, riducendo il contrasto. Black Pro-Mist (Tiffen): gradi 1/8, 1/4, 1/2, 1 e 2 (la pagina del 4 x 4" li elenca così); Tiffen scrive che combina «unique layering of contrast» con una «gauzy paint like halation», che già al grado più basso aumenta l'halation aggiungendo «a pleasing depth of warmth» senza trasferirla ai toni della pelle, e che gli effetti diventano più evidenti da 1/4 in su [P: tiffen.com/products/4-x-4-black-pro-mist-filter, letta 2026-11-08]. Glimmerglass (Tiffen): filtro «beauty» che ammorbidisce dettagli della pelle, imperfezioni e rughe, dà alte luci «glowing» e una lieve riduzione del contrasto; visto dal soggetto sembra scintillare; gradi da 1/16 in su (1/16 ammorbidisce meno di 1/8) [P: tiffen.com, catalogo prodotti (products.json del negozio ufficiale), letto 2026-11-08, scheda «4 x 4" Glimmerglass 1/16»]. Hollywood Black Magic: attribuito a Schneider, descrizione da verificare (non è nel catalogo Tiffen; schneideroptics.com dà errore di certificato al lettore, nessuno snapshot Wayback utile con le ricerche CDX provate).
- **Si vede:** luci pratiche che brillano, volto con pelle più morbida, neri più alti.
- **Quando:** per togliere durezza al digitale, «cinematografizzare» un'immagine nitida; ritratto, notte con luci.
- **Higgsfield:** `soft black diffusion filter, glowing halation around highlights, lifted blacks, softened skin` . Modello: la voce Halation Diffusion del Cinema Studio [V]; nel testo libero tendenza [I] a un bagliore eccessivo.
- **Errore comune:** gradi alti su un'immagine già morbida; sulle luci pratiche un 1/4 può bastare.

#### Black Satin, Star e Streak
- **Cos'è:** Black Satin (Tiffen) = diffusione a bassa densità che ammorbidisce leggermente l'immagine e abbassa la risoluzione del dettaglio, «più granulosa» del Satin normale, controlla le alte luci e riduce il contrasto, attenua imperfezioni e rughe tenendo l'immagine a fuoco [P: tiffen.com, catalogo prodotti (products.json del negozio ufficiale), letto 2026-11-08, scheda «4 x 4" Black Satin Diffusion Filter»; **corretto**: prima «morbidisce le ombre e lascia nitida la parte più luminosa», che la scheda non dice]; star = filtro con reticolo che forma raggi a stella (4, 6, 8 punte); streak = filtro con linee incise (es. a 2 mm) che da una sorgente puntiforme produce un unico raggio, orientabile ruotando il filtro: orizzontale imita il flare anamorfico [P: tiffen.com, catalogo prodotti (products.json del negozio ufficiale), letto 2026-11-08, scheda «4 x 4" Streak 2mm»]; il filtro star resta std.
- **Si vede:** raggi simmetrici dalle sorgenti (star), strisce lineari (streak).
- **Quando:** star per atmosfera da anni '80 e lusso retrò; streak per un look anamorfico a basso costo.
- **Higgsfield:** `four-point star flares on the lights` / `horizontal anamorphic-style light streaks`. Modello: [I] le stelle sono ben rese.
- **Errore comune:** star su ogni luce, effetto kitsch.

#### Fog e filtri colorati
- **Cos'è:** fog = filtro che simula nebbia leggera, abbassa il contrasto e diffonde le luci; filtri colore: 85 (converte luce diurna in tungsteno su pellicola, indicato da Kodak per le pellicole 200T e 500T in esterno [P]), 80A, graduati (cielo), sepia, ecc. (std).
- **Si vede:** nebbia e riflessi di colore; cambi di temperatura colore sulla pellicola.
- **Quando:** atmosfera, pellicola bilanciata male, effetti di colore nel cielo.
- **Higgsfield:** `light atmospheric fog, lowered contrast, glowing lights` / `warm graduated filter on the sky`. Modello: [I].
- **Errore comune:** lasciare il filtro colore e dimenticare il bilanciamento camera.

#### Filtro IR cut e IRND
- **Cos'è:** filtro che blocca l'infrarosso; in digitale, ND forti senza controllo dell'IR possono far virare i neri verso rosso o magenta; si usano IRND o un IR cut aggiuntivo. Tiffen: gli IRND sono ottimizzati per i sensori digitali con attenuazione quasi piatta del visibile e dell'infrarosso, perché i sensori sono più sensibili all'IR della pellicola e possono dare dominanti di colore sui soggetti scuri [P: tiffen.com, catalogo prodotti (products.json del negozio ufficiale), letto 2026-11-08, scheda «Water White Glass IRND 1.2»]. Il colore preciso della dominante (rosso/magenta) resta std.
- **Si vede:** neri caldi e tessuti scuri che virano al viola/marrone senza il filtro.
- **Quando:** ND forti (oltre 1,2) in esterno.
- **Higgsfield:** non traducibile. Modello: [I].
- **Errore comune:** attribuire il viraggio alla camera.

**Fonti sezione 8:** Kodak (filtro 85, ND) [P]; Tiffen Black Pro-Mist: pagina tiffen.com/products/4-x-4-black-pro-mist-filter aperta con curl e letta il 2026-11-08 [P]. Verifica 2026-11-08: Glimmerglass, Black Satin, Streak, IRND, polarizzatori (fattori e stop) e densità ND letti sul catalogo ufficiale Tiffen (tiffen.com/products.json, 733 prodotti, schede descrittive) [P]. Restano da verificare: Hollywood Black Magic (Schneider: certificato non valido via lettore, Wayback senza la pagina), filtro star, fog, variabile e croce di polarizzazione (std).

---

## 9. Frame rate e otturatore

#### 24, 25 e 30 fps
- **Cos'è:** numero di fotogrammi al secondo; 24 fps = standard cinema, 25 fps = standard televisivo europeo, 30 fps (29,97) = standard televisivo americano. SMPTE ST 7 (16 mm): «The standard frame rate for motion-picture photography is 24 frames per second», con 24, 25 o 30 fps ammessi per i film destinati alla televisione [P: pub.smpte.org, letto 2026-11-08]; il 29,97 e l'abbinamento 25 = Europa / 30 = America restano std.
- **Si vede:** 24 = movimento con una certa sfocatura e ritmo «cinema»; 30 = più continuo, più «video»; 25 = in Europa è la base televisiva.
- **Quando:** 24 per il look cinema; 25 per consegne televisive europee; 30 per notizie, sport, sociale.
- **Higgsfield:** `24 fps cinematic motion cadence` . Modello: durata e frame rate dipendono dal modello; verificare nello schema (`models_explore`), non nel prompt [V come regola]; la resa «cadenza» è [I].
- **Errore comune:** richiedere 24 fps in un modello con frame rate fisso diverso.

#### 48, 60 fps e alta frequenza (HFR)
- **Cos'è:** frame rate raddoppiato o più, proiettato a velocità naturale (HFR) o rallentata (slow motion) (std).
- **Si vede:** HFR = movimento fluido, a volte «effetto telenovela»; slow motion = tempo dilatato.
- **Quando:** HFR per sport, videogiochi, immersione; slow motion per gesti e impatto.
- **Higgsfield:** `smooth high frame rate motion` . Modello: [I].
- **Errore comune:** usare HFR su un look drammatico: sembra una soap.

#### Overcrank e undercrank
- **Cos'è:** overcrank = girare a più di 24 fps e riprodurre a 24, ottenendo slow motion; undercrank = girare a meno e riprodurre a 24, ottenendo movimento accelerato. Esempio di calcolo: 120 fps riprodotti a 24 = 5x più lento; ALEXA 35 Xtreme a 330 fps [P] = 13,75x. (Formula: fattore = fps ripresa / fps riproduzione.)
- **Si vede:** overcrank = gocce, tessuti, capelli, volti con rallentatore; undercrank = movimento a scatti accelerato, comico o nervoso.
- **Quando:** overcrank per enfasi e bellezza; undercrank per frenesia e per simulare velocità.
- **Higgsfield:** `overcranked slow motion, droplets suspended mid-air` / `undercranked, jerky accelerated motion`. Modello: Overcranked e Undercranked sono nel vocabolario della skill [V]; la resa del modello è [I].
- **Errore comune:** chiedere slow motion di una scena che ha già un movimento lento.

#### Regola dei 180° e angolo dell'otturatore
- **Cos'è:** tempo di esposizione = angolo / (360 × fps). A 180° e 24 fps: 1/48 s; a 25 fps: 1/50 s; a 48 fps: 1/96 s; a 120 fps: 1/240 s (calcolo mio, formula std).
  Kodak: l'otturatore a disco da 180° è il più comune e le cineprese a pellicola girano per lo più a 24 fps; dimezzare l'angolo (da 180 a 90) dimezza il tempo di esposizione; angoli piccoli fermano l'azione ed evitano il mosso; alcune luci che sfarfallano, come gli HMI più vecchi, richiedono un otturatore a 172° [P: Kodak, «The Essential Reference Guide for Filmmakers», PDF 2012, snapshot Wayback di motion.kodak.com, letto con PDFKit 2026-11-08, pp. 64-65].
- **Si vede:** 180° dà la sfocatura di movimento «naturale» del cinema; angoli più stretti danno nitidezza a scatti; più larghi, scie.
- **Quando:** 180° di default; ridurlo per azione e guerra; aumentarlo per sogno e velocità.
- **Higgsfield:** `natural 180-degree motion blur`. Modello: «Low Shutter» è nel vocabolario [V]; il valore preciso dell'angolo è [I].
- **Errore comune:** indicare l'angolo dell'otturatore come se il modello lo misurasse.

#### Otturatore stretto e largo
- **Cos'è:** otturatore stretto (es. 45° o 90°) = poco blur, movimento a scatti; largo (270-360°) = molto blur (std).
- **Si vede:** stretto = esplosioni e detriti nitidi, ritmo nervoso (esempio, uso interno: in Salvate il soldato Ryan Janusz Kamiński ha girato molte scene con l'otturatore a 45° o 90°; il 45° «was especially effective while filming explosions», con ogni granello di sabbia visibile in caduta [P: theasc.com/article/saving-private-ryan-cinematography-kaminski (articolo di American Cinematographer, agosto 1998, ripubblicato dall'ASC), letto in Chrome vero 2026-11-08]); largo = movimento onirico.
- **Quando:** battaglie, azione cruda; sogno, ballo.
- **Higgsfield:** `narrow shutter, crisp staccato motion with no blur, debris sharp in the air` / `wide shutter, dreamy motion trails`. Modello: [I] gli effetti di otturatore stretto sono resi in modo variabile.
- **Errore comune:** richiedere un otturatore stretto su una scena lenta.

#### Rolling shutter e global shutter
- **Cos'è:** rolling = lettura del sensore riga per riga, con distorsione (skew) se la camera o il soggetto si muovono velocemente; global = tutto il sensore letto nello stesso istante, nessuna distorsione (std). Quali modelli abbiano global shutter: da verificare sul costruttore.
- **Si vede:** rolling = pali che si inclinano, flash a metà quadro; global = geometria stabile.
- **Quando:** global per azione, VFX e riprese con luce stroboscopica.
- **Higgsfield:** non traducibile. Modello: [I] se un modello restituisce effetti skew, sono artefatti, non una scelta.
- **Errore comune:** attribuire all'obiettivo la distorsione che nasce dal sensore.

**Fonti sezione 9:** ARRI, ALEXA 35 Xtreme (330 fps) [P]; vocab.md della skill higgsfield (Overcranked, Undercranked, Low Shutter) [P]; verifica 2026-11-08 [P]: SMPTE ST 7 (24 fps standard; 24/25/30 per TV), Kodak Essential Reference Guide 2012 (otturatore 180°, 90°, 172° per HMI), American Cinematographer ago. 1998 su theasc.com (Salvate il soldato Ryan, 45°/90°). Restano std: 29,97, effetto HFR, elenco delle camere global shutter (solo RED V-RAPTOR [X] letto, sezione 4).

---

## 10. Esposizione e misura

#### False color
- **Cos'è:** modalità del monitor che colora l'immagine per livello di esposizione (esempio ARRI: viola per neri, verde per grigio medio, rosa per pelle chiara, rosso per saturazione); la scala varia per marca (std, da verificare sul costruttore).
- **Si vede:** una mappa colorata dell'esposizione sopra l'immagine.
- **Quando:** a set, per esporre pelle e grigio medio con precisione.
- **Higgsfield:** non traducibile. Modello: non pertinente.
- **Errore comune:** applicare la legenda di una marca a un'altra.

#### Zebra
- **Cos'è:** strisce sovrapposte alle zone che superano un livello IRE impostato (es. 70% per la pelle, 100% per il clipping) (std).
- **Si vede:** zone di sovraesposizione a colpo d'occhio.
- **Quando:** controllo rapido delle alte luci su camere piccole e documentario.
- **Higgsfield:** non traducibile. Modello: non pertinente.
- **Errore comune:** impostare lo zebra senza sapere il livello della curva log.

#### Waveform e vettorscopio
- **Cos'è:** waveform = grafico della luminanza lungo la larghezza dell'immagine; vettorscopio = grafico di tonalità e saturazione (std).
- **Si vede:** neri, grigi e luci in numeri; tono pelle su una linea di riferimento nel vettorscopio.
- **Quando:** per esporre con precisione e per ottenere coerenza di colore fra riprese.
- **Higgsfield:** non traducibile. Modello: non pertinente.
- **Errore comune:** fidarsi del monitor invece degli strumenti.

#### Esposimetro a luce incidente e riflessa
- **Cos'è:** incidente = misura la luce che cade sul soggetto (bulbo davanti al soggetto, verso la camera); riflesso = misura la luce riflessa dal soggetto, tarata su un grigio medio al 18% (std). Kodak indica gli EI di DOUBLE-X per esposimetri a luce incidente o riflessa, con lettura dalla camera su soggetti medi o su cartoncino grigio al 18% tenuto davanti al soggetto, e di correggere per soggetti molto chiari o scuri [P: Kodak H-1-5222, marzo 2026, letto 2026-11-08].
- **Si vede:** incidente = esposizione indipendente dal colore del soggetto; riflesso = un soggetto chiaro risulta sottoesposto, uno scuro sovraesposto.
- **Quando:** incidente per set controllati; riflesso per fotometria di una zona (cielo, finestra).
- **Higgsfield:** non traducibile. Modello: non pertinente.
- **Errore comune:** misurare riflesso su una superficie bianca e non compensare.

#### ISO/EI e doppia sensibilità nativa
- **Cos'è:** EI = indice di esposizione scelto. ALEXA 35: EI 160-6400 [P: arri.com, 2026-11-08]. Sony VENICE 2 (sensore 8,6K) ha doppia sensibilità base 800/3200 [P: sony-cinematography.com, 2026-11-08]; con la base alta la camera sposta il sensore in una modalità a minore rumore nelle ombre (std; secondo risultati di ricerca +6/-10 stop attorno al grigio medio a ciascuna base [S]: da verificare, la pagina Sony VENICE 2 riletta il 2026-11-08 dà solo «16 stops of total latitude»; ricerca Google in Chrome vero senza pagine Sony).
- **Si vede:** 3200 base = ombre più pulite in poca luce, meno stop in alte luci; 800 base = più margine sulle luci.
- **Quando:** 3200 base per interni scuri e notte con luce disponibile.
- **Higgsfield:** `low-light scene, clean shadows, minimal noise`. Modello: [I].
- **Errore comune:** alzare l'ISO nella speranza di «più luce» quando manca la luce vera.

#### Esposizione sul grigio medio e controllo delle alte luci
- **Cos'è:** il grigio medio al 18% è il riferimento dell'esposizione; con le camere log si sceglie dove collocare il grigio medio nella gamma (es. +6/-10 stop attorno al grigio per VENICE 2 [S], non letto) (std).
- **Si vede:** esposizione verso le ombre (più grana) o le luci (clipping).
- **Quando:** scene ad alto contrasto; la regola «proteggi le luci» nei digitali, «proteggi le ombre» sulla pellicola negativa (std).
- **Higgsfield:** `exposed for the highlights, shadows falling into black` . Modello: [I].
- **Errore comune:** valutare l'esposizione dal monitor con la LUT applicata invece che sul log.

**Fonti sezione 10:** ARRI, ALEXA 35 [P]; Sony, sony-cinematography.com/venice2 [P, riletta 2026-11-08]; Kodak H-1-5222 per esposimetro e grigio 18% [P]; ricerca web per +6/-10 [S, da verificare]. Restano std: legenda false color ARRI (nessuna pagina arri.com trovata con Google in Chrome vero), zebra, waveform, vettorscopio; ASC / American Cinematographer Manual non consultabile gratis.

---

## Verifica e limiti del documento

- **Passata di verifica delle citazioni (2026-11-08, non indipendente, fatta dall'autore):** riconfrontati con le pagine scaricate i valori ARRI (17 stop, EI 160-6400, 330 fps, 660 fps a 11 stop, Open Gate 4,6K, LogC4, REVEAL), Kodak (codici di emulsione, filtri di bilanciamento e ND suggeriti, DLT della 500T, DOUBLE-X per luce bassa e profondità di campo), Sony VENICE 2 (8,6K, 16 stop, 800/3200, ND a 8 stop), Blackmagic (16 stop, PYXIS 36 x 24 mm). Si chiede al lead un verificatore indipendente.
- **Ancora non verificato su pagina primaria (aggiornato 2026-11-08, vedi «Verifica del 2026-11-08»):** vedi l'elenco «Ancora aperti» nella sezione finale. Rischio: un preventivo o una scheda tecnica costruiti su quei punti possono contenere errori.
- **Comportamenti dei modelli:** solo ciò che sta nei file della skill `higgsfield` è marcato [V]. Il resto è [I] e va provato con una generazione prima di entrare in un brief. L'istantanea del catalogo (2026-09-26) è più vecchia di 30 giorni.
- **Esempi di film:** presenti in due voci (otturatore stretto; push/pull e bleach bypass), entrambi da Salvate il soldato Ryan con fonte American Cinematographer (ago. 1998, su theasc.com) [P, letto 2026-11-08]; più l'esempio IMAX nella sezione 6. Le altre voci non portano esempi: da aggiungere solo con fonte.
- **Prossima revisione:** entro 2027-02-06, e al primo cambio di catalogo Higgsfield.

## Verifica del 2026-11-08

Tre verificatori indipendenti dall'autore, in sequenza (sessioni Chrome `ver-cineluce`, `ver-cineluce3`); lavoro chiuso.
- **Controllati:** le due passate precedenti non hanno registrato i conteggi (le loro voci sono elencate sotto); la terza ha controllato 43 dati std / [S] / «da verificare» (33 promossi, 8 corretti, 10 ancora aperti) più 10 controlli a campione su fonti già [P] (ALEXA 35, LEE 201 e 204, Astera Titan, Aputure STORM, Cooke Look, Panavision C, Blackmagic PYXIS, SMPTE ST 417, Kodak 500T): tutti e 10 confermati; due precisazioni (LEE 201 riporta 34 e 35% di trasmissione; Aputure dice «4K HMI or 10K tungsten fresnel»).
- **Promossi a [P] o [V] (tutte le passate):** camere (ARRI Mini LF e 265, RED V-RAPTOR [X], Sony Burano e VENICE 2 6K, Canon C400 in Chrome vero, iPhone 18 Pro); ottiche (Cooke, Zeiss Master Prime, Panavision, ARRI Signature, Leitz); luce (SkyPanel, Titan, STORM, Rosco, LEE, Dedolight da Wayback); fotogrammi di pellicola (Kodak PDF 2024; SMPTE ST 7, 59, 195, 201, 215, 417, PDF gratuiti su pub.smpte.org, non a pagamento); tabella Kelvin (Kodak Essential Reference Guide 2012, Wayback); rapporti 1,33/1,37/1,66/1,85/2,40/2,2/1,43 (Kodak); EI DOUBLE-X 200/250 (Kodak H-1-5222); filtri Tiffen (Glimmerglass, Black Satin, Streak, IRND, polarizzatori, densità ND); T-stop, profondità di campo, otturatore 180°/172°; rapporti d'uscita dei modelli (specs della skill higgsfield).
- **Corretti (14):** ALEXA 265 = 15 stop, non 17; Titan Tube = tubo da 0,55 a 2 m; CTO «5.600 → 3.200 K» dipende da marca e taglio; «Dolly In punto di forza di Kling» non è nella skill; «Zeiss neutre» non è del costruttore; Canon C400 1.540 g (non 1.550) e «Discontinued» non confermato; **4:3 è un'uscita nativa** di Seedance, FLUX 3 Video, Wan (prima «solo look»); 4:5 esiste solo nei modelli immagine; candela 1.850 K (non 1.900); sole all'alba 2.000 K (non 3.000-4.000); cielo coperto 6.000 K (non 6.500-7.000); 1,66 è più stretto del 16:9; Black Satin descritto in modo errato; IMAX: SMPTE e Kodak discordano sull'altezza (si usa SMPTE 51,61 mm).
- **Esempi di film con fonte:** Salvate il soldato Ryan (otturatore 45°/90°, ENR al 70%, ottiche senza trattamento), American Cinematographer ago. 1998 su theasc.com [P].
- **Ancora aperti (circa 35, quasi tutti std di mestiere):** schemi di luce e definizioni (sezioni 1-2: nessun manuale ASC gratuito); 2,00:1 Univisium; Hollywood Black Magic (Schneider: certificato non valido, Wayback senza pagina); legenda false color ARRI; VENICE «+6/-10 stop» [S]; Zeiss Super Speed, Canon K35, Petzval; filtri star e fog; fascio DLH4 5-48° [S]; ora blu in K; push/pull/bleach bypass; elenco camere global shutter. Metodi provati per ognuno: curl, r.jina.ai, Chrome vero, Wayback.
- **Metodi che hanno funzionato:** Chrome vero (Canon, Kodak prodotti, ASC, IMAX); Wayback CDX per i PDF Kodak e Dedo Weigert; il negozio Tiffen in JSON (`/products.json`); PDFKit per i PDF SMPTE e Kodak.
