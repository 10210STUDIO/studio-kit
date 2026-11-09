# Tecnica del cinema — inquadratura, movimento, montaggio

Manuale di mestiere per dirigere video AI (Higgsfield) e riprese reali con il linguaggio di una troupe: piani, angoli, composizione, continuità, movimenti, supporti, montaggio, grammatica per pubblicità e social. Il Lessico di `cinema.md` definisce i termini; qui si va a fondo e si traducono in istruzioni.
Luce, camere, ottiche e frame rate stanno in `tecnica-cinema-luce-ottiche.md`; VFX e grading in `tecnica-cinema-vfx-colore.md`. Qui si rimanda, non si duplica.
I film citati in «Si vede» sono per uso interno e non entrano mai nel campo Higgsfield né nei deliverable (`regole.md`).

**Convenzioni.** Letta il 2026-11-08. Le definizioni di mestiere vengono da StudioBinder [S] (blog di un produttore di software per la produzione, firma redazionale) e Wikipedia [S], salvo dove indicato. Fiducia delle definizioni: MEDIA dove due fonti concordano, BASSA dove ce n'è una sola o nessuna letta (marcata «non letta»). Per i campi Higgsfield: **verificato** = letto nei file della skill `higgsfield` (snapshot modelli 2026-09-26); **da verificare** = ipotesi di mestiere non provata su una generazione. Nomi di preset e movimenti: solo quelli presenti nei file della skill. Fuori da Cinema Studio valgono i termini di `vocab.md` (Whip Pan, Crash Zoom In, Dolly Zoom In, Snorricam, FPV Drone, Crane Up, 360 Orbit, Super Dolly Out, Dutch Angle, OTS, Overhead shot); dentro Cinema Studio solo i nomi del Director Panel (Static, Handheld, Zoom In/Out, Camera Follows, Pan Left/Right, Tilt Up/Down, Orbit Around, Dolly In/Out, Jib Up/Down, Drone Shot, Dolly Left/Right, 360 Roll, Auto).
**Regole di prompt che valgono per tutte le voci** (verificate nei file della skill): una mossa dominante per inquadratura (due al massimo, in sequenza con tempi); il movimento nomina il suo punto d'arrivo, altrimenti la camera torna indietro; la mossa dichiarata deve poter produrre l'inquadratura finale dichiarata; mai «zoom» per un movimento fisico; Seedance e Cinema Studio 3.0 non hanno prompt negativo, quindi si scrive in positivo («locked-off static camera, no movement»); sinistra e destra sono sempre dal punto di vista della camera.

---

## 1. Scala dei piani

Il piano è quanto del soggetto e dell'ambiente sta nel quadro. Cambia tre cose insieme: quanto vediamo, quanto siamo vicini emotivamente, quanta informazione di luogo portiamo. Per fedeltà alla cornice dei modelli, il piano si scrive con la parte del corpo che deve stare nel quadro, non con la sigla.

| Piano (IT) | Sigla EN | Cosa include [S, StudioBinder] | Uso tipico |
|---|---|---|---|
| Campo lunghissimo | EWS | Soggetto piccolo rispetto al luogo | Luogo, scala, solitudine |
| Campo lungo | WS / LS | Soggetto intero con ambiente, spazio sopra e sotto | Relazione col luogo |
| Figura intera | FS | Soggetto dalla testa ai piedi | Azione, costume, più personaggi |
| Piano medio-lungo | MWS | Dalle ginocchia in su | Passaggio fra figura e medio |
| Piano americano | CS (cowboy shot) | Da metà coscia in su | Gesto delle mani, tensione, moda |
| Piano medio | MS | Dalla vita in su | Dialogo, prodotto in mano |
| Mezzo primo piano | MCU | Dal petto in su | Intimità con aria intorno |
| Primo piano | CU | Volto o oggetto che riempie il quadro | Emozione, prodotto-eroe |
| Primissimo piano / dettaglio | ECU | Una parte: occhi, labbra, grilletto | Materia, tensione, texture |

#### Campo lunghissimo (EWS) — apertura, scala
- **Cos'è:** il soggetto appare piccolo contro il luogo; serve a enfatizzare il luogo e la relazione del personaggio con esso (StudioBinder, 2026-11-08, [S]).
- **Si vede / si sente:** orizzonte alto o basso netto, figura di pochi pixel, silenzio o suono d'ambiente ampio. Esempio interno: i deserti di Mad Max: Fury Road.
- **Quando:** apertura di sequenza, isolamento, scala di un viaggio. Brand: automotive, outdoor, travel, lusso «luogo» (hospitality, resort); sconsigliato per prodotto piccolo.
- **Higgsfield:** "extreme wide shot, the figure stays small against the landscape (frame occupancy under 15%, notazione del Frame Coordinate System), vast empty landscape, horizon on the lower third". **Verificato:** per la scala si ancora il soggetto a una misura umana ("the rider stays the human-sized anchor, never shrunk to a tiny dot") perché su Seedance il soggetto si rimpicciolisce di taglio in taglio. Modello: Seedance 2.0 per scala e rivelazioni (model-guide); Kling 3.0 se serve un solo clip pulito.
- **Errore comune:** campo lunghissimo senza ancoraggio di scala; il modello inventa geografia e il soggetto si perde.

#### Campo lungo (WS) — luogo e relazione
- **Cos'è:** bilancia soggetto e ambiente, tiene il soggetto intero e dà contesto; spazio sopra e sotto il soggetto (StudioBinder, [S]).
- **Si vede / si sente:** corpo intero con aria attorno, orizzonte leggibile, prospettiva. Esempio interno: The Martian.
- **Quando:** relazione con l'architettura, passaggio fra scene, danza. Brand: moda (look intero), real estate, retail.
- **Higgsfield:** "wide shot, full body visible with generous space above the head and below the feet, subject centred in the environment". Modello: Kling 3.0 o Seedance 2.0 (qualsiasi; nessuna differenza documentata, da verificare).
- **Errore comune:** tagliare i piedi o la testa: scrivere "full body from head to shoes visible" e fissare l'altezza in cm se ci sono due persone (Seedance livella le altezze, verificato).

#### Figura intera (FS)
- **Cos'è:** soggetto dalla testa ai piedi; può contenere più personaggi (StudioBinder, [S]).
- **Si vede / si sente:** il corpo riempie l'altezza del quadro con poco margine; esempio interno: i gruppi di Guardians of the Galaxy.
- **Quando:** costume, camminata, coreografia, ensemble. Brand: moda e sportswear (movimento e vestibilità), beauty (look totale).
- **Higgsfield:** "full shot, head to toe visible, feet touching the ground plane, body fills most of the frame height with a small margin above and below". Modello: Kling 3.0 (camminata, figura); Seedance 2.0 se il movimento è complesso, ma la camminata scivola (failure mode documentato, verificato in FAILURE-MODES: dichiarare la fase del passo).
- **Errore comune:** piedi che galleggiano; dichiarare il suolo e il contatto.

#### Piano medio-lungo (MWS)
- **Cos'è:** frame dalle ginocchia in su; sta fra figura intera e piano medio (StudioBinder, [S]).
- **Si vede / si sente:** il corpo è quasi intero ma la gamba finisce nel margine inferiore; esempio interno: The Usual Suspects.
- **Quando:** transizione di scala nel coverage, camminate in dialogo. Brand: fashion editoriale quando serve il capo senza scarpe.
- **Higgsfield:** "medium wide shot framed from the knees up". Modello: indifferente (da verificare).
- **Errore comune:** il modello lo promuove a figura intera; ripetere "cut at the knees, no feet visible".

#### Piano americano (cowboy shot)
- **Cos'è:** il soggetto dalla metà coscia in su; il nome viene dai western, dove inquadrava la fondina (StudioBinder, [S]). «Piano americano» è l'equivalente italiano in uso; la corrispondenza esatta fra le due etichette non è stata verificata su un manuale (non letta).
- **Si vede / si sente:** mani e torso con una postura visibile, tensione dell'anca.
- **Quando:** gesto, duello, camminata verso camera. Brand: moda (giacca, cintura, borsa), automotive (pilota e volante).
- **Higgsfield:** "cowboy shot, framed from mid-thigh to above the head, hands visible at the lower edge of frame". Modello: Kling 3.0 (da verificare).
- **Errore comune:** le mani fuori campo o raddoppiate. **Verificato:** dichiarare il numero di mani e da dove entrano.

#### Piano medio (MS)
- **Cos'è:** dalla vita in su; composizione bilanciata fra soggetto e ambiente (StudioBinder, [S]).
- **Si vede / si sente:** busto, braccia in azione, sfondo leggibile.
- **Quando:** dialogo, demo di prodotto in mano, presentatore. Brand: tech (uso dell'oggetto), food (mani e piatto), beauty (applicazione).
- **Higgsfield:** "medium shot, waist up, both hands visible in frame holding the product at chest height". Modello: Kling 3.0.
- **Errore comune:** prodotto che cambia forma fra clip; ancorarlo con un riferimento immagine.

#### Mezzo primo piano (MCU)
- **Cos'è:** dal petto in su: abbastanza vicino da enfatizzare il soggetto, abbastanza largo da includere lo spazio intorno (StudioBinder, [S]); esempio citato: No Country for Old Men.
- **Si vede / si sente:** volto con un po' di spalle, sfondo sfocato ma leggibile.
- **Quando:** conversazione intima, intervista, confessione. Brand: lusso (volto e gioiello), corporate (testimonial).
- **Higgsfield:** "medium close-up, chest up, subject slightly right of centre, eye line at the upper third". Modello: Kling 3.0 per dialoghi e volti.
- **Errore comune:** sguardo che «sbanda» verso camera; fissare "looks off-camera to the left at a fixed point".

#### Primo piano (CU)
- **Cos'è:** il volto o l'oggetto riempie il quadro; mostra emozione e reazione (StudioBinder, [S]).
- **Si vede / si sente:** pelle, micro-espressioni, pori e peli visibili; suono ravvicinato.
- **Quando:** momento chiave, reazione, rivelazione. Brand: beauty/skincare (texture), orologeria (quadrante), tech (display).
- **Higgsfield:** "close-up, face fills the frame from forehead to chin, shallow depth of field, focus on the nearest eye". Con aperture: "f/1.4 look" (Cinema Studio, verificato) per intimità. Modello: Kling 3.0 (volti), Seedance 2.0 con piano FOV 18° (anchor "close portrait", verificato).
- **Errore comune:** pelle di plastica; chiedere "natural skin texture, visible pores", non "perfect skin".

#### Primissimo piano / dettaglio (ECU)
- **Cos'è:** inquadra una parte (occhi, labbra, mani, grilletto) (StudioBinder, [S]); esempio citato: Black Swan.
- **Si vede / si sente:** macro, il materiale diventa paesaggio, suono ravvicinato.
- **Quando:** tensione, sensorialità, texture. Brand: gioielleria, cosmetica, food (cottura), tessuto.
- **Higgsfield:** "extreme close-up of the eye, the iris fills the frame". **Verificato:** Seedance FOV 12° ("tele-detail, hands and objects") e "no drift mid-segment"; per mani, dichiarare "only two hands in the frame". Modello: Seedance 2.0 (macro e insert).
- **Errore comune:** soggetto non nominato: l'insert deve dire cosa mostra (verificato).

#### Establishing shot — il piano che dice dove siamo
- **Cos'è:** il piano all'inizio della scena che mostra chiaramente il luogo dell'azione; non deve per forza essere largo, da drone o accompagnato da titolo; può essere anche un POV (StudioBinder, [S]).
- **Si vede / si sente:** facciata, skyline, interno visto da lontano, spesso con ora del giorno chiara.
- **Quando:** all'ingresso in un luogo nuovo. Brand: hospitality, real estate, retail, automotive (dove siamo).
- **Higgsfield:** "establishing shot of [place], clear time of day, no characters, static camera, 3 seconds". Modello: Veo 3.1 per il paesaggio e Kling 3.0 per la stabilità (da verificare).
- **Errore comune:** aprire sempre sullo stesso campo lungo da drone; in un video corto è tempo sprecato (vedi §9).

#### Insert
- **Cos'è:** un piano con l'unico scopo di portare l'attenzione su un dettaglio della scena; spesso dal punto di vista del personaggio, in CU o ECU così che si legga un testo o un particolare (StudioBinder, [S]).
- **Si vede / si sente:** la mano che gira la chiave, il display, il logo inciso.
- **Quando:** per rendere leggibile un fatto (un prezzo, un messaggio) senza dialogo. Brand: tech e food, dove il prodotto deve apparire con nitidezza.
- **Higgsfield:** **Verificato:** l'insert dura 0,3–0,5 s e nomina il soggetto: "INSERT CUT, 0.4s, the thumb presses the shutter button". Va ri-ancorato dopo il taglio. Modello: Seedance 2.0 (vocabolario di taglio nativo).
- **Errore comune:** un insert che non dice che oggetto è: il modello inventa l'oggetto.

#### Cutaway
- **Cos'è:** un piano che stacca dall'azione principale su un'altra informazione visiva e poi ritorna all'azione con un senso nuovo; senza vincolo geografico preciso (StudioBinder, [S]). Spesso sono gli editor a usarli per coprire continuità.
- **Si vede / si sente:** il pubblico che applaude durante il discorso, un orologio, l'esterno.
- **Quando:** controllo del tempo, tensione, copertura di un taglio. Brand: sport (reazione del pubblico), corporate (mani, dettagli di lavoro).
- **Higgsfield:** "CUTAWAY to [object], 0.6s, static" nel formato timed multishot (cut ladder, verificato). Modello: Seedance 2.0.
- **Errore comune:** cutaway generato come scena nuova con luce diversa; copiare luce e palette della scena principale.

#### Two-shot e piano di gruppo
- **Cos'è:** inquadra due soggetti; non devono per forza stare fianco a fianco (uno in primo piano e uno sullo sfondo) e serve a mostrare la relazione emotiva; spesso usato in storie romantiche e di tensione (StudioBinder, [S]).
- **Si vede / si sente:** due figure con relazione spaziale chiara, pochi tagli.
- **Quando:** conversazione che richiede entrambi i volti, coppie in pubblicità (profumo, travel). Brand: lusso lifestyle, automotive family.
- **Higgsfield:** "two-shot, waist up, the woman on the left (165 cm) and the man on the right (178 cm), both facing three-quarters toward each other". **Verificato:** limite di 3 personaggi tracciati su Seedance, altezze dichiarate in cm. Modello: Kling 3.0 per i due volti; Seedance 2.0 se si taglia.
- **Errore comune:** altezze che si equalizzano; scrivere cm.

**Fonti:** StudioBinder, «Guide to Camera Shots: Every Shot Size Explained (2026)» (https://www.studiobinder.com/blog/types-of-camera-shots-sizes-in-film/), letta con curl il 2026-11-08, [S], MEDIA; StudioBinder, pagine su insert, cutaway, two-shot (letti gli incipit con curl il 2026-11-08), [S]; skill Higgsfield (camera, vocab, model-guide, seedance) lette il 2026-11-08, [P] per il vocabolario della piattaforma. Il piano americano come sinonimo di cowboy shot: non letto in un manuale, BASSA.

---

## 2. Angolazioni e punto di vista

L'angolo è la posizione della camera rispetto al soggetto (altezza e inclinazione). Cambia il rapporto di potere percepito. Non si confonda con la focale, che sta in `tecnica-cinema-luce-ottiche.md`.

#### Livello occhi (eye level)
- **Cos'è:** camera all'altezza degli occhi del soggetto; angolo neutro (non letta una definizione dedicata; uso di mestiere, BASSA).
- **Si vede / si sente:** orizzonte a metà del soggetto, linee verticali dritte, nessun giudizio.
- **Quando:** dialogo, documentario, scene di parità. Brand: corporate e testimonial (fiducia), food in prima persona.
- **Higgsfield:** "eye-level camera, lens at the subject's eye height, horizon through the subject's eyes". Modello: indifferente.
- **Errore comune:** il default dei modelli è già un po' dall'alto; dichiarare l'altezza in cm della camera se serve.

#### Alto (high angle)
- **Cos'è:** la camera guarda in giù sul soggetto da una posizione elevata; va da poco sopra gli occhi fino a perpendicolare sopra il soggetto (StudioBinder, [S]).
- **Si vede / si sente:** soggetto che appare più piccolo, il pavimento occupa molto quadro.
- **Quando:** vulnerabilità, panoramica di un'area, mappa dell'azione. Brand: retail (vista del negozio), food in tavola.
- **Higgsfield:** "high-angle shot, camera about 2.5 metres above the subject tilted down 35 degrees". Modello: Kling 3.0 (da verificare).
- **Errore comune:** confondere high angle con overhead (vedi sotto).

#### Basso (low angle)
- **Cos'è:** camera sotto la linea degli occhi che guarda in su; l'estremo sotto i piedi si chiama extreme low angle (StudioBinder, [S]).
- **Si vede / si sente:** soffitto, cielo, mento, figura che incombe.
- **Quando:** potere, scala, minaccia (anche vulnerabilità secondo la fonte). Brand: sportswear (atleta eroico), automotive (fascia anteriore), architettura e lusso (verticalità).
- **Higgsfield:** "low-angle shot, camera 30 centimetres off the ground tilted up, the subject towers against the sky". Modello: Kling 3.0 (da verificare).
- **Errore comune:** low angle con grandangolo spinto: il modello deforma i volti; fissare focale con "rectilinear lines, no wide-angle warp" (clausola verificata).

#### Overhead / bird's eye
- **Cos'è:** camera sopra il soggetto, a circa 90 gradi; differisce dall'aerial perché sta vicina all'azione, come un uccello e non come un satellite (StudioBinder, [S]).
- **Si vede / si sente:** geometria piatta, tavolo, coreografia come disegno.
- **Quando:** azione verticale, scene di tavola, mappe di gruppo. Brand: food (flat lay, impiattamento), moda (look disposti), tech (unboxing).
- **Higgsfield:** **Verificato** nel vocab: "Overhead shot of the dancers forming patterns". Per il food: "top-down overhead shot, camera 90 degrees above the table, plates arranged in a grid". Modello: Kling 3.0.
- **Errore comune:** il modello inclina a 70 gradi; scrivere "exactly 90 degrees, no perspective on the table plane".

#### Aerial
- **Cos'è:** punto di vista da drone, elicottero o aereo, molto sopra il soggetto (StudioBinder, [S]; la voce dedicata non è stata aperta fino alla definizione).
- **Si vede / si sente:** orizzonti larghi, profondità che si disvela, parallasse.
- **Quando:** scala, geografia, viaggi. Brand: travel, automotive, real estate.
- **Higgsfield:** "aerial drone shot, 80 metres above ground moving forward over the coastline". In Cinema Studio il nome esatto è **Drone Shot** (verificato). Modello: Veo 3.1 per paesaggi (da verificare), Kling 2.6 per FPV (model-guide).
- **Errore comune:** richiedere drone senza dire altezza e direzione.

#### Dutch angle / canted
- **Cos'è:** camera inclinata sull'asse x, con un'inclinazione evidente; segnala che qualcosa non va, disorientamento (StudioBinder, [S]); nato con l'espressionismo tedesco degli anni Venti, «Dutch» da «Deutsch».
- **Si vede / si sente:** orizzonte non orizzontale, verticali inclinate.
- **Quando:** tensione, horror, ebbrezza, disorientamento. Brand: musica e moda sperimentale; sconsigliato per lusso e health.
- **Higgsfield:** **Verificato:** "Dutch Angle as the conspirators whisper"; precisare gradi: "tilted 15 degrees clockwise". Modello: Kling 2.6 o Wan 2.5 (model-guide; Wan 2.5 forse solo in UI).
- **Errore comune:** inclinazione continua che cambia in clip; fissarla e dichiararla costante.

#### POV (soggetto in prima persona)
- **Cos'è:** la camera mostra ciò che il personaggio guarda; viene stabilita fra un piano del personaggio che guarda e uno della sua reazione (StudioBinder, [S]); spesso a mano per accentuare la soggettività.
- **Si vede / si sente:** mani del personaggio in basso, respiro, movimento irregolare.
- **Quando:** esperienze soggettive, sport, guida. Brand: sport/action camera, automotive, gaming.
- **Higgsfield:** "first-person point of view, the hands of the cyclist visible at the lower edge gripping the handlebar, handheld sway". Modello: Kling 3.0 / Veo 3.1 (inferenza: il model-guide, righe 328-330, indica per «Handheld (documentary feel)» Kling 2.6 e Veo 3, non Veo 3.1 né Kling 3.0; da verificare).
- **Errore comune:** mani sbagliate di numero; dichiarare da dove entrano.

#### Over-the-shoulder (OTS)
- **Cos'è:** inquadratura da dietro una spalla del personaggio A su B, usata nel campo/controcampo (StudioBinder, [S]).
- **Si vede / si sente:** spalla e nuca in primo piano sfocate, volto dell'altro nitido.
- **Quando:** dialogo, negoziazione, consulenza. Brand: servizi, banche, healthcare.
- **Higgsfield:** **Verificato:** "OTS from behind the detective, facing the suspect". Aggiungere "the foreground shoulder is out of focus, the far face sharp". Modello: Kling 3.0.
- **Errore comune:** inversione di lati nel controcampo; scrivere sinistra e destra dal punto di vista della camera.

#### Altezza e distanza della camera (campo lungo ≠ camera lontana)
- **Cos'è:** scelta pratica: la camera può essere bassa e lontana o alta e vicina; piano, angolo e focale sono tre decisioni distinte (StudioBinder presenta separatamente shot size, angle e movement, [S]).
- **Si vede / si sente:** prospettiva diversa a parità di piano.
- **Quando:** pianificazione del coverage. Brand: tutti.
- **Higgsfield:** dichiarare in ordine: piano → angolo → focale/FOV (Seedance: gradi discreti 8/12/18/29/47/63/84/107/180, mai millimetri; verificato) → distanza in metri. Modello: Seedance 2.0 per FOV esplicito.
- **Errore comune:** scrivere «grandangolo» e «close-up» insieme senza chiarire se la camera è vicina (deforma) o se si ritaglia.

**Fonti:** StudioBinder, pagine su high angle, low angle, overhead, Dutch angle, POV, OTS (sul campo/controcampo), lette con curl il 2026-11-08, [S], MEDIA; skill Higgsfield (camera, vocab, model-guide, seedance) lette il 2026-11-08, [P]. Eye level non letto in una voce dedicata: BASSA.

---

## 3. Composizione

La composizione è la disposizione degli elementi nel quadro. Le «regole» sono linee guida: si conoscono per romperle con intenzione.

#### Regola dei terzi
- **Cos'è:** dividere il quadro in terzi orizzontali e verticali; gli elementi chiave stanno sulle linee o sulle loro intersezioni. StudioBinder la definisce una linea guida più che una regola, usabile da qualunque livello (StudioBinder, [S]).
- **Si vede / si sente:** occhio sul terzo superiore, orizzonte sul terzo inferiore o superiore, soggetto decentrato.
- **Quando:** default per ritratti e paesaggi; romperla quando serve un effetto (centratura per frontalità e potere). Brand: moda editoriale, travel, lifestyle.
- **Higgsfield:** **Verificato** (Frame Coordinate System): coordinate nel quadro, "subject's eyes on the upper-left third intersection, horizon on the lower third line". Modello: Seedance 2.0 per istruzioni spaziali (da verificare), Kling 3.0 con immagine di partenza.
- **Errore comune:** terzi applicati a ogni piano: il montaggio diventa monotono.

#### Centratura e simmetria
- **Cos'è:** soggetto sull'asse verticale del quadro, metà sinistra specchio della destra. Definizione di mestiere (non letta una fonte dedicata, BASSA).
- **Si vede / si sente:** corridoi frontali, facciate, volti pieni; ritmo calmo e formale.
- **Quando:** autorità, formalità, ironia, ordine. Brand: lusso, architettura, istituzionale, hospitality.
- **Higgsfield:** "perfectly symmetrical frontal composition, the subject centred on the vertical axis, walls mirror each other on both sides, one-point perspective, locked-off static camera". Modello: Kling 3.0; i modelli sbilanciano le simmetrie (da verificare), quindi fissare "no tilt, no off-axis".
- **Errore comune:** centratura imprecisa di qualche grado: il difetto si legge subito.

#### Headroom e looking room (lead room / nose room)
- **Cos'è:** headroom è lo spazio sopra la testa; lead room è lo spazio davanti al soggetto, nella direzione dello sguardo o del movimento. Definizioni di mestiere (non letta una fonte; la pagina Wikipedia dedicata non si è scaricata, BASSA).
- **Si vede / si sente:** una persona che guarda a destra ha più aria a destra; chi cammina verso il bordo senza aria sembra intrappolato.
- **Quando:** regola di base; si rompe per claustrofobia o per scegliere un fuori campo inquietante. Brand: ritratti e testimonial in 9:16 (la testa non deve toccare il bordo alto della UI).
- **Higgsfield:** "subject looks toward the right, leaving 40 percent of the frame empty on the right, a small gap of headroom above the hair". Modello: Kling 3.0 (da verificare).
- **Errore comune:** teste tagliate; scrivere la quantità di aria.

#### Profondità e piani (foreground, middle, background)
- **Cos'è:** dividere il quadro in strati che la camera o i soggetti attraversano. La deep focus tiene a fuoco tutti i piani senza favorire primo piano, mezzo e sfondo (StudioBinder, [S]); lo shallow focus fa il contrario (vedi `tecnica-cinema-luce-ottiche.md`).
- **Si vede / si sente:** oggetto in primo piano sfocato, soggetto nel piano medio, sfondo che racconta.
- **Quando:** per dare spazio al quadro e far muovere la parallasse. Brand: architettura, automotive, tech (hero su sfondo).
- **Higgsfield:** **Verificato** (Spatial Zoning): "foreground: out-of-focus leaves at the left edge; midground: the woman standing; background: the street lit in warm light". Una zona per ogni strato. Modello: Seedance 2.0.
- **Errore comune:** troppi strati: il modello li fonde.

#### Frame within a frame
- **Cos'è:** usare porte, finestre, specchi o archi per incorniciare il soggetto. Definizione di mestiere (non letta una fonte, BASSA).
- **Si vede / si sente:** il soggetto visto attraverso una finestra o una porta aperta.
- **Quando:** isolamento, voyeurismo, enfasi. Brand: architettura, hospitality, auto (finestrino).
- **Higgsfield:** "the subject framed by a doorway in the foreground, door frame dark and out of focus, subject centred inside the opening". Evitare i riflessi (Seedance li gestisce male, verificato: usare finestre senza specchio). Modello: Kling 3.0.
- **Errore comune:** riflessi in specchi e vetri.

#### Spazio negativo
- **Cos'è:** lo spazio attorno al soggetto, vuoto e senza dettagli, per semplificare l'immagine; si ottiene spesso inquadrando il soggetto più lontano (StudioBinder, [S]).
- **Si vede / si sente:** pareti vuote, cielo, una figura piccola; silenzio visivo.
- **Quando:** solitudine, scala, emozione; ma anche spazio per titoli e testo (§9). Brand: lusso (respiro), tech (minimale), social con copy a schermo.
- **Higgsfield:** **Verificato:** il negative space si dichiara come zona: "the right 55 percent of the frame is empty plain wall, no objects, clean for text". Modello: Seedance 2.0 (zone), Kling 3.0 con immagine d'avvio.
- **Errore comune:** lo spazio vuoto viene riempito dal modello con dettagli; dichiararlo in positivo.

#### Linee guida (leading lines)
- **Cos'è:** linee del quadro (strade, binari, corrimani) che conducono lo sguardo al soggetto. Definizione di mestiere (non letta una fonte, BASSA).
- **Si vede / si sente:** convergenza verso un punto, prospettiva a fuga.
- **Quando:** per dare direzione e profondità. Brand: automotive, architettura, outdoor.
- **Higgsfield:** "the converging road lines lead to the cyclist at the right third of the frame, one-point perspective". Modello: Kling 3.0 (da verificare).
- **Errore comune:** linee che attraversano il volto.

#### Peso visivo e bilanciamento
- **Cos'è:** bilanciare gli elementi del quadro: contrasto, colore e dimensione danno peso. Simmetrico o asimmetrico (StudioBinder ha due pagine dedicate, non lette fino in fondo; BASSA).
- **Si vede / si sente:** un soggetto piccolo e luminoso contrasta una massa scura.
- **Quando:** per dosare tensione. Brand: moda editoriale, art direction.
- **Higgsfield:** "large dark mass on the left balanced by a small bright subject on the right third". Modello: Kling 3.0 (da verificare).
- **Errore comune:** aggiungere elementi per «riempire».

#### Formato come composizione (aspect ratio)
- **Cos'è:** il rapporto d'aspetto decide che cosa è composizione: il 9:16 premia il verticale (volti, corpi interi), il 16:9 l'orizzontale, il 2.39 la banda larga (cinema.md per i formati).
- **Si vede / si sente:** lo stesso soggetto richiede altezza e aria diverse.
- **Quando:** decidere il formato prima del piano (video-scriptwriting). Brand: social verticale vs cinema per film di marca.
- **Higgsfield:** **Verificato** (snapshot 2026-09-26): rapporto d'uscita come enum del modello: Kling 3.0 16:9, 9:16, 1:1; Seedance 2.0 auto, 21:9, 16:9, 4:3, 1:1, 3:4, 9:16; Veo 3.1 16:9, 9:16. «Anamorphic» e «2.39» sono registro di stile nella riga Look, non rapporto d'uscita. Modello: Seedance 2.0 per 21:9 nativo, Kling 3.0 non lo supporta.
- **Errore comune:** chiedere "2.39:1" a un modello che non lo ha.

**Fonti:** StudioBinder, «Rule of thirds», «Negative space», «Deep focus» (curl, 2026-11-08), [S], MEDIA per i tre; centratura, headroom, frame within a frame, linee guida, bilanciamento: non letta una fonte che le definisca (BASSA); skill Higgsfield (vocab, seedance, model-guide, `specs`) lette il 2026-11-08, [P] per le regole di piattaforma.

## 4. Asse e continuità

La continuità è la sensazione di spazio e tempo coerenti fra un'inquadratura e l'altra; il continuity editing è il sistema che la mantiene (StudioBinder, [S]). Nei video AI ogni clip è generato separatamente: la continuità non è garantita da nessuno e va scritta nel prompt.

#### Regola dei 180° (asse d'azione)
- **Cos'è:** linea immaginaria fra due personaggi (o fra personaggio e oggetto); tenere la camera da un lato mantiene la stessa relazione destra/sinistra fra i soggetti. Attraversarla si chiama crossing the line o breaking the line e può disorientare (StudioBinder, [S]).
- **Si vede / si sente:** in un dialogo uno guarda sempre verso destra di quadro e l'altro verso sinistra. Esempio interno: la scena al tavolo di Heat citata da StudioBinder.
- **Quando:** ogni scena con due o più persone, inseguimenti con veicoli. Brand: auto (direzione di marcia costante), sport (squadre che attaccano verso lo stesso lato).
- **Higgsfield:** **Verificato:** "Character A stays on the left, Character B stays on the right, neither crosses the central vertical axis" (crossing rule, vocab) più la clausola di camera "camera stays on the north side of the line for all shots" (da verificare in generazione). **Verificato:** dopo ogni taglio in Seedance si ri-ancorano posizioni e direzione di sguardo. Modello: Seedance 2.0 (blocco Spatial Layout, verificato).
- **Errore comune:** il campo/controcampo invertito: il modello ribalta le posizioni e nessuno se ne accorge finché non si monta.

#### Quando si rompe l'asse
- **Cos'è:** rispettare il 180° crea orientamento; romperlo disorienta e segnala disagio; piegarlo (bending) segnala un cambio graduale (StudioBinder, [S]).
- **Si vede / si sente:** salto di lato fra due inquadrature, sguardi che cambiano direzione.
- **Quando:** panico, ubriachezza, rottura di un rapporto. Brand: rare; videoclip e moda sperimentale.
- **Higgsfield:** descrivere la rottura come scelta: "the camera crosses to the opposite side of the axis at the cut, the characters swap screen sides". Modello: Seedance 2.0 (da verificare).
- **Errore comune:** rompere per ignoranza, non per intenzione.

#### Regola dei 30°
- **Cos'è:** fra due piani consecutivi dello stesso soggetto la camera deve spostarsi di almeno 30 gradi, altrimenti il taglio sembra un jump cut; una regola affine è quella dei 20 mm (focale), da cui «20 mm / 30 gradi» (Wikipedia, 2026-11-08, [S]).
- **Si vede / si sente:** due piani quasi uguali in successione sembrano un salto in avanti.
- **Quando:** in fase di coverage e di prompt di taglio. Brand: tutti; è la causa di molti tagli «sbagliati» nei video corti.
- **Higgsfield:** inferenza dello studio (da verificare): la regola del double-contrast cut di Seedance (cambiare **sia** la dimensione del piano **sia** il carattere di camera a ogni taglio; verificata in ENGINE-RULES) soddisfa lo spirito del 30°. Scrivere ogni taglio con un piano diverso e una camera diversa. Modello: Seedance 2.0.
- **Errore comune:** due close-up dello stesso volto in fila, con la stessa camera.

#### Eyeline match
- **Cos'è:** la direzione dello sguardo dell'attore informa lo spettatore su cosa guarda; un taglio da un volto che guarda in basso a un oggetto sul tavolo fa leggere l'oggetto come ciò che il personaggio vede (StudioBinder, [S]). Per riuscire servono piani con lo stesso size e lo stesso sguardo.
- **Si vede / si sente:** sguardi coerenti di campo in campo; esempio citato: la tavolata di Barry Lyndon.
- **Quando:** dialogo, reazione, scoperta. Brand: tech (guardare lo schermo), food (guardare il piatto), retail.
- **Higgsfield:** "she looks down and slightly right of camera at a fixed point on the table, eyeline unchanged across the shot". Modello: Kling 3.0 per il volto; sguardo che «va in camera» è un errore frequente (da verificare).
- **Errore comune:** il soggetto guarda in camera dopo un taglio senza averlo deciso.

#### Direzione sullo schermo (screen direction)
- **Cos'è:** la direzione in cui un soggetto si muove nel quadro (da sinistra a destra); va mantenuta tra piani consecutivi (StudioBinder lo fa discendere dall'asse, [S]).
- **Si vede / si sente:** l'auto che esce a destra entra a sinistra nel taglio successivo.
- **Quando:** inseguimenti, viaggi, camminate. Brand: automotive, travel, sport.
- **Higgsfield:** **Verificato** (PRODUCTION-PATTERNS): "travel screen-left to screen-right, locked", ripetuto uguale in ogni clip del percorso. Modello: Seedance 2.0.
- **Errore comune:** non dirlo: tra clip generate separatamente la direzione non è vincolata e può invertirsi (frequenza non misurata).

#### Match on action
- **Cos'è:** taglio su un'azione che prosegue da un piano al successivo, una delle famiglie di match cut insieme ai graphic match e ai sound bridge (StudioBinder, [S]).
- **Si vede / si sente:** la mano che apre la porta nel piano largo, la stessa mano che la spalanca nel piano stretto.
- **Quando:** per nascondere il taglio. Brand: sport, fashion in movimento, product demo.
- **Higgsfield:** **Verificato:** "anchor-gesture cut": scrivere lo stesso gesto (es. "the hand pushes the door open") alla fine della clip N e all'inizio della clip N+1. Seedance: "the action crosses the cut mid-move", non a riposo (FAILURE-MODES). Modello: Seedance 2.0.
- **Errore comune:** tagliare a azione conclusa: sembra un arresto.

#### Master shot e coverage
- **Cos'è:** il master è la ripresa continua della scena intera, che copre tutto ciò che serve ed elimina i buchi in montaggio; il coverage è l'insieme degli altri angoli. Può essere un master «complesso» con blocking fluido e anche una lunga ripresa (StudioBinder, [S]).
- **Si vede / si sente:** un campo largo con tutta la scena, poi singoli, OTS, insert, cutaway.
- **Quando:** ogni scena girata dal vero; per l'AI vale come piano di generazione (un master, poi dettagli). Brand: spot narrativi, branded content.
- **Higgsfield:** pianificare una serie: master (campo lungo, camera fissa) → medi → primi piani → insert. Ogni clip ripete lo stesso ambiente e le stesse descrizioni di personaggio. **Verificato:** in Seedance si ricopia l'ambiente ("set contains only what the reference shows") per non far derivare la geografia. Modello: Seedance 2.0 con riferimenti; Kling 3.0 per il singolo.
- **Errore comune:** generare ogni piano come scena nuova.

#### Campo/controcampo (shot/reverse shot)
- **Cos'è:** una camera su un soggetto, poi il suo punto di vista inverso; spesso con OTS o singoli abbinati. Più stretto del Kuleshov effect, che riguarda il senso nato da due piani qualsiasi (StudioBinder, [S]).
- **Si vede / si sente:** due singoli con stesso piano, stessa focale, stessa altezza, sguardi opposti.
- **Quando:** dialogo, intervista, vendita. Brand: servizi, assicurazioni, healthcare.
- **Higgsfield:** serie di due prompt con parametri identici (piano, FOV, altezza, luce) e sguardi speculari: "she looks right of camera" / "he looks left of camera". **Verificato:** ripetere assoluti identici, non rimandi tra prompt ("camera speed of shot 9 equals shot 10" non funziona). Modello: Kling 3.0 (volti).
- **Errore comune:** variare piano o luce fra campo e controcampo senza motivo.

#### Reaction shot
- **Cos'è:** subito dopo un'azione, un piano che mostra la reazione di un altro personaggio (StudioBinder, [S]); da pianificare per primo nella shot list.
- **Si vede / si sente:** un volto che ascolta; esempio citato: Scarface.
- **Quando:** per dare peso a un fatto. Brand: pubblicità comica, testimonial, unboxing.
- **Higgsfield:** "reaction close-up, 1.2s, her eyes widen and her mouth opens slightly, no dialogue". Il campo «no dialogue» e lo stato di bocca per i volti visibili appartengono alle regole di dialogo/filler-babble della skill (da verificare qui in generazione). Modello: Kling 3.0.
- **Errore comune:** reaction «generica»: nominare cosa fa il volto con muscoli, non con etichette emotive.

**Fonti:** StudioBinder, «180 Degree Rule», «Eyeline Match», «Shot Reverse Shot», «Master Shot», «Match Cuts» (curl, 2026-11-08), [S], MEDIA; Wikipedia, «30-degree rule» (API, 2026-11-08), [S], MEDIA (concorde con la ricerca web); skill Higgsfield (seedance ENGINE-RULES, PRODUCTION-PATTERNS, FAILURE-MODES, vocab) lette il 2026-11-08, [P]. L'abbinamento fra double-contrast cut e regola dei 30° è un'inferenza non verificata.

---

## 5. Movimenti di camera

Un movimento deve essere motivato: da un soggetto che si muove, da una scoperta, da un'emozione. Fuori dal movimento, la camera fissa non è «niente», è una scelta. La stessa mossa può uscire da supporti diversi (§6); qui è definita per l'effetto sullo schermo.

#### Camera fissa (locked-off)
- **Cos'è:** nessun movimento; il cinema usa il treppiede o la testa bloccata. Definizione di mestiere (cinema.md, Lessico).
- **Si vede / si sente:** quadro stabile, tutto si muove nel quadro; tensione, solennità, comicità.
- **Quando:** dialogo, composizione, tensione, loop. Brand: lusso, prodotto, istituzionale; base per testo a schermo.
- **Higgsfield:** **Verificato:** "locked-off static camera, no movement" (in positivo, senza prompt negativo); in Cinema Studio **Static**. Modello: qualsiasi; è il movimento più affidabile.
- **Errore comune:** scrivere «no camera movement» e ottenere un lieve drift; ripetere "the frame does not change".

#### Pan
- **Cos'è:** movimento orizzontale: la camera ruota sull'asse da una posizione fissa; non è uno spostamento (StudioBinder, [S]). Distinto dal tilt (verticale).
- **Si vede / si sente:** il quadro scorre in orizzontale, la prospettiva resta quella.
- **Quando:** panoramica, seguire un movimento, scoperta. Brand: travel, real estate, automotive.
- **Higgsfield:** **Verificato:** "The camera stays in position and pans to follow him" (per un pan vero) e "static pan beats glide": con un pan che deve restare un pan, fissare la posizione. In Cinema Studio **Pan Left** / **Pan Right**. Modello: Kling 3.0.
- **Errore comune:** il modello trasforma il pan in dolly; dichiarare "the camera does not move through space".

#### Tilt
- **Cos'è:** rotazione verticale su/giù da un punto fisso; diverso dal pan (StudioBinder, [S]). Un tilt verso l'alto può suggerire inferiorità o scala; verso il basso osservare un'area.
- **Si vede / si sente:** rivelazione verticale, edificio, corpo.
- **Quando:** rivelare un'architettura, un look dal basso verso l'alto. Brand: moda (scarpe → volto), lusso, auto.
- **Higgsfield:** "tilt up from the shoes to the face over 5 seconds, camera position fixed". In Cinema Studio **Tilt Up** / **Tilt Down**. Modello: Kling 3.0 (da verificare).
- **Errore comune:** non nominare l'inquadratura finale.

#### Whip pan / swish pan (e whip tilt)
- **Cos'è:** rotazione così veloce da produrre un blur di movimento; può servire da transizione nel tempo e nello spazio (StudioBinder, [S]); sull'asse verticale è un whip tilt.
- **Si vede / si sente:** striscio laterale, whoosh, taglio nascosto nel blur.
- **Quando:** transizioni energiche, comicità, azione. Brand: sport, music, social.
- **Higgsfield:** **Verificato:** "Whip Pan from the thief to the officer" (fuori Cinema Studio); in Seedance si può usare **WHIP CUT** nel vocabolario dei tagli. Non è nel Director Panel. Modello: Kling 3.0 o Seedance 2.0 (da verificare).
- **Errore comune:** whip pan dichiarato senza due soggetti noti: il blur non porta a niente.

#### Dolly in / push in
- **Cos'è:** il carrello si avvicina al soggetto; lo spostamento è fisico e cambia la prospettiva (StudioBinder, «dolly shot», [S]). Usato per intimità, enfasi, realizzazione.
- **Si vede / si sente:** i piani dello sfondo scorrono con parallasse; il soggetto cresce.
- **Quando:** emozione crescente, rivelazione, discorso. Brand: lusso, beauty, tech.
- **Higgsfield:** **Verificato:** "Camera Dolly In toward her face" e "slow dolly push from medium shot to tight close-up over 8 seconds"; Cinema Studio **Dolly In**. Modello: Kling 2.6/3.0 (model-guide).
- **Errore comune:** non nominare piano d'arrivo e durata; la camera torna indietro (action-reversal, verificato).

#### Dolly out / pull out
- **Cos'è:** la camera si allontana; svela l'ambiente o stacca emotivamente (StudioBinder, [S]).
- **Si vede / si sente:** il soggetto rimpicciolisce, appare il contesto.
- **Quando:** rivelazioni di scala, finali, distacco. Brand: spot con finale «dove siamo», real estate.
- **Higgsfield:** **Verificato:** "over the full 7 seconds the camera pulls back only 10–15 centimeters" per micro-mosse (servono distanza e tempo); Cinema Studio **Dolly Out**; "Super Dolly Out" per la rivelazione di scala fuori Cinema Studio. Modello: Seedance 2.0 o Minimax Hailuo 2.3 (model-guide).
- **Errore comune:** pull-out senza nuovo contenuto in fondo al quadro.

#### Truck / dolly laterale
- **Cos'è:** movimento laterale di tutta la camera; il truck è un tipo di tracking shot che si muove a sinistra o a destra, tradizionalmente su binari (StudioBinder, [S]).
- **Si vede / si sente:** parallasse laterale, soggetti che scorrono dietro ostacoli.
- **Quando:** passeggiata, rivelazione di una fila di elementi. Brand: retail (corsia), fashion (parata), food (linea di piatti).
- **Higgsfield:** Cinema Studio **Dolly Left** / **Dolly Right** (verificato). Prompt: "the camera trucks left at walking pace, 2 metres from the wall, keeping the subject centred". Modello: Kling 3.0.
- **Errore comune:** confondere truck con pan: nel pan l'orizzonte ruota, nel truck scorre.

#### Tracking / camera follows
- **Cos'è:** qualsiasi inquadratura in cui la camera in movimento segue uno o più soggetti; non solo su binari ma anche con gimbal, stabilizzatori, droni e a mano (StudioBinder, [S]).
- **Si vede / si sente:** il soggetto mantiene il suo posto nel quadro, lo sfondo scorre.
- **Quando:** passeggiata, inseguimento, accompagnamento. Brand: sport, moda, lifestyle.
- **Higgsfield:** **Verificato:** "the camera tracks alongside at a steady 5 km/h, matching their walking pace, 2 m from them"; Cinema Studio **Camera Follows**. Per la camminata dichiarare "heel lands first, strict left-right alternation, one foot always on the ground". Modello: Kling 3.0; Seedance 2.0 con le clausole di camminata.
- **Errore comune:** velocità diversa fra clip abbinate (verificato): scrivere lo stesso valore assoluto in ogni prompt.

#### Pedestal / boom (alzata verticale)
- **Cos'è:** la camera sale o scende in verticale senza ruotare (in StudioBinder, nell'elenco movimenti, compare «Boom»; la voce «pedestal» non è stata letta, BASSA).
- **Si vede / si sente:** il quadro sale come un ascensore, le linee verticali restano parallele.
- **Quando:** rivelazione di un oggetto alto, cambio di punto di vista. Brand: architettura, auto, tech.
- **Higgsfield:** "pedestal up, the camera rises straight up 1.5 metres without tilting, keeping the horizon level". Non esiste un controllo dedicato nel Director Panel: il più vicino è **Jib Up** (verificato). Modello: Kling 3.0 (da verificare).
- **Errore comune:** il modello aggiunge un tilt.

#### Zoom
- **Cos'è:** variazione di focale con camera ferma; cambia il campo visivo, non la prospettiva. Si distingue dal dolly (StudioBinder dedica una sezione alla differenza, non letta nel dettaglio; definizione di mestiere, BASSA).
- **Si vede / si sente:** il piano si stringe senza parallasse; «effetto televisivo» o documentaristico.
- **Quando:** tensione, ironia, estetica anni Settanta. Brand: retro, musica; raro in lusso.
- **Higgsfield:** **Verificato:** non scrivere «zoom» per un movimento fisico; per lo zoom vero in Cinema Studio **Zoom In** / **Zoom Out**. Fuori da Cinema Studio: "slow optical zoom in, the camera does not move, the background stays the same size". Modello: Kling 3.0 (da verificare).
- **Errore comune:** zoom in un prompt in cui si voleva un dolly.

#### Crash zoom
- **Cos'è:** zoom ottico rapidissimo verso il soggetto per un effetto d'urto. Definizione di mestiere (non letta, BASSA).
- **Si vede / si sente:** il piano stringe in una frazione di secondo, a volte con whoosh.
- **Quando:** commedia, horror, azione. Brand: social, gaming, moda pop.
- **Higgsfield:** **Verificato:** "Crash Zoom In on the bloody handprint" (sostituire con un oggetto sicuro: "on the red button"). Il nome «Crash Zoom In / Crash Zoom Out» è un preset camera confermato in `vocab.md` (riga 78) e in `skills/higgsfield-camera/SKILL.md` (righe 74-75), letti 2026-11-08 [P]; compare anche tra i preset DoP (`model-guide.md`, riga 401). Modello: **da verificare**: «Kling 2.6 o 3.0» è un'inferenza, perché Crash Zoom non è nella tabella di compatibilità del model-guide (righe 318-340); non provato in generazione.
- **Errore comune:** abusarne: perde effetto al secondo uso.

#### Dolly zoom (vertigo effect)
- **Cos'è:** effetto in camera: ci si avvicina o allontana con il dolly mentre si zooma nella direzione opposta; il soggetto resta della stessa dimensione e lo sfondo si deforma. Crea disagio e uno spazio che si piega; decidono direzione, focale e velocità (StudioBinder, [S]).
- **Si vede / si sente:** soggetto fermo, sfondo che si schiaccia o si dilata.
- **Quando:** realizzazione, vertigine, panico. Brand: raro; thriller e musica.
- **Higgsfield:** **Verificato:** "Dolly Zoom In — subject stays size as background rushes away". Modello: Kling 3.0 (da verificare; non è nell'elenco dei controlli per modello).
- **Errore comune:** il modello ingrandisce solo il soggetto: dichiarare "the background perspective stretches, the face stays the same size".

#### Jib / crane up e down
- **Cos'è:** camera su braccio (jib) o gru che sale, scende o ruota; il jib sta su un cavalletto con contrappeso (StudioBinder, [S]). Dà scala e apertura.
- **Si vede / si sente:** salita lenta dal dettaglio al contesto; spesso finale.
- **Quando:** aperture e chiusure, rivelazione di scala. Brand: automotive, travel, lusso, eventi.
- **Higgsfield:** **Verificato:** "Crane Up from the soldier's hands to the war-torn landscape"; in Cinema Studio il nome è **Jib Up** / **Jib Down** (non «Crane»). Modello: Seedance 2.0 o Minimax Hailuo 2.3 per Crane Up (model-guide).
- **Errore comune:** scrivere «Crane» in Cinema Studio.

#### Steadicam / stabilizzatore a corpo
- **Cos'è:** sistema che isola i movimenti dell'operatore: combina stabilità del treppiede, flessibilità della camera a mano e capacità del dolly; vest e braccio. Inventato da Garrett Brown (StudioBinder, [S]); le date restano **non verificate su fonte primaria** (solo secondarie). Wikipedia «Steadicam» (letta 2026-11-08, [S]): primo demo reel girato nel 1974, design finale completato e prodotto introdotto da Cinema Products nel 1975; quindi «1974 invenzione» è da leggere come «1974 prime riprese di prova». Riconoscimento verificato in secondarie: premio tecnico Class I agli Oscar 1978 (50ª edizione) a Garrett Brown e Cinema Products «for the invention and development of Steadicam» ([S], 2026-11-08).
- **Si vede / si sente:** scivolamento fluido, camminata morbida, passa per porte e scale.
- **Quando:** seguire un personaggio in ambiente reale, long take. Brand: moda (backstage), hospitality (tour), sport.
- **Higgsfield:** non esiste un controllo: si descrive il risultato: "smooth stabilized following shot at walking pace, slight organic float, no jitter". Modello: Kling 3.0 (da verificare).
- **Errore comune:** confondere Steadicam con handheld: la prima è fluida, la seconda no.

#### Gimbal
- **Cos'è:** stabilizzatore elettronico a 3 assi (StudioBinder lo cita tra i mezzi di tracking, [S]); sostituisce in parte la Steadicam con meno peso e costo.
- **Si vede / si sente:** movimento molto pulito, a volte «troppo digitale»; orizzonte sempre livellato.
- **Quando:** produzioni piccole, social, brand content. Brand: tutti.
- **Higgsfield:** "stabilized gimbal shot, perfectly level horizon, continuous gliding movement". Modello: Kling 3.0 (da verificare).
- **Errore comune:** gimbal su ogni inquadratura: ripetitività e look «app».

#### Camera a mano (handheld)
- **Cos'è:** la camera non poggia su supporto fisso; dal mockumentary agli action, va dal leggero respiro allo «shaky cam» (StudioBinder, [S]).
- **Si vede / si sente:** micro-oscillazioni, reframing, ritardo nel seguire.
- **Quando:** urgenza, realismo, soggettiva. Brand: documentaristico, sport, moda street.
- **Higgsfield:** **Verificato:** "Handheld camera jostling with the crowd"; Cinema Studio **Handheld**. Dosare: "subtle handheld, breathing sway, 1 centimetre amplitude". Modello: Kling 2.6 o Veo 3 (model-guide).
- **Errore comune:** handheld + dolly + rack focus insieme: sovraccarico (verificato).

#### Drone / aerial move
- **Cos'è:** camera su drone: tracking aereo, reveal, orbita larga (StudioBinder, [S]).
- **Si vede / si sente:** grande parallasse, orizzonte ampio.
- **Quando:** scala, geografia. Brand: travel, real estate, automotive, eventi.
- **Higgsfield:** Cinema Studio **Drone Shot** (verificato); fuori: "drone flying forward and slightly upward over the ridge at 40 km/h, horizon level". Modello: Veo 3.1 per il paesaggio (da verificare).
- **Errore comune:** drone usato come riempitivo.

#### FPV drone
- **Cos'è:** drone in prima persona, voli aggressivi che attraversano spazi stretti. Definizione di mestiere (non letta, BASSA).
- **Si vede / si sente:** picchiate, passaggi in fessure, rotazione.
- **Quando:** inseguimenti, scoperta di un luogo. Brand: auto, sport estremi, real estate dinamico.
- **Higgsfield:** **Verificato:** "FPV Drone" fra i preset (kinetic chase). Modello: Kling 2.6 (model-guide).
- **Errore comune:** percorsi impossibili che il modello «attraversa» (muri). Definire il percorso con tappe.

#### Snorricam
- **Cos'è:** camera fissata al corpo dell'attore, rivolta verso di lui, che resta fermo al centro del quadro mentre lo sfondo si muove (Wikipedia, «Chestcam», [S]). Disorientamento e vertigine.
- **Si vede / si sente:** il volto immobile, il mondo che gira.
- **Quando:** panico, ubriachezza, euforia. Brand: musica, moda sperimentale.
- **Higgsfield:** **Verificato:** "Snorricam locked on her face as the room spins". Modello: Kling 2.6/3.0 (da verificare).
- **Errore comune:** soggetto che si muove nel quadro: l'effetto richiede il volto fermo.

#### Orbit / arc
- **Cos'è:** la camera ruota attorno al soggetto, che di solito resta fermo, con una traiettoria curva (StudioBinder, [S]); si ottiene con dolly su curva o Steadicam.
- **Si vede / si sente:** lo sfondo ruota, il soggetto resta; senso di eroismo.
- **Quando:** rivelazione di un eroe, prodotto, momento di unione. Brand: automotive, luxury product, sport.
- **Higgsfield:** **Verificato:** "360 Orbit around the boxer in the ring" e "smooth 180-degree orbit at eye level, constant distance"; Cinema Studio **Orbit Around**. Modello: Kling 2.6/3.0 (model-guide).
- **Errore comune:** orbita senza gradi e distanza: il modello cambia raggio.

#### Roll
- **Cos'è:** rotazione della camera sull'asse ottico. Nel Director Panel è **360 Roll** (verificato, «disorientamento, stilizzato»); definizione cinematografica di mestiere non letta.
- **Si vede / si sente:** l'orizzonte gira.
- **Quando:** stordimento, effetto video musicale. Brand: musica, gaming.
- **Higgsfield:** **360 Roll** in Cinema Studio. Fuori: "the camera rolls 360 degrees around its lens axis in 3 seconds, subject centred". Modello: da verificare.
- **Errore comune:** non fissare una fine; l'orizzonte non torna dritto.

#### Piano sequenza / oner
- **Cos'è:** ripresa pensata per apparire come un'unica, ininterrotta; movimento e blocking elaborati sono comuni ma non obbligatori; può coprire una scena intera o essere incorniciato da altre inquadrature (StudioBinder, [S]).
- **Si vede / si sente:** assenza di tagli visibili.
- **Quando:** immersione, virtuosismo, spazio che si rivela. Brand: automotive, hospitality, lancio di prodotto.
- **Higgsfield:** **Verificato:** "one continuous shot, the camera does not cut on its own" (cut ladder, livello 1). Limiti di durata: Kling 3.0 3–15 s, Seedance 2.0 4–15 s; per più lunghi, Kling 3.0 Motion Control (3–30 s con riferimento di movimento, model-guide). Modello: Seedance 2.0 / Kling 3.0.
- **Errore comune:** scrivere i secondi per movimento in un oner: il modello li legge come tagli (verificato).

#### Movimento composto (sequenza di mosse)
- **Cos'è:** più movimenti in successione, es. una salita seguita da un push in (StudioBinder tratta i movimenti combinabili con pan/tilt, [S]).
- **Si vede / si sente:** due fasi chiare.
- **Quando:** scena che parte da un contesto e arriva a un dettaglio. Brand: lusso, travel, product reveal.
- **Higgsfield:** **Verificato:** una mossa dominante; se servono due, in sequenza con tempi: "Camera pans left from 0-3s tracking the character, holds, then pushes in on the face from 4-8s". In Cinema Studio 3.0 vale One-Move Rule. Modello: Seedance 2.0; per percorsi lunghi complessi, Kling 3.0 Motion Control, oppure `@Video` "Match the camera movement from @Video1".
- **Errore comune:** handheld + rise + push-in + rack focus insieme (multi-motion overload, verificato).

**Fonti:** StudioBinder, pagine su camera movements, dolly, pan, tilt, whip pan, arc, crane, tracking, handheld, Steadicam, dolly zoom, long take (curl, 2026-11-08), [S], MEDIA; Wikipedia, «Chestcam», «Camera dolly», «Jib (camera)», «Camera stabilizer» (API, 2026-11-08), [S]; skill Higgsfield (camera, vocab, model-guide, cinema Director Panel, seedance FAILURE-MODES) lette il 2026-11-08, [P]. Zoom, crash zoom, pedestal, FPV, roll: definizioni di mestiere senza fonte letta, BASSA.

## 6. Supporti e attrezzatura di movimento

Il supporto decide il carattere del movimento: peso, fluidità, ripetibilità, costo. **Nessun supporto è un controllo Higgsfield**: nei modelli si descrive l'effetto sullo schermo e, per le riprese vere, si sceglie il supporto per ottenerlo. Ogni voce dice quale effetto descrivere nel prompt per approssimarlo. Per camere e sensori vedi `tecnica-cinema-luce-ottiche.md`.

#### Treppiede e testa fluida
- **Cos'è:** supporto fisso con testa che permette pan e tilt con attrito controllato. Definizione di mestiere (non letta una fonte, BASSA).
- **Si vede / si sente:** pan e tilt con accelerazione e frenata morbide, quadro stabile.
- **Quando:** interviste, paesaggi, prodotto, camera fissa. Brand: istituzionale, food, prodotto.
- **Higgsfield:** "locked-off tripod shot" per il fisso; "slow fluid pan with gentle ease-in and ease-out" per il movimento. Cinema Studio **Static** / **Pan**. Modello: Kling 3.0.
- **Errore comune:** pan a velocità costante, senza accelerazione: sa di software.

#### Slider
- **Cos'è:** piccola guida con carrello per spostamenti brevi di qualche decina di centimetri. Definizione di mestiere (non letta una fonte, BASSA).
- **Si vede / si sente:** parallasse lieve, prodotto che «respira».
- **Quando:** prodotto, food, dettaglio. Brand: beauty, tech, gioielleria.
- **Higgsfield:** **Verificato:** per micro-mosse servono distanza e tempo: "over the full 7 seconds the camera slides sideways only 30 centimetres, subject centred". Cinema Studio **Dolly Left** / **Dolly Right**. Modello: Kling 3.0.
- **Errore comune:** durata troppo corta per l'ampiezza: la mossa sembra uno scatto.

#### Carrello su binari (track dolly)
- **Cos'è:** carrello su ruote, spesso su binario, per movimenti orizzontali fluidi; il dolly grip lo spinge; gli studio dolly hanno un braccio idraulico per l'asse verticale; le mosse su due assi si chiamano compound move; senza binari si parla di «dancefloor» (Wikipedia, «Camera dolly», [S]).
- **Si vede / si sente:** avvicinamenti e allontanamenti puliti, curve se il binario è curvo.
- **Quando:** push in, truck, orbite basse. Brand: lusso, cinema pubblicitario.
- **Higgsfield:** "smooth dolly push-in on rails, no sway". Cinema Studio **Dolly In** / **Dolly Out** / **Dolly Left** / **Dolly Right**. Modello: Kling 3.0 (Dolly In, model-guide).
- **Errore comune:** aggiungere «handheld» a un dolly: due caratteri contrari.

#### Jib e gru
- **Cos'è:** braccio con contrappeso e camera all'estremità; la gru ne è la versione grande. Alcuni jib tengono la camera parallela al suolo; i jib stanno su treppiede e possono fare pan; alcune gru più grandi sono telecomandate (StudioBinder; Wikipedia «Jib (camera)», [S]).
- **Si vede / si sente:** archi di salita e discesa, aperture.
- **Quando:** ingressi, finali, eventi. Brand: automotive, eventi, concerti.
- **Higgsfield:** Cinema Studio **Jib Up** / **Jib Down** (verificato). Prompt: "jib arm rises in a gentle arc from table height to 3 metres, keeping the subject framed". Modello: Seedance 2.0 per Crane Up.
- **Errore comune:** confondere jib con drone.

#### Gru telescopica (Technocrane)
- **Cos'è:** gru con braccio telescopico, telecomandata da un operatore a una consolle; telescopa a velocità variabile e può compensare l'arco (arc compensation); lunghezze da 3 a 30 metri secondo i modelli. La prima è stata presentata a Photokina (Colonia) nel settembre 1986 da Technovision (Wikipedia, «Technocrane», riletta 2026-11-08, [S]; confermato il testo, nessuna primaria).
- **Si vede / si sente:** movimenti impossibili per gru e carrello: attraversare una scena in un'unica mossa, avvicinarsi lungo una linea retta mentre si cresce.
- **Quando:** grandi produzioni, spot di prodotto con movimenti complessi. Brand: automotive, bevande, lusso.
- **Higgsfield:** "telescoping crane move, the camera extends forward through the room while rising, constant speed, eye line of the subject maintained" (non è un controllo; da verificare). Cinema Studio **Jib Up** è l'approssimazione. Modello: Seedance 2.0; per percorsi lunghi, Kling 3.0 Motion Control con riferimento.
- **Errore comune:** chiedere tre assi insieme senza sequenza (overload, verificato).

#### Steadicam
- **Cos'è:** stabilizzatore indossato con gilet e braccio (vedi §5, Steadicam), inventato da Garrett Brown; primi test 1974, prodotto introdotto nel 1975 (Wikipedia «Steadicam», letta 2026-11-08, [S]; StudioBinder, [S]; nessuna primaria).
- **Si vede / si sente:** scorrimento fluido, adatto a scale e curve.
- **Quando:** long take, backstage, tour. Brand: moda, hospitality, sport.
- **Higgsfield:** "smooth stabilized following shot, slight organic float" (nessun controllo dedicato). Modello: Kling 3.0 (da verificare).
- **Errore comune:** descrivere «Steadicam» per nome come se fosse un preset (non lo è; nomi di prodotti possono entrare nel prompt nei manuali tecnici, ma l'efficacia non è verificata).

#### Gimbal (es. Ronin)
- **Cos'è:** stabilizzatore elettronico a 3 assi, tenuto a mano o montato su veicolo (StudioBinder lo cita, [S]); la serie DJI Ronin è un prodotto di mercato (nome di prodotto, non letta una scheda).
- **Si vede / si sente:** movimento levigato, orizzonte sempre in bolla.
- **Quando:** riprese rapide e piccole troupe. Brand: social, branded content, sport.
- **Higgsfield:** "gimbal-stabilized tracking shot, level horizon, continuous glide". Modello: Kling 3.0.
- **Errore comune:** look «troppo perfetto» per un racconto di realtà.

#### Cable cam
- **Cos'è:** camera stabilizzata sospesa a cavi e mossa in tre dimensioni con un sistema controllato da computer; Skycam, inventata da Garrett Brown all'inizio degli anni Ottanta (Wikipedia, «Skycam», [S]); «Skycam» è un marchio, il termine generico è cable-suspended camera.
- **Si vede / si sente:** movimenti da videogioco sopra un campo di gara, picchiata e traverso.
- **Quando:** stadi, eventi, arene. Brand: sport, concerti.
- **Higgsfield:** "cable-suspended camera glides above the pitch at 10 metres height following the ball, smooth stabilized". Cinema Studio **Drone Shot** come approssimazione. Modello: Veo 3.1 o Kling 3.0 (da verificare).
- **Errore comune:** presentarla come drone: il drone ha sempre un po' di rotazione.

#### Motion control robotico
- **Cos'è:** tecnica che permette controllo preciso e ripetizione dei movimenti di camera; consente più passate con lo stesso movimento per comporre elementi, miniature, doppioni di un attore; si fa una «blank take» (clean plate) di riferimento (Wikipedia, «Motion control photography», [S]).
- **Si vede / si sente:** movimenti identici in take diversi, perfetti per composizioni.
- **Quando:** prodotto con riprese multiple, VFX, split-screen. Brand: tech, beauty, food (hero con liquidi).
- **Higgsfield:** l'equivalente AI è la ripetizione di un movimento con un riferimento: **Verificato:** `@Video` "Match the camera movement from @Video1" e Kling 3.0 Motion Control (movimento da video di riferimento). Modello: Kling 3.0 Motion Control. Vedi `tecnica-cinema-vfx-colore.md`.
- **Errore comune:** aspettarsi ripetibilità esatta: ogni generazione è un'interpretazione.

#### Car rig e Russian Arm
- **Cos'è:** gru telecomandata montata su un veicolo con testa girostabilizzata, per filmare veicoli in movimento da quasi ogni angolo; si chiama anche U-Crane; Anatoliy Kokush ha ricevuto nel 2006 un premio scientifico e ingegneristico dell'Academy per il concetto (SHOOTonline e ricerca web, 2026-11-08, [S] con una sola pagina aperta; i valori di velocità variano per fornitore e non li riporto).
- **Si vede / si sente:** inseguimenti con camera vicina all'asfalto, rotazioni rapidissime.
- **Quando:** inseguimenti, spot auto, azione. Brand: automotive.
- **Higgsfield:** "low tracking shot alongside the car at 60 km/h, camera 40 centimetres above the asphalt, swinging from the front wheel to the driver's window". Cinema Studio **Camera Follows**. Modello: Kling 2.6 (FPV/inseguimenti) o Seedance 2.0 (da verificare).
- **Errore comune:** velocità in aggettivi: scrivere km/h (verificato).

#### Drone come supporto
- **Cos'è:** camera su multirotore, usata per riprese aeree e per voli in FPV (vedi §5).
- **Si vede / si sente:** parallasse ampia; vincoli normativi di volo.
- **Quando:** scala, panorami. Brand: travel, real estate, eventi.
- **Higgsfield:** vedi §5, **Drone Shot**. Modello: Veo 3.1 (paesaggio).
- **Errore comune:** normativa di volo ignorata nelle riprese vere (regole ENAC/EASA non verificate qui).

**Fonti:** Wikipedia, «Camera dolly», «Jib (camera)», «Technocrane», «Skycam», «Motion control photography», «Camera stabilizer» (API, 2026-11-08), [S], MEDIA; StudioBinder, Steadicam e crane (curl, 2026-11-08), [S]; SHOOTonline sul Russian Arm (letta in parte con curl, 2026-11-08), [S], BASSA; treppiede, slider, gimbal Ronin: nessuna scheda letta, BASSA. Regole sul volo dei droni: non verificate.

---

## 7. Blocking e messa in scena

Blocking è come attori e camera si muovono e si dispongono nello spazio. Nel video AI, il blocking è ciò che si scrive per evitare che il modello improvvisi la geografia.

#### Blocking (attori, oggetti, camera)
- **Cos'è:** coreografia di posizioni e movimenti dei soggetti rispetto alla camera; la sua efficacia dipende dalla lettura del quadro. StudioBinder lo lega alla gestione di più eyeline in un gruppo ([S]; il video di approfondimento non è stato visto). Il movimento può stare nel blocking senza muovere la camera (StudioBinder, «complex master shot», [S]).
- **Si vede / si sente:** l'attore attraversa il quadro, due personaggi si scambiano di posto.
- **Quando:** scene con più persone, spot narrativi. Brand: corporate, retail, hospitality.
- **Higgsfield:** **Verificato:** blocco Spatial Layout: per ogni soggetto identità, posizione (ancora qualitativa + percentuale), piano di profondità, occupazione, orientamento, punti di contatto. Esempio: "Character A stands in the right third, x-position 70%, y-position 50%, frame occupancy 25%, feet on the wooden floor". Modello: Seedance 2.0.
- **Errore comune:** coordinate come garanzia matematica: sono un'ancora forte, non esatta (verificato).

#### Staging in profondità
- **Cos'è:** disporre i soggetti su più piani (primo piano, medio, fondo) così che la scena si racconti senza tagli (StudioBinder, «complex master shot», [S]; deep focus, [S]).
- **Si vede / si sente:** un personaggio in primo piano a fuoco, un altro che entra sul fondo.
- **Quando:** master complessi e oner. Brand: spot d'atmosfera, retail, hospitality.
- **Higgsfield:** "foreground: the woman's shoulder, out of focus; midground: the man at the table; background: a door opens and a waiter enters". Modello: Seedance 2.0. Un'entrata va scritta come fisica con durata (FAILURE-MODES).
- **Errore comune:** uscire e rientrare nella stessa clip: l'uscita dal quadro equivale a un taglio (verificato).

#### Movimento motivato
- **Cos'è:** la camera si muove perché qualcosa nella scena lo richiede (un personaggio, una scoperta); l'arc shot è un'eccezione perché il soggetto è fermo (StudioBinder, [S]).
- **Si vede / si sente:** il movimento «si giustifica» in azione; senza motivo sembra gratuito.
- **Quando:** sempre; domanda di controllo prima di ogni mossa. Brand: tutti.
- **Higgsfield:** scrivere il motivo nel prompt: "the camera follows her as she crosses to the window, stops when she stops". Modello: Kling 3.0.
- **Errore comune:** movimento di camera per «dare dinamismo» a un prodotto fermo.

#### Blocking del prodotto (reveal)
- **Cos'è:** coreografia di come il prodotto entra e resta nel quadro: dalla mano, dal fuori campo, dall'ombra. Pratica di mestiere (non letta una fonte, BASSA).
- **Si vede / si sente:** il prodotto compare con una causa fisica visibile.
- **Quando:** spot di prodotto, social, unboxing. Brand: tech, beauty, food, lusso.
- **Higgsfield:** **Verificato:** nessun oggetto si muove da solo; scrivere la causa: "the hand slides the bottle into frame from the right, the label faces camera". Il prodotto fuori campo non esiste (off-screen = nonexistent). Modello: Seedance 2.0 (cause fisiche) con riferimento immagine del prodotto.
- **Errore comune:** prodotto che compare «per magia».

**Fonti:** StudioBinder, «180 Degree Rule», «Master shot», «Deep focus», «Arc shot» (curl, 2026-11-08), [S]; skill Higgsfield (seedance SKILL § Frame Coordinate System e Spatial Layout Block, ENGINE-RULES, FAILURE-MODES) lette il 2026-11-08, [P]. Il blocking come disciplina non è stato verificato su un manuale di regia: MEDIA-BASSA.

---

## 8. Montaggio e ritmo

Il montaggio decide la durata percepita. Un taglio è una decisione di tempo, di spazio o di significato. Per i modelli, tagli e movimenti si dichiarano in una scala di precisione: oner, tagli in sequenza senza tempi, multishot con tempi, b-roll libero (cut ladder, verificato).

**Vocabolario di taglio Seedance (verificato):** HARD CUT, SMASH CUT, MATCH CUT, INSERT CUT, REVERSE CUT, WHIP CUT; dissolvenze solo se richieste. Ogni prompt con tagli porta "cuts only at the specified points, the camera does not cut on its own". I tempi dichiarati devono sommare alla durata (4–15 s).

#### Taglio netto (hard cut) e taglio di continuità
- **Cos'è:** passaggio diretto da un piano all'altro; il continuity editing mantiene la coerenza di tempo e spazio (StudioBinder, [S]).
- **Si vede / si sente:** il taglio non si nota.
- **Quando:** default del montaggio. Brand: tutti.
- **Higgsfield:** "HARD CUT at 3.0s" nel formato timed multishot. **Verificato:** double-contrast (cambiare dimensione del piano e carattere di camera a ogni taglio). Modello: Seedance 2.0.
- **Errore comune:** due piani uguali di seguito.

#### Jump cut
- **Cos'è:** taglio dentro un singolo piano che fa saltare il soggetto in avanti nel tempo; rende il montaggio evidente, rompe la continuità (StudioBinder, [S]).
- **Si vede / si sente:** salto di posizione e di tempo.
- **Quando:** montaggi, tensione, stato mentale, ritmo di vlog. Brand: social, moda street, musica.
- **Higgsfield:** "jump cut: same framing, the subject's position shifts forward at the cut" (da verificare). Modello: Seedance 2.0.
- **Errore comune:** confonderlo con il match cut (il match cut collega due scene).

#### Match cut
- **Cos'è:** transizione, visiva o sonora, che usa elementi della scena precedente per condurre nella successiva; ha un legame tematico; famiglie: graphic match (forme, colori, composizione), match on action, sound bridge (StudioBinder, [S]).
- **Si vede / si sente:** la ruota diventa l'orologio; il gesto continua in un altro luogo.
- **Quando:** passaggio di tempo, metafora. Brand: lusso, heritage, automotive.
- **Higgsfield:** **Verificato:** `MATCH CUT` nel vocabolario Seedance; "MATCH CUT: the circular lens of the camera on the table becomes the round window of the plane, same size and position in frame". Modello: Seedance 2.0.
- **Errore comune:** forme diverse di taglia: fissare posizione e dimensione.

#### J-cut
- **Cos'è:** l'audio della scena successiva precede l'immagine (la forma di J sulla timeline); è il contrario dell'L-cut (Apple, Final Cut Pro User Guide, [P]; Adobe, pagina di Premiere sul J-cut/L-cut via r.jina.ai, [P]; Wikipedia [S]; StudioBinder [S]; letti 2026-11-08, ALTA).
- **Si vede / si sente:** si sente il rumore della scena nuova mentre si vede ancora la vecchia.
- **Quando:** transizioni fluide, dialogo, apertura di un film. Brand: spot narrativi, podcast video.
- **Higgsfield:** audio in Kling 3.0 / Veo 3.1 / Cinema Studio con audio nativo; il J-cut è un'operazione di montaggio, da fare in post (da verificare se un modello la produce in un solo clip). **Attenzione:** `vocab.md` di Higgsfield scrive «L-cut / J-cut — audio from next shot leads picture (L) or vice versa (J)»: è l'inverso della definizione confermata da Apple e Adobe (J = audio successivo in anticipo): l'errore è in `vocab.md`, non in questo file. Segnalato al lead.
- **Errore comune:** scambiare J e L.

#### L-cut
- **Cos'è:** l'audio della scena precedente continua sull'immagine della successiva (StudioBinder, [S]).
- **Si vede / si sente:** si vede il volto che ascolta mentre l'altro ancora parla.
- **Quando:** dialogo, voice over, flashback, chiusura. Brand: testimonial, corporate.
- **Higgsfield:** **Verificato** (vocab): "L-cut audio bridge": si tiene l'audio del piano in uscita attraverso il taglio; in post. Modello: n/a (montaggio).
- **Errore comune:** vedi J-cut.

#### Cross-cutting e montaggio parallelo
- **Cos'è:** tagliare azioni separate per mostrare momenti simultanei; il parallel editing crea un parallelo narrativo da confrontare (StudioBinder, [S]).
- **Si vede / si sente:** alternanza fra due luoghi con tensione crescente.
- **Quando:** corsa contro il tempo, confronti. Brand: sport, before/after, sostenibilità.
- **Higgsfield:** due set di prompt con luci e palette diverse e un elemento di collegamento; ≤3 personaggi tracciati per taglio (verificato). Modello: Seedance 2.0.
- **Errore comune:** non dichiarare la simultaneità.

#### Montage
- **Cos'è:** serie di immagini separate, in movimento o ferme, montate in sequenza continua; comprime il tempo o intreccia storie (StudioBinder, [S]).
- **Si vede / si sente:** tagli rapidi e ritmo musicale.
- **Quando:** allenamento, viaggio, passaggio di tempo. Brand: sport, travel, fitness, moda.
- **Higgsfield:** **Verificato:** i micro-slice di più take, assemblati a posteriori; Cinema Studio speed ramp Ramp Up (3.0, verificato). Modello: Seedance 2.0 per i tagli, Kling 3.0 per i singoli clip.
- **Errore comune:** montage senza oggetto ricorrente.

#### Smash cut e whip cut
- **Cos'è:** taglio brusco senza ammorbidimento (smash, vocab Higgsfield); whip cut: taglio nascosto dentro un whip pan (vocab).
- **Si vede / si sente:** contrasto di volume e di luce.
- **Quando:** da silenzio a rumore, comicità. Brand: social, musica.
- **Higgsfield:** **Verificato:** `SMASH CUT`, `WHIP CUT` nel vocabolario. Modello: Seedance 2.0.
- **Errore comune:** uso su ogni taglio.

#### Effetto Kuleshov
- **Cos'è:** il senso nasce dall'accostamento di due piani, non dall'espressione di uno; più largo del campo/controcampo (StudioBinder, [S]).
- **Si vede / si sente:** un volto neutro cambia significato a seconda dell'oggetto che segue.
- **Quando:** piani di reazione, product-in-context. Brand: food (volto + piatto), lusso (volto + gioiello).
- **Higgsfield:** volto con espressione neutra di 1 s, poi INSERT sull'oggetto. Modello: Kling 3.0 (volto neutro), Seedance 2.0 (insert).
- **Errore comune:** volto troppo espressivo: il senso non nasce dall'accostamento.

#### Dissolvenze e transizioni (dissolve, fade, wipe)
- **Cos'è:** dissolvenza incrociata, in nero, a tendina; StudioBinder presenta tipi di cuts e transitions (pagina letta solo in apertura, BASSA).
- **Si vede / si sente:** passaggio di tempo, apertura/chiusura.
- **Quando:** ellissi, chiusure. Brand: heritage, lusso (dissolvenza lenta); social (quasi mai).
- **Higgsfield:** **Verificato:** in Seedance dissolvenze e crossfade solo se richiesti esplicitamente. Modello: Seedance 2.0; spesso meglio in post.
- **Errore comune:** transizioni da software come effetto-stile.

#### Durata dei piani e ASL
- **Cos'è:** l'ASL (average shot length) di Barry Salt è la durata totale divisa per il numero di shot; esempio: 5.400 s / 900 shot = 6 s (ricerca web, 2026-11-08, [S], una sintesi non letta nella fonte originale; BASSA). Si critica perché la distribuzione è asimmetrica e la mediana descrive meglio.
- **Si vede / si sente:** un ASL basso dà ritmo veloce, alto dà respiro.
- **Quando:** calcolare il ritmo di uno spot: numero di piani = durata / ASL desiderato. Brand: tutti.
- **Higgsfield:** calcolo di pianificazione: spot 15 s con ASL 2,5 s ≈ 6 piani (aritmetica, assunzione dello studio). Seedance 2.0 accetta 4–15 s a clip (verificato).
- **Errore comune:** pianificare 15 piani in 15 s con un modello che regge ≤3 personaggi per taglio.

#### Ritmo per formato: 6 s
- **Cos'è:** formato bumper o pre-roll non saltabile. Nessun benchmark pubblico trovato per i 6 s; per i 15 e 30 s esistono due misure (vedi sotto). Le regole che seguono per i 6 s sono di mestiere e assunzioni dello studio.
- **Si vede / si sente:** un'idea sola, un piano forte, logo nel contenuto.
- **Quando:** reminder, lancio, teaser. Brand: tutti.
- **Higgsfield:** 6 s sono una sola generazione (Veo 3.1 4/6/8 s; Kling 3.0 3–15 s; Seedance 2.0 4–15 s, verificato); 1–3 piani, ASL 2–6 s (stima). "In medias res": il primo fotogramma è già l'azione. Modello: Veo 3.1 se serve audio nativo; Kling 3.0.
- **Errore comune:** logo isolato in apertura (video-scriptwriting).

#### Ritmo per formato: 15 s
- **Cos'è:** formato standard di feed e storie. Benchmark misurato (AdSum, arXiv 2510.26569 v2, 17 dic 2025, 102 coppie di spot fast food/bibite USA da YouTube, letto 2026-11-08, [P] sui dati dell'autore): nei 15 s 8 shot e 1,52 s per shot (la figura dello stesso paper riporta 10 shot e 1,53 s: incongruenza interna del paper). Law et al., arXiv 2608.24329 (agosto 2026), 99 annunci cinematici (36 dello Studio 1a su 124 annunci raccolti + 63 dello Studio 1b; presi dalle librerie annunci di Meta e TikTok, solo in inglese, i più visti per impressioni di 35 marchi, maggio-luglio 2026): media 17,9 s, 15,2 shot, 1,2 s per shot [P, preprint non sottoposto a revisione, riletto sul PDF il 2026-11-08; la versione precedente scriveva «124 annunci cinematici», errore: 124 è l'intero corpus]; lo stesso paper cita come ordine di grandezza una durata media di circa 4 s per i film moderni (Cutting 2016, citato dal paper, non letto) e circa 30 s per gli spot TV. Campione non rappresentativo di ogni mercato. Le due misure sono più rapide della stima dello studio qui sotto (4–7 piani, ASL 2–4 s).
- **Si vede / si sente:** apertura forte, un corpo centrale con un punto di svolta a metà, CTA finale.
- **Quando:** annunci, product demo. Brand: tech, food, retail.
- **Higgsfield:** 4–7 piani come stima (ASL 2–4 s); un solo clip Seedance 2.0 multishot (max 15 s) o più clip concatenati; controllare il punto di mezzo (video-scriptwriting: cambia qualcosa a metà). Modello: Seedance 2.0 (multishot), Kling 3.0.
- **Errore comune:** prompt oltre 180 parole: per Seedance 50–80 parole è l'ottimo di coerenza, ~180 è dove inizia a rompersi e oltre 220 spesso fallisce nel text encoder (SKILL.md Seedance, righe 153-157, letto 2026-11-08, [P]); il CHANGELOG (riga 1351) precisa che l'ottimo 50–80 vale solo per il singolo shot, quindi per un multishot da 15 s il limite di ~180 parole non è confermato come soglia complessiva (da verificare in generazione).

#### Ritmo per formato: 30 s
- **Cos'è:** formato narrativo o istituzionale; richiede costruzione. Benchmark misurato (AdSum, arXiv 2510.26569 v2, letto 2026-11-08, [P] sui dati dell'autore; spot fast food/bibite USA): nei 30 s 18 shot e 1,67 s per shot. Per brand film di lusso o heritage non esistono dati pubblici trovati: il benchmark è di un settore veloce.
- **Si vede / si sente:** atti: apertura, sviluppo, picco, chiusura.
- **Quando:** brand film brevi. Brand: lusso, heritage, hospitality.
- **Higgsfield:** oltre il limite di una generazione (15 s): 2+ clip concatenati con frame d'uscita→ingresso e azione che attraversa il taglio (verificato); Cinema Studio 4.0 non dichiara il limite di durata (da verificare). Modello: Seedance 2.0 + montaggio in post.
- **Errore comune:** concatenare senza ripetere i valori assoluti (velocità, luce) fra i clip.

#### Ritmo verticale (9:16)
- **Cos'è:** formato nativo per social; Kling 3.0, Seedance 2.0 e Veo 3.1 lo supportano (enum verificato, snapshot 2026-09-26). Il ritmo è più rapido per costume del feed, non per natura (video-scriptwriting).
- **Si vede / si sente:** soggetto in piano medio o primo piano, altezza dominante, testo grande.
- **Quando:** reel, storie, annunci mobile. Brand: moda, beauty, food, app.
- **Higgsfield:** componi per la verticale: "vertical 9:16 frame, subject centred, headroom to the top safe area". Piani: più primi piani e figure intere; evitare campi larghi orizzontali. Modello: Kling 3.0 o Veo 3.1.
- **Errore comune:** generare 16:9 e tagliare a 9:16 in post: si perde soggetto e aria.

**Fonti:** StudioBinder, pagine su jump cut, J-cut, L-cut, match cut, cross-cutting, montage, continuity editing, Kuleshov (dal campo/controcampo), transitions (curl, 2026-11-08), [S], MEDIA; ricerca web su ASL (2026-11-08), [S], BASSA (fonti primarie Cinemetrics e Salt non lette; il sito Filmmakers Academy ha bloccato curl); skill Higgsfield (seedance SKILL § Cut-format ladder, vocab, FAILURE-MODES, model-guide, root SKILL.md) lette il 2026-11-08, [P]. Benchmark sugli shot degli spot: AdSum arXiv 2510.26569 v2 (17 dic 2025) e Law et al. arXiv 2608.24329 (agosto 2026), letti 2026-11-08, [P] sui dati degli autori, MEDIA (campioni limitati). J-cut/L-cut: la definizione di questo file è confermata da Apple Final Cut Pro User Guide e da Adobe (via r.jina.ai) [P], e da Wikipedia [S]; **`vocab.md` della skill Higgsfield (riga 125) le ha invertite**: da segnalare al lead.

---

## 9. Grammatica per la pubblicità e i social

I principi vengono da `video-scriptwriting` (skill dello studio) e sono qui tradotti in inquadratura. Il video si paga secondo per secondo e lo spettatore può uscire in qualsiasi momento.

#### Hook nei primi fotogrammi
- **Cos'è:** l'apertura decide tutto: l'immagine più forte, il risultato prima del processo, un'affermazione specifica, il problema nel suo momento peggiore, un volto che parla già dentro una frase, movimento fin dai primi fotogrammi; mai logo da solo, saluto, domanda retorica ovvia (video-scriptwriting, skill dello studio, [P] interno).
- **Si vede / si sente:** il primo fotogramma è già l'azione.
- **Quando:** ogni annuncio in feed o pre-roll. Brand: tutti.
- **Higgsfield:** **Verificato:** "in medias res": la clip inizia a metà azione; scrivere il primo piano come immagine più forte, non come establishing. Preparare tre aperture diverse per ogni script. Modello: Seedance 2.0 (apertura in medias res), Kling 3.0.
- **Errore comune:** aprire con un establishing shot lento.

#### Formati verticali e safe zone
- **Cos'è:** zone dello schermo coperte dall'interfaccia della piattaforma (profilo, bottoni, didascalia). I valori cambiano per formato, piattaforma, canvas di riferimento e (TikTok) lunghezza della didascalia. Letti sulle pagine ufficiali il 2026-11-08, [P]: **YouTube** (Google Ads Help, answer/9128498, SVG ufficiale su canvas 1080×1920): 288 px sopra, 672 sotto, 192 a destra, 48 a sinistra; la pagina Google degli Shorts ads (business.google.com/us/ad-solutions/youtube-ads/shorts-ads/) indica invece alto 10%, basso 25%, destra 10%: le due indicazioni Google discordano, vale la più prudente. **Meta** (Ads Guide, Instagram Reels, immagine e video, canvas 1440×2560): 14% sopra, 35% sotto, 6% per lato; l'Help Center Meta non dà percentuali, indica solo il 40% in basso se la Reel ha un disclaimer. **TikTok** (Business Help Center, «TikTok Auction In-Feed Ads», giugno 2026, con i template zip ufficiali): non c'è un valore fisso; canvas 720×1280: 160 sopra, 80 per lato, 440 sotto, colonna destra 120; canvas 540×960: 126 sopra, 60 per lato, 120 a destra, margine inferiore 406 (1 riga di didascalia) o 507 (4 righe). Formato verticale 9:16 con minimo 540×960 px per gli In-Feed (stessa pagina TikTok, [P]). Le percentuali Meta/YouTube/TikTok non sono intercambiabili: si applica il template della piattaforma di destinazione.
- **Si vede / si sente:** testi e logo nella parte centrale, fuori da fasce alte e basse.
- **Quando:** ogni verticale. Brand: tutti.
- **Higgsfield:** lasciare lo spazio come zona dichiarata: "the lower 35 percent and the top 15 percent of the frame contain only background, no face, no logo, and the right 18 percent stays clear of the main subject" (**corretto 2026-11-08**: la formula precedente, 25% in basso e 12% in alto, era un valore di lavoro dello studio più stretto di tutte e tre le fonti ufficiali: Meta 35% basso / 14% alto; YouTube 672/1920 = 35% basso, 288/1920 = 15% alto, 192/1080 = 18% destra; TikTok 440/1280 = 34% basso, 160/1280 = 12,5% alto, 120/720 = 17% colonna destra; i rapporti sono calcoli dello studio sui pixel ufficiali. Per TikTok vale il template dell'Ads Manager, che con più righe di didascalia sale a 507/960 = 53% in basso nella variante con anchor a 4 righe. Se la Reel ha un disclaimer Meta indica il 40% in basso libero). La formula in prompt è da verificare in generazione. Modello: qualsiasi con 9:16.
- **Errore comune:** testo impresso nell'immagine: va aggiunto in post come livello (video-scriptwriting).

#### Muto prima, suono dopo
- **Cos'è:** il video deve funzionare a volume zero; il parlato aggiunge sfumatura, non l'informazione critica; i sottotitoli sono obbligatori (video-scriptwriting, [P] interno).
- **Si vede / si sente:** azione chiara senza voce; testo a schermo corto.
- **Quando:** ogni feed. Brand: tutti.
- **Higgsfield:** mostrare l'informazione critica con un insert leggibile (0,3–0,5 s, soggetto nominato, verificato); audio nativo (Veo 3.1, Kling 3.0) solo come strato. Modello: Veo 3.1 o Kling 3.0 per l'audio.
- **Errore comune:** concetti solo nel dialogo.

#### Spazio per il testo (inquadratura al servizio del copy)
- **Cos'è:** lasciare spazio per il testo è una decisione di ripresa, non di montaggio (video-scriptwriting, [P] interno).
- **Si vede / si sente:** zona vuota stabile dove sta il copy per la durata di lettura.
- **Quando:** quando il messaggio è a schermo. Brand: tutti; lusso e tech con spazio negativo.
- **Higgsfield:** vedi §3 (Spazio negativo): "the upper-left 40 percent of the frame is plain dark wall, nothing moves there". Camera fissa nella zona. Modello: Seedance 2.0 / Kling 3.0.
- **Errore comune:** camera in movimento che sposta il vuoto.

#### Loop
- **Cos'è:** il video che torna al primo fotogramma senza stacco, per la riproduzione ripetuta. Pratica di mestiere (non letta una fonte, BASSA).
- **Si vede / si sente:** l'ultima posa è la prima.
- **Quando:** social, loop di prodotto, GIF-like. Brand: moda, beauty, tech.
- **Higgsfield:** "the last frame returns to the exact starting pose and framing, seamless loop, locked-off camera" (da verificare in generazione); con `start_image` e frame finale uguale se il modello lo accetta (da verificare). Modello: Kling 3.0 (start_image, model-guide).
- **Errore comune:** loop con camera in movimento: il ritorno non coincide.

#### Un'idea per inquadratura e punto di mezzo
- **Cos'è:** un'idea per video, una per inquadratura, e il momento di calo è a metà: lì deve cambiare qualcosa (luogo, dato, volto, ritmo) (video-scriptwriting, [P] interno).
- **Si vede / si sente:** cambio di scala o di luogo al centro.
- **Quando:** ogni script. Brand: tutti.
- **Higgsfield:** cambio di piano e di carattere di camera a metà (double-contrast, verificato). Modello: Seedance 2.0.
- **Errore comune:** metà video uguale all'inizio.

#### Versioni per durata e aperture alternative
- **Cos'è:** per accorciare si riscrive solo l'apertura; il nucleo e la CTA restano. Annunci simili contano come una sola creatività su Meta (Meta for Business, 2025-12-16, riportato dalla skill video-scriptwriting; non riletto in originale, [S], BASSA): tre aperture sullo stesso corpo testano l'hook, non il concetto.
- **Si vede / si sente:** stessa chiusura, aperture diverse.
- **Quando:** test creativi. Brand: tutti.
- **Higgsfield:** generare l'apertura come clip separato e riusare il corpo. Modello: Seedance 2.0.
- **Errore comune:** testare concetti con la stessa struttura.

**Fonti:** skill `video-scriptwriting` (studio, letta nel contesto della sessione 2026-11-08), [P] interno; skill Higgsfield (seedance, model-guide, root SKILL.md) lette il 2026-11-08, [P]; safe zone: Google Ads Help answer/9128498 e pagina Google Shorts ads; Meta Ads Guide Instagram Reels e Meta Help Center; TikTok Business Help Center «TikTok Auction In-Feed Ads» con zip dei template (curl, r.jina.ai, playwright-cli Chrome headed; letti 2026-11-08), [P], ALTA. Meta for Business 2025-12-16 resta riportato da secondaria (non riletto). Le safe zone sono parametri che le piattaforme cambiano: rileggere prima di fissare pixel dopo 90 giorni.

---

## Cosa non è stato verificato

- Safe zone: lette sulle pagine ufficiali il 2026-11-08 (vedi §9); non verificate Facebook Feed e Stories, né i formati diversi da Reels/In-Feed/Shorts.
- Definizioni di zoom, crash zoom, pedestal, FPV, roll, simmetria, headroom, frame within a frame, leading lines, treppiede, slider, gimbal: senza fonte letta (BASSA).
- Efficacia sui modelli di molte formule «da verificare»: nessuna generazione è stata eseguita in questa sessione.
- Benchmark di ASL: trovati solo due campioni misurati (spot USA fast food/bibite; 124 annunci cinematici), non per lusso, heritage o 6 s. Il paper AdSum ha incongruenze interne (10 vs 8 shot nei 15 s; 1,53 vs 1,52 s). Salt e Cinemetrics originali non letti.
- Verifica delle citazioni fatta dall'autore, non indipendente (per le parti toccate vedi la sezione seguente).

---

## Verifica del 2026-11-08

Verificatore indipendente (non autore). Metodi: curl con user-agent, r.jina.ai, playwright-cli Chrome headed, PDF con PDFKit.
- **Promossi a [P]:** safe zone YouTube, Meta Reels, TikTok In-Feed (§9); definizione J-cut/L-cut (Apple, Adobe); preset Crash Zoom In/Out (file Higgsfield); benchmark shot per spot 15 e 30 s (AdSum arXiv 2510.26569 v2; Law et al. arXiv 2608.24329).
- **Corretti:** (1) safe zone «non lette» sostituite con valori ufficiali; (2) le percentuali dello studio nel campo Higgsfield (25% basso, 12% alto) sono più strette di Meta/YouTube: avvisato nel testo; (3) stima 15 s dello studio (ASL 2–4 s) più lenta dei dati misurati (1,2–1,5 s); (4) Crash zoom: modello «Kling 2.6 o 3.0» ripassato a «da verificare»; (5) Steadicam: StudioBinder e Wikipedia concordano (1974 prime prove, 1975 prodotto), ma restano [S]: segnalato che mancano primarie; (6) POV: «Veo 3.1 / Kling 3.0» per l'handheld non risulta nel model-guide (che dice Kling 2.6 e Veo 3): marcato inferenza; (7) soglia ~180 parole: precisato che l'ottimo 50–80 vale per il singolo shot, non dimostrato per il multishot.
- **Controlli a campione su fonti già [P] o [S] note (16, nessun errore salvo (6)):** durate Seedance 4–15 s, Kling 3.0 3–15 s, Veo 3.1 4/6/8 s, limite 3 personaggi, 50–80/180 parole, Crane Up→Seedance/Hailuo 2.3, Handheld→Veo 3, 19 nomi di preset camera/taglio nelle skill Higgsfield; Technocrane (Photokina, settembre 1986), Skycam (inizio anni Ottanta), regola dei 30°, dolly zoom (Wikipedia); Steadicam, 180°, J-cut (StudioBinder).
- **Da segnalare al lead:** `vocab.md` Higgsfield (riga 125) inverte J-cut e L-cut.
- **Aperti:** date Steadicam, Technocrane 1986, Skycam, Russian Arm (nessuna primaria letta); Salt e Cinemetrics originali; Meta for Business 2025-12-16; safe zone Facebook Feed/Stories; definizioni BASSA di zoom, pedestal, FPV, roll, simmetria, leading lines, treppiede, slider, gimbal (nessuna scheda letta). Headroom e lead room: da BASSA a MEDIA (più secondarie concordi, nessuna primaria).
- **Rischio:** AdSum ha incongruenze interne e campioni USA di un solo settore: non usare come norma per lusso o 6 s.

