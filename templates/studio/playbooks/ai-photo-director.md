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

## [2026-11-04] Catalogo immagini Higgsfield: 40 job type
**Pattern:** il catalogo vero è `higgs model list --image` (40 voci), non le skill. Nano Banana: `nano_banana_2_1` (2.1), `nano_banana_pro`, `nano_banana_flash` (= Nano Banana 2), `nano_banana_2_lite`, `nano_banana`; quattro job type con nome «Nano Banana Pro»: `nano_banana_2_ai_stylist`, `_relight`, `_skin_enhancer`, `_shots`. Soul: `text2image_soul_v2`, `soul_cast`, `soul_location`, `soul_cinematic`. OpenAI/Grok: `gpt_image_2`, `gpt_image_2_5`, `openai_hazel`, `grok_image`, `grok_image_2_0`. Seedream: `seedream_v5_pro`, `seedream_v5_lite`, `seedream_5_0_flash`, `seedream_v4_5`. Altri: `flux_3_image`, `flux_2`, `flux_kontext`, `flux_2_pro_outpaint`, `ideogram_4_5`, `ideogram_vector`, `recraft_v4_1`, `recraft_v4_styles`, `z_image`, `kling_omni_image`, `image_auto`. Strumenti: `outpaint`, `topaz_image`, `topaz_image_generative`, `bytedance_image_upscale`, `image_background_remover`, `3d_jutsu_angles`, `autosprite`. Workflow immagine (`higgs workflow list`): `cinematic_studio_image`, `cinematic_studio_2_5`, `cinematic_studio_soul_cast`, `cinematic_studio_soul_location`, `soul_cinema_studio`, `image_decompose`, `marketing_studio_image`, `marketing_studio_2_image` (Product Shot), `ms_image`.
**Evidenza:** [P] `higgs model list --image` e `higgs workflow list`, lanciati il 2026-11-04.
**Quando non vale:** sopra i 30 giorni: rilanciare. L'elenco dice cosa esiste, non i parametri né la qualità.
**Cliente/progetto:** generale.

## [2026-11-04] Nano Banana 2.1 su Higgsfield: parametri e costo
**Pattern:** `nano_banana_2_1` accetta fino a 14 immagini in ingresso (maschera compresa), risoluzione 1k/2k/4k, `thinking_level` minimal/medium/high (default medium), inpaint con `mask` + `is_inpaint`, formati da 1:1 a 21:9 più 4:1, 1:4, 8:1, 1:8 (ha il 4:5). Costo: 2 crediti a 2k, 3 a 4k; Nano Banana Pro 2 a 2k, 4 a 4k. Per i master 4k il 2.1 costa meno del Pro: confrontarli su due frame prima di una serie.
**Evidenza:** [P] `higgs model get nano_banana_2_1` e `higgs generate cost` (prompt di prova, thinking default), 2026-11-04. Nessuna generazione: qualità non provata.
**Quando non vale:** i prezzi cambiano e `thinking_level` alto potrebbe costare di più (non misurato): rifare `higgs generate cost` con i parametri veri.
**Cliente/progetto:** generale.

## [2026-11-04] Trasparenza AI (AI Act art. 50): cosa vale per le nostre foto
**Pattern:** l'art. 50 si applica dal 2 agosto 2026. Il rinvio al 2 dicembre 2026 (Reg. UE 2026/1744, nuovo art. 111(4)) vale solo per i **fornitori** di sistemi già sul mercato e solo per la marcatura dell'art. 50(2): {{STUDIO}} usa lo strumento, quindi nessun rinvio per noi. Per opere «evidentemente artistiche, creative, satiriche, di finzione» l'obbligo dell'art. 50(4) si limita a dichiarare l'esistenza del contenuto generato in modo che non disturbi la fruizione. Se una foto di campagna rientri nel caso «deepfake» lo decide `compliance-rights-officer`, non io. Il Codice di condotta (10 giugno 2026) chiede metadati firmati e filigrana non percepibile (impronta facoltativa, icona UE «AI») e **non nomina C2PA**. Linee guida C(2026) 5054 del 20 luglio 2026: non vincolanti. Per ogni foto consegnata: registro con modello, job-id, prompt, riferimenti, costo, intervento umano.
**Evidenza:** [P] Reg. UE 2024/1689 art. 50 e 113; Reg. UE 2026/1744; Codice e Linee guida sul sito della Commissione; letti il 2026-11-04.
**Quando non vale:** fuori UE; e se compliance dà un'interpretazione diversa sul caso concreto, vale la sua.
**Cliente/progetto:** generale.

## [2026-11-04] Diritto d'autore: senza intervento umano la tutela è dubbia
**Pattern:** dopo la L. 132/2025 (art. 25, in vigore dal 10/10/2025) l'art. 1 L. 633/1941 protegge le opere dell'ingegno umano «anche laddove create con l'ausilio di strumenti di intelligenza artificiale, purché costituenti risultato del lavoro intellettuale dell'autore». Negli USA l'Ufficio del copyright (Parte 2, gennaio 2025, parere non sentenza): «prompts do not alone provide sufficient control». Quindi il registro deve documentare cosa abbiamo deciso e fatto a mano (direzione, scelta fra N bozze, ritocchi, compositing, testo in post), non solo il prompt.
**Evidenza:** [P] normattiva.it (L. 132/2025 art. 25) e copyright.gov, letti il 2026-11-04.
**Quando non vale:** non dice quanto intervento basta: nessuna sentenza italiana verificata. Il giudizio sul singolo caso è di compliance.
**Cliente/progetto:** generale.

## [2026-11-04] C2PA e SynthID: cosa si può promettere
**Pattern:** specifica C2PA corrente 2.5. I metadati di provenienza si possono togliere (explainer C2PA §7.2.3); per questo esistono i Content Credentials «durevoli» con watermark e impronta. Google scrive che tutte le immagini dei suoi modelli Nano Banana portano SynthID, ma la pagina vale per la sua API: **sulle uscite via Higgsfield né SynthID né C2PA sono verificati**. Al cliente non si promette nessuna marcatura finché non è provata sul file scaricato (es. `c2patool`); si conservano gli originali non ricodificati.
**Evidenza:** [P] spec.c2pa.org 2.5 ed explainer 2.3; aistudio.google.com/docs/image-generation; letti il 2026-11-04.
**Quando non vale:** se Higgsfield documenta la marcatura o un test su un file la conferma: aggiornare questa voce.
**Cliente/progetto:** generale.

## Da verificare

- Nano Banana Pro 2k (2 crediti) dà foto più «moda» e meno sintetiche di soul_cinematic (0,12): 15 scatti su 17 utilizzabili, giudizio del cliente non registrato. Con 21:9 una volta ha prodotto un dittico (due pannelli affiancati): controllare. Con gruppi «four people» a volte ne mette cinque.
