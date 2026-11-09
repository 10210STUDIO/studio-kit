# Misura, analisi e strumenti AI

Un agente non ha orecchie: qui impara a sentire misurando (loudness, picchi, fase, spettro, tempo e tonalità), a controllare un file prima della consegna e a usare separazione, trascrizione e generazione AI senza illudersi su cosa producono e su cosa si può farne. Serve a chi nello studio riceve, controlla o genera audio: producer, motion, chi chiude una consegna, chi briefa un fornitore di restauro o di QC.
Non copre: come si fa un mix o un master (`mix-mastering.md`), le consegne per spot e film (`audio-per-immagine.md`), la licenza di un brano o di un campione (`rights-licensing-clearance`, `atlante-culturale/references/regole.md` §5-6). Il controllo «al volo» di cosa si sente in un file (parlato, musica, umore, eventi) lo fa la skill `audio-understand`: qui si misura la qualità tecnica.
Letto e redatto il 2026-11-09. Revisione: 2027-02-07 (90 giorni), prima per termini d'uso dei generatori e cause, che cambiano ogni pochi mesi.

**Legenda.** [P] = fonte primaria letta il 2026-11-09 (norma, documentazione o termini del produttore, README del codice, sentenza o comunicato). [S] = secondaria (stampa di settore, studi legali, blog), citata ma non confermata sulla fonte. [M] = **misurato da me il 2026-11-09** su questa macchina (Mac mini M4 Pro, macOS 26.6, ffmpeg 9.0.1, Python 3.11 con essentia 2.1b6, librosa 0.10.2, demucs 4.1.0, basic-pitch 0.4.0): i comandi sono stati eseguiti davvero, l'output riportato è quello vero. **da verificare** = non letto alla fonte; non usarlo in un contratto o in un preventivo.

---

## Lessico

- **Loudness integrato** (*integrated loudness*, I): intensità percepita media dell'intero programma, in LUFS, con gate che esclude i silenzi (ITU-R BS.1770).
- **LUFS / LKFS** (*Loudness Units relative to Full Scale*): la stessa unità; LUFS è il nome EBU, LKFS il nome ITU/ATSC. 1 LU = 1 dB.
- **Loudness momentaneo** (*momentary*, M): finestra di 400 ms; dice quanto «spinge» un colpo.
- **Loudness a breve termine** (*short-term*, S): finestra di 3 s; è il valore che si guarda scorrendo un brano o uno spot.
- **Gamma di loudness** (*loudness range*, LRA): differenza in LU tra il 10° e il 95° percentile della distribuzione short-term; misura la dinamica «macro» (strofa contro ritornello), non i transienti.
- **Picco reale** (*true peak*, dBTP): picco stimato del segnale ricostruito fra i campioni, con sovracampionamento; può superare il picco dei campioni.
- **Picco di campione** (*sample peak*, dBFS): il valore assoluto massimo dei campioni scritti nel file.
- **Picco inter-campione** (*inter-sample peak*, ISP): l'eccesso che il convertitore o il codec ricostruiscono fra due campioni; si vede solo col true peak.
- **Clipping** (*clipping*): il segnale tocca il massimo digitale e la forma d'onda viene tagliata piatta; si conta come campioni consecutivi a fondo scala.
- **Fattore di cresta** (*crest factor*): rapporto picco/RMS in dB; basso = segnale schiacciato dal limiter.
- **Offset DC** (*DC offset*): valore medio diverso da zero; ruba headroom e fa «clic» ai tagli.
- **Correlazione di fase** (*phase correlation*): da +1 (mono) a −1 (canali in controfase); sotto 0 il mix perde parti quando viene sommato in mono.
- **Compatibilità mono** (*mono compatibility*): quanto un mix stereo regge la somma L+R (smartphone, casse Bluetooth, radio AM, molti impianti da evento).
- **Spettrogramma** (*spectrogram*): tempo in orizzontale, frequenza in verticale, energia in colore; l'immagine che sostituisce l'orecchio.
- **Normalizzazione del loudness** (*loudness normalization*): la piattaforma alza o abbassa il volume di riproduzione per portare il brano al suo riferimento; non comprime.
- **Normalizzazione a due passate** (*two-pass loudnorm*): prima si misura, poi si applica un guadagno lineare calcolato sui valori misurati.
- **Recupero di informazioni musicali** (*music information retrieval*, MIR): disciplina che estrae da un file audio tempo, tonalità, accordi, struttura, timbro.
- **Griglia dei battiti** (*beat tracking*): posizione nel tempo di ogni battito; il BPM ne è solo la media.
- **Errore d'ottava** (*octave error*): il rilevatore di tempo restituisce metà o doppio del BPM vero (64 o 256 invece di 128).
- **Stima della tonalità** (*key estimation*): tonica e modo con un punteggio di confidenza; gli errori tipici sono la quinta, la relativa e la parallela.
- **Separazione delle sorgenti** (*source separation*, «stem splitting»): divide un mix in voce, batteria, basso, altro (o più).
- **SDR** (*signal-to-distortion ratio*): metrica in dB della qualità di una separazione rispetto alla traccia originale isolata; più alto è meglio.
- **Rientro** (*bleed*): resto di altre sorgenti dentro una traccia separata.
- **Trascrizione automatica** (*automatic music transcription*, AMT): audio → note MIDI.
- **Impronta timbrica** (*audio embedding*): vettore numerico che descrive il suono; due suoni simili hanno vettori vicini.
- **CLAP** (*Contrastive Language-Audio Pretraining*): modello che mette testo e audio nello stesso spazio; permette «trova i suoni che somigliano a questo» e «trova il suono che corrisponde a questa frase».
- **Abbinamento dell'equalizzazione** (*match EQ*): curva che porta lo spettro medio di un file verso quello di un riferimento.
- **Confronto a loudness uguale** (*level-matched A/B*): ascoltare o misurare due versioni portate allo stesso LUFS; senza, vince sempre la più forte.
- **Restauro audio** (*audio restoration*): togliere rumore, clic, ronzio, riverbero, distorsione da una registrazione.
- **Riparazione spettrale** (*spectral repair*): ricostruire una zona dello spettrogramma (un colpo di tosse, un telefono) partendo da ciò che le sta intorno.
- **Controllo qualità** (*quality control*, QC): la verifica tecnica di un file contro una specifica prima che esca.
- **Specifica di consegna** (*delivery spec*): il documento del destinatario (broadcaster, piattaforma, distributore) con formato, loudness, picchi, canali, silenzi, metadati.
- **Clonazione vocale** (*voice cloning*): modello che riproduce una voce da campioni registrati.
- **Filigrana audio** (*audio watermark*): segnale impercettibile inserito dal generatore per riconoscere un output AI (SynthID, AudioSeal).
- **Credenziali di contenuto** (*Content Credentials*, C2PA): manifesto firmato nei metadati che dice chi ha generato o modificato un file; si perde facilmente con una ricodifica.
- **Impronta acustica** (*audio fingerprint*): firma che riconosce un brano registrato (Content ID, Audible Magic); non è una filigrana e non dice se il brano è AI.
- **Riciclaggio del modello** (*model laundering*): accusa delle major del 2026 a Suno: addestrare un modello nuovo sugli output di uno vecchio non «pulisce» l'infrazione.

Fonti: ITU-R BS.1770, EBU Tech 3341 e 3342 (definizioni, vedi Numeri); documentazione ffmpeg (filtri `ebur128`, `loudnorm`, `aphasemeter`) letta 2026-11-09 [P]; README Demucs, basic-pitch, AudioSeal [P]; pagina SynthID di Google DeepMind [P]; MBW 18/09/2026 per «model laundering» [S].

## Mestieri

#### Ingegnere di analisi audio e MIR (MIR engineer, audio data scientist)
- **Fa:** trasforma file audio in dati: tempo e griglia, tonalità, accordi, struttura, timbro, stem, note MIDI, somiglianze fra suoni. Sta a monte della produzione (analisi di un riferimento, scouting di campioni, catalogazione di un archivio) e a valle (verifica che un lavoro somigli o non somigli troppo a un riferimento).
- **Consegna:** report con valori misurati e confidenza (JSON o tabella), stem WAV, MIDI, mappa delle sezioni con i tempi, indice di ricerca per somiglianza su una libreria. Ogni numero con lo strumento e la versione che l'ha prodotto.
- **Strumenti standard:** Python con librosa, essentia, madmom (solo da GitHub, vedi Tecniche), Demucs, basic-pitch, CLAP; Sonic Visualiser con i plugin Vamp per guardare e annotare; ffmpeg per tutto ciò che è formato e loudness; mir_eval per misurare quanto sbaglia un algoritmo.
- **Come si briefa:** dare il file nella qualità migliore disponibile (WAV, non un MP3 scaricato), dire a cosa serve il dato (BPM per un montaggio, tonalità per un topliner, stem per un remix autorizzato), chiedere confidenza e alternativa per ogni stima (BPM e metà/doppio, tonalità e quinta/relativa), chiedere che i valori misurati siano separati dalle scelte creative. Diritti: analizzare un brano non dà alcun diritto a usarlo.
- **Segno di livello alto:** dà sempre due stime quando sono plausibili (128 o 64 BPM; La minore o Do maggiore) e spiega come ha deciso; controlla a campione a orecchio o con un metronomo sovrapposto; sa su quali generi il suo algoritmo è stato addestrato.
- **Errore comune:** presentare una stima come un fatto («è in Fa# minore») senza confidenza; usare l'algoritmo di tonalità addestrato su un genere per un altro (vedi Numeri: il punteggio pesato scende da 74,3 a 57,3 cambiando genere di addestramento).

#### Tecnico di restauro audio (audio restoration engineer)
- **Fa:** pulisce registrazioni rovinate o sporche: rumore di fondo, ronzio a 50 Hz, clic e crepitii del vinile, distorsione da clipping, riverbero di una stanza, rumori puntuali (telefono, tosse, sirena). Lavora prima del montaggio audio e del mix (presa diretta, interviste, archivi) o su materiale d'archivio da ripubblicare.
- **Consegna:** file restaurati nello stesso formato e alla stessa durata (sincrono invariato), più l'originale intatto; per l'archivio un registro dei passaggi; per i lavori delicati più versioni a intensità diverse.
- **Strumenti standard:** iZotope RX 12 Advanced (oltre 50 moduli: Spectral Repair, Dialogue Isolate, De-reverb, De-click, De-hum, De-clip, Music Rebalance, Scene Rebalance, Ambience Match) [P: izotope.com, letto 2026-11-09]; Cedar (Cambridge, DNS per la presa diretta) da verificare; Steinberg SpectraLayers; per la voce, i moduli di isolamento basati su reti neurali.
- **Come si briefa:** mandare il file originale (mai una copia già compressa o già «pulita»), indicare cosa deve restare (l'ambiente di una location, il fruscio di un vinile come carattere) e cosa sparire, la destinazione (broadcast, social, cinema), la durata da mantenere al campione, e chiedere un prima/dopo di 30 secondi da approvare prima del lavoro completo.
- **Segno di livello alto:** il restauro non si sente: niente voce «subacquea» o metallica, niente buchi nel fondo; il fondo resta continuo fra un taglio e l'altro (usa Ambience Match o un tappeto); lavora per passate leggere invece che con un solo modulo al massimo.
- **Errore comune:** denoise al massimo in un colpo solo (artefatti «a bolle» e sibilanti mangiate); restaurare dopo la compressione o la normalizzazione invece che prima; chiedere di «togliere la musica» da una ripresa e poi usare la musica che resta senza licenza.

#### Tecnico di controllo qualità delle consegne (audio QC, deliverables technician)
- **Fa:** verifica che ogni file audio o video esca conforme alla specifica del destinatario: formato, frequenza, bit, canali e loro ordine, loudness integrato e short-term massimo, true peak, silenzi in testa e in coda, fase, sincrono, metadati, nomi dei file. Sta all'ultimo passaggio, dopo il mix e prima dell'invio.
- **Consegna:** un rapporto di QC per file (passa/non passa, con valori misurati e misuratore usato) e i file corretti o la richiesta di correzione al mixer.
- **Strumenti standard:** meter conformi a BS.1770 ed EBU Tech 3341 (Nugen VisLM, iZotope Insight 2, Youlean Loudness Meter 2 PRO con preset AGCOM 219/09/CSP, EBU R128, ATSC A/85 e piattaforme di streaming [P: youlean.co, letto 2026-11-09]); ffmpeg/ffprobe per controlli automatici in serie; sistemi di QC automatizzato per il broadcast (Interra Baton, Telestream Vidchecker/Aurora) da verificare.
- **Come si briefa:** dargli la specifica scritta del destinatario (PDF del broadcaster, pagina della piattaforma, specifica del distributore) e non «lo standard»: −23 LUFS per la TV europea, −24 per prassi italiana e USA, −14 per lo streaming musicale sono riferimenti diversi. Indicare chi corregge (lui o il mixer) e la scadenza dell'emittente.
- **Segno di livello alto:** misura il file finale esportato, non la sessione; misura anche la somma mono e i singoli stem; annota la versione del misuratore; conosce la tolleranza di misura (±0,2 LU per EBU R128 nel QC, ±0,3 dB sul true peak) e non rimanda indietro un file per 0,1 LU.
- **Errore comune:** normalizzare «a orecchio» o con il normalizzatore di picco del montaggio video; misurare un MP3 di anteprima invece del master; non controllare il true peak dopo la conversione in AAC per i social.

#### Specialista di audio AI (AI audio specialist, generative audio producer)
- **Fa:** genera o trasforma audio con i modelli: musica (Suno, ElevenLabs Music, Stable Audio), voce e doppiaggio (ElevenLabs, Seed Audio via Higgsfield), effetti (ElevenLabs Sound Effects, Mirelo via Higgsfield), audio nativo dei modelli video; separa stem; clona voci con consenso. Lavora in pre-produzione (provini, temp track, animatic) e, se i termini lo permettono, in produzione.
- **Consegna:** file audio con registro di provenienza: servizio, modello, piano attivo, data, prompt, ID del job, termini letti; WAV quando il piano lo consente (ElevenLabs Music dà WAV lossless solo da Pro in su [P]).
- **Strumenti standard:** i servizi sopra; Higgsfield `generate_audio` (modelli `seed_audio` per la voce, `text2speech_v2` con varianti ElevenLabs e MiniMax, `mirelo_text_to_audio` per gli effetti, `suno_music` 15-360 s quando il catalogo lo espone [P: schema del tool letto 2026-11-09]); Demucs o RX per gli stem; c2patool per leggere le credenziali.
- **Come si briefa:** dire l'uso finale con precisione (organico social, paid social, TV, radio, cinema, evento, streaming musicale): i diritti cambiano per uso e per piano (ElevenLabs Music esclude film, TV e radio sotto il piano Enterprise Music [P]). Vietare nel brief nomi di artisti, titoli e testi nei prompt (`regole.md` §5). Chiedere il registro di provenienza come parte della consegna.
- **Segno di livello alto:** sa dire per ogni file «questo si può usare qui e non là» citando i termini; tratta l'output come un provino da ripassare (mix, loudness, true peak, editing della forma) e non come un master; non promette esclusiva né assenza di pretese di terzi.
- **Errore comune:** generare con un piano gratuito e consegnare (Suno, ElevenLabs: uso non commerciale); usare per uno spot TV una traccia generata con un piano che esclude la TV; ricodificare e perdere watermark e metadati di provenienza.

#### Perito audio forense e verificatore di autenticità (audio forensic examiner)
- **Fa:** stabilisce se una registrazione è integra, modificata o sintetica: analisi di continuità del fondo e della rete elettrica (ENF), spettrogramma, metadati, impronte e filigrane. Per {{STUDIO}} serve quando arriva un audio «di un cliente» o di una persona nota da usare, o quando un contenuto dello studio viene contestato come falso.
- **Consegna:** perizia con metodo, strumenti, risultati per ogni test e limiti; per un'agenzia, un parere scritto «compatibile / non compatibile» con un'origine.
- **Strumenti standard:** spettrogramma (RX, Sonic Visualiser), lettori di metadati e credenziali (ffprobe, c2patool), rilevatori dei produttori (SynthID Detector di Google per i contenuti Google e partner [P]; AI Speech Classifier di ElevenLabs, solo per la voce ElevenLabs e non affidabile sul modello v3 [P]); software forensi dedicati da verificare.
- **Come si briefa:** dare il file originale con la sua catena di custodia (chi l'ha registrato, come è arrivato), non una copia da WhatsApp; dire la domanda precisa («è stato montato?», «è generato?»).
- **Segno di livello alto:** dice cosa non può escludere. Nessun rilevatore copre tutti i generatori: un risultato «nessuna filigrana trovata» non significa «registrazione autentica».
- **Errore comune:** usare un unico rilevatore online come prova; confondere impronta acustica (Content ID riconosce un brano) con rilevamento di AI.

#### Ricercatore musicale e di campioni (music researcher, sample scout)
- **Fa:** trova il materiale giusto in archivi, librerie e cataloghi: un brano di repertorio per uno spot, un loop in un disco, un suono in una libreria di effetti, le alternative a un riferimento che il cliente non può avere. Lavora prima della music supervision e della clearance.
- **Consegna:** una rosa corta (5-10 candidati) con dati misurati (BPM, tonalità con confidenza, durata, punti di taglio, presenza di voce), estratti già tagliati, titolari dei diritti e via di licenza per ciascuno.
- **Strumenti standard:** ricerca per somiglianza con embedding (CLAP) su una libreria propria; separazione per sentire il materiale isolato; database di metadati (Discogs, WhoSampled) e librerie licenziate (Tracklib, librerie di production music). Metodo da riprendere dallo strumento di scouting dell'attività DJ: finestre allineate alle battute, criteri riportati separati (presenza armonica, assenza di batteria o di voce, qualità della giunzione del loop, stabilità armonica, livello) invece di un punteggio unico opaco, tonalità stimata per ogni finestra, e i criteri non misurabili segnalati come segnaposto invece che inventati.
- **Come si briefa:** dare riferimento, durata, mood, budget di licenza e media; dire subito se il brano deve poter essere usato in paid e in TV, perché questo esclude metà dei candidati.
- **Segno di livello alto:** ogni candidato arriva con la via di licenza già verificata; distingue master e composizione; segnala quando un candidato somiglia troppo al riferimento (rischio di imitazione servile).
- **Errore comune:** consegnare la rosa senza i titolari; scegliere a gusto un brano che poi non si licenzia in tempo.

Fonti: pagine prodotto iZotope RX 12 e Insight 2, Nugen VisLM, Youlean Loudness Meter, Sonic Visualiser (versione 5.2.1 del 21/03/2025), Google DeepMind SynthID, ElevenLabs AI Speech Classifier, ElevenLabs Music Terms (09/10/2026), schema del tool Higgsfield `generate_audio`, tutti letti 2026-11-09 [P]; Korzeniowski & Widmer 2017 per il calo cross-genere [P]; metodo di scouting dalla skill DJ `sampling-and-crate-digging` (interna, non verificata su fonte esterna). Cedar, Baton, Vidchecker: da verificare (metodi provati: nessuno, non aperti in questa sessione).

## Tecniche

### A. Sentire misurando: il metodo

#### Ascoltare senza orecchie (measurement-based listening)
- **Cos'è:** il metodo con cui un agente sostituisce l'ascolto: ogni giudizio «suona forte / scuro / largo / schiacciato / fuori fase» diventa una misura con un numero, un'unità e un riferimento.
- **Si sente:** —. È il contrario: si misura quello che un orecchio sentirebbe. Corrispondenze di base: forte = LUFS integrato e short-term massimo; schiacciato = fattore di cresta e LRA bassi; aspro o distorto = true peak sopra 0 e campioni a fondo scala; scuro o brillante = energia per banda nello spettro; stretto o vuoto in mono = correlazione e somma mono; lento o veloce = BPM con l'alternativa metà/doppio.
- **Quando:** sempre, prima di dire qualcosa su un file che non si è potuto ascoltare; e anche quando un umano l'ha ascoltato, per avere un numero da scrivere nel rapporto.
- **Come:** 1) misurare il file **finale esportato**, non la sessione o un'anteprima; 2) misurare anche un riferimento nelle stesse condizioni e ragionare per differenza (lo stesso numero non dice nulla da solo); 3) riportare ogni valore con lo strumento che l'ha prodotto; 4) separare ciò che è misurato da ciò che è una scelta creativa («il basso misurato è in Re minore; il giro che ho scritto sopra è mia scelta»); 5) chiudere con «da confermare a orecchio» quando la decisione è estetica.
- **AI:** gli strumenti che «descrivono» un audio (classificatori, CLAP, la skill `audio-understand`) danno etichette e somiglianze, non misure tecniche: dicono «c'è parlato, umore teso», non «−9 LUFS e true peak +0,8». Servono entrambe.
- **Errore comune:** prendere i meter di una DAW per una misura di loudness. Nell'attività DJ di {{TITOLARE}} si è visto che i meter di traccia letti via MCP sono sulla scala del fader (0,85 ≈ 0 dB): utili per il rapporto fra una traccia e un'altra e per vedere il clipping, **non** sono LUFS. Per il loudness si misura un file con un misuratore BS.1770.

### B. Loudness, picchi, fase

#### Misura del loudness con ffmpeg (EBU R128 scanner, `ebur128`)
- **Cos'è:** il filtro `ebur128` di ffmpeg misura loudness momentaneo (400 ms), short-term (3 s), integrato con gate, LRA e, con `peak=true`, il true peak, secondo ITU-R BS.1770 ed EBU R128 [P: documentazione ffmpeg].
- **Si sente:** il numero integrato dice quanto forte verrà percepito il programma intero; lo short-term massimo dice quanto «salta fuori» il momento più forte (è il numero che fa reclamare il pubblico di uno spot).
- **Quando:** a ogni consegna; per confrontare due versioni; per capire di quanto una piattaforma abbasserà un file.
- **Come:** `ffmpeg -hide_banner -nostats -i FILE -af ebur128=peak=true:framelog=quiet -f null -` e leggere il blocco «Summary» in fondo: `I:` integrato in LUFS, `LRA:` in LU, `Peak:` sotto «True peak» in dBFS (che per il true peak va letto come dBTP). Con `peak=sample+true` dà sia il picco di campione sia il true peak. Senza `framelog=quiet` stampa 10 righe al secondo con M, S, I: utili per trovare il punto più forte. Verifiche fatte [M]: un seno a 1 kHz stereo a −41,1 dBFS per canale misura −41,1 LUFS (calibrazione corretta, come previsto da EBU Tech 3341); un master club WAV 24 bit di 5'55" misura I −8,4 LUFS, LRA 5,4 LU, true peak 0,0 dBTP, in 1,1 secondi.
- **AI:** —
- **Errore comune:** leggere la riga `TARGET:-23 LUFS` del log come risultato: è solo il riferimento grafico del filtro. Misurare un file video senza `-vn` su file con più tracce audio: si misura solo la prima.

#### Normalizzazione a due passate (`loudnorm`, two-pass)
- **Cos'è:** il filtro `loudnorm` di ffmpeg porta un file a un loudness integrato, un LRA e un true peak dati. In una passata lavora in modo **dinamico** (comprime); in due passate, con i valori misurati, applica un **guadagno lineare**, che non tocca la dinamica [P: documentazione ffmpeg].
- **Si sente:** in modo lineare, nulla cambia tranne il volume; in modo dinamico, il brano si appiattisce (meno differenza fra strofa e ritornello) e i transienti si ammorbidiscono.
- **Quando:** per portare in specifica un file parlato, un audio da social o un temp track; **non** per masterizzare musica (si usa un limiter in mastering, vedi `mix-mastering.md`).
- **Come:** passata 1: `ffmpeg -hide_banner -nostats -i IN.wav -af loudnorm=I=-23:TP=-1:LRA=11:print_format=json -f null -` e copiare `input_i`, `input_tp`, `input_lra`, `input_thresh`, `target_offset`. Passata 2: `ffmpeg -i IN.wav -af loudnorm=I=-23:TP=-1:LRA=11:measured_I=…:measured_TP=…:measured_LRA=…:measured_thresh=…:offset=…:linear=true:print_format=json -ar 48000 -c:a pcm_s24le OUT.wav`. Nel JSON della seconda passata controllare `"normalization_type" : "linear"`: se dice `dynamic`, il filtro è ricaduto in compressione. Succede quando il LRA di destinazione è più basso di quello del file o quando il guadagno porterebbe il true peak oltre il limite [P]: allora o si alza `LRA`, o si abbassa il bersaglio, o si passa da un limiter vero. Succede anche quando il LRA misurato è `0.00` (toni di prova, rumori e ambienti costanti, drone): il codice del filtro accetta il modo lineare solo con `measured_LRA` diverso da zero [P: `af_loudnorm.c`, riga 820, letto 2026-11-09; M: rumore rosa costante, LRA 0,00 → `Dynamic`]; per questi file basta `-af volume=XdB` con X = bersaglio − `input_i`, controllando il true peak. I file più corti di 3 s vengono invece trattati sempre in modo lineare, con guadagno limitato dal TP [P: ibid.]. **Il true peak riportato dalla seconda passata in modo lineare è un picco di campione** (il filtro misura `SAMPLE_PEAK` e in lineare non sovracampiona): sul file di prova con clipping la riga `Output True Peak` dice −22,1, il true peak vero misurato con `ebur128` è −19,2 dBTP [M]. Il risultato si rimisura sempre con la Ricetta, blocco 2. In modo dinamico il filtro sovracampiona a 192 kHz: mettere sempre `-ar` in uscita [P]. Prova fatta [M]: rumore rosa limitato a −11,3 LUFS portato a −14 in due passate: uscita −13,9 LUFS, true peak −3,1 dBTP, `linear`.
- **AI:** gli audio generati (voce, musica, audio nativo dei video) escono a loudness molto diversi fra loro (vedi Numeri: da −26,8 a −44,2 LUFS sui clip misurati): la due passate è il modo pulito di allinearli prima del montaggio.
- **Errore comune:** usare la passata singola (`loudnorm` senza `measured_*`) su musica finita e consegnarla: è un compressore automatico. Copiare a mano i valori sbagliati fra le passate: si automatizza con uno script o si usa `stats_file`.

#### Misura del loudness in Python (pyloudnorm)
- **Cos'è:** libreria Python che implementa ITU-R BS.1770-4 per il loudness integrato, con funzione LRA ispirata a EBU Tech 3342 e normalizzazione; **non** misura il true peak [P: README pyloudnorm, versione 0.2.0 del 04/01/2026 su PyPI].
- **Si sente:** —
- **Quando:** quando la misura entra in uno script (analisi in serie di una libreria, controllo automatico di 50 voci generate).
- **Come:** `uv run --with pyloudnorm --with soundfile python -c "import soundfile as sf, pyloudnorm as pyln; d,r=sf.read('FILE.wav'); print(pyln.Meter(r).integrated_loudness(d))"`. Confronto fatto [M]: sullo stesso master pyloudnorm −8,45 LUFS, ffmpeg −8,4 LUFS; sul seno di calibrazione entrambi −41,1. Per il true peak resta ffmpeg.
- **AI:** —
- **Errore comune:** usarla per il QC di una consegna broadcast senza true peak; dimenticare che lavora sul file decodificato (un MP3 misura il loudness dell'MP3, non del master).

#### Meter di loudness commerciali (loudness meters)
- **Cos'è:** plugin e applicazioni che misurano in tempo reale e su file, con preset delle norme: Nugen VisLM (lo standard della post-produzione e del broadcast secondo il produttore, true peak, multi-stem), iZotope Insight 2 (loudness, spettrogramma, intelligibilità, fino a 7.1.2 Atmos), Youlean Loudness Meter 2 (gratuito, PRO a pagamento, preset BS.1770-4, EBU R128, ATSC A/85, AGCOM 219/09/CSP, piattaforme di streaming) [P: pagine dei produttori, lette 2026-11-09].
- **Si sente:** —
- **Quando:** durante il mix e il montaggio audio (si guarda lo short-term mentre si lavora); per un QC con documento firmato; quando il cliente chiede «il report del meter».
- **Come:** caricare sull'uscita master; scegliere il preset del destinatario; azzerare prima di riprodurre dall'inizio alla fine; esportare il grafico o il PDF. Un meter conforme EBU Mode deve avere la scala «EBU +9» (−41 a −14 LUFS) come predefinita [P: EBU Tech 3341].
- **AI:** —
- **Errore comune:** misurare solo un pezzo del programma (il loudness integrato è sull'intero file); confondere il preset «Spotify» (riferimento di riproduzione) con una specifica di consegna.

#### Picco reale, picchi inter-campione e clipping (true peak, ISP, clipping detection)
- **Cos'è:** il true peak stima il picco del segnale analogico ricostruito sovracampionando (4 volte a 48 kHz, cioè 192 kHz, nell'algoritmo di BS.1770 [P]); il clipping è il taglio a fondo scala, visibile come campioni consecutivi al valore massimo.
- **Si sente:** crepitio o asprezza sui colpi forti; distorsione che appare **dopo** la conversione in AAC/MP3 o nel convertitore del telefono anche se il WAV «non clippa».
- **Quando:** su ogni master e ogni consegna; con particolare cura su master molto forti (sopra −10 LUFS) e su tutto ciò che verrà compresso in lossy.
- **Come:** `ebur128=peak=sample+true`: se il true peak supera il sample peak di più di qualche decimo, ci sono picchi inter-campione. Prova [M]: un seno a 11.025 Hz con campioni a −0,0 dBFS misura true peak **+3,6 dBTP** (il valore teorico è +3,0 dB; la differenza è nel filtro di sovracampionamento, e BS.1770 ammette l'imprecisione: EBU dà ±0,3 dB di tolleranza [P]). Per il clipping: `astats` riporta `Peak level dB` e `Peak count` (quante volte il picco è stato raggiunto) e `Flat factor` (lunghezza dei tratti piatti); sul master club misurato [M]: picco −0,001 dBFS, 63,5 occorrenze in media per canale: limiter a 0 dBFS, picchi ripetuti al massimo.
- **AI:** gli output dei generatori spesso arrivano già limitati e «a tappo» (vedi Numeri, audio nativo dei video): misurare sempre prima di sovrapporre altro audio.
- **Errore comune:** fidarsi del picco di campione a −0,1 dBFS come «sicuro»; mettere il limiter a −0,1 dBTP e poi convertire in AAC a 128 kbps.

#### Fase, correlazione e compatibilità mono (phase correlation, mono compatibility)
- **Cos'è:** la correlazione dice quanto i due canali sono simili (+1 identici, 0 indipendenti, −1 opposti); la compatibilità mono si verifica sommando i canali e misurando quanto loudness si perde.
- **Si sente:** in mono (smartphone con un altoparlante, casse Bluetooth, molti impianti da evento) un mix con problemi di fase perde la voce, il basso o un intero synth largo; un file con un canale invertito sparisce del tutto.
- **Quando:** sempre per social, radio, eventi; ogni volta che un mix usa allargatori stereo, chorus, doppie riprese microfoniche, effetti generati con AI.
- **Come:** 1) `aphasemeter=video=0:phasing=1` di ffmpeg logga `mono_start`, `out_phase_start` e durata dei tratti in controfase [P]; 2) confronto di loudness calibrato: `ffmpeg -i FILE -af "pan=mono|c0=0.5*c0+0.5*c1,ebur128=framelog=quiet:dualmono=true" -f null -` e confrontare con l'integrato stereo. Con `dualmono=true` un contenuto perfettamente in fase dà **lo stesso** valore [M: rumore identico sui due canali −11,2 e −11,2 LUFS]. Il master club misurato perde 0,3 LU (normale); un file con un canale invertito passa da −11,2 a −70 LUFS, cioè silenzio [M]. Soglia di partenza (non una norma): oltre 1-1,5 LU di perdita si ascolta in mono e si cerca la causa.
- **AI:** gli stem separati e l'audio generato possono avere fasi strane fra i canali; si controllano come un mix.
- **Errore comune:** guardare solo la fase media (la media del master misurato è +0,58, ma 87 finestre su 3.822 sono negative [M]): un buco breve nel punto chiave pesa più della media.

#### Spettro e spettrogramma (spectrum, spectrogram)
- **Cos'è:** la fotografia della frequenza nel tempo. ffmpeg `showspectrumpic` produce un'immagine PNG dell'intero file [P]; Sonic Visualiser (gratuito, open source, versione 5.2.1 del 21/03/2025 [P]) permette di zoomare, sovrapporre analisi (beat, tonalità, note) con i plugin Vamp e annotare.
- **Si sente:** un taglio netto sopra 16 kHz = file che è passato da un MP3 o da un AAC a bassa qualità, o generato a 32 kHz; righe orizzontali fisse = ronzio (50 Hz e armoniche) o fischi; colonne verticali = clic; zona scura sotto 40 Hz in un brano dance = manca il sub.
- **Quando:** per capire se un «WAV» è un MP3 rinominato; per trovare rumori da restaurare; per confrontare il bilanciamento con un riferimento.
- **Come:** `ffmpeg -i FILE -lavfi "showspectrumpic=s=1600x800:legend=1:scale=log:fscale=log" spettro.png` (0,3 s su 33 s di audio [M]); l'agente legge il PNG con lo strumento di lettura immagini. Per una misura numerica della banda alta: `highpass=f=16000,astats` e leggere `RMS level dB` (−inf o sotto −85 dB = niente sopra 16 kHz, tipico di un file a 32 kHz). Non riconosce un MP3 o un AAC a 128 kbps (taglio a ~17 kHz, solo 5-6 dB in meno sul rumore rosa di prova [M]): per quello serve lo spettrogramma con `fscale=lin`, dove il taglio è una banda nera netta; con `fscale=log` la zona sopra 11 kHz è schiacciata e il taglio quasi non si vede [M].
- **AI:** lo spettrogramma è il controllo più rapido sulla qualità tecnica di un output AI (banda limitata, artefatti metallici «a righe» della separazione, rumore sintetico in coda).
- **Errore comune:** giudicare il bilanciamento tonale dal centroide spettrale su materiale rumoroso: il fruscio di un disco a 78 giri alza il centroide verso i 4 kHz anche quando l'energia vera sta fra 120 e 400 Hz (lezione dell'attività DJ); meglio l'RMS per banda.

#### Silenzi in testa e in coda, offset DC (head/tail silence, DC offset)
- **Cos'è:** tratti silenziosi all'inizio e alla fine del file; spostamento medio del segnale dallo zero.
- **Si sente:** un silenzio in testa ritarda l'attacco in un montaggio o in una playlist; un silenzio troppo corto in coda taglia la coda del riverbero; il DC dà un «tump» ai tagli e alle dissolvenze.
- **Quando:** su ogni consegna; le specifiche dei broadcaster e dei distributori spesso fissano la durata del silenzio e dei «tre secondi di nero» (vedi `audio-per-immagine.md`).
- **Come:** `silencedetect=n=-60dB:d=0.5` logga `silence_start`, `silence_end`, `silence_duration` [P]; prova [M]: 2,0 s di silenzio in testa e 1,5 s in coda rilevati al millisecondo. `astats` dà `DC offset` (sul master misurato 0,00004, trascurabile [M]).
- **AI:** gli output generati hanno spesso silenzi o code di rumore irregolari: si rifilano prima di consegnare.
- **Errore comune:** soglia sbagliata: a −60 dB un fondo di sala viene visto come «suono»; per un parlato registrato usare −50 dB e controllare a vista sullo spettrogramma.

Fonti (B): documentazione ffmpeg `ebur128`, `loudnorm`, `aphasemeter`, `silencedetect`, `showspectrumpic` (ffmpeg.org/ffmpeg-filters.html) e `ffmpeg -h filter=…` della versione 9.0.1 [P]; ITU-R BS.1770-5 (11/2023), EBU R 128-2023, EBU Tech 3341 (2016) e 3342 [P]; README pyloudnorm e PyPI [P]; pagine Nugen, iZotope, Youlean, Sonic Visualiser [P]; tutte le prove [M] eseguite il 2026-11-09 su segnali di prova generati con ffmpeg e su un master WAV dell'archivio di {{TITOLARE}} (copiato in /tmp, l'originale non è stato toccato).

### C. Analisi musicale (MIR), separazione, confronto, restauro

#### Pipeline locale di analisi (uv, ffmpeg, Python)
- **Cos'è:** l'ambiente minimo per misurare in locale: ffmpeg (Homebrew), uv per gli ambienti Python isolati, e le librerie di analisi.
- **Si sente:** —
- **Quando:** una volta per macchina; da rifare quando una libreria cambia versione di Python supportata.
- **Come:** `brew install ffmpeg` · `uv venv ~/mir-tools/.venv --python 3.11` · `uv pip install --python ~/mir-tools/.venv "librosa<1" essentia basic-pitch demucs pretty_midi pyloudnorm soundfile`. **Correzione rispetto alla skill DJ:** il vincolo di versione oggi non è più ovvio. librosa 1.0.0 (11/08/2026) richiede Python ≥3.12, mentre basic-pitch 0.4.0 dichiara fino a 3.11 e il suo README dice che sui Mac Apple Silicon supporta solo 3.10 (su questa macchina gira su 3.11 con CoreML [M]); madmom su PyPI è fermo alla 0.16.1 del 2018 (si installa da GitHub: ultimo commit sul ramo principale del 25/08/2024, ultimo push al repository il 20/03/2026 [P: API GitHub]); demucs su PyPI è la 4.1.0 dell'11/07/2026, pubblicata dal fork di Alexandre Défossez, che si dichiara «the officially maintained Demucs», mentre il repository di Meta è archiviato (sola lettura) e dice «not maintained anymore» [P: PyPI e README, letti 2026-11-09]. Quindi: **un ambiente 3.11 con librosa 0.10/0.11** per la pipeline completa; un secondo ambiente 3.12 solo se serve librosa 1.0. La skill DJ segnala che `uvx demucs` fallisce per numpy mancante e va installato nell'ambiente persistente (riportato, non riprovato).
- **AI:** Demucs, basic-pitch, CLAP e i separatori UVR (pacchetto `audio-separator` 0.48.0, 29/10/2026, Python ≥3.10 [P]) scaricano i modelli al primo uso: prevedere la rete e qualche centinaio di MB.
- **Errore comune:** installare tutto in un ambiente «globale» e scoprire il conflitto di versione a metà lavoro; non annotare le versioni nel report (la stessa analisi con librosa 0.10 e 1.0 può dare numeri diversi).

#### Tempo e griglia dei battiti (tempo estimation, beat tracking)
- **Cos'è:** stima del BPM globale e della posizione di ogni battito (e, con i modelli più nuovi, del primo battito della battuta).
- **Si sente:** un BPM sbagliato di metà o doppio non si nota leggendo il numero ma si nota subito montando: i tagli cadono in levare.
- **Quando:** montare un video a tempo, sincronizzare un'animazione, scegliere un brano di libreria compatibile, preparare uno stem per un remix.
- **Come:** essentia `RhythmExtractor2013(method="multifeature")` e librosa `beat.beat_track`, confrontati; madmom o Beat This! (CPJKU, ISMIR 2024, versione 1.1.0 del 14/04/2026, senza post-elaborazione DBN [P: README]) per griglie più precise e per i downbeat. Prova [M] sul master club: essentia 129,98 BPM in 2,4 s; librosa 129,20 BPM in 3,4 s. **Il decimale di librosa non è una misura:** con frequenza 22.050 Hz e salto 512 campioni i valori possibili sono a gradini (136,0 · 129,2 · 123,0 BPM): 129,2 vuol dire «circa 130». Precisione pubblicata (vedi Numeri): su musica elettronica (GiantSteps Tempo) i migliori sistemi classici restano fra 59 e 77% di stime giuste entro il 4% (Accuracy1), e salgono a 86-94% se si perdonano gli errori di metà/doppio/terzo (Accuracy2); le annotazioni umane stesse concordano solo all'81,5% (Accuracy1) [P: Schreiber, ISMIR 2018].
- **AI:** i modelli neurali (madmom, Beat This!) sono a loro volta AI; nessuno dei generatori musicali garantisce il BPM chiesto nel prompt: si misura l'output.
- **Errore comune:** riportare un solo BPM senza l'alternativa metà/doppio; fidarsi del BPM su musica con tempo libero, rubato, swing forte o cambi di tempo (il BPM globale lì non esiste).

#### Tonalità (key estimation)
- **Cos'è:** stima di tonica e modo (maggiore/minore) dal contenuto armonico, di solito con profili di riferimento sul cromagramma o con una rete neurale.
- **Si sente:** una tonalità sbagliata si scopre quando la voce o il topline «stona» sopra la base.
- **Quando:** scegliere un brano di libreria compatibile con un jingle, briefare un topliner o un cantante, preparare un mashup autorizzato.
- **Come:** essentia `KeyExtractor` con più profili e confronto. Prova [M] sul master club: profili `temperley` e `bgate` → Do# maggiore; `krumhansl` ed `edma` → La♭ maggiore. Sono a distanza di quinta: è l'errore più tipico. Il metro di giudizio standard (MIREX, mir_eval) pesa 1 la tonalità giusta, 0,5 la quinta, 0,3 la relativa, 0,2 la parallela [P: mir_eval]. Il miglior sistema dello studio di riferimento ottiene 74,3 di punteggio pesato e 67,9% di tonalità esatte su musica elettronica, ma 57,3 se addestrato su pop/rock; il profilo `edma` di essentia ottiene 65,6 / 57,8% sullo stesso test [P: Korzeniowski & Widmer 2017]. Per decidere fra due candidati: separare il basso o l'«other» con Demucs, trascrivere con basic-pitch e guardare l'istogramma delle classi di altezza (metodo della skill DJ).
- **AI:** la tonalità chiesta a un generatore musicale non è garantita: si misura.
- **Errore comune:** presentare la tonalità senza confidenza e senza la seconda ipotesi; analizzare l'intero brano quando un loop di 4 battute sta in una tonalità locale diversa (lo scouting dell'attività DJ stima la tonalità per finestra).

#### Struttura del brano (structure analysis, segmentation)
- **Cos'è:** divisione del brano in sezioni (intro, strofa, ritornello, break, drop) con i tempi di inizio.
- **Si sente:** —; serve a tagliare una versione da 30" o 15" su un punto musicale, o a trovare il pezzo che regge un loop.
- **Quando:** riduzioni di un brano per spot, scelta del punto d'attacco per un social, analisi di un riferimento.
- **Come:** non esiste uno strumento «verità»: curva RMS su finestre lunghe e rilevamento dei cambi sostenuti (metodo della skill DJ), oppure librosa `segment` o msaf (fermo al 2023), oppure all-in-one (`allin1`, 1.1.0 del 2023: battiti, downbeat ed etichette di sezione) [P: PyPI]. Etichettare in modo descrittivo (sezione forte/debole) e far confermare le etichette umane («drop», «ritornello»).
- **AI:** i generatori musicali accettano spesso indicazioni di struttura nel prompt o nel testo (tag di sezione); il risultato si verifica con la stessa analisi.
- **Errore comune:** prendere per buone le etichette semantiche di un algoritmo; tagliare su un cambio di energia che cade a metà battuta (si allinea sempre alla griglia dei downbeat).

#### Separazione delle sorgenti (source separation, stem splitting)
- **Cos'è:** un modello divide il mix in tracce: Demucs v4 (voce, batteria, basso, altro; `htdemucs_6s` aggiunge chitarra e piano), modelli MDX/Roformer della comunità UVR, servizi commerciali e moduli di RX 12 (Music Rebalance, Dialogue Isolate, Scene Rebalance per dialoghi/musica/effetti nella post) [P: README Demucs, izotope.com].
- **Si sente:** la voce si separa meglio di tutto; «other» è sempre il più sporco; gli artefatti tipici sono timbro metallico o «acquoso», piatti che restano nella voce, code di riverbero tagliate, basso che respira con la cassa.
- **Quando:** remix e versioni autorizzate, karaoke e strumentali per un evento, togliere la musica da una presa diretta, isolare un elemento per analizzarlo (tonalità sul basso, trascrizione della linea), scouting di campioni.
- **Come:** `demucs -n htdemucs -d mps -o OUTDIR FILE.wav` (su Apple Silicon `-d mps` usa la GPU). Tempi misurati [M] su un brano di 5'55" su M4 Pro: **13,7 s con MPS** (circa 31 secondi di audio al secondo), **68 s su CPU**. `htdemucs_ft` è circa 4 volte più lento e «might be a bit better» [P]. Qualità pubblicata: SDR 9,00 dB su MUSDB HQ per `htdemucs`, 9,20 dB con fine-tuning per sorgente [P]. Il piano di `htdemucs_6s` «non funziona bene» per ammissione degli autori [P]. Per nascondere gli artefatti in un uso creativo: filtrare, saturare e mescolare il 70-90% dello stem con poco mix originale (valori di partenza della skill DJ). Per la post-produzione: RX Dialogue Isolate o Scene Rebalance.
- **AI:** è AI. Uso legittimo: separare materiale di cui si hanno i diritti (le proprie registrazioni, brani con licenza che consente versioni, presa diretta propria). Separare un brano commerciale **non crea alcun diritto** sugli stem: master e composizione restano dei titolari. Suno ed ElevenLabs offrono separazione dentro i loro servizi, con i loro termini.
- **Errore comune:** consegnare uno stem separato come se fosse una traccia multitraccia originale; separare un MP3 a bassa qualità (gli artefatti si sommano).

#### Trascrizione audio → MIDI (automatic music transcription)
- **Cos'è:** basic-pitch (Spotify, ICASSP 2022) converte audio in note MIDI con pitch bend; è leggero, polifonico e indipendente dallo strumento, e «funziona meglio su uno strumento alla volta» [P: README].
- **Si sente:** —; il MIDI va ascoltato su un suono neutro per capire quanto è sporco (note fantasma, ottave sbagliate, accordi spezzati).
- **Quando:** ricavare una linea di basso o una melodia da un provino, preparare una partitura di massima per un musicista, verificare una tonalità con l'istogramma delle note.
- **Come:** separare prima con Demucs, poi `basic-pitch OUTDIR stem.wav`. Tempo misurato [M]: 5,4 s per il basso separato di un brano di 5'55" (backend CoreML). Pulire il MIDI a mano: soglie di durata minima, quantizzazione leggera, ottave.
- **AI:** è AI. Per una melodia nota la trascrizione è uno strumento di interpolazione (ri-suonare): chiede comunque la licenza della composizione.
- **Errore comune:** trascrivere il mix intero (polifonia densa = note a caso); trattare il MIDI come una partitura giusta senza controllo umano.

#### Impronta timbrica e ricerca per somiglianza (audio embeddings, CLAP)
- **Cos'è:** un modello trasforma ogni suono in un vettore; si cercano i vicini. LAION-CLAP (licenza CC0, audio a 48 kHz) ha checkpoint dedicati: generale sotto 10 s, generale a lunghezza variabile, musica, musica e parlato [P: README]. Con CLAP si cerca anche per testo («cassa secca anni '80»).
- **Si sente:** —; è il sostituto di «riconoscere un suono».
- **Quando:** trovare in una libreria di effetti o di campioni i suoni più vicini a un riferimento; ordinare cento tracce di libreria per somiglianza con il temp track del cliente; trovare doppioni.
- **Come:** indicizzare la libreria una volta (un vettore per file), poi interrogare con il riferimento e prendere i primi 10; ascoltare i primi 3. Per suoni composti (cassa, basso, lead) la skill DJ divide il riferimento in bande (sub 20-150 Hz, bassi 150-500, medi 500-2k, alti 2-8k, aria 8-20k) più la componente transiente, e cerca un candidato per banda: è un metodo, i risultati vanno trattati come «stessa famiglia», non come copie. Avvertenza pratica della skill DJ: i file `._` creati da macOS sui dischi esterni inquinano l'indice con falsi risultati tutti con lo stesso punteggio: escluderli.
- **AI:** è AI; la skill `audio-understand` usa CLAP per ordinare candidati per umore.
- **Errore comune:** prendere il punteggio di somiglianza come misura di qualità; usare il modello generale per la musica quando esiste quello musicale.

#### Confronto con un riferimento (reference matching, match EQ, level-matched A/B)
- **Cos'è:** mettere a confronto il proprio file con un riferimento **allo stesso loudness**, e misurare la differenza di spettro medio; il match EQ calcola una curva che avvicina uno all'altro.
- **Si sente:** a parità di loudness emergono le differenze vere: più o meno basso, più o meno «aria», più o meno compressione. Senza parità di loudness vince sempre il file più forte.
- **Quando:** quando il cliente manda un riferimento («deve suonare come questo»); per confrontare due mix o due generazioni AI; per verificare un fornitore.
- **Come:** portare entrambi a −23 LUFS (o −14) con loudnorm in due passate in file temporanei; confrontare LRA, fattore di cresta (`astats`: picco − RMS), true peak; generare i due spettrogrammi con la stessa scala; per una curva di correzione, Ozone Match EQ o FabFilter Pro-Q (funzione EQ Match) in un mix, da usare con poca intensità (valore di partenza: 30-50% della curva, non il 100%). La skill DJ stima anche la catena di effetti di uno stem confrontando crest factor, RMS e centroide con l'originale: è un'approssimazione della dinamica, non del timbro, e va detto.
- **AI:** il prompt di un generatore non può contenere il nome dell'artista o del brano di riferimento (`regole.md` §5 e termini ElevenLabs Music §2.1 [P]): il riferimento si traduce in misure e parole (BPM, tonalità, strumenti, densità, brillantezza).
- **Errore comune:** confrontare a orecchio due file a loudness diversi; copiare la curva del riferimento al 100% (si copia anche il suo materiale musicale, non solo il suono).

#### Restauro audio (audio restoration)
- **Cos'è:** l'insieme di de-noise, de-hum, de-click, de-crackle, de-clip, de-reverb, de-esser, isolamento del dialogo e riparazione spettrale. iZotope RX 12 Advanced ne raccoglie oltre 50, con Repair Assistant che propone le correzioni e, nuovi nella 12, Scene Rebalance (dialogo, musica, effetti separati in un mix finito) e Trim Silence [P: izotope.com].
- **Si sente:** fatto bene, non si sente; fatto male, voce metallica o «sott'acqua», fondo che pompa, sibilanti mangiate, ambiente che sparisce fra una frase e l'altra.
- **Quando:** presa diretta di uno spot o di un'intervista, voce registrata in casa da un testimonial, materiale d'archivio, podcast; prima di separare o trascrivere un file rumoroso.
- **Come:** ordine di partenza (non una regola): de-clip → de-click → de-hum → de-noise in passate leggere (meglio due a 6 dB che una a 12) → de-reverb → riparazione spettrale dei rumori puntuali → Ambience Match per ricucire il fondo. Lavorare su una copia, confrontare a loudness uguale con l'originale, ascoltare in cuffia.
- **AI:** i moduli moderni sono reti neurali (Dialogue Isolate, Music Rebalance); ElevenLabs offre Voice Isolator [P: menu del sito]. Vanno bene per salvare un file, non per «trasformare un telefono in uno studio»: oltre un certo punto l'AI inventa dettagli della voce.
- **Errore comune:** restaurare dopo la compressione e la normalizzazione; togliere tutto il rumore (il silenzio digitale fra le frasi si nota più del fondo).

#### Controllo qualità di un file prima della consegna (delivery QC)
- **Cos'è:** la verifica di ogni voce della specifica sul file finale, con un rapporto scritto.
- **Si sente:** un file fuori specifica viene abbassato o rifiutato dal destinatario; un true peak alto distorce dopo la codifica; un canale invertito sparisce in mono.
- **Quando:** prima di ogni invio: broadcaster, piattaforme, distributori musicali, cliente.
- **Come:** checklist, in quest'ordine: 1) **formato e contenitore** (WAV/BWF PCM, AIFF, FLAC; per il video la traccia audio dentro il file) · 2) **frequenza** (48 kHz per video e broadcast; 44,1 kHz per CD Baby e per il CD) · 3) **bit** (24 per il lavoro e il broadcast; 16 dove richiesto, con dither) · 4) **canali e ordine** (stereo L/R; per 5.1 l'ordine della specifica) · 5) **loudness integrato** e **short-term massimo** contro la specifica · 6) **true peak** · 7) **LRA** se la specifica lo chiede (non sotto 1 minuto: EBU lo sconsiglia [P]) · 8) **silenzi** in testa e in coda · 9) **fase e somma mono** · 10) **clipping e DC** · 11) **durata** al fotogramma o al campione · 12) **metadati** (ISRC, titolo, artista, BWF, credenziali C2PA se presenti) e **nome del file** secondo la specifica · 13) **ascolto** di inizio, fine e punto più forte. I comandi sono nella Ricetta sotto.
- **AI:** per ogni asset AI aggiungere al QC: servizio, piano e data, e la riga nel registro `rights/` (`regole.md` §6).
- **Errore comune:** controllare la sessione e non il file esportato; consegnare 48 kHz a un distributore che vuole 44,1 (CD Baby lo segnala come errore comune [P]); dimenticare che una seconda esportazione cambia tutto e va rimisurata.

### D. Audio generato con l'AI

#### Generazione musicale con l'AI (AI music generation)
- **Cos'è:** modelli che generano brani completi (registrazione e composizione) da testo, testi, riferimenti audio: Suno (v6 lanciata il 09/09/2026 [S: MBW]), ElevenLabs Music, Stable Audio 3.0 (Stability AI, «trained on fully licensed data», fino a 6 minuti, pesi aperti per sperimentare [P: stability.ai]), Udio (oggi chiuso al download, vedi sotto), Suno via Higgsfield (`suno_music`, 15-360 s, quando il catalogo lo espone [P: schema tool]).
- **Si sente:** forma plausibile e suono «finito» a primo ascolto; ai controlli emergono voci con consonanti impastate, testi che perdono senso, piatti e alti granulosi, mix poco profondo, strutture che ripetono senza svilupparsi, fine brusca.
- **Quando:** provini e temp track per presentare un'idea al cliente; musica di sottofondo per contenuti organici a basso rischio; mai per l'audio logo di una marca o per un brano che il cliente vuole possedere (la protezione d'autore di un output puramente generato è incerta: `regole.md` §6, L. 132/2025 art. 25).
- **Come:** prima di generare, leggere i termini del servizio per l'uso finale (tabella in Numeri). In sintesi, letti il 2026-11-09 [P]: **Suno** (termini in vigore dal 03/09/2026): con piano Pro o Premier Suno cede all'utente i diritti che ha sull'output, senza garantire che esista un copyright; uso commerciale solo per i brani **scaricati** entro le quote del piano; con piano free o Basic solo uso personale non commerciale; vietato rimuovere fingerprint, watermark o metadati che Suno può aggiungere per nascondere provenienza, piano o stato del download, e vietato ottenere l'output registrandolo o con lo stream ripping; i Remix attivati fra utenti sono opera comune e restano solo per uso personale non commerciale, con qualunque piano. Quote (pagina prezzi, letta 2026-11-09 [P]): Free nessun download e nessun diritto commerciale; Pro 10 $/mese (8 annuale) con 20 download al mese; Premier 30 $/mese (24 annuale) con 60 download al mese; download aggiuntivi acquistabili. **ElevenLabs Music** (Music Terms del 09/10/2026): Free senza download e con attribuzione; Starter e superiori con uso commerciale online e offline **escluso film, TV, radio e videogiochi «Studio»**, consentiti solo dal piano Enterprise Music (anche Enterprise Music Lite li esclude); vietato con tutti i piani self-serve creare o alimentare una libreria musicale per terzi; distribuzione sulle piattaforme di streaming da Creator in su; WAV lossless solo da Pro in su; Starter, Creator e Pro «solo uso individuale», Scale per entità sotto i 10 dipendenti, Business sotto i 50; vietato mettere nel prompt nomi di artisti, autori, titoli, album, editori, etichette e testi riconoscibili. **Udio** (termini rivisti il 12/11/2025): vietato scaricare gli output e pubblicarli su piattaforme come YouTube, Spotify, Instagram, TikTok; vietato l'uso commerciale; gli output restano di Udio. **Stable Audio**: per i modelli in locale licenza Community gratuita sotto 1 milione di dollari di ricavi annui (con registrazione per l'uso commerciale), Enterprise sopra, con indennizzo legale solo in Enterprise; per l'app stableaudio.com valgono i Terms of Service di Stability AI (in vigore dal 31/07/2025): Stability cede all'utente i suoi diritti sull'output «se ce ne sono», usa input e output per addestrare salvo opt-out, vieta di presentare un output come fatto da un umano. Dopo la generazione: misurare loudness e true peak, spettrogramma, tagliare la forma, mixare con il resto; registrare servizio, piano, data, prompt e job.
- **AI:** è la voce stessa. Via Higgsfield (Terms del 23/10/2026 [P]) Higgsfield non rivendica l'output, non ne limita l'uso commerciale e permette di trasferirlo al cliente; usa input e output per addestrare i suoi modelli salvo contratto Enterprise; non fa alcuna verifica dei diritti; per i modelli di terzi valgono **anche le loro politiche d'uso accettabile**, e prevale la più restrittiva. Non dice che si applichino i piani commerciali del fornitore a valle (per esempio la tabella ElevenLabs Music): nel dubbio si legge anche quella e si applica la più prudente.
- **Errore comune:** generare con un account personale o gratuito e consegnare a un cliente; usare ElevenLabs Music non Enterprise per uno spot TV o radio; chiedere «nello stile di [artista]» (vietato da `regole.md` §5 e dai termini ElevenLabs); promettere al cliente esclusiva o assenza di pretese.

#### Voce sintetica e clonazione vocale (text-to-speech, voice cloning)
- **Cos'è:** generazione di parlato da testo con voci di catalogo o con una voce clonata da registrazioni. Via Higgsfield: `seed_audio` (Seed Audio 1.0 di ByteDance, voce preset o elemento di riferimento, parametri di velocità, loudness e intonazione, clonazione da un riferimento audio) e `text2speech_v2` con varianti ElevenLabs, MiniMax e altre [P: schema tool].
- **Si sente:** le voci migliori reggono frasi brevi; sui testi lunghi emergono accenti sbagliati, respiri finti, intonazione ripetitiva, nomi propri e numeri pronunciati male; in italiano le doppie e l'accento tonico sono il punto debole (osservazione di mestiere da verificare su un test vero).
- **Quando:** speakeraggio di provini e animatic, versioni linguistiche di prova, contenuti interni; per la messa in onda, solo con voce di catalogo licenziata per l'uso o con clonazione della voce di chi ha firmato il consenso.
- **Come:** testo con punteggiatura scritta per l'orecchio; numeri e sigle in lettere; generare frase per frase e montare; misurare e normalizzare (−23 LUFS per broadcast, poi mix). ElevenLabs: uso commerciale solo con piano a pagamento, gli utenti free solo uso non commerciale [P: termini 09/10/2026]. **Clonazione su ElevenLabs:** si può clonare solo la propria voce o una voce che si è autorizzati a condividere; caricando le registrazioni si concede a ElevenLabs una licenza perpetua, irrevocabile e sublicenziabile a usarle, e a usare il modello della voce, per migliorare i servizi e svilupparne di nuovi (non a commercializzare la voce da sola senza permesso) [P: Terms of Use §4(b), 4(d), 4(e)]; i consensi della persona vanno conservati almeno 5 anni ed esibiti su richiesta [P: ElevenCreative Terms §2]. Il consenso scritto del testimonial deve quindi coprire anche questa licenza al fornitore; i contratti Enterprise possono differire (da verificare sul contratto). Il doppiaggio Dubbing v2 è escluso da film, serie, piattaforme di streaming e on demand senza autorizzazione scritta [P: ElevenCreative Terms, Allegato 1]. Suno permette un «Voice Model» solo della **propria** voce [P].
- **AI:** è la voce stessa. Regola dello studio: nessuna voce di persona riconoscibile senza consenso scritto che copra l'uso AI (`regole.md` §3.3-3.5; deepfake vocale è reato in Italia, art. 612-quater c.p.).
- **Errore comune:** clonare la voce di un testimonial da un'intervista «perché tanto l'ha già detto»; consegnare il parlato senza normalizzarlo (vedi Numeri: gli output arrivano a loudness molto diversi).

#### Effetti sonori con l'AI (AI sound effects)
- **Cos'è:** generazione di effetti, ambienti e foley da testo: ElevenLabs Sound Effects, Mirelo via Higgsfield (`mirelo_text_to_audio`, durata obbligatoria) [P: schema tool], Stable Audio.
- **Si sente:** funzionano bene ambienti e texture (pioggia, folla lontana, vento) e colpi semplici; meno bene azioni lunghe con causa ed effetto e sincronismi precisi; spesso hanno coda di rumore e loudness casuale.
- **Quando:** prototipi, animatic, social, layer di ambiente sotto un mix; per il cinema e la TV meglio librerie licenziate o un sound designer (`audio-per-immagine.md`).
- **Come:** prompt con sorgente, azione, spazio e distanza («passi su ghiaia, esterno, vicino, ritmo lento»), durata esatta; generare più varianti; tagliare, misurare, mettere in fase con l'immagine a mano.
- **AI:** valgono i termini del servizio. ElevenLabs Sound Effects (ElevenCreative Terms, Allegato 4, 09/10/2026 [P]): uso consentito anche in film, trailer e pubblicità, commerciale solo con un piano che lo permetta, ma **solo combinato con altro materiale**: vietato vendere o distribuire gli effetti da soli o metterli in una libreria di suoni o campioni. A differenza di ElevenLabs Music, qui film e pubblicità non sono esclusi.
- **Errore comune:** usare un effetto generato come unico layer senza controllo dello spettro (spesso banda limitata o rumore sintetico in coda).

#### Audio nativo dei modelli video (native audio in video generation)
- **Cos'è:** l'audio che modelli come Seedance, Kling, Veo, Wan generano insieme al video (parametro `generate_audio` o `sound` nei modelli Higgsfield, spesso attivo per default [P: model-guide della skill `higgsfield`]).
- **Si sente:** ambiente e azioni plausibili, a volte parlato con sincronismo labiale; qualità da presa di riferimento, non da mix: banda limitata, compressione AAC, livelli casuali.
- **Quando:** clip di prova, riferimento per il sound designer, social veloci; per un film di marca l'audio si rifà o si ricostruisce partendo da quello come guida.
- **Come:** misurare ogni clip prima del montaggio. Misure fatte [M] su clip generati archiviati nello studio (formato così come salvati; non verificato se ricodificati dopo il download): Seedance 2.5 (esempio Higgsfield) AAC **32 kHz**, −26,8 LUFS, nessuna energia sopra 16 kHz; Kling AAC 44,1 kHz a 128 kbps, −30,3 e −29,8 LUFS; Veo AAC 48 kHz, **−44,2 LUFS**. Fra il più forte e il più debole ci sono 17 LU: senza normalizzazione il montaggio salta di volume a ogni stacco. Un'uscita a 32 kHz non contiene nulla sopra 16 kHz (Nyquist): non si recupera alzando la frequenza.
- **AI:** è la voce stessa.
- **Errore comune:** spegnere l'audio in generazione per risparmiare e poi non avere il riferimento per il sound design; usare l'audio nativo come definitivo in uno spot.

#### Rilevamento e dichiarazione di audio AI (AI audio detection, watermarking, disclosure)
- **Cos'è:** tre famiglie di strumenti: **filigrane** inserite dal generatore e lette da un rilevatore dello stesso sistema (SynthID di Google; AudioSeal di Meta, open source con licenza MIT, localizzazione al singolo campione a 16 kHz, robusto a compressione e rumore [P: README]); **classificatori** di un produttore (ElevenLabs AI Speech Classifier: solo voci ElevenLabs, non affidabile sul modello v3, non rileva altri fornitori [P]); **rilevatori di piattaforma** (Deezer dichiara di riconoscere anche Suno e Udio [S: TechCrunch su comunicato Deezer]); più le **credenziali** C2PA nei metadati.
- **Si sente:** —
- **Quando:** prima di usare un audio ricevuto da terzi presentato come «registrato»; quando un contenuto dello studio va dichiarato; quando un cliente chiede se un brano è AI.
- **Come:** 1) leggere i metadati: `ffprobe -show_format -show_streams FILE` e `c2patool FILE`; 2) caricare sul rilevatore del probabile generatore (SynthID Detector per i contenuti Google e partner, che secondo Google comprendono OpenAI, NVIDIA, Kakao e presto Apple [P: deepmind.google]; il classificatore ElevenLabs per le voci ElevenLabs); 3) spettrogramma per artefatti; 4) scrivere il risultato con i suoi limiti. Per la dichiarazione: regole dello studio e AI Act art. 50 in `regole.md` §6; la filigrana del fornitore non basta come dichiarazione (FAQ della Commissione, ivi) e anche ElevenLabs scrive che la sua marcatura non soddisfa gli obblighi di dichiarazione dell'utente [P: Music Terms §3.4]. Su Spotify la dichiarazione passa dai crediti DDEX inviati dal distributore [S].
- **AI:** è la voce stessa.
- **Errore comune:** «nessuna filigrana trovata» letto come «non è AI»; ricodificare o ripulire i metadati e perdere la prova di provenienza (Suno vieta di rimuovere fingerprint e watermark [P]).

Fonti (C, D): README Demucs, basic-pitch, LAION-CLAP, AudioSeal, Beat This! su GitHub [P]; PyPI per versioni e requisiti Python di librosa, demucs, basic-pitch, madmom, pyloudnorm, audio-separator, allin1, msaf [P]; Schreiber, «A Crowdsourced Experiment for Tempo Estimation of Electronic Dance Music», ISMIR 2018 [P]; Korzeniowski & Widmer, «End-to-End Musical Key Estimation Using a Convolutional Neural Network», EUSIPCO 2017, arXiv 1706.02921 [P]; mir_eval `key.weighted_score` [P]; iZotope RX 12 [P]; termini Suno (03/09/2026), ElevenLabs Terms e Music Terms (09/10/2026), Udio (12/11/2025), Stability AI license page [P]; Google DeepMind SynthID, ElevenLabs AI Speech Classifier [P]; schema del tool Higgsfield `generate_audio` e `higgsfield/model-guide.md` [P]; MBW 18/09/2026 su Suno v6 [S]; skill DJ `mir-audio-analysis` e `sampling-and-crate-digging` per i metodi (interne). Tutte lette il 2026-11-09.

## Ricetta: controllare un file audio in 5 minuti

Serve solo ffmpeg (e, facoltativo, `c2patool`). Funziona su WAV, AIFF, FLAC, MP3 e sulla traccia audio di un MP4/MOV. Eseguita su un master di 5'55": **3 secondi** in tutto [M]. Incollare in un terminale zsh o bash, cambiando solo la prima riga.

```bash
F="file.wav"   # <- il file da controllare
echo "== 1. Formato";  ffprobe -v error -show_entries format=format_name,duration:stream=codec_name,sample_rate,channels,channel_layout,bits_per_sample,bits_per_raw_sample -of default=nw=1 "$F"
echo "== 2. Loudness e picchi"; ffmpeg -hide_banner -nostats -i "$F" -vn -af ebur128=peak=sample+true:framelog=quiet -f null - 2>&1 | sed -n '/Summary/,$p' | grep -E "I:|LRA:|Peak:"
echo "== 3. Short-term massimo"; ffmpeg -hide_banner -nostats -i "$F" -vn -af ebur128 -f null - 2>&1 | grep -o "S: *-\?[0-9.]*" | tr -d 'S: ' | sort -g | tail -1 | sed 's/^/S max: /;s/$/ LUFS/'
echo "== 4. Clipping, DC, cresta"; ffmpeg -hide_banner -nostats -i "$F" -vn -af astats=measure_perchannel=none -f null - 2>&1 | grep -E "DC offset|Peak level dB|RMS level dB|Peak count|Flat factor"
echo "== 5. Mono (stesso valore = ok)"; ffmpeg -hide_banner -nostats -i "$F" -vn -af "pan=mono|c0=0.5*c0+0.5*c1,ebur128=framelog=quiet:dualmono=true" -f null - 2>&1 | sed -n '/Summary/,$p' | grep "I:"
echo "== 6. Fase e silenzi"; ffmpeg -hide_banner -nostats -i "$F" -vn -af "aphasemeter=video=0:phasing=1:duration=0.5,silencedetect=n=-60dB:d=0.3" -f null - 2>&1 | grep -E "out_phase|silence_" | head -8
echo "== 7. Banda alta sopra 16 kHz (RMS)"; ffmpeg -hide_banner -nostats -i "$F" -vn -af "highpass=f=16000:poles=2,astats=measure_perchannel=none" -f null - 2>&1 | grep "RMS level dB"
echo "== 8. Spettrogramma"; ffmpeg -hide_banner -loglevel error -y -i "$F" -lavfi "showspectrumpic=s=1600x800:legend=1:scale=log:fscale=log" "${F%.*}_spettro.png" && echo "${F%.*}_spettro.png"
echo "== 9. Metadati e credenziali"; ffprobe -v error -show_entries format_tags -of default=nw=1 "$F"; command -v c2patool >/dev/null && c2patool "$F" 2>&1 | head -3
```

**Come si legge l'output.** Nel blocco 2 la prima riga `Peak:` è il picco di campione (dBFS), la seconda il **true peak** (ffmpeg scrive «dBFS», va letto come dBTP). Nel blocco 5 confrontare il valore con `I:` del blocco 2: uguale = mono perfetto. Nel blocco 6 nessuna riga `out_phase` = nessun tratto in controfase lungo almeno 0,5 s; le righe `silence_start: 0` e `silence_end: X` dicono quanto silenzio c'è in testa. Il blocco 8 crea un PNG: l'agente lo apre con lo strumento di lettura immagini. Sul master di prova, nel PNG si legge l'arrangiamento: la fascia gialla sotto 160 Hz (cassa e sub) sparisce nell'intro, nel break fra circa 193 e 238 s e nel finale [M]. Per un MP4 con più tracce audio aggiungere `-map 0:a:N` dopo `-i "$F"`.

**Rinormalizzare in due passate** (solo parlato, temp track, audio di social; non per masterizzare musica):
```bash
T=-23; TP=-1   # bersaglio: -23/-1 broadcast EU, -14/-1 streaming e social (riferimento di riproduzione, non obbligo)
J=$(ffmpeg -hide_banner -nostats -i "$F" -af loudnorm=I=$T:TP=$TP:LRA=20:print_format=json -f null - 2>&1 | sed -n '/^{/,/^}/p')
v(){ echo "$J" | grep "\"$1\"" | grep -o -- '-\?[0-9.]*' | head -1; }
ffmpeg -hide_banner -nostats -y -i "$F" -af "loudnorm=I=$T:TP=$TP:LRA=20:measured_I=$(v input_i):measured_TP=$(v input_tp):measured_LRA=$(v input_lra):measured_thresh=$(v input_thresh):offset=$(v target_offset):linear=true:print_format=summary" -ar 48000 -c:a pcm_s24le "${F%.*}_norm.wav" 2>&1 | grep -E "Normalization Type|Output Integrated|Output True Peak"
```
Se `Normalization Type` dice `Dynamic`, il file è stato compresso: il guadagno lineare avrebbe superato il true peak, oppure il file ha LRA misurato 0,00 (segnale costante: lì si usa `volume`, vedi Tecniche). Si abbassa il bersaglio o si passa da un limiter nel mix. `LRA=20` evita che il filtro ricada in modo dinamico per colpa del LRA del file. La riga `Output True Peak` in modo lineare è un picco di campione, non il true peak: rimisurare `${F%.*}_norm.wav` con il blocco 2 [M, verifica del 2026-11-09].

| Valore misurato | Cosa significa | Cosa fare |
|---|---|---|
| `sample_rate=44100` per un video o per la TV | il materiale nasce da musica o da un export sbagliato | riesportare a 48 kHz dalla sessione; non ricampionare un mix finito se si può evitare |
| `sample_rate=48000` per CD Baby o per un CD | il distributore lo rifiuta (CD Baby lo cita come errore comune [P]) | export 44,1 kHz / 16 bit con dither dal master a 24 bit |
| `sample_rate=32000` (tipico di alcuni audio nativi AI [M]) | niente sopra 16 kHz, suono «ovattato» | usarlo come guida; rifare o sostituire l'audio |
| `bits_per_sample=16` su un file di lavoro | headroom e risoluzione ridotti per il mix | chiedere il 24 bit (o 32 float) a chi l'ha esportato |
| `channels=1` dove serve stereo, o 6 canali inattesi | consegna sbagliata o downmix mancante | riesportare nel formato della specifica |
| `I:` −23,0 ± 0,2 LUFS su uno spot EU | in specifica EBU R128 / R128 s1 [P] | nulla |
| `I:` fra −24 e −23 su uno spot per l'Italia | Rai chiede −23,0 ±0,2, Publitalia «−24» (vedi `audio-per-immagine.md`) | leggere la specifica scritta della concessionaria; per Rai TV anche true peak ≤ −2 dBTP |
| `I:` più forte di −16 su un parlato per social | sarà abbassato e suonerà schiacciato accanto agli altri | rinormalizzare in due passate; ridurre la compressione |
| `I:` da −8 a −10 su un brano musicale | master «club» forte: in streaming sarà abbassato di 4-6 dB (Spotify riproduce a −14 [P]) | nessun errore se è una scelta; verificare true peak ≤ −2 dBTP come chiede Spotify per i master oltre −14 [P] |
| `S max` oltre −18 LUFS su uno spot a −23 | supera il limite EBU R128 s1 per i contenuti brevi [P] | ridurre i picchi di loudness (compressione o automazione nel mix) |
| true peak sopra −1 dBTP (broadcast) o sopra 0 | picchi inter-campione; distorsione dopo la codifica | limiter true peak a −1 dBTP (−2 per master forti destinati allo streaming); rimisurare |
| true peak molto più alto del picco di campione (oltre ~0,5 dB) | il limiter lavora sui campioni, non sul segnale ricostruito | attivare il true peak nel limiter o abbassare il ceiling |
| `Peak level dB` ≈ 0 e `Peak count` alto, `Flat factor` > 0 | clipping o limiter a fondo scala | rifare il limiter con ceiling più basso; se il clip è nella sorgente, De-clip in RX |
| differenza `Peak level dB` − `RMS level dB` sotto ~8 dB | fattore di cresta basso: materiale molto compresso (soglia di partenza, da confrontare con un riferimento del genere) | se non è voluto, ridurre limiter e compressione; confrontare a loudness uguale |
| `LRA` sotto 3 LU su un film o un documentario | dinamica schiacciata, affaticante | chiedere al mixer più respiro (e rispettare la specifica del destinatario) |
| `LRA` sopra 15-20 LU su un contenuto per smartphone | i passaggi deboli spariscono nel rumore di fondo | ridurre la dinamica per la versione mobile |
| `DC offset` sopra ~0,001 in valore assoluto | spostamento in continua, **oppure** energia sotto 10 Hz (rumore rosa di prova senza offset: −0,0013; dopo `highpass=f=10`: −0,000005 [M]) | rimisurare con `highpass=f=10,astats`: se resta, filtro passa-alto a 10-20 Hz o correzione DC in RX |
| mono più basso dello stereo di oltre 1-1,5 LU | parti in controfase che spariscono in mono | ascoltare in mono, cercare allargatori, doppie riprese, stem AI; correggere la fase |
| mono a −70 LUFS | un canale è invertito | invertire la polarità di un canale e rimisurare |
| righe `out_phase_start` | tratti in controfase lunghi | ascoltare quei punti; correggere nel mix |
| `silence_start: 0` con durata oltre la specifica | silenzio in testa: il file «parte tardi» | rifilare o rispettare il pre-roll della specifica |
| silenzio in coda nullo | la coda del riverbero o del suono è tagliata | riesportare con coda |
| `RMS level dB` sopra 16 kHz a −inf o sotto −85 dB su musica | banda limitata: file a 32 kHz o meno (generato o ricampionato) | chiedere la sorgente lossless; per un AI, rigenerare o sostituire |
| blocco 7 «normale» ma il file è sospetto | il filtro a 2 poli non vede il taglio di un MP3/AAC a 128 kbps (taglio a ~17 kHz: solo 5-6 dB in meno rispetto al WAV [M]) | spettrogramma con `fscale=lin` al posto di `fscale=log` nel blocco 8: il taglio netto si vede come banda nera sopra 16-17 kHz [M] |
| `encoder=Lavf…` o un encoder diverso da quello atteso | il file è stato riconvertito | chiedere l'export originale |
| `c2patool`: «No claim found» | nessuna credenziale C2PA (normale per un WAV di studio; per un output AI vuol dire che la provenienza si è persa o non c'era) | per un asset AI: recuperare il file originale dal servizio con l'ID del job |

Fonti: comandi eseguiti il 2026-11-09 con ffmpeg 9.0.1 su segnali di prova e su un master [M]; soglie da EBU R 128-2023 e R 128 s1-2020, pagina Spotify for Artists «Loudness normalization», CD Baby Help Center «How do I upload my audio?» [P, letti 2026-11-09]; soglie indicate «di partenza» o «~» sono pratica di mestiere, non norme.

## Numeri di riferimento

Le specifiche di consegna per spot, film e piattaforme video (Netflix, broadcaster, social) sono in `audio-per-immagine.md`; i riferimenti di mastering per lo streaming musicale in `mix-mastering.md`. Qui ci sono i numeri che servono a **misurare** e a **controllare**.

**Come funziona la misura**

| Grandezza | Valore | Fonte | Letto |
|---|---|---|---|
| Finestra momentaneo / short-term | 0,4 s / 3 s, rettangolari scorrevoli; short-term non gated; aggiornamento ≥ 10 Hz | [P] EBU Tech 3341 (V3, 2016) | 2026-11-09 |
| Gate del loudness integrato | blocchi di 400 ms sovrapposti al 75%; soglia assoluta −70 LKFS; relativa −10 LU (era −8 fino ad agosto 2011) | [P] ITU-R BS.1770-5 (11/2023); storia in EBU R 128-2023 | 2026-11-09 |
| Loudness range (LRA) | differenza fra 10° e 95° percentile della distribuzione short-term; gate relativo −20 LU, assoluto −70 LUFS; sconsigliato sotto 1 minuto | [P] EBU Tech 3342; R 128-2023 nota 2 | 2026-11-09 |
| True peak | sovracampionamento 4× (da 48 a 192 kHz) | [P] ITU-R BS.1770-5, Allegato 2 | 2026-11-09 |
| Scala predefinita di un meter «EBU Mode» | EBU +9: da −18 a +9 LU (−41 a −14 LUFS); opzionale +18 | [P] EBU Tech 3341 §2.7 | 2026-11-09 |
| LUFS e LKFS | stessa unità | [P] EBU R 128-2023, nota 1 | 2026-11-09 |
| Calibrazione | seno 1 kHz stereo a −41,1 dBFS per canale → −41,1 LUFS con ffmpeg e pyloudnorm | [M] | 2026-11-09 |

**Riferimenti di loudness da controllare**

| Destinazione | Integrato | Altri limiti | Tolleranza | Fonte | Letto |
|---|---|---|---|---|---|
| Programmi TV/radio (EBU) | −23,0 LUFS | true peak ≤ −1 dBTP (in produzione) | ±1,0 LU solo dove non praticabile (dirette); ±0,2 LU per errori di misura nel QC; true peak ±0,3 dB | [P] EBU R 128-2023 | 2026-11-09 |
| Spot e promo (EBU) | −23,0 LUFS | short-term max −18,0 LUFS; true peak −1 dBTP; LRA non si usa | ±0,2 LU (QC), +0,2 LU sullo short-term | [P] EBU R 128 s1-2020 | 2026-11-09 |
| Pubblicità TV in Italia (norma) | nessun valore assoluto: infrazione se almeno l'8% di 50 spot consecutivi supera di oltre 1,0 LU il livello ordinario del canale (5 giorni); gate a −8 LU dal livello non gated, non il −10 LU di BS.1770. Testo completo, TUSMA art. 44 e delibera 34/09/CSP in `audio-per-immagine.md` | — | — | [P] AGCOM, delibera 219/09/CSP, Allegato A, punti 4-11 (PDF riletto con PDFKit nella verifica) | 2026-11-09 |
| Pubblicità TV in Italia (specifiche delle concessionarie) | Rai −23,0 LUFS, short-term max −18, true peak −2 dBTP; Publitalia «EBU di −24»: valori, fonti e date in `audio-per-immagine.md` (Numeri, tabella delle consegne) | — | — | [P]/[S] come indicato lì | 2026-11-09 |
| Spotify e altre piattaforme musicali (riproduzione, non consegna) | Spotify −14 LUFS; valori e regole di tutte le piattaforme nella tabella «Normalizzazione delle piattaforme» di `mix-mastering.md` | true peak ≤ −1 dBTP (≤ −2 se più forte di −14) | — | [P] Spotify for Artists, «Loudness normalization» | 2026-11-09 |

**Formati richiesti dai distributori musicali**

| Distributore | Formato | Note | Fonte | Letto |
|---|---|---|---|---|
| DistroKid | WAV, MP3, M4A, FLAC, AIFF, WMA; «16-bit, 44.1 kHz WAV is typical, but pretty much any specification works» | max 1 GB per file (altrimenti FLAC); traccia < 5 ore, album < 10 ore, durata media dei brani ≥ 60 s | [P] DistroKid Help Center, «What Audio File Formats Can I Upload?» (aperto in Chrome) | 2026-11-09 |
| CD Baby | WAV o FLAC (MP3 accettato, sconsigliato), **stereo, 44,1 kHz, 16 bit**; nomi file solo lettere, numeri, `-` e `_` | 24 bit / 48 kHz va convertito a 16 / 44,1 | [P] CD Baby Help Center, «How do I upload my audio?» | 2026-11-09 |
| The Orchard | WAV o FLAC; 16 bit a 44,1 o 48 kHz; 24 bit da 44,1 a 192 kHz; niente bit diversi nella stessa uscita | consente Apple Lossless .m4a per caricare più in fretta | [S] Help Center Orchard citato da ricerca web; **da verificare** (metodi provati: curl, jina, Chrome nelle due verifiche: la pagina chiede il login; Wayback senza copie). L'indice di ricerca della pagina ufficiale riporta gli stessi valori | 2026-11-09 |

**Precisione degli algoritmi di analisi**

| Compito | Risultato | Condizioni | Fonte | Letto |
|---|---|---|---|---|
| Tempo, musica elettronica | migliori risultati riportati: Accuracy1 77,0% (NI Traktor Pro 2, con intervallo 88-175 BPM imposto); Accuracy2 90,2% (CrossDJ, 75-150) | GiantSteps Tempo; Accuracy1 = entro il 4%; Accuracy2 = perdona errori ×2, ×3, ×½, ×⅓ | [P] Schreiber, ISMIR 2018 | 2026-11-09 |
| Tempo, sistema accademico (Böck) | Accuracy1 58,9% → 64,8%; Accuracy2 86,4% → 94,0% passando dalle etichette originali a quelle corrette dal crowdsourcing | stesso dataset | [P] ibid. | 2026-11-09 |
| Accordo fra annotazioni umane | 81,5% (Accuracy1), 91,1% (Accuracy2) fra etichette originali e nuove | anche la «verità» è incerta | [P] ibid. | 2026-11-09 |
| Tonalità, musica elettronica | migliore: punteggio pesato 74,3, esatte 67,9%; profilo EDMA (presente in essentia) 65,6 / 57,8%; QM 50,4 / 39,6% | GiantSteps Key, 604 estratti di 2 minuti | [P] Korzeniowski & Widmer, EUSIPCO 2017 | 2026-11-09 |
| Tonalità, effetto del genere | stesso modello addestrato su pop/rock e provato su elettronica: 57,3 invece di 74,3 | — | [P] ibid. | 2026-11-09 |
| Pesi del punteggio MIREX | esatta 1; quinta sopra 0,5 (anche sotto solo con `allow_descending_fifths`); relativa 0,3; parallela 0,2; altro 0 | — | [P] mir_eval `key.weighted_score` | 2026-11-09 |
| Separazione, Demucs v4 | SDR 9,00 dB (`htdemucs`); 9,20 dB con fine-tuning per sorgente | MUSDB HQ test set | [P] README Demucs | 2026-11-09 |

**Tempi di calcolo su Apple Silicon** (Mac mini M4 Pro, macOS 26.6; brano stereo 44,1 kHz / 24 bit di 5'55")

| Operazione | Tempo | Fonte |
|---|---|---|
| Loudness integrato + LRA + true peak (ffmpeg `ebur128`) | 1,1 s | [M] |
| Ricetta QC completa (9 controlli + spettrogramma) | 3,1 s | [M] |
| loudnorm, passata di misura su 33,5 s | 0,65 s | [M] |
| Tempo + 4 stime di tonalità (essentia) + tempo (librosa), caricamento compreso | 7,4 s | [M] |
| Separazione Demucs `htdemucs` su GPU (`-d mps`) | 13,7 s | [M] |
| Separazione Demucs `htdemucs` su CPU | 68 s | [M] |
| Trascrizione basic-pitch del basso separato (CoreML) | 5,4 s | [M] |
| Riferimento del produttore: Demucs su CPU | «circa 1,5 volte la durata del brano» | [P] README Demucs (dato su hardware non specificato) |

**Audio nativo dei modelli video** (clip archiviati nella cartella dei film del sito, misurati così come sono; non verificato se ricodificati dopo il download)

| Clip | Formato audio | Loudness integrato | Picco di campione | Sopra 16 kHz | Fonte |
|---|---|---|---|---|---|
| Seedance 2.5 (esempio Higgsfield, 15 s) | AAC 32 kHz, 270 kbps | −26,8 LUFS | −7,3 dBFS | nulla (−inf) | [M] |
| Kling (8 s) | AAC 44,1 kHz, 128 kbps | −30,3 LUFS | −14,8 dBFS | −90 dB | [M] |
| Kling (5 s) | AAC 44,1 kHz, 128 kbps | −29,8 LUFS | −4,9 dBFS | −85 dB | [M] |
| Veo (8 s) | AAC 48 kHz, 256 kbps | −44,2 LUFS | −28,8 dBFS | −78 dB | [M] |

**Generatori audio AI: cosa permettono i termini** (letti il 2026-11-09; rileggere prima di ogni lavoro)

| Servizio | Proprietà dell'output | Uso commerciale | Limiti che contano per {{STUDIO}} | Fonte |
|---|---|---|---|---|
| Suno (termini dal 03/09/2026) | con Pro/Premier Suno cede i suoi diritti; nessuna garanzia che esista un copyright | solo con Pro/Premier e solo per brani scaricati entro le quote del piano (Pro 20, Premier 60 download al mese); free/Basic: personale, non commerciale | vietato rimuovere fingerprint/watermark/metadati per nascondere provenienza o piano; vietato registrare o fare stream ripping; Remix fra utenti: opera comune, non commerciali; nessuna garanzia di non violazione; causa UMG e Sony in corso (vedi Novità) | [P] suno.com/terms e /pricing |
| ElevenLabs Music (Music Terms 09/10/2026) | all'utente, secondo il contratto di base | Free: niente download, attribuzione obbligatoria; Starter e oltre: online e offline **tranne film, TV, radio e videogiochi «Studio»**, consentiti solo con Enterprise Music | streaming musicale da Creator in su; WAV lossless da Pro in su; Starter/Creator/Pro solo uso individuale, Scale < 10 dipendenti, Business < 50; vietati nel prompt nomi di artisti, autori, titoli, etichette, testi | [P] elevenlabs.io/music-terms |
| ElevenLabs (voce, clonazione; Terms 09/10/2026) | all'utente («you retain all rights in and to your Output») | utenti free: solo non commerciale; utenti a pagamento: commerciale | clonazione: licenza perpetua e irrevocabile a ElevenLabs su registrazioni e modello della voce per migliorare e sviluppare servizi; consensi conservati 5 anni; Dubbing v2 escluso da film, TV e streaming senza autorizzazione scritta; vale la Prohibited Use Policy | [P] elevenlabs.io/terms-of-use, /creative-terms |
| ElevenLabs Sound Effects (ElevenCreative Terms 09/10/2026) | come sopra | con piano commerciale, anche in film, trailer, pubblicità | solo combinati con altro materiale; vietate la vendita singola e le librerie di suoni | [P] elevenlabs.io/creative-terms, Allegato 4 |
| Udio (termini 12/11/2025) | di Udio e dei suoi licenzianti | vietato | vietato scaricare e pubblicare su YouTube, Spotify, Instagram, TikTok e simili; ammessi solo link condivisi su canali approvati da Udio | [P] udio.com/terms-of-service |
| Stable Audio 3.0 (Stability AI) | app: Stability cede i suoi diritti «se ce ne sono» (ToS 31/07/2025) | modelli in locale: licenza Community gratuita sotto 1 M$ di ricavi annui, con registrazione per l'uso commerciale; Enterprise sopra | addestrato su dati «fully licensed» secondo il produttore; indennizzo legale solo in Enterprise; app: input e output usati per l'addestramento salvo opt-out | [P] stability.ai/license, /community-license-agreement, /stable-audio, /terms-of-use |
| Higgsfield `generate_audio` (Terms 23/10/2026) | Higgsfield non rivendica l'output; trasferibile ai clienti | non limitato da Higgsfield | input e output usati per addestrare salvo Enterprise; nessuna verifica dei diritti; valgono anche le politiche d'uso del fornitore del modello (prevale la più restrittiva); vietato presentare l'output come umano o togliere le marcature di provenienza. Modelli: `seed_audio`, `text2speech_v2` (varianti ElevenLabs, MiniMax e altre), `mirelo_text_to_audio`, `suno_music` 15-360 s se nel catalogo; `sonilo_music` e `inworld_text_to_speech` solo per la pipeline giochi | [P] higgsfield.ai/terms; schema del tool |

**Pipeline: versioni** (PyPI, letto 2026-11-09)

| Pacchetto | Versione | Data | Python | Nota |
|---|---|---|---|---|
| librosa | 1.0.0 | 11/08/2026 | ≥ 3.12 | la 0.10.2 gira su 3.11 [M] |
| essentia | 2.1b6.dev1438 | 19/05/2026 | — | — |
| demucs | 4.1.0 | 11/07/2026 | ≥ 3.10 | dal fork adefossez («officially maintained»); repo Meta archiviato |
| basic-pitch | 0.4.0 | 16/08/2024 | fino a 3.11 dichiarato; README: Apple Silicon solo 3.10 | gira su 3.11 con CoreML [M] |
| madmom | 0.16.1 | 14/11/2018 | 3.5-3.7 dichiarati | installare da GitHub (ultimo commit sul ramo principale 25/08/2024; push 20/03/2026) |
| pyloudnorm | 0.2.0 | 04/01/2026 | ≥ 3.9 | niente true peak |
| audio-separator (modelli UVR) | 0.48.0 | 29/10/2026 | ≥ 3.10 | — |
| beat-this | 1.1.0 | 14/04/2026 | — | richiede PyTorch ≥ 2.0 |

Fonti: tutte nelle righe; [M] = misure del 2026-11-09 descritte in Tecniche.

## Errori che si sentono

- **Lo spot «salta fuori» dal blocco pubblicitario** → short-term massimo sopra −18 LUFS anche con integrato a −23 → misurare lo short-term massimo (Ricetta, blocco 3) e chiedere al mixer di contenere i picchi di loudness, non solo l'integrato.
- **Il brano distorce su Spotify o su Instagram ma non nel WAV** → true peak sopra −1 dBTP, picchi inter-campione che la codifica lossy amplifica → limiter con rilevamento true peak, ceiling −1 dBTP (−2 per master forti), rimisurare dopo l'export.
- **La voce sparisce dalla cassa Bluetooth all'evento** → somma mono più bassa dello stereo di oltre 1-1,5 LU o tratti `out_phase` → ascolto in mono, correzione della fase nel mix; per gli stem separati o generati, controllare la fase prima di usarli.
- **Il file «WAV» suona ovattato** → nessuna energia sopra 16 kHz nello spettrogramma: è un MP3/AAC convertito o un audio generato a 32 kHz → chiedere la sorgente lossless; non accettare un WAV ricavato da un MP3.
- **Il montaggio salta di volume a ogni stacco fra clip AI** → audio nativo dei modelli fra −27 e −44 LUFS [M] → normalizzare ogni clip in due passate prima del montaggio, poi mixare.
- **Il parlato generato o restaurato suona metallico, «sott'acqua»** → de-noise o isolamento troppo aggressivi, o voce sintetica spinta oltre la frase breve → passate leggere, confronto a loudness uguale con l'originale, generare frase per frase.
- **Lo stem separato «respira» e ha piatti nella voce** → limite della separazione (SDR circa 9 dB in media per Demucs v4) → usarlo filtrato e mescolato, non nudo; per un remix serio chiedere i multitraccia originali al titolare.
- **I tagli del video cadono in levare** → BPM stimato a metà o al doppio, o griglia non allineata al primo battito → controllare l'alternativa ×2/×½ e allineare alla prima battuta reale (lo scouting dell'attività DJ àncora la griglia al primo onset, non al campione zero).
- **Il topliner canta stonato sulla base di libreria** → tonalità sbagliata di una quinta o scambiata con la relativa → confrontare più profili, verificare sul basso separato, chiedere conferma a un musicista.
- **Il cliente sente «più potente» la versione sbagliata** → confronto fatto senza parità di loudness → portare le versioni allo stesso LUFS prima di ogni A/B, anche con il cliente in sala.
- **Il loudness normalizzato con ffmpeg ha perso la dinamica** → `loudnorm` in una sola passata (modo dinamico) o seconda passata ricaduta in `dynamic` → due passate e controllo di `Normalization Type: Linear`.
- **Il distributore rifiuta il master** → 24 bit / 48 kHz consegnato a chi vuole 16 / 44,1 (CD Baby), o nomi file con caratteri non ammessi → leggere la pagina del distributore, export dedicato con dither.
- **Il brano AI pubblicato viene contestato o rimosso** → generato con un piano non commerciale, o con ElevenLabs Music non Enterprise in TV/radio, o con Udio (download e pubblicazione vietati) → controllare i termini per l'uso finale prima di generare; registro di provenienza in `rights/`.
- **Un audio «autentico» ricevuto da terzi è un deepfake** → nessun rilevatore copre tutti i generatori; un classificatore negativo non prova nulla → metadati, credenziali, rilevatore del probabile generatore, spettrogramma, catena di custodia; nel dubbio non si usa (`regole.md` §3).

Fonti: sintesi delle Tecniche e dei Numeri sopra, con le stesse fonti [P]/[M].

## Novità

1. **2025-10-29 — Universal chiude la causa con Udio.** Accordo per una piattaforma con licenza da lanciare nel 2026; nel frattempo il servizio resta in un «walled garden» con fingerprinting e filtri, e i download sono spenti. I termini Udio del 12/11/2025 vietano download e pubblicazione [P: udio.com]; l'accordo (transazione con risarcimento, licenze su registrazioni ed edizioni, nuova piattaforma in abbonamento addestrata solo su musica autorizzata, prodotto attuale in «walled garden» con fingerprinting e filtri) [P: comunicato UMG, universalmusic.com, 29/10/2025]. A ottobre 2026 la nuova piattaforma risulta non ancora lanciata [S: ricerca web, fonti non primarie].
2. **2025-11 — Warner chiude con Udio (19/11/2025) e con Suno (25/11/2025).** Con Suno: transazione, modelli con licenza nel 2026 che sostituiscono i vecchi, download solo con account a pagamento e con tetti mensili, opt-in di artisti e autori per nome, voce e composizioni; Suno acquista Songkick [P: comunicati WMG, wmg.com e PDF su investor relations].
3. **2025-11-11 — GEMA contro OpenAI, Tribunale di Monaco I (42 O 14139/24):** testi di nove autori tedeschi memorizzati nei modelli GPT-4 e 4o e riprodotti negli output: violazione del diritto di riproduzione, non coperta dall'eccezione di text and data mining; responsabile OpenAI, non l'utente; inibitoria, rendiconto e danni [P: comunicato stampa del Landgericht München I, n. 11/2025]. OpenAI ha fatto appello all'Oberlandesgericht di Monaco [P: comunicato GEMA, 31/07/2026].
4. **2026-04-16 — Spotify avvia in beta i crediti AI** basati sullo standard DDEX (dichiarazione dell'uso di AI in voce, scrittura, produzione, mix, mastering), dopo la politica del settembre 2025 su cloni vocali e spam [S: Music Week, TechCrunch]. Apple avrebbe reso obbligatori dei «Transparency Tags» in consegna dal 04/03/2026 [S: una sola fonte secondaria, **da verificare**].
5. **2026-07-21 — Deezer: oltre il 50% dei brani caricati ogni giorno è interamente generato con AI** (picco di giugno 2026, media di circa 90.000 al giorno); Deezer annuncia la rimozione dei brani AI usati per stream fraudolenti e di quelli non ascoltati da almeno 6 mesi [P: newsroom Deezer]. Nel 2025 i brani AI erano il 10% dei caricamenti a gennaio e il 28% a settembre [S: TechCrunch].
6. **2026-07-31 — GEMA contro Suno, Tribunale di Monaco I (42 O 763/25):** prima sentenza europea su un generatore musicale. Violano il diritto d'autore l'addestramento negli USA (anche secondo la legge USA serviva una licenza GEMA), la memorizzazione nel modello e la riproduzione negli output di sei composizioni («Forever Young», «Atemlos», «Mambo No. 5», «Rasputin», «Big in Japan», «Daddy Cool») [P: comunicato GEMA, gema.de, 31/07/2026]; Suno risponde degli output, non gli utenti; obbligo di rendiconto e danni; non definitiva, appellabile all'OLG di Monaco [S: Bird & Bird, Bristows, LTO; sentenza e comunicato del tribunale non letti].
7. **2026-08 — Spotify etichetta gli «AI Persona»:** i profili ritenuti identità generate con AI vengono esclusi dalle raccomandazioni algoritmiche ed editoriali, da metà settembre [S: NPR, 13/08/2026].
8. **2026-09-03 — Nuovi termini Suno:** uso commerciale legato ai download entro le quote del piano; divieto di rimuovere fingerprint e watermark che Suno può aggiungere per indicare piano e stato del download [P: suno.com/terms].
9. **2026-09-09 — Suno v6**, presentata come addestrata da zero con Warner, BMG e Believe e senza dati Universal o Sony [S: MBW].
10. **2026-09-18 — Universal e Sony fanno una seconda causa a Suno** (tribunale federale di Boston, 60.202 registrazioni): sostengono che v6 «ricicla» l'infrazione perché addestrata sugli output dei modelli precedenti («model laundering»), più l'aggiramento delle protezioni di YouTube [S: MBW 18/09/2026, Variety, Boston.com 27/09/2026; atto di citazione non letto]. La prima causa di UMG e Sony (giugno 2024, stesso tribunale) è ancora in corso [S: ibid.]. Sony ha anche una seconda causa contro Udio (luglio 2026) [S: ricerca web su Variety, articolo non aperto per paywall]. Il 06/11/2026 nuove cause contro Suno dai titolari dei diritti di Elvis Presley e da Eight Mile Style [S: una fonte di stampa, **da verificare**].
11. **2026-10-09 — ElevenLabs aggiorna Terms e Music Terms:** tabella dei diritti per piano; film, TV e radio solo con Enterprise Music; divieto di nomi di artisti e titoli nei prompt; la marcatura di ElevenLabs non sostituisce gli obblighi di dichiarazione dell'utente [P].
12. **Strumenti 2025-2026:** iZotope RX 12 con Scene Rebalance, Stems View e Trim Silence [P]; Stable Audio 3.0 con dati dichiarati licenziati e pesi aperti [P]; librosa 1.0 (11/08/2026, Python ≥ 3.12) [P]; Demucs passa al fork di Alexandre Défossez, versione 4.1.0 (11/07/2026) [P]; SynthID Detector aperto a tutti, con contenuti di Google e partner (OpenAI, NVIDIA, Kakao, «presto Apple») [P: deepmind.google, data dell'apertura non indicata].

Fonti: indicate in ogni punto; [S] = stampa di settore o studi legali, non sentenza, comunicato o termini originali.

## Verifica del 2026-11-09

- **[P] letti alla fonte:** ITU-R BS.1770-5; EBU R 128-2023, R 128 s1-2020, Tech 3341, Tech 3342 (PDF, PDFKit); AGCOM 219/09/CSP Allegato A; documentazione ffmpeg; Spotify for Artists; DistroKid (Chrome) e CD Baby; termini Suno, Udio, ElevenLabs (Terms e Music Terms), Stability; schema `generate_audio`; README Demucs, basic-pitch, pyloudnorm, LAION-CLAP, AudioSeal, Beat This!; PyPI; Schreiber 2018 e Korzeniowski & Widmer 2017; mir_eval; pagine RX 12, Insight 2, VisLM, Youlean, Sonic Visualiser, SynthID, classificatore ElevenLabs; comunicato Deezer.
- **[M] misurato:** tutti i comandi della Ricetta, le prove su segnali di sintesi e su un master, i tempi su M4 Pro, l'audio nativo di 4 clip AI.
- **Correzioni rispetto alle skill DJ:** il vincolo «Python 3.11» non regge più per librosa 1.0 (≥ 3.12); madmom va installato da GitHub; Demucs non è più mantenuto da Meta (fork); il decimale del BPM di librosa è un gradino della risoluzione, non una misura; i meter della DAW non sono LUFS (già detto dalla skill DJ, confermato); pyloudnorm non misura il true peak.
- **Aperto:** The Orchard (help center dietro login); prassi italiana −24 LUFS (nessuna specifica di emittente letta); cause Suno/Udio solo da stampa (MBW, Bird & Bird; Variety bloccata da paywall), sentenza GEMA non letta in originale; Apple Transparency Tags; termini di ElevenLabs Sound Effects e della clonazione vocale nel dettaglio; Cedar, Baton, Vidchecker non aperti; qualità dei separatori UVR/Roformer e dei servizi commerciali (nessun benchmark primario letto); `uvx demucs` non riprovato.

**Verifica indipendente (2026-11-09).** Ricetta e due passate rieseguite così come scritte, in zsh e bash, su segnali `lavfi` (seno, rumore rosa, silenzio in testa, clipping, canale invertito, MP4 con due tracce, MP3): tutti i comandi funzionano e la tabella corrisponde. Corretti: (1) `loudnorm` ricade in `Dynamic` anche con LRA misurato 0,00 (sorgente `af_loudnorm.c`) e il suo «Output True Peak» in lineare è un picco di campione (−22,1 contro −19,2 dBTP veri) [M]; (2) il blocco 7 non vede MP3/AAC a 128 kbps: serve `fscale=lin`; (3) DC offset ~0,001 è un falso allarme sul materiale ricco di infrasuoni; (4) Suno: quote 20/60 download, Remix comuni e non commerciali; ElevenLabs: licenza perpetua sulle voci clonate, Sound Effects ammessi in film e pubblicità solo combinati, Dubbing v2 escluso da film e TV; Higgsfield: Terms 23/10/2026 letti, «termini del modello a valle» ridotto a ciò che dicono (politiche d'uso); Stable Audio: app separata dalla licenza dei modelli; (5) madmom: ultimo commit 2024, non «attivo»; Demucs Meta archiviato. Promossi a [P]: UMG-Udio, WMG-Udio e WMG-Suno (comunicati), GEMA-OpenAI (comunicato del tribunale), GEMA-Suno (comunicato GEMA). Riletti e confermati: R 128 e s1, AGCOM 219/09, termini ElevenLabs/Suno/Udio/Stability, PyPI, README Demucs/pyloudnorm/basic-pitch, Schreiber 2018, Korzeniowski 2017, mir_eval, CD Baby, DistroKid. AGCOM e specifiche Rai/Publitalia ridotte a rimando verso `audio-per-immagine.md`. Restano aperti: The Orchard (login), sentenza GEMA-Suno e citazione UMG/Sony-Suno 2026 non lette, Apple Transparency Tags, cause Elvis/Eight Mile Style.

### Suno (account dello studio)

{{TITOLARE}} ha un piano annuale Suno (2026-11-09). Solo web, nessuna API pubblica: non si collega come strumento, si usa a mano dal browser. Prima di ogni uso per un cliente verificare i termini correnti sui diritti commerciali del piano.
