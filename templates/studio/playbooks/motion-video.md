# Playbook — motion-video

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-10-29] Video di sfondo da still con Higgsfield: prompt "locked off" e loop ping-pong

**Pattern:** Kling 4.0 image-to-video (16 crediti, 5 s, 1080p) deriva e rimodella soggetti rigidi se il prompt dice "slow push-in". Con "camera completely locked off on a tripod, only the light changes, the object never changes shape" la geometria regge. Loop senza giunzione: andata + ritorno scartando i due fotogrammi duplicati (240 frame da 121). Va bene solo per luce, ombre, fogliame; mai per versamenti o vapore (al contrario sembrano sbagliati). Nota operativa: i job `higgs ... &` lanciati in una chiamata Bash e lasciati in background muoiono a fine chiamata; usare `wait` nella stessa chiamata.
**Evidenza:** due video di sfondo per un sito: prima generazione con deriva/nebbia come fumo, seconda pulita (stesso still). Costo totale 6 clip circa 199 crediti.
**Quando non vale:** soggetti con movimento direzionale (liquidi, vapore). Il movimento della luce in un interno resta minimo anche con prompt forte.
**Cliente/progetto:** generale.

## [2026-10-30] Persone negli still: bloccare testa e capelli in positivo, mai "vento sui capelli"

**Pattern:** con Kling 4.0 image-to-video, uno still con una persona di profilo e un prompt che chiede "vento che muove i capelli" fa girare la testa entro 1 s (qui: chignon diventato caschetto, volto sparito). Funziona: "held pose like a photograph, only breathing", testa/capelli/mani/oggetto dichiarati fermi con le parole dello still ("same profile", "same low bun", "hands and card do not move"), e il movimento affidato solo ad ambiente (foglie, luce di nuvola, orlo dell'abito). 5 s invece di 6 riduce la deriva. L'output segue il rapporto dello still anche se si chiede 16:9. La sorgente ha audio AAC: togliere con `-an`. Il loop di 5 s non chiude (primo/ultimo fotogramma diversi): andata 4 s + ritorno senza duplicati = 190 fotogrammi, 7,9 s.
**Evidenza:** video hero di un sito, un job scartato e uno approvato; 19,5 + 16,25 crediti. Controllo: frame al secondo, crop su volto e mani, frazione di pixel di un colore e RGB del cappotto contro lo still.
**Quando non vale:** soggetti di spalle o senza volto; still con più di due volti (non provato, es. 3 donne con occhiali: rischio alto); movimenti direzionali, dove il ritorno del ping-pong è visibile (figure lontane che camminano all'indietro).
**Cliente/progetto:** generale.

## [2026-10-30] Chiusura 3D deterministica con three.js headless e mix con ffmpeg: quattro trappole

**Pattern:** (1) Motion blur + profondità di campo per accumulo (sotto-fotogrammi con camera su disco d'apertura): i riflessi puntiformi di una superficie lucida diventano puntini se il campione è troppo forte. Rimedi insieme: tetto per campione (`min(rgb, 2.5)` prima della media), 96 campioni a diaframma aperto, sfocatura finale di 5 px x apertura, rotazione della spirale a ogni fotogramma. Nessuno da solo basta. (2) In three recente una DirectionalLight da 1 dà colore/pi: per il colore pieno serve circa pi; per un marchio che deve arrivare *più scuro* del cartello finale, tenere la chiave sotto pi e lasciare il colore pieno al cartello. Le facce piane estruse vanno riportate a normale (0,0,±1) dopo `toCreasedNormals`, o sul fronte si vedono i triangoli. (3) ffmpeg 9: `-filter_complex_script` non esiste, usare `-/filter_complex file`. Con `aloop`/`adelay` i frame audio sono lunghi: prima di `volume=...:eval=frame` con espressioni in `t` mettere `asetnsamples=n=1024`, altrimenti il guadagno resta fermo per interi secondi. (4) Livelli: se prima di `loudnorm` c'è un limiter, il guadagno lineare è impossibile (il picco sfora) e il filtro passa in dinamica alzando di 18 dB la musica piano. Misurare con ebur128, applicare `volume`, poi `alimiter` (limit 0,79, level=0) e iterare fino a +-0,15 LU. Una scena AI con voce a -30 LUFS e picco -10 dBFS ha 20 dB di cresta: il limiter ne mangia 3 dB sui picchi, controllare.
**Evidenza:** chiusura col marchio di un film breve: -16,2 LUFS, -1,9 dBTP sul file AAC; ultimo fotogramma contro il marchio, differenza media 0,29/255.
**Quando non vale:** (1) con diaframma chiuso il tetto non serve; (3) versioni di ffmpeg diverse dalla 9.
**Cliente/progetto:** generale.

## [2026-10-30] Splice: la licenza non nomina la pubblicità

**Pattern:** le condizioni Splice (luglio 2026, §3.1.1.2) coprono film, TV, sincronizzazione, social video; la pubblicità non è elencata, Content ID non è trattato. Per uno spot commerciale chiedere conferma scritta a Splice prima di pubblicare e non consegnare a terzi né i loop né il letto musicale da solo (§3.1.1.3 a, c). Tenere ricevuta dei crediti. Il coordinamento passa da `compliance-rights-officer`.
**Evidenza:** lettura delle condizioni nella sessione del 2026-10-30; registro delle licenze tenuto nel progetto. **Da verificare:** la revisione del 2026-11-01 non ha potuto riaprire le condizioni Splice, quindi numeri di paragrafo e contenuto vanno ricontrollati sul testo corrente prima dell'uso.
**Quando non vale:** se Splice conferma per iscritto l'uso pubblicitario.
**Cliente/progetto:** generale.

## [2026-10-30] Superfici lucide in three.js: il macro si fa sulle curve, non sulle facce piane

**Pattern:** (1) Una faccia piana lucida riflette un'unica zona dell'ambiente: con pannelli rettangolari esce una finestra a croce, sempre, qualunque sia l'angolo. Il macro bello è sulla spalla curva di una forma tonda vista dall'alto (softbox sopra), dove il bordo luminoso scorre e si piega. (2) Nel macro abbassare tutte le luci d'ambiente (qui x0,22) e lasciare solo orizzonte, softbox dall'alto e un softbox stretto che passa; farle salire durante l'uscita. Un softbox largo 86 diventa una finestra: scalarlo in larghezza (x0,16) nel macro. (3) In three 0.186 `envMapIntensity` è ignorato con `scene.environment`: la scala va nello shader. (4) PMREM rigenerato a ogni sotto-fotogramma (256 px) fa muovere i softbox nei riflessi per pochi ms; il render completo (144 fotogrammi, 16/64 sotto-fotogrammi) dura ~25 s su M4 Pro. (5) Lo stacco al marchio come bordo luminoso che porta il campo di colore, calcolato dentro il passaggio di accumulo con alfa = frazione di cartello, dà motion blur e un ultimo fotogramma identico al file se il cartello si somma a parte (non passa mai dall'accumulo). (6) Il pavimento (riflesso + base) va sfumato a zero nel macro: altrimenti una macchia grigia compare a lato.
**Evidenza:** seconda versione della stessa chiusura: contatto a 6 fps e fotogrammi chiave letti dal direttore della fotografia; ultimo fotogramma contro il cartello, PSNR 40,9 dB (37,2 dB sul canale del colore più saturo: sottocampionatura cromatica H.264, non errore).
**Quando non vale:** (1) con facce non piane (forme con curve ampie, superfici scolpite); (2) se la scena è fatta di più oggetti che si riflettono tra loro: qui l'ambiente non ha occlusione né riflessi tra oggetti.
**Cliente/progetto:** generale.

## [2026-11-04] Remotion: licenza per numero di persone, skill ufficiali

**Pattern:** Remotion è gratis per individui, organizzazioni non profit e aziende a scopo di lucro fino a 3 dipendenti; da 4 persone serve la Company License. Prima di consegnare un progetto Remotion a un cliente con più di 3 persone, annota chi esegue i render (la licenza segue chi lo usa) e scrivi nel resoconto che la licenza va decisa da {{TITOLARE}}. Listino 2026: Creators 25 dollari/mese per postazione; Automators 0,01 dollari a render, minimo 100 dollari/mese; Enterprise da 500 dollari/mese. Con Remotion 5.0 la licenza cambierà: una pull request aperta (#3750, non unita) fa contare anche i collaboratori esterni. Skill ufficiali: `npx skills add remotion-dev/skills` (remotion.dev/skills), con `/remotion-best-practices` che include le altre.
**Evidenza:** [P] LICENSE.md ufficiale di Remotion (2026), remotion.pro/license e remotion.dev/skills, letti il 2026-11-04. Ultima release vista: 4.0.540 (2026-11-02).
**Quando non vale:** prezzi e soglia cambiano con la 5.0. Per chi valuta soltanto il prodotto non c'è obbligo.
**Cliente/progetto:** generale. Riverificare entro il 2027-02-04.

## [2026-11-04] Video nei siti: WCAG 2.2.2 e 2.3.1, entrambi livello A

**Pattern:** (1) 2.2.2 Pause, Stop, Hide: moto, lampeggio o scorrimento che parte da solo, dura più di 5 secondi ed è presentato insieme ad altro contenuto vuole un meccanismo per fermarlo, metterlo in pausa o nasconderlo; fa eccezione l'attività dove il movimento è essenziale. Per l'aggiornamento automatico di contenuti non c'è l'eccezione dei 5 secondi. (2) 2.3.1: niente che lampeggi più di tre volte in un secondo, o lampi sotto le soglie di lampo generale e di lampo rosso. Vale per i video di sfondo e i loop in hero: un loop di 8 secondi in autoplay ha bisogno di un controllo di pausa visibile, non basta `prefers-reduced-motion`.
**Evidenza:** [P] W3C, Understanding WCAG 2.2, pagine 2.2.2 e 2.3.1, lette il 2026-11-04.
**Quando non vale:** movimento essenziale all'attività; video avviato dall'utente. Le soglie numeriche di lampo generale e rosso non le ho lette: se il video ha stacchi luminosi rapidi si misura con uno strumento, non a occhio.
**Cliente/progetto:** generale.

## [2026-11-04] Video con AI: Art. 50, marcatura, C2PA

**Pattern:** dal 2 agosto 2026 vale l'art. 50 dell'AI Act (Reg. UE 2024/1689). Il rinvio al 2 dicembre 2026 (Reg. UE 2026/1744) riguarda solo i fornitori dei sistemi già sul mercato e solo la marcatura dell'art. 50(2). Chi usa lo strumento e pubblica (di solito, noi) è sotto l'art. 50(4) già oggi. Per un'opera evidentemente artistica o creativa l'obbligo si limita a dichiarare l'esistenza del contenuto generato o modificato, in modo che non ostacoli la visione. Il Codice di condotta (10 giugno 2026) prevede metadati firmati, filigrana, impronta facoltativa e un'icona UE «AI» all'inizio del video, ripetuta a intervalli; non nomina C2PA. Le Linee guida C(2026) 5054 non sono vincolanti. Operativo: elenca gli asset AI di ogni export e passa il punto a `compliance-rights-officer`; non scrivere «marcato» su un file se non l'hai provato con `c2patool`. C2PA corrente: 2.5; i metadati si possono rimuovere (explainer C2PA §7.2.3), per questo esistono i Content Credentials durevoli con watermark. La ricodifica ffmpeg lo toglie: misurato il 2026-11-04 con `c2patool` 0.28.4: il sorgente Seedance ha un manifesto C2PA valido (firma non nella lista di fiducia di c2patool), il master ricodificato con ffmpeg non ha più nessun manifesto («No claim found»); vedi playbook di ai-film-director.
**Evidenza:** [P] testo del Reg. 2024/1689 e 2026/1744 via Cellar, pagine della Commissione, spec.c2pa.org 2.5, explainer 2.3, 2026-11-04. Io non ho riletto la norma. SynthID: documentato da Google per Veo e Nano Banana sulle sue API.
**Quando non vale:** non so se {{STUDIO}} sia «utilizzatore» in ogni caso (di solito sì); non so se SynthID o C2PA restino sulle uscite passate da Higgsfield.
**Cliente/progetto:** generale. Riverificare entro il 2027-02-04.

## [2026-11-04] Meta: annunci simili contano come una creatività sola

**Pattern:** Meta raggruppa gli annunci che condividono attributi visivi e tematici e li tratta come varianti della stessa creatività, con apprendimento condiviso. Cambiare testo o call to action è iterazione; la diversificazione produce creatività nettamente diverse. Meta non pubblica soglie numeriche, e gli «insight creativi» sono in prova. Quindi venti aperture sullo stesso corpo sono un test di hook, non di concetto: per un test di concetti servono corpi, volti, ambientazioni diversi. La leva Remotion resta valida per formati, sottotitoli e lingue.
**Evidenza:** [P] Meta for Business, «Demystifying creative diversification», 2025-12-16, letto il 2026-11-04. Non provato sul nostro account che venti aperture siano raggruppate.
**Quando non vale:** su altre piattaforme (TikTok, YouTube) non so; per hook testati dentro un unico concetto il raggruppamento non è un problema.
**Cliente/progetto:** generale. Riverificare entro il 2027-02-04.

## [2026-11-04] HyperFrames 0.9.10: titoli, forme e varianti di testo a volume

**Pattern:** per testi, titoli, forme animate e varianti di testo/colore, HyperFrames (HTML + GSAP, CLI fissa alla 0.9.10) funziona. Un `index.html` 1080x1920 da 10 s; variabili dichiarate in `data-composition-variables` e legate con `data-var-text`; batch con `render --batch rows.json --output "out/x-v{index}.mp4" --strict-variables`. Tre trappole: (1) `check` gira sui testi predefiniti, non su ogni riga del batch: una variante con titolo lungo è uscita a x=1037 (limite 1026) senza avvisi, quindi dopo ogni batch si misura a pixel il riquadro del contenuto o si fissa un tetto di caratteri; (2) `--strict-variables` rifiuta chiavi non dichiarate (il campo `name` ha fatto abortire il batch): i file si nominano con `{index}`; (3) lo scaffold di `init` carica GSAP da CDN, scrive `AGENTS.md`/`CLAUDE.md` e mette in `package.json` uno script `publish`: usare `init --skip-skills`, copiare `gsap.min.js` e i font in `assets/` (@font-face a file locale, OFL), non lanciare `npm run publish`. Il primo fotogramma deve essere già leggibile (titolo al 55% di opacità, si assesta in 0,7 s) per fare da still.
**Evidenza:** prova propria, un giro, una macchina (M4 Pro, ffmpeg 9.0.1). Da `init` al primo MP4 verificato circa 8 min; render di 10 s in 7,0 s a caldo (26 s a freddo); batch di 5 in 31,5 s. Tre render, stesso md5 del file e di tutti i 300 fotogrammi. `ffprobe`: 1080x1920, 10,000 s, 30 fps, H.264 yuv420p, decodifica pulita.
**Quando non vale:** non provati transizioni, `preview`, `--docker`, altra macchina (audio, sottotitoli e video girato: vedi la voce seguente). Remotion non misurato a fianco: la raccomandazione «affiancare» (HyperFrames per testi/forme/varianti, Remotion per progetti React o con logica) è in parte memoria. Versione 0.x: ogni aggiornamento si ricontrolla.
**Cliente/progetto:** generale. Riverificare entro il 2027-02-04.

## [2026-11-04] HyperFrames 0.9.10, seconda prova: voce, sottotitoli, video girato (9:16, 14 s)

**Pattern:** funziona tutto in locale. (1) Voce: `say -v Alice` una frase per file, con `[[slnc 350]]` dopo la virgola; `silencedetect -50dB:d=0.04` dà i confini dei gruppi di sottotitoli. Ogni file è un `<audio id class="clip" data-start data-volume>` nell'HTML della composizione: la voce cade sul `data-start` al campione (cross-correlazione a 48 kHz: 0 ms). (2) Sottotitoli scritti a mano da quei tempi in una sotto-composizione `data-track-kind="captions"`; misurati sul MP4 (pixel contro energia dell'audio reso): ingresso +23/+57 ms, uscita da -17 a +77 ms, cioè un fotogramma in ritardo: aprire il gruppo 1-2 fotogrammi prima. (3) Girato: `<video muted>` 1920x1080 in un riquadro 1080x1920 con `object-fit: cover`; `objectPosition` si anima con GSAP (qui 52% -> 39% per seguire il soggetto) e il render lo rispetta. (4) Loudness, trappola: una voce mono su due canali vale +3 LU nel mix stereo. `normalize-audio` misura l'elemento da solo (mono -16,5 LUFS, propone +0,5 dB) mentre il mix era a -13,9. Si misura sempre il MP4 con `ebur128=peak=true` e si regola `data-volume` (voce 0,78 e tappeto 1,09: -15,8 LUFS, -2,8 dBTP). (5) Con l'audio il determinismo regge: tre render (uno con la rete in uscita bloccata da `sandbox-exec`) stesso md5 di file, video e audio decodificati: con GSAP e font in locale il render non usa la rete. (6) Chiusura ferma: scheda opaca, scarto medio fra fotogrammi 0,0014 negli ultimi 2,1 s.
**Evidenza:** prova propria (M4 Pro, ffmpeg 9.0.1). 1080x1920, 30 fps, H.264 High yuv420p, AAC LC 48 kHz stereo, 14,000 s; render 7,2-9,3 s (8 worker), 12 MB, `check` ok. Testo e zona sicura misurati a pixel: sottotitoli x 217-861, y 1146-1218; titolo y 963-1069. `watch` (whisperx small, `WATCH_WHISPERX_LANGUAGE=it`): testo identico, ma un solo segmento a risoluzione di 1 s, inutile per i tempi. `audio-understand`: «Sine wave 0,45» sul tappeto, parlato riconosciuto, tonalità A minor (coincide con l'accordo), ma il tratto 10-14 s è etichettato «speech» con la voce finita a 10,8 s.
**Quando non vale:** (a) `hyperframes transcribe` richiede whisper-cpp (non installato, `brew install` = installazione non autorizzata) e scaricherebbe il modello: non provato, quindi i sottotitoli da voce registrata o di altri vanno prima trascritti con altro strumento e tempi a livello di parola; (b) il girato 16:9 a 1080p in 9:16 è un ingrandimento 1,78x (nitidezza non misurata) e 24->30 fps duplica fotogrammi (scatto non misurato); (c) una sola macchina, una voce sintetica, nessun parlato sovrapposto alla musica forte; (d) ogni comando stampa «skills out of date: npx hyperframes skills update»: ignorarlo, è vietato; (e) `check` avvisa `timeline_track_too_dense` con sei gruppi in fila sulla stessa traccia: innocuo. Il file reso non ha manifesto C2PA (neanche il master di partenza lo aveva). Licenza delle voci di sistema macOS per uso commerciale: non verificata.
**Cliente/progetto:** generale. Riverificare entro il 2027-02-04.

## Da verificare

(ipotesi non ancora dimostrate)
