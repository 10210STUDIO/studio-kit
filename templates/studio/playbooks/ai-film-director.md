# Playbook — ai-film-director

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-10-30] Piano sequenza text-to-video, non still animati montati
**Pattern:** un solo piano sequenza generato text-to-video (Seedance 2.5), camera che segue, mondo vivo intorno, gesto finale chiaro.
**Evidenza:** in un progetto reale il cliente ha bocciato due film: still animati con Kling («hold their pose») = «AI statica»; 5 inquadrature Veo/Kling a tagli secchi = «cambi scena robotici, si vede che è AI». Ha indicato come direzione un esempio pubblico Seedance 2.5 di Higgsfield (15 s, un solo piano sequenza che segue un personaggio dentro un interno d'epoca).
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

## Da verificare

- Costo del doppiaggio Higgsfield (`dubbing`, MCP o CLI): `higgs generate cost dubbing` resta appeso con `--input_video` e rifiuta `--video` senza `duration` (che però non è un parametro accettato). L'MCP non ha anteprima del costo. Inoltre traduce da solo: «Are you ready?» potrebbe diventare «sei pronto?», non «siete pronti?». Alternativa provata: il pattern della coda `omni_reference`.
- Seed Audio con voce di riferimento: tende a copiare le pause del riferimento (1 caso). Si chiudono in montaggio.
- Volto con tratti specifici nel prompt (lentiggini, sopracciglia dritte, mascella forte) = meno somiglianze con attrici note? (1 caso, solo a occhio)
- Punto d'arrivo lontano nel prompt («a table at the end of the hall») = gesto finale incompiuto all'ultimo secondo? (1 caso)
- «Vast hall» favorisce l'architettura che cambia a metà (soffitto piano diventato volta)? (1 caso)
- Katana regge un piano sequenza con interazione fra persone?
