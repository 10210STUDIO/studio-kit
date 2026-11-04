# Playbook — creative-performance-strategist

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-11-04] Errore: conti per cella sbagliati e fatti di prodotto inventati

**Pattern:** prima di consegnare una matrice di test, rifai a mano budget e acquisti (o risultati) per ogni cella angolo × esecuzione e controlla che righe e colonne tornino col totale. Tutto ciò che il brief non dice sul prodotto (costruzione, materiali, prezzi, casi) si marca «da confermare».
**Evidenza:** test cieco del 2026-11-04: un elaborato di questo ruolo ha sbagliato il conto degli acquisti per angolo e ha dato per vera una costruzione della scarpa che il brief non conteneva. Entrambi gli errori li ha trovati chi giudicava, non chi produceva.
**Quando non vale:** mai: il controllo costa minuti. Se il brief non dà budget né obiettivo di acquisti, la matrice si fa senza conti e lo si dichiara, invece di inventarli.
**Cliente/progetto:** generale.

## [2026-11-04] Meta: «diverso» = concetto diverso, non file diverso

**Pattern:** Meta raggruppa gli annunci che si assomigliano per aspetto e tema e li tratta come varianti della stessa creatività, con apprendimento e delivery condivisi. Cambiare solo testo o call to action è iterazione, non diversificazione. Venti hook sullo stesso corpo video possono contare come una creatività sola: leggili come iterazione, non come venti test di angolo. Gli insight di similarità sono in prova: controlla se l'account li ha.
**Evidenza:** [P] Meta for Business, «Demystifying creative diversification», 2025-12-16, https://www.facebook.com/business/news/demystifying-creative-diversification : «When multiple ads look or feel alike, these are seen as variations of the same creative, meaning learnings and delivery optimizations are shared at the creative level»; «We're beginning to test creative insights». Il post non dà soglie numeriche: le soglie 40%, 60% e «8-12 concetti» che girano sono di terzi, non usarle.
**Quando non vale:** non dice quanto devono differire due ad per essere separati, e non vale per TikTok o Google (non verificati). Se l'account mostra l'insight di similarità, vince quello che dice l'account.
**Cliente/progetto:** generale.

## [2026-11-04] Meta: hook rate con la metrica giusta

**Pattern:** su Meta l'hook rate si scrive «3-second video plays ÷ impression». La formula è una convenzione di mestiere; la metrica è di Meta: conta le riproduzioni di almeno 3 secondi (o del 97% di un video più corto), separate per impression, senza i replay, autoplay compreso. Hold rate: scegli una formula, scrivila (es. ThruPlay ÷ 3-second video plays) e non cambiarla dentro un test.
**Evidenza:** [P] Meta Business Help Centre, «3-second video plays», https://en-gb.facebook.com/business/help/743427195703387 , letta 2026-11-04: «The number of times that your video played for at least three seconds, or for nearly its total length if it's shorter than three seconds… exclude any time spent replaying the video.»
**Quando non vale:** non esiste un benchmark ufficiale Meta di hook rate né di hold rate. La definizione di ThruPlay non l'ho riletta oggi: leggila nel Help prima di usarla. Non confrontare con TikTok.
**Cliente/progetto:** generale.

## [2026-11-04] Meta: finestra di lettura cambiata nel 2026, non confrontare prima e dopo

**Pattern:** un test creativo su Meta si legge con la finestra di attribuzione attiva nell'account, scritta nel piano. Non confrontarlo con test letti prima di marzo 2026: da allora il click-through conta solo i clic sul link, e salva e condividi passano a «engage-through».
**Evidenza:** [P] Meta, https://www.facebook.com/business/news/click-attribution , 2026-03-03: click-through «to exclusively include link clicks»; le altre azioni passano a «engage-through»; la soglia di engaged view per i video scende da 10 a 5 secondi; rollout da fine marzo 2026, non per tutti lo stesso giorno. [P] Meta for Developers, 2025-10-16: dal 2026-01-12 l'Insights API non restituisce più `7d_view` e `28d_view`.
**Quando non vale:** la durata della finestra engage-through non è sulla pagina. Il cambio non tocca la fatturazione.
**Cliente/progetto:** generale.

## [2026-11-04] Asset AI: etichetta art. 50 AI Act, già in vigore per chi li usa

**Pattern:** ogni ad generato o modificato con AI che mostra persone, luoghi, oggetti o eventi verosimili passa da `compliance-rights-officer` prima del lancio. Registra per ogni ad quali strumenti AI l'hanno toccato. Lo studio di solito è «utilizzatore»: per i deepfake l'obbligo di etichetta vale già. Per opere evidentemente artistiche o di finzione basta una dichiarazione che non disturbi la visione.
**Evidenza:** [P] Reg. (UE) 2024/1689, art. 50, applicabile dal 2026-08-02 (art. 113). Il rinvio al 2026-12-02 (Reg. (UE) 2026/1744, art. 111(4)) vale solo per i fornitori di sistemi già sul mercato e solo per la marcatura dell'art. 50(2), non per chi usa lo strumento (art. 50(4)). Linee guida C(2026) 5054 del 2026-07-20, non vincolanti; Codice di condotta del 2026-06-10: metadati firmati, filigrana, icona all'inizio del video ripetuta a intervalli; non nomina C2PA. Verificato il 2026-11-04 su EUR-Lex/Cellar.
**Quando non vale:** la decisione finale sull'etichetta non è di questo ruolo. Le regole di etichettatura AI proprie di Meta, TikTok e Google sono un'altra cosa e non sono verificate.
**Cliente/progetto:** generale.

## [2026-11-04] Google: linee guida di testo per AI Max e Performance Max

**Pattern:** per ogni cliente con text customization attiva su Search (AI Max) o Performance Max, scrivi da `brand-voice` le linee guida di testo: esclusioni di termini e restrizioni di messaggio, ognuna con un esempio concreto. Prima di aggiungerle, avvisa chi gestisce l'account che valgono anche per i testi già generati, che vengono rimossi se non le rispettano.
**Evidenza:** [P] Google Ads Help, «Use text guidelines with Performance Max and Search campaigns (beta)», https://support.google.com/google-ads/answer/16489313 , letta 2026-11-04: «experimental beta»; richiede text customization «ON»; fino a 25 esclusioni e 40 restrizioni per campagna; le esclusioni valgono per lingua, le restrizioni anche sulle altre lingue; le esclusioni non bloccano i prezzi (serve una restrizione tipo «Don't generate assets with prices»); «existing Google-optimized text assets will stop serving and be marked as removed if they don't adhere».
**Quando non vale:** è una beta: limiti e comportamento si rileggono sulla pagina prima di ogni impostazione. Linee guida troppo larghe tolgono molti asset buoni e possono far calare la campagna (lo dice la pagina). Microsoft Ads ha controlli simili, non verificati.
**Cliente/progetto:** generale.

## Da verificare

(ipotesi non ancora dimostrate)
