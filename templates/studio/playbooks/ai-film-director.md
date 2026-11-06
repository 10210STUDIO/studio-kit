# Playbook — ai-film-director

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-10-30] Piano sequenza text-to-video, non still animati montati
**Pattern:** un solo piano sequenza generato text-to-video (Seedance 2.5), camera che segue, mondo vivo intorno, gesto finale chiaro.
**Evidenza:** un cliente ha bocciato due film: still animati con Kling («hold their pose») = «AI statica»; 5 inquadrature Veo/Kling a tagli secchi = «cambi scena robotici, si vede che è AI». Ha indicato come direzione un esempio pubblico Seedance 2.5 di Higgsfield (15 s, un solo piano sequenza che segue un personaggio dentro un interno d'epoca).
**Quando non vale:** quando serve tenere un volto o un luogo già approvato: allora `omni_reference`, sempre in un solo movimento.
**Cliente/progetto:** generale.

## [2026-10-30] Costi Seedance 2.5, 15 s
**Pattern:** bozza 480p = 45 crediti, 720p = 105, 1080p = 240 (`higgs generate cost`, senza audio). Bozze per scegliere, poi una sola finale.
**Evidenza:** `higgs generate cost seedance_2_5`, 2026-10-30.
**Quando non vale:** i prezzi cambiano: riverificare sempre prima.
**Cliente/progetto:** generale.

## [2026-10-30] Finale da `draft_job_id`: stessa scena, si sceglie sulla bozza
**Pattern:** la finale 1080p con `--draft_job_id <bozza>` ripete la bozza 480p: stesse posizioni, tempi, gesto. Si sceglie guardando la bozza; la finale serve per il controllo a piena risoluzione (mani, volto). Il file arriva in HEVC: va sempre ricodificato in H.264 per il web. Attesa: `higgs generate wait <id> --timeout 9m` (non `--wait-timeout`).
**Evidenza:** una bozza e la sua finale confrontate a 4 fps: identiche. Sorgente 1920x1080 hevc. Vale anche per l'audio nativo: in una seconda coppia bozza/finale la battuta cade agli stessi tempi (entro 0,05 s).
**Quando non vale:** non provato con parametri diversi fra bozza e finale (durata, formato).
**Cliente/progetto:** generale.

## [2026-10-30] Grammatica del prompt che dà il piano sequenza dell'esempio
**Pattern:** «The camera tracks alongside her at her pace, [oggetti] sliding past in the foreground, then she turns toward the lens and the camera drifts around in front of her» + palette scritta in positivo (es. «muted slate, moss and charcoal tones») e materiali (pietra, noce, travertino), senza scrivere il divieto del colore riservato («no [colore]»).
**Evidenza:** 3 bozze su 3 con carrello laterale, oggetti in primo piano e svolta frontale a metà; nessuna traccia del colore riservato in tutte e tre.
**Quando non vale:** «turns toward the lens» in una bozza ha dato lo sguardo in macchina mentre camminava di lato per 6 s: in quel caso scrivere «turns and walks toward the camera».
**Cliente/progetto:** generale.

## [2026-10-30] Seedance tende a volti di attrici note: controllarli sempre
**Pattern:** con casting generico (giovane donna, capelli scuri, chignon o caschetto) Seedance 2.5 può dare volti molto simili ad attrici note. Controllare la somiglianza su ogni bozza prima di scegliere; scartare anche se il resto è il migliore.
**Evidenza:** 2 bozze su 3 (chignon, caschetto) con volto che ricordava la stessa attrice nota; scartate.
**Quando non vale:** con `omni_reference` su un volto di casting approvato.
**Cliente/progetto:** generale.

## [2026-10-30] Battuta parlata con Seedance 2.5: va ancorata a metà, non in coda
**Pattern:** se la battuta è l'ultima frase del prompt, Seedance la mette negli ultimi 1,5 s e la tronca. Per anticiparla: «She reaches the [punto d'arrivo] by the eighth second ... and right away says: "..." Then, for the last few seconds, she [ascolta/reagisce] ...» prima della riga del suono. Audio nativo gratis: `generate_audio true` costa uguale (45 bozza, 240 finale), esce AAC 32 kHz (ricampionare a 48 kHz).
**Evidenza:** 3 bozze su 3 con la battuta in coda: 13,6–15,0 s, l'ultima parola tagliata in 2. Con l'ancora e l'azione dopo: 11,4–13,7 s e 12,7–14,1 s. Labiale allineato a 6 fps.
**Quando non vale:** non garantisce un tempo preciso (2 casi, scarto di 1 s fra i due); per stare entro i 13 s serve probabilmente ancorare ancora prima (6° secondo).
**Cliente/progetto:** generale.

## [2026-10-30] Controllo audio in locale senza strumenti installati
**Pattern:** trascrizione con `uvx --from mlx-whisper mlx_whisper --model mlx-community/whisper-small-mlx --language en --condition-on-previous-text False` (su tutta la traccia allucina ripetizioni: trascrivere segmenti di 1,5–2 s), tempi esatti dall'inviluppo RMS in banda voce (`highpass=200,lowpass=4000,asetnsamples=320,astats...`) a 20 ms. In zsh non usare `set -- $r` per spezzare stringhe.
**Evidenza:** battute trovate e confermate su 5 bozze e sulla finale; il timestamp delle parole di Whisper sbaglia di 0,5–1 s, l'inviluppo no.
**Quando non vale:** non giudica timbro e naturalezza della voce: va ascoltata da una persona.
**Cliente/progetto:** generale.

## [2026-10-30] Ridoppiare o ritimare una battuta su una finale approvata: coda `omni_reference` + audio di riferimento
**Pattern:**
1. Si costruisce in locale la traccia audio voluta: per la stessa lingua si riaccostano i pezzi della voce originale; per un'altra lingua si usa Seed Audio con 1 s della voce originale come riferimento, poi EQ sullo spettro dell'originale.
2. Si rigenera solo la coda (5 s) con Seedance 2.5 `omni_reference`: video di riferimento = coda originale muta, audio = nuova traccia. La bocca segue l'audio.
3. Si monta sulla finale con una dissolvenza di 8 fotogrammi su un gesto veloce.

Il video di riferimento va ripulito dai movimenti di bocca non voluti (avanti-indietro di un tratto in cui sta ferma): altrimenti li ricopia. Costo: 15 crediti a 480p, 80 a 1080p per 5 s.

**Evidenza:** un film breve in due lingue, labiale verificato a 6 fps.
- `video_edit` tiene i tempi della bocca e dell'audio originali, anche con un audio di riferimento: non ritima.
- Draft `omni_reference` con `start_image`: parlato in più, scartato.
- `draft_job_id` accetta solo job draft: un 480p non draft non si porta a 1080p.

**Quando non vale:** se la camera si muove molto nella coda, la dissolvenza si vede. La coda rigenerata non è identica al pixel (circa 26 dB di PSNR).
**Cliente/progetto:** generale.

## [2026-11-04] Catalogo Higgsfield: cosa è modello e cosa è workflow
**Pattern:** `higgs model list --video` non mostra tutto. Sono **workflow** (si vedono con `higgs workflow list`, parametri con `higgs workflow get`, si lanciano con `higgs generate workflow`): Cinema Studio 4.0 (`cinematic_studio_video_4_0`), Kling 3.0 Motion Control (`kling3_0_motion_control`), Reframe (`reframe`), `dubbing`, `voice_change`. Sono **modelli**: `seedance_2_5`, `kling4_0`, `kling_o3_image_reference` (Kling 3.0 Omni), `veo3_1`, `veo3_1_lite`, `gemini_omni_flash_1_1`, Genjutsu (`hf_mult_motion_control`, `hf_mult_replace_object`), `topaz_hyperion_2_5`, `topaz_video`, `video_upscale`, `bytedance_video_upscale`, `fps_boost`, `video_deflicker`. La skill `higgsfield` non documenta ancora Kling 4.0 né Topaz Hyperion 2.5: per questi vale solo la CLI.
**Evidenza:** [P] `higgs model list --video` (45 voci) e `higgs workflow list`, 2026-11-04. Veo: Google ha messo il 22 ott 2026 come data **più vicina possibile** di ritiro delle versioni preview di Veo 3.1 nell'API Gemini (sostituto `gemini-omni-1.1-flash`), non come chiusura confermata (aistudio.google.com/docs/deprecations, letta il 2026-11-04); su Higgsfield `veo3_1` c'è ancora e risponde a `generate cost` (32 crediti, parametri di default).
**Quando non vale:** il catalogo cambia di settimana in settimana: rilanciare i due comandi a ogni progetto. Essere nel catalogo non dice nulla sulla qualità. Katana sta solo nell'MCP: non verificato da CLI.
**Cliente/progetto:** generale.

## [2026-11-04] Limiti reali di Seedance 2.5 e Kling 4.0 (schema CLI)
**Pattern:**
- Seedance 2.5: durata fino a 30 s (31 rifiutato); al massimo 30 immagini (contando inizio e fine) e 50 riferimenti in totale; `start_image`/`end_image` solo in `omni_reference`; `t2v` non accetta media; `draft` e `draft_job_id` si escludono. Risoluzioni 480p, 720p, 1080p.
- Kling 4.0: durata fino a 30 s (31 rifiutato); 720p o 1080p; nessuna bozza; al massimo 10 immagini e 15 riferimenti fra immagini, video ed elementi; text-to-video vuole un formato fisso.
- Cinema Studio 4.0 ha le stesse modalità di Seedance 2.5 (t2v, omni_reference, video_edit, video_extension) più id di camera, obiettivo, diaframma, epoca, genere, ritmo, luce e palette; nessun `draft` nello schema.
**Evidenza:** [P] `higgs model get seedance_2_5|kling4_0`, `higgs workflow get cinematic_studio_video_4_0`, `generate cost` con `--duration 31`, 2026-11-04.
**Quando non vale:** è lo schema, non una prova di qualità: 30 s in un piano solo non l'abbiamo mai generato. Riverificare a ogni progetto.
**Cliente/progetto:** generale.

## [2026-11-04] Listino misurato (stime `higgs generate cost`, gratis)
**Pattern:**
- Seedance 2.5 (2026-10-30, riconfermato 2026-11-04): 3 cr/s in bozza 480p, 7 a 720p, 16 a 1080p. 15 s: 45 / 105 / 240. 30 s: 90 in bozza, 480 a 1080p. Il prezzo dipende solo da durata e risoluzione: non cambiano `omni_reference` con fotogramma iniziale e finale, il 9:16, l'audio nativo.
- Cinema Studio 4.0 (2026-11-02): stessi prezzi di Seedance 2.5.
- Kling 4.0 (2026-11-02, riconfermato 2026-11-04): 3,25 cr/s a 1080p (15 s = 48,75; 30 s = 97,5), 5 volte meno di Seedance a 1080p. Senza bozza: si gira direttamente a 1080p. Il blog Higgsfield dice 4 o 7,5: vale la CLI del giorno.
- Veo 3.1 (2026-11-02): 4 cr/s base, 10 in alta qualità. Hailuo 2.3: 11 crediti per 10 s.
- Rifinitura su 15 s (2026-11-02): ByteDance upscale 4K 4; Topaz Hyperion 2.5 37; FPS Boost Topaz 50; Deflicker 2; Reframe 9:16 70,5 a 720p, 183 a 1080p. Upscale e FPS Boost si stimano solo passando il file (`--video`); `reframe` con il file fallisce, si stima con `--duration`.
- Coda `omni_reference` di 5 s (2026-10-30): 15 crediti a 480p, 80 a 1080p.
- Euro: `playwright-cli open https://higgsfield.ai/pricing` + `eval document.body.innerText` (WebFetch non vede i prezzi). Ultra 129 €/mese (99 annuale) per 3.000 crediti, IVA esclusa (2026-11-02).
**Evidenza:** [P] stime della CLI alle date indicate, nessun credito speso; «Un'uscita sola» (`spot-agenzia/06_costi_uscita_sola.md`).
**Quando non vale:** i prezzi cambiano: sopra i 30 giorni si riverifica prima di un preventivo. La qualità di Kling 4.0 non è provata da noi. In zsh i flag in una variabile (`$x="--draft true"`) non si spezzano: scriverli per esteso.
**Cliente/progetto:** generale.

## [2026-11-04] Metadati di provenienza: chi li mette e quando si perdono
**Pattern:** i file scaricati da Higgsfield arrivano già marcati in modo diverso secondo il modello. Seedance 2.5 e Veo 3.1 portano un manifesto C2PA (Seedance: `c2pa.claim.v2`, hash `c2pa.hash.bmff.v3`, firma, `digitalSourceType = trainedAlgorithmicMedia`; Veo: firmato da Google). Kling non ha C2PA ma un tag `AIGC` nei metadati del contenitore (`ContentProducer: kling`). Tutti i nostri master ricodificati con ffmpeg in H.264/WebM non hanno più né l'uno né l'altro. Quindi: tenere sempre il sorgente originale accanto al master e dichiarare nel `.md` che il master non è marcato.
**Evidenza:** [P] misura nostra, 2026-11-04, ricerca dei byte `c2pa`/`AIGC` e `ffprobe` su file scaricati da Higgsfield e sui master ricodificati da questi: le sorgenti Seedance hanno il manifesto; le clip Veo hanno il manifesto Google; le clip Kling hanno il tag AIGC; i master ricodificati (mp4 e webm) non hanno nulla. La specifica C2PA (2.5) non dice nulla su H.264: dice solo che il manifesto si può togliere e che per questo esistono i Content Credentials «durevoli» con filigrana (explainer 2.3 §7.2.3).
**Quando non vale:** validato dal lead con `c2patool` 0.28.4 (2026-11-04): la sorgente Seedance ha un manifesto «Valid» con firma `signingCredential.untrusted` (l'emittente non è nella lista di fiducia di c2patool), il master ricodificato dà «No claim found». Non provato un remux senza ricodifica (`-c copy`): con l'hash sui byte del file probabilmente il manifesto resta ma non è più valido. SynthID di Google (filigrana nei pixel dei video Veo, dichiarata resistente alla compressione) non si vede con questi strumenti: non verificato se sopravviva nel master.
**Cliente/progetto:** generale.

## [2026-11-04] AI Act art. 50: cosa vale per noi che pubblichiamo
**Pattern:** dal 2 agosto 2026 vale l'art. 50 (Reg. UE 2024/1689). Il rinvio al 2 dicembre 2026 (Reg. UE 2026/1744, nuovo art. 111(4)) vale solo per i **fornitori** dei sistemi già sul mercato e solo per la marcatura dell'art. 50(2): chi usa lo strumento e pubblica deepfake (art. 50(4)) deve già etichettare, **nessuna proroga**. Per opere «evidentemente artistiche, creative, satiriche, di finzione» l'obbligo si riduce a dichiarare la presenza di contenuto generato «in modo appropriato che non ostacoli la visione». Il Codice di condotta (10 giu 2026) chiede metadati firmati più filigrana e l'icona all'inizio del video, ripetuta a intervalli; non nomina C2PA. Le Linee guida C(2026) 5054 (20 lug 2026) non sono vincolanti. Per noi: etichetta visibile decisa con `compliance-rights-officer`, più il registro di ogni film.
**Evidenza:** [P] testo AI Act e Omnibus su Cellar, Codice e Linee guida sul sito della Commissione, letti, 2026-11-04.
**Quando non vale:** se un nostro film sia un «deepfake» (somiglia a persone, luoghi o eventi reali e sembrerebbe autentico) e se rientri nell'eccezione creativa lo decide `compliance-rights-officer` caso per caso, non noi. Riverificare sopra i 90 giorni: Linee guida e Codice possono essere aggiornati.
**Cliente/progetto:** generale.

## [2026-11-04] Registro dell'intervento umano: serve anche per i diritti
**Pattern:** per ogni film scrivere nel `.md` modello, job-id, prompt integrale e le scelte umane (casting, luce, camera, selezione fra le bozze, montaggio, correzioni). In Italia l'art. 1 della L. 633/1941 (modificato dalla L. 132/2025, art. 25) protegge le opere «anche laddove create con l'ausilio di strumenti di intelligenza artificiale, purché costituenti risultato del lavoro intellettuale dell'autore»: un film da solo prompt ha tutela dubbia, il registro è la prova del lavoro umano.
**Evidenza:** [P] normattiva.it, letto, 2026-11-04. Negli USA l'Ufficio del copyright (rapporto Parte 2, gen 2025) dice che i soli prompt non bastano: è un parere, non una sentenza.
**Quando non vale:** il registro non garantisce la tutela; la valutazione la fa `compliance-rights-officer` con `rights-licensing-clearance`.
**Cliente/progetto:** generale.

## [2026-11-05] Nano Banana Pro, modifica del solo viso: rifà tutto il quadro, si incolla solo il viso
**Pattern:** chiedendo «edit only the face, keep everything else identical» Nano Banana Pro ridisegna l'immagine intera (scala +5%, marchio presente nell'immagine rifatto male). Si tiene solo l'ovale del viso: si riscala e si allinea la modifica sull'originale per correlazione su una zona fuori dal viso (spalle), poi maschera ellittica sfumata. 0 crediti in più, cucitura invisibile.
**Evidenza:** una scena di un film, una generazione da 2 crediti, allineamento scala 0,945, correlazione 0,976.
**Quando non vale:** se la modifica cambia anche la posa della testa o la luce sul collo, l'ovale non combacia. 1 caso.
**Cliente/progetto:** generale.

## [2026-11-06] CLI `higgs` da agente: sempre `< /dev/null`
**Pattern:** da una shell non interattiva `higgs generate cost|create` (sicuro con `--video`) resta appeso a leggere il prompt da stdin. Aggiungere `< /dev/null` a ogni chiamata. `--video` e `--start-image` accettano un job-id al posto del file: niente upload. `timeout` può non esistere su Mac: verificare prima di farci affidamento.
**Evidenza:** [P] cost con `--video` appeso per oltre 8 minuti; con `< /dev/null` risposta in 0,7 s (una clip, 2026-11-06).
**Quando non vale:** in un terminale interattivo non serve.
**Cliente/progetto:** generale.

## [2026-11-04] Limiti reali di Seedance 2.5, Kling 4.0, Cinema Studio 4.0 (schema CLI)
**Pattern:**
- Seedance 2.5: fino a 30 s; al massimo 30 immagini (inizio e fine compresi) e 50 riferimenti; `start_image`/`end_image` solo in `omni_reference`; `t2v` non accetta media; `draft` e `draft_job_id` si escludono; 480p, 720p, 1080p. Fotogramma iniziale e finale con stesso formato e stessi pixel.
- Kling 4.0: fino a 30 s; 720p o 1080p; nessuna bozza; `end_image` in image-to-video; al massimo 10 immagini e 15 riferimenti; t2v vuole un formato fisso. Anche `kling3_0` ha `end_image`.
- Cinema Studio 4.0: stesse modalità di Seedance 2.5 (anche `end_image` in omni) più id di camera, obiettivo, diaframma, epoca, genere, ritmo, luce, palette; nessun `draft` nello schema.
**Evidenza:** [P] `higgs model get` / `workflow get`, `generate cost` con `--duration 31`, 2026-11-04 e 2026-11-06.
**Quando non vale:** è lo schema, non qualità. `end_image` su Seedance mai generato da noi (su Kling sì).
**Cliente/progetto:** generale.

## [2026-11-06] Bozza 480p ingrandita a 1080p invece della finale: regge
**Pattern:** su un pezzo breve già scelto, `bytedance_video_upscale` standard (preset `aigc` o `common`, quasi uguali) porta la bozza 480p a 1080p per 1 credito invece dei 28 della finale 720p. Un volto di circa 30 px resta lo stesso per tutti i fotogrammi, senza effetto cera; nitidezza (varianza laplaciana) 197 contro 26 di un lanczos, sfarfallio fra fotogrammi +12%, mosso conservato. Perde: lentiggini e grana della pelle (pelle lisciata), bordi un po' pittorici. Esce a 1918×1080: va portato a 1920 in montaggio.
**Evidenza:** una clip di uno spot, una prova per ciascun preset (`aigc` e `common`), fotogrammi 8-29 a 8 e 24 fps, ritagli 1:1.
**Quando non vale:** 1 caso, figure piccole e camera ferma. Se il volto è il soggetto in primo piano, serve la finale. Giudicato su fogli, non a velocità vera da una persona.
**Cliente/progetto:** generale.

## [2026-10-30] Battuta parlata con Seedance 2.5: ancorarla a metà, non in coda
**Pattern:** se la battuta è l'ultima frase del prompt, finisce negli ultimi 1,5 s e si tronca. «She reaches the desk by the eighth second ... and right away says: "..." Then, for the last few seconds, she ...» prima della riga del suono. Audio nativo gratis, AAC 32 kHz (ricampionare a 48 kHz). Controllo: `mlx_whisper` (small, `--condition-on-previous-text False`) su segmenti di 1,5-2 s; tempi esatti dall'inviluppo RMS in banda voce a 20 ms (Whisper sbaglia di 0,5-1 s).
**Evidenza:** 3 bozze su 3 in coda (13,6–15,0 s); con l'ancora 11,4–13,7 e 12,7–14,1 s.
**Quando non vale:** scarto di 1 s fra i casi; timbro e naturalezza li giudica una persona.
**Cliente/progetto:** generale.

## [2026-10-30] Ridoppiare o ritimare una battuta su una finale approvata
**Pattern:** traccia voluta costruita in locale (pezzi della voce originale, o Seed Audio con 1 s di riferimento + EQ); si rigenera solo la coda di 5 s con Seedance `omni_reference` (video = coda muta ripulita dai movimenti di bocca non voluti, audio = nuova traccia); dissolvenza di 8 fotogrammi su un gesto veloce. `video_edit` non ritima.
**Evidenza:** uno spot EN/IT, labiale a 6 fps.
**Quando non vale:** camera molto mossa nella coda; la coda non è identica al pixel (~26 dB PSNR).
**Cliente/progetto:** generale.

## [2026-11-05] Nano Banana Pro, modifica del solo viso: si incolla solo il viso
**Pattern:** «edit only the face» ridisegna tutto il quadro (scala +5%, marchio rifatto male). Si riscala e allinea la modifica per correlazione su una zona fuori dal viso, poi maschera ellittica sfumata.
**Evidenza:** su un'inquadratura di uno spot, scala 0,945, correlazione 0,976.
**Quando non vale:** se cambia la posa della testa o la luce sul collo. 1 caso.
**Cliente/progetto:** generale.

## [2026-11-06] Seedance 2.5 video_extension forward
**Pattern:** esce solo la continuazione (4 s chiesti = 4 s), raccordata all'ultimo fotogramma; accetta `--image-references`; costa come una bozza omni. Il risultato è in `result_url` (il primo .mp4 del JSON è il video d'ingresso). In 1 caso: deriva (pavimento opaco, pareti più sature, comparse in fila che guardano in camera).
**Evidenza:** una generazione di prova.
**Quando non vale:** 1 caso, 480p.
**Cliente/progetto:** generale.

## [2026-11-06] Seedance 2.5 con `--start-image` + `--end-image`: l'oggetto esce davvero, ma i tempi slittano verso la fine
**Pattern:** arrivo = stato *dopo* l'uscita (libro fuori quadro) + «carries the closed, rigid book... it never stops and never fades» + ritaglio della mano come `--image-references`: la mano entra, prende e porta fuori il libro intero, nessuna dissolvenza, dita mai fuse (guanto nero contro mano nuda). Ma i tempi scritti in secondi slittano di circa 1 s verso la fine (scritto 1,3/1,8/2,6/<4 s; uscito 1,9/2,5/3,8/4,95 s): l'oggetto esce sull'ultimo fotogramma. Si sceglie la finestra di montaggio sulla bozza, non prima. Il fondo che è uguale in partenza e arrivo si congela dopo il primo secondo; con partenza e arrivo diversi in ogni elemento (comparse in posizioni diverse) resta vivo (≈20× il rumore del muro). Il modello va dritto dalla partenza all'arrivo: un'azione che torna indietro («pulls it back once») non esce (tiro 0%), e una condizione di sequenza («stays still until the book has left») si anticipa di circa 0,5 s.
**Evidenza:** una clip di uno spot, 2 generazioni, 480p, tutti i 121 fotogrammi, moto e bordo del libro misurati.
**Quando non vale:** 2 casi, camera ferma, mezzo busto. Per tempi esatti scrivere le azioni circa 1 s prima o allungare la clip; un movimento all'indietro va messo in un keyframe, non solo scritto.
**Cliente/progetto:** generale.

## [2026-11-06] Eleven v4 (`elevenlabs_v4`) per risate e battute brevi
**Pattern:**
- **Prezzo:** si paga a blocchi di 50 caratteri di testo, tag compresi. 0,23 crediti fino a 50 caratteri, 0,46 da 51. Conviene tenere ogni testo entro i 50.
- **Testo minimo:** un testo di soli tag (`[laughs]`) fallisce. Il job viene rimborsato. Serve almeno una sillaba, per esempio `mm.`.
- **Voci:** `higgs voices list` non dice genere ed età. Si leggono nel JSON del job, in `params.voices[0]`.
- **Risate:** con i tag escono soffiate. AST le classifica Gasp o Sigh (Laughter circa 0), CLAP dà «laughing» a 1,00. Per il controllo «laughter» usare CLAP.
  - Durata 1,4-2,5 s con un solo tag d'azione più `mm.`.
  - Con tre tag si arriva a 4-5 s.
  - `[giggles]` dà una risata acuta.
  - Senza «mm» finale (sillaba `hhh.`/`heh.`/`hah.`): 6 testi su 8 escono solo fiato, senza voce. Solo `[bursts out laughing, low and warm]` dà scoppi sonori (3 job: 2 sonori, 1 solo fiato): lo stesso testo varia molto da un job all'altro, e la voce sale (205 contro 285 Hz). Per una risata piena, più job sullo stesso testo valgono più di testi nuovi.
- **Battute:** `[calls out firmly, not shouting]` abbassa la voce rispetto a `[calling out from across the room]`.
- **Uscita:** MP3 44,1 kHz mono, asciutto, senza ambiente.
**Evidenza:** uno spot, 26 job in due giri di prove. Prezzo da `generate cost` e da `account transactions`.
**Quando non vale:**
- Le voci sono giudicate solo con misure, non da una persona all'ascolto.
- «not shouting» è verificato su 1 voce (f0 di 172 Hz contro 280-320).
- Il prezzo va riverificato dopo 30 giorni.
**Cliente/progetto:** generale.

## Da verificare

- Costo del doppiaggio Higgsfield (`dubbing`, MCP o CLI): `higgs generate cost dubbing` resta appeso con `--input_video` e rifiuta `--video` senza `duration` (che però non è un parametro accettato). L'MCP non ha anteprima del costo. Inoltre traduce da solo: «Are you ready?» potrebbe diventare «sei pronto?», non «siete pronti?». Alternativa provata: il pattern della coda `omni_reference`.
- Seed Audio con voce di riferimento: tende a copiare le pause del riferimento (1 caso). Si chiudono in montaggio.
- Volto con tratti specifici nel prompt (lentiggini, sopracciglia dritte, mascella forte) = meno somiglianze con attrici note? (1 caso, solo a occhio)
- Punto d'arrivo lontano nel prompt («a table at the end of the hall») = gesto finale incompiuto all'ultimo secondo? (1 caso)
- «Vast hall» favorisce l'architettura che cambia a metà (soffitto piano diventato volta)? (1 caso)
- Katana regge un piano sequenza con interazione fra persone?
