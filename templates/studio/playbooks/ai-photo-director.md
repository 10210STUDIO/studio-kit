# Playbook — ai-photo-director

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-10-29] Campagne a registri, non una serie sola
**Pattern:** più campagne distinte, una per mondo di riferimento del cliente (per un cliente di lusso, per esempio, mondi diversi della moda), con nomi propri; colore trattenuto come base, bianco e nero nel mix; se il marchio ha un colore riservato, mai in scena.
**Evidenza:** quattro prove foto in un progetto reale: reportage bocciato, tutto B/N «poco editoriale», serie unica «molto meglio», cinque registri «molto molto meglio», approvata.
**Quando non vale:** casi clienti con foto vere: non si generano.
**Cliente/progetto:** generale.

## [2026-11-01] «Sembra AI» si cura togliendo le persone, non aggiungendo grana
**Pattern:** quando il cliente boccia foto «troppo AI», le cause sono quasi sempre persone in posa con lo stesso volto, materia nuova e metafore illustrate. Still life di oggetti veri e usati del mestiere (polvere, matita, carta arricciata), una sola luce da finestra, oggetto tagliato dal bordo: con Nano Banana Pro 4k 12 candidate buone su 23 generate. Nel prompt NON scrivere «medium-format film» o «Portra»: il modello aggiunge una cornice da pellicola con angoli arrotondati (2 casi su 23). Scrivere invece «full-bleed, no border, no film frame».
**Evidenza:** due slot fotografici di un sito, 23 generazioni con log; giudizio del cliente non ancora registrato.
**Quando non vale:** dove serve una persona (campagne a registri approvate).
**Cliente/progetto:** generale.

## [2026-11-01] Nano Banana Pro: oggetti con segni scritti tornano sbagliati
**Pattern:** righelli, quadranti, firme e dorsi di libri escono con numeri e lettere inventati (4 scarti su 11). Evitare oggetti che portano scritte; un quadrante rotondo si legge come un orologio. «No numbers, no markings» nel prompt non basta. Un prompt con «basement» è stato bloccato come nsfw (non addebitato): riformulare senza.
**Evidenza:** come sopra.
**Quando non vale:** —
**Cliente/progetto:** generale.

## [2026-11-01] Nano Banana Pro a colore pieno: cornici, forme-lettera, oggetti indesiderati, soglie
**Pattern:**
- **Modello.** Nano Banana Pro 2k a 2 crediti l'immagine regge colore pieno, luce dura e ombra netta. Con 24 bozze e un giro di ripresa si spendono circa 74 crediti.
- **Cornice bianca.** Il modello aggiunge ancora cornici bianche nonostante "full-bleed, no border". Una misura automatica di luminosità le premia, perché il bianco della cornice alza il p99. Prima di misurare, controllare il bordo con un bbox (il rettangolo che contiene l'immagine) e rifilare o rigenerare.
- **Forme che diventano lettere.** "Il calco del vuoto dentro una lettera" fa uscire lettere vere. Funziona invece "smooth closed convex pebble form, no notches, no hooks, no counters, nothing letter-like".
- **Lampade in quadro.** "No lamps" non basta: il faro esce in quadro in 4 bozze su 24.
- **Soglie che non si possono rispettare.** Sulle immagini a campo di colore, soglie su bianchi pieni, bianchi neutri e area nera falliscono per costruzione: per una cella a colore pieno non chiedere bianchi e nero. Un verde bottiglia ha C* intorno a 25: una soglia "C* medio ≥ 25" è quasi impossibile per una cella verde (circa 18 è realistico). Soglie di saturazione non tarate su riferimenti bocciano immagini a colore pieno con pareti bianche a fare da fondo.
- **Ritagli 4:5 da un 21:9.** Un soggetto che attraversa tutto il quadro non entra nel 4:5 (perde i piedi, o se ne vede metà). Prevedere una generazione 4:5 a parte, oppure accettarlo.
- **Coraggio senza colori vietati.** Se alcuni colori sono vietati dal brand, il coraggio si ottiene con complementari pieni come giallo su cobalto.
**Evidenza:** giro di 24 bozze a colore pieno per un sito, con misure CIELAB per immagine.
**Quando non vale:** soglie e costi vanno ritarati su ogni progetto; i prezzi cambiano.
**Cliente/progetto:** generale.

## [2026-11-01] High key caldo: modelli, costi e soglie di misura che si scontrano col brief
**Pattern:**
- **Costi a immagine 2k:** Nano Banana Pro 2; GPT Image 2.5 high 2,75; Seedream 5 Pro 2,5 (non ha il 4:5: generare 3:4 e ritagliare); GPT Image 2 high 6,5. Per 12 idee, i 4:5 a parte e i rifacimenti: 82 crediti.
- **GPT Image 2.5** tiene meglio le scene complesse: tavolata con oggetti sospesi, 7 persone in fila, 9 gambe tutte alla stessa altezza.
- **Nano Banana Pro** rende meglio pelle, fiori e ritratti a colore pieno.
- **Lanci in parallelo:** 9 lavori insieme hanno restituito `not_enough_credits` su 4, pur con il saldo pieno. Lanciarne al massimo 2 alla volta.
- **Colore di marca vietato in scena:** un controllo «ΔE2000 ≤ 15 dal colore di marca» prende le ombre di tinte vicine ma diverse (pochi gradi di tinta accanto al colore di marca), anche se i colori della serie distano tutti 23 o più. Lasciarlo come segnalazione, non come blocco.
- **Toni chiari sotto soglia:** rosa confetto e pesca chiari hanno C* sotto 35 e non passano una soglia «C* ≥ 40 su 40%». Chiedere «saturated bubblegum-pink #F58CB8» oppure «deep-peach #FF9A62».
- **Lilla (tinta circa 300°):** fa fallire una soglia «caldo ≥ 60%» anche se ridotto a margine nel prompt.
- **«Diners only at the edges»** in GPT 2.5 dà comunque volti interi, e uno in più. Funziona invece «no faces at all, cropped shoulders and hands».
- **Permessi Bash:** se `python3 -c`, `$(...)`, heredoc, `cd` e i comandi incatenati con `higgs` vengono negati, mettere tutto in file `.py` veri con percorsi assoluti (generazione, costo, misura) e lanciare comandi singoli.
**Evidenza:** un giro di 12 idee con script di generazione e misura e log per immagine.
**Quando non vale:** i prezzi cambiano: rifare `higgs generate cost`.
**Cliente/progetto:** generale.

## [2026-11-01] Togliere un colore vietato da una foto generata: tinta, rifacimenti, sfumatura
**Pattern:**
- **Spostare la tinta di una zona per allontanarla dal colore vietato funziona solo se la rotazione non lo attraversa.** Con un colore di marca a tinta Lab H: su una zona a circa H − 10°, girarla di altri 10° verso H − 20° la allontana dal marchio (1,53% → 0,07% di pixel presi); su una zona a circa H + 12° lo stesso giro (−10°) la porta *addosso* a H e peggiora (3,21% → 3,41%). Prima di correggere, guardare la tinta media dei pixel presi.
- **I rifacimenti con una frase «ombre chiare» non spostano le superfici che hanno per natura una tinta vicina al colore vietato** (per un colore caldo: pelle, legno, pareti in ombra) (9,7 → 6,9%; 7,9 → 3,3 → 9,7%; 3,2 → 4,1 → 9,9%). Funzionano solo quando il colore sta in un elemento che il modello può togliere o illuminare (1,22 → 0,04%; 10,99 → 0,00%). Dopo un secondo tentativo andato a vuoto, fermarsi e portare la questione a chi decide: è la soglia contro il soggetto, non un difetto.
- **Il riquadro della correzione va sfumato.** Con un taglio netto, la superficie vicina (stessa tinta) mostra lo spigolo. GaussianBlur 80 sul riquadro risolve.
**Evidenza:** una serie di bozze con script di correzione e misura per immagine.
**Quando non vale:** se cambia la soglia o la tinta del colore vietato.
**Cliente/progetto:** generale.

## [2026-11-01] Misure sul file finale e tagli fuori campo
**Pattern:**
- **Il colore vietato si misura sul file finale e sulla copia web, non sul raw.** Ritaglio 3:4→4:5 e JPEG lo alzano: 0,74% raw → 1,05% finale → 1,18% web. Vicino a una soglia dell'1% decide il JPEG.
- **«Out of frame» non basta se la camera è «from slightly below»:** un cappello «held out of frame» è rientrato con la testa. Camera «at shoulder height, straight on» e fonte d'ombra lontana («parasol far overhead») tolgono il cappello; la nuca resta parzialmente in campo.
**Evidenza:** stessa serie, misure e log per immagine.
**Quando non vale:** se cambia la soglia o il formato JPEG delle copie.
**Cliente/progetto:** generale.

## Da verificare

- Nano Banana Pro 2k (2 crediti) dà foto più «moda» e meno sintetiche di soul_cinematic (0,12): 15 scatti su 17 utilizzabili, giudizio del cliente non registrato. Con 21:9 una volta ha prodotto un dittico (due pannelli affiancati): controllare. Con gruppi «four people» a volte ne mette cinque.
