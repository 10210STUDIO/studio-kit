# Mix e mastering

Copre il mestiere di chi porta le tracce registrate a un mix finito (stereo e Dolby Atmos) e il mix a un master pronto per streaming, CD e vinile: ruoli, tecniche con valori di partenza, specifiche di consegna delle piattaforme, plugin e hardware di riferimento. Serve a chi in {{STUDIO}} briefa un mixer o un mastering engineer, e a chi controlla in casa il loudness e il formato di un deliverable musicale.
Non copre la registrazione e la voce (`registrazione.md`), il loudness per TV, cinema e spot in broadcast (EBU R 128 a −23 LUFS è solo citata qui: il dettaglio sta in `audio-per-immagine.md`), l'industria discografica e le etichette (`atlante-culturale/references/industria-musicale.md`), i diritti sulle voci e sugli output AI (`atlante-culturale/references/regole.md` §3 e §6).
Letto e redatto il 2026-11-09. Scadenza di revisione: 2027-02-07 (90 giorni), prima per le specifiche delle piattaforme.

**Legenda della provenienza.** [P] = norma o documentazione del produttore/piattaforma letta il 2026-11-09 (ITU, EBU, AES, Apple, Spotify, Dolby, IFPI, DCA, manuali di UA, Manley, SSL, pagine di FabFilter, oeksound, iZotope, LANDR). [S] = secondaria (Sound On Sound, stampa di settore, blog di vendor, estratti di ricerca), citata ma non confermata su fonte primaria. **std** = pratica di mestiere consolidata scritta senza una fonte aperta in questa sessione: è un **valore di partenza**, non una regola, e va giudicato a orecchio. **da verificare** = non letto su fonte primaria; non usarlo in un preventivo o in una promessa al cliente.

---

## Lessico

- **Mix** (mix, mixdown): la combinazione delle tracce di un brano in un file stereo (o immersivo), con livelli, panorama, EQ, dinamica ed effetti decisi.
- **Mastering** (mastering): l'ultimo passaggio sul mix finito: equilibrio tonale, dinamica, loudness, sequenza dell'album, metadati e formati di consegna.
- **Stem** (stem): sottomix di un gruppo di tracce (batteria, basso, voci, musica, FX) esportato allineato dall'inizio del brano; sommati, devono restituire il mix.
- **Multitraccia** (multitrack): tutte le tracce singole della sessione, prima del raggruppamento in stem.
- **Gain staging** (gain staging): la gestione del livello a ogni stadio della catena, per avere margine e far lavorare i processori nella zona prevista.
- **dBFS** (decibel relative to full scale): livello digitale riferito al fondo scala; 0 dBFS è il massimo campione rappresentabile.
- **Picco reale** (true peak, dBTP): il picco del segnale ricostruito fra i campioni, misurato con sovracampionamento (ITU-R BS.1770); può superare il picco dei campioni.
- **Picco intercampione** (inter-sample peak): il superamento di 0 dBFS che avviene fra due campioni nella conversione in analogico o nella codifica lossy.
- **LUFS / LKFS** (Loudness Units relative to Full Scale): unità di loudness ponderata K secondo ITU-R BS.1770; i due nomi sono equivalenti (EBU R 128 [P]).
- **LU** (Loudness Unit): differenza di loudness; 1 LU = 1 dB.
- **Loudness integrato** (integrated loudness): il loudness dell'intero brano, con gate assoluto a −70 LUFS e relativo a −10 LU (EBU Tech 3341 [P]).
- **Loudness a breve termine** (short-term loudness): finestra mobile di 3 s, senza gate (EBU Tech 3341 [P]).
- **Loudness momentaneo** (momentary loudness): finestra mobile di 0,4 s, senza gate (EBU Tech 3341 [P]).
- **LRA** (Loudness Range): distanza in LU fra il 10° e il 95° percentile della distribuzione dei valori a breve termine, con gate relativo a −20 LU (EBU Tech 3342 [P]).
- **Fattore di cresta** (crest factor, PLR): differenza fra picco e livello medio (RMS o loudness); più basso = più compresso.
- **Normalizzazione del loudness** (loudness normalization): la piattaforma alza o abbassa il volume di riproduzione per portare ogni brano o album a un livello di riferimento; non modifica il file.
- **Normalizzazione per album / per brano** (album / track normalization): un guadagno unico per tutto l'album, che conserva le differenze fra i brani, oppure un guadagno per ogni brano.
- **Headroom** (headroom): margine fra il livello di lavoro e il fondo scala.
- **Limitatore a picco reale** (true peak limiter): limitatore che misura e contiene i picchi fra i campioni, con sovracampionamento.
- **Mascheramento** (masking): un suono più forte nella stessa banda rende meno udibile un altro.
- **Sidechain** (sidechain, key input): il segnale che comanda un processore di dinamica diverso da quello che esso elabora (es. la cassa che abbassa il basso).
- **Mid/Side** (M/S): codifica dello stereo in somma (Mid = L+R) e differenza (Side = L−R), per trattarle separatamente.
- **Compatibilità mono** (mono compatibility): tenuta del mix quando L e R vengono sommati (telefono, altoparlanti smart, alcuni impianti).
- **Riduzione di guadagno** (gain reduction, GR): quanti dB toglie un compressore o un limitatore in un dato istante.
- **Reference** (reference track): brano commerciale usato come confronto, ascoltato allo stesso loudness del mix.
- **Recall** (recall): ripristino esatto di una sessione o di un'impostazione hardware per una revisione.
- **Print** (print): il file stampato di un mix o di una versione (main, strumentale, a cappella, TV mix).
- **Bed** (bed): in Dolby Atmos, i canali fissi legati agli altoparlanti (fino a 7.1.2).
- **Oggetto** (object): in Dolby Atmos, una traccia mono o stereo con metadati di posizione 3D, resa dal renderer sull'impianto disponibile.
- **ADM BWF** (Audio Definition Model Broadcast Wave Format): il file master Dolby Atmos con audio e metadati, richiesto da Apple Music [P].
- **Binaurale** (binaural render): la resa per cuffia del mix immersivo.
- **ISRC** (International Standard Recording Code): codice di 12 caratteri che identifica una registrazione, non la composizione né il prodotto (IFPI [P]).
- **UPC/EAN** (barcode): codice del prodotto (l'album), distinto dall'ISRC.
- **DDP** (Disc Description Protocol): il formato con cui si consegna il master di un CD alla fabbrica (DCA; per CD la versione corrente è DDP 2.0 [P]).
- **PQ** (PQ subcode): i dati del CD che indicano inizio dei brani, pause, ISRC e codice a barre.
- **Lacca** (lacquer): disco d'alluminio laccato inciso dal tornio, da cui si fa la galvanica per le matrici del vinile.
- **DMM** (Direct Metal Mastering): incisione diretta su rame invece che su lacca.
- **Filtro ellittico** (elliptical EQ): filtro del tornio che rende mono le basse frequenze per limitare il movimento verticale dello stilo.
- **Dither** (dither): rumore aggiunto quando si riduce la profondità di bit (es. 24 → 16 bit) per evitare distorsione da troncamento.

Fonti: ITU-R BS.1770-5 (pagina ITU, in vigore dal 11/2023) [P]; EBU R 128-2023, Tech 3341-2023, Tech 3342-2023 [P, PDF tech.ebu.ch]; IFPI, ISRC Structure e When not to assign [P]; DCA, DDP Specification [P]; Apple Video and Audio Asset Guide 5.3.19 [P]. Tutto letto il 2026-11-09.

## Mestieri

Ordine nella catena: registrazione → montaggio ed editing → **mix** (con l'assistente) → approvazione → **stem e versioni** → **mastering** stereo → (in parallelo) **mix immersivo** e suo controllo → **taglio vinile** / DDP / consegna al distributore. Il mastering engineer non dovrebbe mai ricevere un mix non approvato: ogni revisione di mix dopo il mastering si paga due volte.

#### Mix engineer (mixing engineer)
- **Fa:** trasforma il multitraccia in un mix stereo: bilanciamento, EQ, dinamica, spazio, automazione, effetti. Sta dopo produzione ed editing, prima del mastering. Nei lavori pop di alto livello riceve sessioni già prodotte e lavora per giorni su un brano, con revisioni sulle note di artista ed etichetta.
- **Consegna:** il mix principale in WAV 24 bit (o 32 bit float) alla frequenza di sessione, senza limitatore sul bus (o due versioni, con e senza, se il cliente vuole ascoltare «forte»); le versioni concordate (strumentale, a cappella, TV mix, clean/explicit); stem; nota di recall o la sessione archiviata.
- **Strumenti standard:** DAW (Pro Tools resta lo standard degli studi di mix; Logic, Cubase/Nuendo, Ableton Live, Studio One nei progetti di produttore); console analogica di grandi studi (SSL, Neve, API) o mix tutto in DAW; plugin per categoria (vedi «Plugin e hardware» nelle Tecniche); monitor near-field più un piccolo altoparlante di controllo; misuratori di loudness e di fase. std
- **Come si briefa:** dare 2-3 reference (con il motivo: «la voce davanti come in X», non «suona come X»), il rough mix del produttore come punto di partenza, la destinazione (streaming, spot TV, evento, social con cellulare), le versioni richieste, la scadenza, il numero di giri di revisione inclusi (di solito 2-3, std), chi dà le note (una voce sola), chi possiede le sessioni. Chiedere in anticipo i prezzi di recall e revisioni extra.
- **Segno di livello alto:** il mix regge a basso volume, in mono e sul telefono; la voce si capisce senza essere staccata; le revisioni sono puntuali e il recall è esatto; mette per iscritto cosa ha cambiato a ogni versione. Esempi di livello alto citati da iZotope tra gli utenti di Ozone: Dave Pensado, Craig Bauer, Joe Visciano [P: testimonianze sul sito iZotope, 2026-11-09] (citazioni promozionali, non prove di metodo).
- **Errore comune:** di chi briefa, dare note vaghe («più energia») senza minutaggio e senza reference allo stesso volume; del mixer, consegnare un mix già limitato a −8 LUFS che toglie margine al mastering.

#### Mastering engineer (mastering engineer)
- **Fa:** ascolta il mix approvato in una stanza e su un impianto molto accurati e lo prepara per tutti i formati: equilibrio tonale, dinamica, loudness, coerenza fra i brani, sequenza e pause dell'album, metadati, file per streaming, CD (DDP) e vinile. Sta dopo il mix e prima della distribuzione o della fabbrica. Non ripara un mix sbagliato: lo può solo correggere poco.
- **Consegna:** per lo streaming, WAV/FLAC 24 bit alla frequenza nativa (Spotify e Apple vogliono la risoluzione nativa, non ricampionata [P]); per CD un DDP con PQ, ISRC, codice a barre e CD-Text; per vinile un file per lato (SOS [S]) o i file e le note per il tagliatore; foglio con ISRC, loudness integrato e picco reale di ogni brano; eventualmente versione per Apple Digital Masters controllata con gli strumenti Apple.
- **Strumenti standard:** catena analogica di mastering (EQ passivi Manley Massive Passive o tipo Pultec, compressori Manley Variable Mu, Shadow Hills Mastering Compressor, SSL bus), convertitori di alto livello, workstation di mastering (Steinberg WaveLab, Merging Pyramix, SADiE, Sequoia), limitatori in software (FabFilter Pro-L 2, Ozone Maximizer), Apple Digital Masters droplet, `afclip` e AURoundTripAAC per il controllo della codifica [P: Apple]. std per l'elenco di studio.
- **Come si briefa:** mix approvati, nominati come da tracklist, con picchi sotto 0 dBFS e senza limitatore (o con la versione limitata solo come riferimento); reference di loudness e colore; sequenza dell'album, pause e dissolvenze volute; formati (streaming, CD, vinile, Atmos); ISRC e codice a barre dal distributore o dall'etichetta; scadenza; revisioni incluse. Dire se l'album va ascoltato in normalizzazione per album.
- **Segno di livello alto:** l'album suona come un'unità; i brani più piani restano piani; nessuna distorsione nel passaggio ad AAC; il master non è più forte del necessario; consegna un rapporto con i valori misurati. Esempi citati da iZotope: Chris Gehringer, Will Borza [P: sito iZotope].
- **Errore comune:** chiedere «−14 LUFS perché lo dice Spotify» come se fosse un obbligo: Spotify lo **consiglia** nei «Mastering tips» per ottimizzare la sua riproduzione, ma accetta qualsiasi livello e lo normalizza in ascolto (Spotify for Artists [P]); AES TD1008 è una raccomandazione ai servizi, non ai mastering engineer [P]. Oppure chiedere «il più forte possibile» senza sapere che verrà abbassato.

#### Ingegnere di mix immersivo (Dolby Atmos Music mix engineer)
- **Fa:** costruisce dal multitraccia o dagli stem multitraccia un mix in Dolby Atmos (bed fino a 7.1.2 più oggetti) e ne controlla la resa su altoparlanti e in binaurale. Spesso fa anche il mastering del file Atmos (loudness e picco), perché il master Atmos si consegna così com'è. Sta dopo il mix stereo approvato, che resta il riferimento.
- **Consegna:** un ADM BWF per brano, 24 bit a 48 o 96 kHz (il 96 kHz viene convertito a 48 in uscita), integrato non oltre −18 LKFS e picco reale non oltre −1 dBTP misurati per brano, niente contenuto a banda piena nel canale LFE, sincronizzato con lo stereo di riferimento; per album gapless, confini dei brani entro 0,5 s da quelli dello stereo e nessun silenzio in più a fine brano (Apple Video and Audio Asset Guide 5.3.19 [P]).
- **Strumenti standard:** Dolby Atmos Renderer (fino a 128 ingressi: 1-10 per il bed 7.1.2, 11-128 per oggetti e bed aggiuntivi, fino a 118 canali oggetto [P: Dolby Atmos Renderer Guide v3.0]); DAW con renderer interno (Logic Pro, Pro Tools, Nuendo, DaVinci Resolve/Fairlight) std; stanza 7.1.4 come minimo, 9.1.4 o 9.1.6 come riferimento Dolby; ascolto calibrato a 85 dBC con +20 dB di headroom, 79-82 dBC nelle stanze piccole (Dolby, Best Practices for Dolby Atmos Music Studios [P]).
- **Come si briefa:** dare multitraccia o stem multitraccia (Apple vieta Atmos da upmix dello stereo, da stem separati dallo stereo e dallo stereo con riverbero aggiunto [P]); lo stereo approvato; reference immersive; distributore abilitato all'Atmos; ISRC nuovo per il mix immersivo (IFPI: un nuovo mix surround da stem è un cambiamento materiale [P]; IFPI ISRC Bulletin 2022/01 lo conferma per l'Atmos [P: titolo e contenuto da estratto di ricerca, PDF non aperto]).
- **Segno di livello alto:** il binaurale regge in cuffia normale (dove ascolta la maggioranza); la voce resta centrata e intelligibile; il mix Atmos non è solo «più largo» dello stereo; consegna senza warning di confini e loudness.
- **Errore comune:** misurare il loudness sul binaurale: Dolby indica di basarsi sulla misura Atmos del Renderer (fatta su un re-render 5.1 interno, per questo le impostazioni di trim la cambiano [S: risposte dello staff Dolby sul forum]), perché il binaurale risulta «un paio di LU» più forte e dipende dal contenuto (risposta Dolby sul forum Professional Support, 2021 [P]). Chiedere l'Atmos avendo solo il master stereo: non si accetta.

#### Tecnico di taglio per vinile (lacquer / DMM cutting engineer)
- **Fa:** incide su lacca (o su rame per il DMM) il master con un tornio, decidendo livello, passo del solco, controllo delle basse in fase e delle sibilanti, lunghezza dei lati. Sta dopo il mastering digitale (o lo fa lui stesso) e prima della galvanica e della stampa. Ascolta le prove di stampa (test pressing).
- **Consegna:** lacche o matrici DMM alla fabbrica, note di taglio, giudizio sui test pressing.
- **Strumenti standard:** torni Neumann (VMS-70 per lacca, VMS-82 per DMM, ad esempio da GZ Media [S: elenco di terzi]); filtro ellittico; limitatori di accelerazione dello stilo. std
- **Come si briefa:** file 24 bit, dinamici, limitati «pochissimo o per niente» (SOS, marzo 2015 [S]); la sequenza per lato con i minutaggi; formato (12″/7″, 33⅓ o 45 giri); quanto conta il volume rispetto alla durata; data delle prove.
- **Segno di livello alto:** il lato interno non distorce; il livello è il massimo compatibile con la durata; sibilanti e alti sotto controllo senza un suono spento; dice prima del taglio cosa non entra.
- **Errore comune:** mandargli il master per lo streaming già schiacciato; chiedere 25 minuti per lato e lo stesso volume di un singolo da 15.

#### Assistente al mix (mix assistant)
- **Fa:** prepara la sessione prima che il mixer arrivi: importa, nomina, colora, raggruppa, controlla fase e allineamento, carica il template di routing e di bus, gestisce stampe, versioni, recall e archiviazione. Sta fra l'editing e il mix.
- **Consegna:** sessione pronta e verificata; print delle versioni; foglio delle versioni e delle note di revisione; archivio della sessione.
- **Strumenti standard:** la stessa DAW del mixer, template di sessione, strumenti di confronto e di nominazione batch. std
- **Come si briefa:** elenco versioni richieste con nomi file esatti, scadenze di ogni consegna, dove caricare, chi riceve.
- **Segno di livello alto:** nessuna versione sbagliata consegnata; nomi file coerenti; sa ricostruire qualsiasi print di sei mesi prima.
- **Errore comune:** stampare le versioni da una sessione non aggiornata all'ultima nota del cliente.

#### Stem engineer (stem / versioning engineer)
- **Fa:** stampa gli stem e le versioni dal mix approvato, per il mastering a stem, per la sincronizzazione (spot, film, social), per il live e per i remix. Controlla che la somma degli stem sia uguale al mix. Spesso è il mixer o il suo assistente; in post e in pubblicità è un ruolo a parte.
- **Consegna:** stem allineati da zero, stessa lunghezza, stessa frequenza e profondità di bit del mix, nominati in modo uniforme, con gli effetti di bus inclusi nello stem a cui appartengono; strumentale, a cappella, TV mix, cutdown per durate (30/15/6 s nei lavori di sync, std).
- **Strumenti standard:** DAW, test di cancellazione di fase (somma degli stem in controfase contro il mix: il residuo deve essere quasi silenzio), misuratore di loudness. std
- **Come si briefa:** quanti stem e quali (la divisione cambia per mastering, per spot o per live), con o senza limitatore del bus (di solito senza; se il bus comprime, il mixer deve dire come si ricompone), durate e formati per ogni canale.
- **Segno di livello alto:** il test di somma passa; gli stem del riverbero e del delay non vengono persi; il pacchetto si apre in qualsiasi DAW senza istruzioni.
- **Errore comune:** stem esportati con il compressore del bus attivo su ogni stem separato: sommati, non tornano al mix.

Fonti: Apple Video and Audio Asset Guide 5.3.19 (8 set 2026) [P]; Spotify for Artists, Loudness normalization e Audio file formats [P]; Dolby Professional Support, Best Practices for Dolby Atmos Music Studios e risposta di Ceri T (Dolby Labs) [P, letti in Chrome]; Dolby Atmos Renderer, pagina prodotto [P]; IFPI ISRC, When to assign [P]; Sound On Sound, «Q. How does mastering differ for vinyl and digital releases?», Eric James, marzo 2015 [S]; iZotope, pagina Ozone 12 [P]. Tutto letto il 2026-11-09.

## Tecniche

Regola di lettura: prima la tecnica e il suo scopo, poi lo strumento. Tutti i valori qui sotto sono **di partenza** (std, salvo dove indicato [P]): si giudica a orecchio, nel contesto del genere, allo stesso loudness. Gli strumenti AI musicali citati nel campo «AI» sono quelli del brief; prima di usarne l'output in un lavoro per un cliente vale `atlante-culturale/references/regole.md` (§3 voci, §6 output AI) e la skill `rights-licensing-clearance`.

### Mix: livelli, frequenze, dinamica

#### Gain staging (gain staging)
- **Cos'è:** tenere un livello adeguato a ogni stadio (clip, insert, fader, bus, master) perché ogni processore lavori nella zona per cui è tarato e resti margine per il mastering.
- **Si sente:** se sbagliato, emulazioni analogiche che saturano «da sole», compressori che reagiscono troppo o niente, bus che distorce; se giusto, non si sente nulla.
- **Quando:** sempre, dall'import delle tracce. Più critico con plugin che emulano hardware.
- **Come:** normalizzare le sorgenti con il clip gain o un trim prima degli insert, lasciando il fader alla musica; lavorare con tracce intorno a −18 dBFS RMS / picchi fra −12 e −6 dBFS (convenzione nata dall'allineamento 0 VU = −18 dBFS: lo stesso valore torna come riferimento di calibrazione in EBU Tech 3341, dove un seno a −18 dBFS deve leggere −18,0 LUFS [P]); bus master con picchi fra −6 e −3 dBFS e nessun limitatore durante il mix. Il calcolo in virgola mobile a 32/64 bit evita il clip interno ma non cambia la reazione dei plugin al livello (SOS, «Gain Staging In Your DAW Software» [S]).
- **AI:** —
- **Errore comune:** alzare tutti i fader per «sentire meglio» e poi abbassare il master: il clip avviene prima.

#### Ordine delle operazioni (order of operations)
- **Cos'è:** la sequenza di lavoro su un mix e su ogni canale.
- **Si sente:** un ordine sbagliato produce lavoro che si annulla (un'esaltazione di EQ che il compressore poi schiaccia, un riverbero che nasconde il problema da correggere).
- **Quando:** a ogni mix; è un default flessibile, non una legge: le console analogiche fissavano l'EQ prima del compressore, nella DAW l'ordine si sceglie per sorgente (SOS, «Q. Should I EQ first or compress first?» [S]).
- **Come:** 1) bilanciamento statico senza processori; 2) pulizia (passa-alto, tagli di risonanze); 3) compressione; 4) saturazione; 5) EQ di carattere; 6) spazio (riverbero, delay sui send); 7) automazione; 8) bus di gruppo; 9) bus master leggero; 10) confronto con le reference allo stesso loudness, in mono, su più impianti.
- **AI:** —
- **Errore comune:** cominciare dagli effetti sul brano in solo; il mix si decide nel contesto.

#### EQ sottrattiva e filtro passa-alto (subtractive EQ, high-pass filter)
- **Cos'è:** togliere energia dove non serve o dove disturba, invece di alzare dove si vorrebbe sentire meglio.
- **Si sente:** mix più pulito e più forte a parità di picco; il basso e la cassa si capiscono; la voce smette di «inscatolare».
- **Quando:** su quasi tutte le tracce che non portano il registro basso.
- **Come:** passa-alto di partenza: voce 80-120 Hz, chitarre 100-150 Hz, synth e pad 60-100 Hz, piatti e hi-hat 200-300 Hz (std): alzare la frequenza finché il timbro si assottiglia, poi tornare indietro. Tagli stretti (Q alto) sulle risonanze trovate spazzando con un picco stretto; tagli larghi per il «fangoso» (200-500 Hz) e il «nasale» (circa 1 kHz) std. Strumento: FabFilter Pro-Q 4 o l'EQ della DAW.
- **AI:** —
- **Errore comune:** passa-alto ripido e alto su tutto: il mix perde corpo e calore; tagliare guardando l'analizzatore invece di ascoltare.

#### EQ dinamica (dynamic EQ)
- **Cos'è:** una banda di EQ che interviene solo quando il segnale in quella banda supera una soglia (o, in espansione, quando scende).
- **Si sente:** la durezza o il rimbombo spariscono solo quando ci sono, il resto del tempo il timbro resta pieno.
- **Quando:** risonanze che compaiono su alcune note (voce, basso, chitarra acustica), aspri a volume alto, effetto di prossimità variabile.
- **Come:** banda sulla frequenza del problema, soglia che tocca solo i momenti critici, 2-6 dB di riduzione massima (std); attacco e rilascio che seguono la nota. Pro-Q 4 ha bande dinamiche e, dal 2024, elaborazione «spectral» dinamica [P: FabFilter]; TDR Nova è gratuito [S].
- **AI:** —
- **Errore comune:** usarla al posto di un taglio statico quando il problema è sempre presente.

#### EQ Mid/Side (M/S EQ)
- **Cos'è:** equalizzare separatamente il centro (Mid) e i lati (Side).
- **Si sente:** si può schiarire o allargare l'«aria» ai lati senza toccare la voce al centro, o pulire il basso dai lati.
- **Quando:** bus master e mastering, pad e cori larghi, riverberi.
- **Come:** passa-alto sul Side fino a 100-150 Hz per tenere mono il basso (std; vedi anche il vinile, dove il limite è più sfumato); leggera esaltazione del Side sopra 5-8 kHz per apertura (std). Controllare sempre in mono dopo.
- **AI:** —
- **Errore comune:** esaltare il Side finché il centro si svuota: mix «fasico», voce lontana, crollo in mono.

#### Compressione: i tipi (compressor types: VCA, FET, optical, variable-mu)
- **Cos'è:** quattro modi di realizzare il controllo del guadagno, con comportamento e colore diversi.
- **Si sente:**
  - **VCA** (SSL G bus, dbx 160, API 2500): preciso e veloce, attacco e rilascio controllabili; sul bus «incolla» senza colorare molto.
  - **FET** (UREI/UA 1176): attacco rapidissimo, aggressivo, aggiunge grinta; la modalità «all-button» distorce in modo musicale su batterie e microfoni d'ambiente.
  - **Ottico** (Teletronix LA-2A, cella T4): lento e dipendente dal programma e dalla frequenza, morbido, livella voce e basso senza farsi notare; attacco medio fisso di 10 ms, rilascio in due fasi: circa 60 ms per il primo 50%, il resto in 1-15 s [P: Universal Audio, «A History of the Teletronix LA-2A»].
  - **Variable-mu** (Fairchild 660 mono / 670 stereo, Manley Variable Mu): la valvola stessa cambia guadagno; rapporto che cresce con il livello, ginocchio morbidissimo, usato sul bus e nel mastering. Il Fairchild ha un selettore «Time Constant» a 6 posizioni (le ultime due dipendenti dal programma) [S: manuale UA della Fairchild Collection, letto solo in estratto].
- **Quando:** VCA per bus e controllo preciso; FET per presenza e grinta su voce, batteria, parallelo; ottico per livellare voce e basso; variable-mu per «tenere insieme» un mix con poca riduzione.
- **Come:** valori di fabbrica letti nei manuali: 1176LN attacco 20-800 µs, rilascio 50 ms-1,1 s, rapporti 4, 8, 12 e 20:1, i tempi si accorciano ruotando la manopola in senso orario [P: manuale UA 1176LN]. Manley Variable Mu: COMP 1,5:1 a ginocchio morbido o LIMIT 4:1, attacco 25-70 ms, rilascio a 5 posizioni 0,2/0,4/0,6/4/8 s [P: manuale Manley rev. 5.2.1]. Bus SSL classico: attacco 0,1-30 ms, rilascio 0,1-1,2 s più Auto, rapporti 2, 4 e 10:1 [S]; il plugin SSL Bus Compressor 2 aggiunge attacco 20 ms, rilasci 0,4/0,8/1,2 s e rapporti 1,5/3/10/20/X [P: user guide SSL]. Shadow Hills Mastering Compressor: stadio ottico seguito da stadio VCA discreto in classe A, usabili in serie o singolarmente, con trasformatori d'uscita commutabili Nickel, Iron, Steel [P: pagina UA del plugin con licenza Shadow Hills]; cella T4B e rapporti del VCA 1,2/2/3/4/6/10:1 [S: schede dei rivenditori; sito Shadow Hills non raggiungibile].
- **AI:** —
- **Errore comune:** scegliere il compressore per il nome (il «suono 1176») senza sapere cosa deve fare; usare un FET veloce su un bus intero e spegnere i transienti.

#### Compressione parallela (parallel / «New York» compression)
- **Cos'è:** sommare al segnale pulito una copia molto compressa.
- **Si sente:** densità, sostegno e volume percepito in più, ma l'attacco del segnale pulito resta.
- **Quando:** bus batteria, voce, basso; generi dove serve impatto senza perdere dinamica.
- **Come:** send o bus; compressione forte sul ramo parallelo (6-20 dB di riduzione, attacco rapido, rilascio medio-rapido); miscelare il ramo al 20-50% finché si sente peso senza perdere lo schiocco (std). Passa-alto a 100-150 Hz sul ramo per non far pompare la cassa (std). Molti compressori hanno un controllo Mix interno (Pro-C 3, SSL Bus Compressor 2 [P]).
- **AI:** —
- **Errore comune:** ritardo di elaborazione non compensato fra i due rami: filtro a pettine e suono vuoto.

#### Compressione in sidechain (sidechain compression, ducking)
- **Cos'è:** un compressore su una traccia comandato da un'altra (di solito la cassa sul basso o sui pad).
- **Si sente:** a bassa intensità la cassa «buca» senza alzare il volume; spinta forte, il «pompaggio» ritmico della house e della EDM.
- **Quando:** conflitto reale fra cassa e basso; effetto stilistico voluto; voce che abbassa la musica nei lavori parlati.
- **Come:** attacco 0-10 ms, rilascio 50-150 ms o a tempo, rapporto 4:1 o più, 3-6 dB di riduzione sui colpi (std). Variante trasparente: sidechain solo nella banda bassa (multibanda o EQ dinamica con ingresso esterno).
- **AI:** —
- **Errore comune:** mettere il sidechain su tutto «perché si fa»: mix vuoto e ondeggiante.

#### Compressione multibanda (multiband compression)
- **Cos'è:** il segnale è diviso in bande, ognuna compressa per conto suo.
- **Si sente:** controllo di un registro (il basso che rimbomba solo su certe note, i medio-alti che pungono nei ritornelli) senza toccare il resto.
- **Quando:** quando il problema è davvero di dinamica in una banda; nel mastering con mano leggera; come effetto aggressivo nel sound design elettronico (OTT di Xfer [S]).
- **Come:** 2-4 bande al massimo, incroci dove il problema finisce, 1-3 dB di riduzione per banda nel mastering (std). Strumenti: FabFilter Pro-MB, moduli di Ozone [P: pagine prodotto].
- **AI:** —
- **Errore comune:** usarla come EQ: se il problema è sempre presente serve un EQ statico; troppe bande rovinano l'equilibrio tonale.

#### Compressione di bus («colla») (bus / glue compression)
- **Cos'è:** compressione leggera su un gruppo (batteria, voci) o sul bus del mix, per far suonare gli elementi come un insieme.
- **Si sente:** coesione e un po' di spinta, senza pompaggio evidente.
- **Quando:** quasi sempre sul bus batteria; sul bus master con prudenza, decidendolo presto (cambia il bilanciamento).
- **Come:** bus batteria: 2:1-4:1, attacco 10-30 ms, rilascio Auto, 2-4 dB di riduzione; bus master: 2:1, attacco lento, rilascio Auto, 1-2 dB (std). Passa-alto nel sidechain a 80-100 Hz se la cassa comanda troppo (std).
- **AI:** —
- **Errore comune:** caricare il bus master per avere volume: diventa un mastering fatto male e anticipato.

#### Saturazione (saturation)
- **Cos'è:** distorsione armonica controllata (nastro, valvola, trasformatore, transistor).
- **Si sente:** calore, presenza e volume percepito senza alzare il picco; arrotondamento dei transienti (nastro); grinta (valvola spinta).
- **Quando:** basso che non si sente sui piccoli altoparlanti (le armoniche lo rendono udibile), voce che deve «uscire», bus per coesione.
- **Come:** poco: confrontare a volume uguale perché la saturazione alza il livello. Strumenti: Soundtoys Decapitator (carattere), FabFilter Saturn 2 (multibanda), emulazioni di nastro (UAD Studer A800, Waves J37) [S].
- **AI:** —
- **Errore comune:** saturare ogni canale «un po'»: le armoniche si sommano e il mix diventa duro e stanco.

#### Riverbero (reverb)
- **Cos'è:** simulazione o registrazione della coda di uno spazio. Tipi: stanza (room), sala (hall), piastra (plate), molla (spring), convoluzione (risposta all'impulso di uno spazio reale), algoritmici «vintage» anni 70-80.
- **Si sente:** profondità e distanza; la piastra dà brillantezza densa alla voce; la stanza corta incolla la batteria; la sala allontana e allarga.
- **Quando:** sui send, quasi mai in insert; uno o due spazi comuni tengono il mix coerente.
- **Come:** pre-delay 10-40 ms per staccare la voce dalla coda (std; a tempo se serve); passa-alto 150-300 Hz e passa-basso 6-10 kHz sul ritorno per non impastare (std); ducking del ritorno sotto la voce. Strumenti: Valhalla Room/VintageVerb/Plate, FabFilter Pro-R 2 (Decay Rate EQ) [P: FabFilter], Altiverb e Lexicon nei grandi studi (std).
- **AI:** —
- **Errore comune:** la coda che riempie gli spazi fra le frasi e impasta i bassi; riverbero diverso su ogni traccia.

#### Delay (delay, echo)
- **Cos'è:** ripetizione del segnale dopo un tempo, con o senza retroazione. Tipi: digitale pulito, nastro (tape echo), bucket-brigade, ping-pong stereo, slapback (singola ripetizione corta).
- **Si sente:** spazio senza la coda diffusa del riverbero; ritmo; il «raddoppio» corto allarga.
- **Quando:** voce (slapback 80-120 ms nel rock e rockabilly, ripetizioni a 1/4 o 1/8 nel pop) std; lancio di fine frase automatizzato.
- **Come:** tempo a battuta (60.000 / BPM = ms di un quarto); filtrare le ripetizioni; ducking sotto la voce. Strumenti: Soundtoys EchoBoy, Valhalla Delay, FabFilter Timeless 3 [S/P].
- **AI:** —
- **Errore comune:** ripetizioni piene di bassi e alti che si accumulano e mascherano la voce.

#### Automazione (automation)
- **Cos'è:** variare nel tempo volume, send, filtri, parametri.
- **Si sente:** la voce che resta sempre davanti, sezioni che crescono, lanci di effetto alla fine delle frasi: il mix «si muove» come una registrazione suonata.
- **Quando:** sempre, nella fase finale; è il lavoro che distingue un mix finito da un bilanciamento statico.
- **Come:** prima i «ride» di volume sulla voce parola per parola (anche ±1-3 dB, std), poi send, poi sezioni. Lavorare in modalità trim/relativa dopo il bilanciamento.
- **AI:** —
- **Errore comune:** usare il compressore per quello che dovrebbe fare l'automazione: la voce diventa piatta.

#### Mascheramento e carving (masking, frequency carving)
- **Cos'è:** due sorgenti nella stessa banda si coprono; il «carving» lascia a ciascuna la sua zona.
- **Si sente:** strumenti che scompaiono nel pieno e ricompaiono in solo; voce che va alzata sempre di più.
- **Quando:** cassa contro basso (50-100 Hz), voce contro chitarre e synth (2-5 kHz), pad contro tutto (std).
- **Come:** tagliare l'elemento meno importante dove sta il fondamentale dell'altro; in alternativa sidechain o EQ dinamica comandata dall'altro (Pro-Q 4 permette il sidechain esterno per banda [P: FabFilter]); scegliere chi comanda in ogni registro.
- **AI:** la separazione di stem (Demucs, Ozone Stem Focus/Stem EQ, iZotope RX) aiuta a **diagnosticare** su un mix stereo dove si sovrappongono gli elementi; non sostituisce il lavoro sul multitraccia.
- **Errore comune:** risolvere alzando: tutti i fader salgono e il mix si satura.

#### Larghezza stereo e compatibilità mono (stereo width, mono compatibility)
- **Cos'è:** quanto il mix occupa i lati e quanto resiste alla somma L+R.
- **Si sente:** un mix largo è avvolgente in cuffia; se la larghezza viene da differenze di fase, in mono spariscono elementi (cori, synth super-saw, riverberi) o il basso si assottiglia.
- **Quando:** controllo ogni 10-15 minuti durante il mix (std); sempre prima della consegna.
- **Come:** basso e cassa al centro sotto 100-150 Hz (std); allargare con panning, doppie esecuzioni reali, Haas sotto 30 ms solo dove regge (std); misurare la correlazione (deve restare per lo più positiva) e ascoltare la somma mono.
- **AI:** —
- **Errore comune:** allargatori sul bus master; fidarsi dell'immagine in cuffia.

#### De-essing e risonanze (de-essing, resonance suppression)
- **Cos'è:** ridurre le sibilanti (S, Z, C dolce, tipicamente 4-10 kHz, std) e le risonanze che si spostano con le note.
- **Si sente:** voce morbida e chiara anche ad alto volume; in eccesso la voce «sfiata» o sembra un difetto di lingua.
- **Quando:** quasi tutte le voci in pop e rap; prima del mastering, perché gli alti del mastering espongono sibilanti invisibili nel mix; essenziale per il vinile.
- **Come:** de-esser a banda divisa (tocca solo la banda) o larga (abbassa tutto); 3-6 dB sulle S peggiori (std). Soppressore dinamico di risonanze per durezza mobile: oeksound soothe3 (dal 19 maggio 2026), modo Soft adattivo e Hard a soglia fissa, fino a 9.1.6 canali [P: oeksound; data S]. FabFilter Pro-DS per il de-essing quotidiano [P].
- **AI:** —
- **Errore comune:** un soppressore di risonanze su ogni traccia e sul bus: il mix diventa spento e senza presenza.

#### Reference e confronto a loudness uguale (reference tracks, level-matched A/B)
- **Cos'è:** ascoltare il mix accanto a brani di riferimento portati allo stesso loudness.
- **Si sente:** a orecchio il più forte sembra sempre migliore: senza pareggiare il loudness il confronto è falso.
- **Quando:** dall'inizio del mix e a ogni revisione, non solo alla fine.
- **Come:** pareggiare per loudness integrato o a breve termine (non per picco); confrontare equilibrio tonale, posizione della voce, larghezza per registro, dinamica fra strofa e ritornello. Strumenti: un misuratore BS.1770 (Youlean, Pro-L 2, iZotope Insight) e un plugin di confronto (Metric AB, ADPTR) std; LANDR, Ozone e Pro-L 2 offrono il pareggio del volume in ascolto [P: LANDR «Volume matching»].
- **Approssimazione con i meter (fare in casa):** il confronto di picco, RMS e fattore di cresta fra il nostro elemento e lo stesso elemento di una reference (isolato con la separazione di stem) avvicina la dinamica e il livello, **non** il timbro: è un controllo grossolano, va detto al cliente che non è un confronto spettrale. Se il fattore di cresta del nostro è più alto, siamo più dinamici (più compressione o meno, per scelta); se è più basso, siamo già più schiacciati.
- **AI:** separazione di stem per isolare l'elemento da confrontare; i limiti sono gli artefatti della separazione.
- **Errore comune:** confrontare con il master commerciale un mix non masterizzato senza abbassare la reference; scegliere reference che il cliente non ha approvato.

#### Revisioni di mix e note del cliente (mix revisions, client notes)
- **Cos'è:** il ciclo di ascolto, note e nuova versione fino all'approvazione.
- **Si sente:** —
- **Quando:** in ogni lavoro; nella pubblicità le note arrivano da più persone (agenzia, cliente, regista).
- **Come:** una persona raccoglie e unifica le note; ogni nota ha minutaggio, elemento, verbo («voce +1 dB nel ritornello a 1:12», non «più energia»); ascolto sullo stesso impianto della volta prima e allo stesso volume; versioni numerate (v1, v2…) con un registro dei cambiamenti; il numero di giri inclusi è scritto nel contratto (skill `scoping-change-orders`).
- **AI:** —
- **Errore comune:** confrontare la v3 con la v2 a volumi diversi o su un altro impianto; note che si contraddicono fra referenti.

### Mastering

#### Catena di mastering (mastering chain)
- **Cos'è:** la sequenza di processori sul mix stereo.
- **Si sente:** in un buon master il mix è più bilanciato e coerente con gli altri brani, non «diverso».
- **Quando:** su ogni brano, poi sull'album nel suo insieme.
- **Come:** ascolto e confronto con il mix originale allo stesso loudness → EQ correttivo (anche M/S) → compressione leggera (1-2 dB, variable-mu, ottico o VCA) → EQ di colore → eventuale saturazione → limitatore a picco reale → dither se si riduce la profondità di bit (std). Controllo della codifica AAC con gli strumenti Apple (droplet, AURoundTripAAC, `afclip`, che verifica anche il clip intercampione [P: Apple Digital Masters]).
- **AI:** Ozone Master Assistant propone una catena a partire da genere, reference e target LUFS [P: iZotope]: è un punto di partenza, non una decisione (vedi «Mastering con l'AI»).
- **Errore comune:** caricare la catena per compensare un mix sbagliato invece di rimandarlo al mixer.

#### Limitazione a picco reale e loudness (true peak limiting and loudness)
- **Cos'è:** l'ultimo stadio, che decide il livello di picco reale e il loudness del master.
- **Si sente:** spinto troppo: transienti schiacciati, distorsione, perdita di impatto; a normalizzazione attiva il master troppo forte viene abbassato e suona più piccolo dei brani dinamici.
- **Quando:** sempre, sul brano finito.
- **Come:** soglia del picco reale a −1 dBTP (Spotify, Apple Atmos, EBU R 128 [P]); se il master è più forte di −14 LUFS integrati, Spotify raccomanda −2 dBTP perché i master forti distorcono di più nella codifica [P]. Il loudness integrato è una **scelta** artistica: Spotify normalizza a −14 LUFS e alza i brani più piani solo finché il picco reale resta a −1 dB (esempio Spotify: −20 LUFS con picco −5 dBFS viene alzato solo a −16 LUFS) [P]; Apple raccomanda almeno 1 dB di margine contro il clip e dice di masterizzare «per il suono voluto, indipendentemente dal volume di riproduzione» [P]. Controllare con un misuratore BS.1770: in casa basta `ffmpeg -hide_banner -nostats -i master.wav -af ebur128=peak=true:framelog=quiet -f null -` (il riepilogo finale riporta I e soglia, LRA con soglia e LRA low/high, e «True peak: Peak: … dBFS»: l'etichetta dice dBFS ma il valore è il picco reale; riverificato il 2026-11-09 con ffmpeg 9.0.1 sul segnale di prova 1 di EBU Tech 3341, seno stereo 1 kHz a −23 dBFS: I −23,0 LUFS, LRA 0,0 LU, picco −23,0; a −18 dBFS: −18,0 LUFS). Il picco intercampione viene rilevato ma con margine: su un segnale costruito con picco dei campioni −0,1 dBFS e picco reale teorico +2,9 dBTP ffmpeg legge +3,5 (stima prudente, buona come allarme, non come misura certificata). `afclip master.wav` conta i campioni in clip e quelli intercampione, canale per canale [P: Apple; provato in locale].
- **AI:** —
- **Errore comune:** inseguire un numero LUFS invece del suono; usare un limitatore a picco di campione e scoprire il clip dopo la codifica.

#### Dinamica e LRA (dynamics, loudness range)
- **Cos'è:** quanto varia il loudness nel brano (LRA, in LU) e quanto distano picco e media (fattore di cresta).
- **Si sente:** dinamica viva = ritornelli che si aprono, strofe che respirano; LRA quasi nullo = tutto alla stessa intensità, fatica d'ascolto.
- **Quando:** da decidere per genere e destinazione: un brano per un ascolto in auto o in palestra non è un brano per un ascolto in cuffia di classica.
- **Come:** leggere LRA (EBU Tech 3342: 10°-95° percentile dei valori a 3 s, gate relativo −20 LU [P]) e loudness a breve termine per sezione. Per la musica pop e dance non esiste un valore di riferimento in una norma: da verificare sulle reference del cliente misurate da noi.
- **AI:** —
- **Errore comune:** usare l'LRA come voto di qualità; è una misura, non un giudizio.

#### Sequenza e spazi in un album (sequencing, spacing, gapless)
- **Cos'è:** ordine dei brani, pause, dissolvenze, transizioni senza interruzione, livello relativo fra brani.
- **Si sente:** un album che scorre come un racconto; un intermezzo piano che resta piano.
- **Quando:** album ed EP, sempre; nei singoli no.
- **Come:** stabilire i livelli relativi ascoltando i passaggi, non pareggiando i LUFS di ogni brano; Spotify normalizza l'album intero con un guadagno unico quando si ascolta l'album, e i singoli brani quando si ascolta in playlist o in casuale [P]; AES TD1008 raccomanda ai servizi di normalizzare il brano più forte di un album a −14 LUFS (tipicamente l'album risulta intorno a −16) [P]. Apple Sound Check può lavorare per album [P: Apple Digital Masters]. Per gli album gapless in Atmos, confini allineati allo stereo entro 0,5 s [P: Apple].
- **AI:** —
- **Errore comune:** portare ogni brano allo stesso loudness integrato: la ballata diventa forte come il pezzo veloce.

#### ISRC, metadati e DDP (ISRC, metadata, DDP)
- **Cos'è:** i codici e il formato che identificano registrazioni e prodotto e li portano in fabbrica e sulle piattaforme.
- **Si sente:** —
- **Quando:** a ogni uscita; prima del mastering finale.
- **Come:** ISRC = 12 caratteri: prefisso di 5 (2 lettere + 3 alfanumerici, assegnato dall'agenzia nazionale), anno di riferimento (2 cifre), codice di designazione (5 cifre, non ripetibile nello stesso anno) [P: IFPI]. Nuovo ISRC per ogni registrazione materialmente diversa: altre versioni o durate, altri mix ed edit, un nuovo mix surround da stem, restauri con intervento creativo; stesso ISRC fra formati e bit-rate diversi e fra paesi; non si assegna a registrazioni di altri [P: IFPI]. Per il CD il master è un DDP (per CD DDP 2.0, con addendum CD-Text [P: DCA]) che contiene immagine audio, descrittori e PQ con inizi, pause, ISRC e codice a barre [S]. Agenzia ISRC italiana: **FIMI**, incaricata dall'IFPI; il produttore fonografico con sede in Italia richiede una volta il «Codice Primo Proprietario» (100 € + IVA 22% per l'audio, altrettanto per il video) e poi assegna da sé anno e numero; chi usa l'ISRC di un distributore ne lascia a lui la titolarità del prefisso [P: fimi.it «Richiedi codice ISRC»; SCF «Codici ISRC», letti 2026-11-09].
- **AI:** —
- **Errore comune:** riusare l'ISRC dello stereo per il mix Atmos o per un edit radio; mandare in fabbrica WAV invece di un DDP verificato.

#### Mastering per vinile (vinyl mastering)
- **Cos'è:** preparare il master per il taglio su lacca o DMM, dove i limiti sono fisici (movimento dello stilo, spazio del solco, velocità lineare che cala verso il centro).
- **Si sente:** se sbagliato, distorsione sulle sibilanti e negli ultimi brani del lato, salti della puntina, livello basso e fruscio sui lati troppo lunghi.
- **Quando:** ogni uscita in vinile; è un master separato da quello digitale.
- **Come:** file 24 bit dinamico, limitato «pochissimo o per niente», uno per lato con la sequenza decisa (SOS [S]); sibilanti già controllate; brani più dinamici e più acuti verso l'esterno del lato, perché all'interno la risposta in alta frequenza cala (std, citato da tagliatori [S]). La regola «basse mono sotto 150 Hz» non va applicata in mix: Masterdisk (studio di mastering e taglio) la definisce «patently wrong» e chiede di non rendere mono le basse salvo richiesta del tagliatore, che decide in base a lunghezza del lato e livello di taglio [P: masterdisk.com, «MONO bass - when Mastering for Vinyl»]; Hugh Robjohns (SOS) indica che tenere mono sotto circa 120 Hz aiuta il livello nel pop e rock con basso e cassa forti, ma il basso stereo si incide se non ha grandi differenze di fase [S: forum SOS]; il «150 Hz» viene dal filtro ellittico del tornio, con pendenza dolce (6 dB/ottava secondo un tagliatore [S]). Lunghezza per lato: vedi «Numeri di riferimento».
- **AI:** —
- **Errore comune:** inviare il master per lo streaming; comprimere il lato a 25 minuti e pretendere il volume di un 12″ da club.

#### Dolby Atmos Music (bed e oggetti, ADM BWF, binaurale, consegna)
- **Cos'è:** il formato immersivo a oggetti usato da Apple Music (Spatial Audio), Amazon Music e Tidal per la musica.
- **Si sente:** voce e strumenti disposti intorno e sopra; in cuffia, con il binaurale, profondità e spazio; mal fatto, lo stereo «spalmato» con un riverbero.
- **Quando:** se il cliente ha i multitraccia, un distributore abilitato e un motivo (Apple dichiara un compenso maggiore per i contenuti spaziali [S: stampa di settore, da verificare su fonte Apple]).
- **Come:** bed (canali fissi, fino a 7.1.2 = 10 ingressi) più oggetti (fino a 118) nei 128 ingressi del Renderer [P: Dolby Atmos Renderer Guide v3.0 (2018) e pagina Renderer]; letti come configurazione predefinita: un bed più largo di 7.1.2 (es. 9.1.6) si fa con «object bed» di oggetti statici [S: articolo Dolby Professional Support]; misura del loudness sulla resa Atmos con il Renderer, non sul binaurale [P: Dolby]; consegna per Apple: ADM BWF 24 bit a 48 o 96 kHz, ≤ −18 LKFS integrati e ≤ −1 dBTP secondo BS.1770-4, misurati brano per brano, niente banda piena nel LFE, sincronizzato con lo stereo; vietati upmix, de-mixing dallo stereo e stereo con ambienza aggiunta [P: Apple 5.3.19]. Tolleranza: un ingegnere Dolby ha scritto «−18 LKFS ±2 LU» (forum, 2021 [P]) ma la pagina Apple dice «must not exceed −18»: per Apple, restare a −18 o sotto. Ascolto a 85 dBC (79-82 nelle stanze piccole) [P: Dolby].
- **AI:** gli strumenti di separazione producono stem dal master stereo, ma **Apple vieta il de-mixing dallo stereo** per l'Atmos [P]: l'AI qui non è una scorciatoia ammessa.
- **Errore comune:** ottimizzare per l'impianto 7.1.4 dello studio quando quasi tutti ascolteranno in cuffia; consegnare il file rerender invece dell'ADM (Dolby [P]).

#### Stem mastering (stem mastering)
- **Cos'è:** mastering a partire da 4-8 stem invece che dal mix stereo, per poter correggere i rapporti (voce, basso, batteria) in fase di mastering.
- **Si sente:** correzioni più precise di quanto permetta un EQ sul mix intero; rischio che diventi un secondo mix.
- **Quando:** mix fatti in casa o da produttori senza mixer, tempi stretti, quando una sola correzione di rapporto salverebbe il brano.
- **Come:** stem allineati da zero, senza limitatore e senza compressione del bus attiva su ogni stem (o con la sua ricostruzione documentata), test di somma contro il mix; il mastering engineer deve dichiarare se cambierà i rapporti e chi li approva. Costo e tempi superiori al mastering stereo (std).
- **AI:** Ozone 12 Stem EQ (edizione Advanced) equalizza voce, basso, batteria e resto dentro un file stereo con separazione neurale [P: iZotope; edizione S]: utile quando gli stem non esistono, con artefatti da controllare in solo e in mono.
- **Errore comune:** usare lo stem mastering per rimandare decisioni di mix.

#### Mastering con l'AI (AI mastering: LANDR, Ozone Master Assistant, eMastered)
- **Cos'è:** servizi o plugin che analizzano il brano e applicano una catena (EQ, dinamica, larghezza, limitatore) per un genere, uno stile o una reference.
- **Si sente:** su un mix buono, un risultato accettabile e rapido; su un mix con problemi, problemi più forti; spesso più forte e più brillante del necessario.
- **Quando:** demo, provini per il cliente, contenuti social a basso budget, controllo incrociato; non per un'uscita discografica importante né per il vinile.
- **Come:** LANDR: online e plugin, stili per intensità e loudness, mastering per album, mastering su reference, pareggio di volume in anteprima, revisioni illimitate [P: landr.com]. Ozone 12 Master Assistant: flusso Custom con profili di genere, reference caricate, target LUFS, scelta dei moduli e dell'intensità [P: iZotope]. eMastered: da verificare (pagina caricata solo via JavaScript). Sempre: confrontare con il mix allo stesso loudness, controllare picco reale e clip dopo codifica.
- **AI:** è la voce stessa. Limiti: non ascolta l'album come insieme (salvo le funzioni album, da verificare caso per caso), non conosce l'intenzione dell'artista, non dialoga sul mix, non prepara DDP né vinile, non risolve problemi di mix; i termini d'uso sui file caricati vanno letti prima di caricare materiale del cliente.
- **Errore comune:** presentarlo al cliente come «mastering» equivalente a quello di uno studio; usarlo su materiale non ancora approvato.

#### Plugin e hardware di riferimento per categoria (reference tools by category)
- **Cos'è:** gli strumenti che si trovano negli studi di alto livello; servono per leggere un preventivo o una lista di attrezzatura, non per scegliere al posto della tecnica.
- **Si sente:** in prove alla cieca le emulazioni moderne sono vicine all'hardware [S: opinione di settore, non verificata]: l'hardware compra soprattutto flusso di lavoro e mani sulle manopole.
- **Quando:** quando un fornitore propone attrezzatura o quando si deve capire che cosa serve davvero.
- **Come:**

| Categoria | Cosa fa | Software di riferimento | Hardware di riferimento |
|---|---|---|---|
| EQ chirurgico e dinamico | tagli stretti, bande dinamiche, M/S, fase lineare | FabFilter Pro-Q 4 (dic 2024) [P] | — |
| EQ di carattere | curve larghe e musicali, colore | emulazioni Pultec, Neve, SSL, API (UAD, Waves, Softube) [S] | Pultec EQP-1A, Neve 1073, SSL E/G, API 550, Manley Massive Passive std |
| Compressore tuttofare | stili diversi, sidechain, M/S | FabFilter Pro-C 3 (15 gen 2026; stili nuovi, immersivo/Atmos) [P] | — |
| FET | presenza, grinta, parallelo | UAD/Waves 1176 [S] | UREI/UA 1176LN [P: manuale] |
| Ottico | livellare voce e basso | UAD/Waves LA-2A [S] | Teletronix LA-2A (riedizione UA) [P: Universal Audio] |
| Variable-mu | colla di bus e mastering | UAD Fairchild, UAD Manley Variable Mu [S] | Fairchild 660/670, Manley Variable Mu [P: manuale Manley] |
| VCA di bus | colla di batteria e mix | SSL Bus Compressor 2 [P], Cytomic The Glue [S] | SSL G bus, API 2500 std |
| Mastering ibrido | ottico + VCA, trasformatori | UAD Shadow Hills Mastering Compressor Class A [P: UA] | Shadow Hills Mastering Compressor [S] |
| De-esser / risonanze | sibilanti, durezza mobile | FabFilter Pro-DS [P], oeksound soothe3 [P] | — |
| Saturazione | armoniche, nastro, valvola | Soundtoys Decapitator, FabFilter Saturn 2, UAD Studer A800 [S] | registratori a nastro std |
| Riverbero | spazio | Valhalla Room/VintageVerb, FabFilter Pro-R 2 [P], Altiverb std | Lexicon 480L, EMT 140 (piastra) std |
| Delay | ripetizioni, carattere | Soundtoys EchoBoy, Valhalla Delay, FabFilter Timeless 3 [S/P] | Roland Space Echo std |
| Limitatore e suite | picco reale, loudness | FabFilter Pro-L 2 [P], iZotope Ozone 12 (IRC 5) [P] | — |
| Restauro | rumore, click, separazione | iZotope RX std | — |
| Misura | loudness, picco reale, fase | Youlean, Pro-L 2, iZotope Insight std; ffmpeg `ebur128`, `afclip` (verificati) | — |

- **AI:** Ozone 12 (Master Assistant, Stem EQ, Bass Control, Unlimiter) e soothe3 (adattivo) sono strumenti con analisi automatica; restano processori da guidare.
- **Errore comune:** giudicare un fornitore dalla lista di plugin; chiedere «il compressore di X» invece di dire cosa deve succedere al suono.

Fonti: EBU Tech 3341-2023 e Tech 3342-2023 [P]; AESTD1008.1.21-9, 24 set 2021 (via Wayback, snapshot 23 nov 2025) [P]; Spotify for Artists [P]; Apple Digital Masters (PDF) e Video and Audio Asset Guide 5.3.19 [P]; Dolby Professional Support [P]; IFPI ISRC [P]; DCA DDP [P]; manuali UA 1176LN, Manley Variable Mu rev. 5.2.1, SSL Bus Compressor 2 User Guide [P]; FabFilter news e pagine prodotto, oeksound soothe3, iZotope Ozone 12, LANDR [P]; Sound On Sound (gain staging, EQ/compressione, vinile) [S]; skill DJ `music-production-mixing-mastering`, `pro-audio-plugins`, `mir-audio-analysis` §7 come base, con i valori non verificati marcati std o [S]. Prova del misuratore ffmpeg: eseguita in locale il 2026-11-09 e ripetuta nella verifica indipendente (ffmpeg 9.0.1, `afclip` di macOS). Aggiunte nella verifica: Universal Audio (storia dell'LA-2A, pagina Shadow Hills Class A) [P]; Dolby Atmos Renderer Guide v3.0 [P]; Masterdisk [P]; FIMI e SCF per l'ISRC [P]; forum SOS (Robjohns) [S].

## Numeri di riferimento

Tutti i valori letti il 2026-11-09. Principio da dire al cliente: **i livelli delle piattaforme sono livelli di riproduzione, non obblighi di consegna**. Spotify consiglia −14 LUFS e −1 dBTP come scelta ottimale per la sua riproduzione, ma accetta qualsiasi loudness e lo corregge in ascolto [P]. Le piattaforme senza documento pubblico sono marcate [S]: i loro valori sono misure di terzi e possono cambiare senza avviso.

**Normalizzazione delle piattaforme (musica stereo)**

| Piattaforma | Livello di riproduzione | Picco consigliato | Alza i brani piani? | Album o brano | Fonte |
|---|---|---|---|---|---|
| Spotify | −14 LUFS (ITU 1770); Premium può scegliere Loud −11 e Quiet −19 | sotto −1 dBTP; sotto −2 dBTP se il master è più forte di −14 LUFS | sì, finché resta 1 dB di margine sul picco reale (in Loud un limitatore a −1 dB di campione, attacco 5 ms, rilascio 100 ms) | album intero quando si ascolta l'album, brano in playlist e casuale | [P] Spotify for Artists, «Loudness normalization». Il web player e i dispositivi di terzi non normalizzano [P]. **Correzione** rispetto alla skill DJ: nessun «tetto di +5 dB» nella pagina Spotify |
| Apple Music (Sound Check) | nessun valore pubblicato da Apple (controllati: Apple Digital Masters PDF, Apple Support 109331 «If music in Apple Music sounds quiet», Video and Audio Asset Guide 5.3.19); −16 LUFS è una misura di terzi | almeno 1 dB di margine contro il clip | Apple dice che Sound Check alza o abbassa; quanto alzi non è documentato | per brano; può lavorare per album | [P] Apple Digital Masters (PDF) e Apple Support 109331 (che avverte anche che lo stereo può suonare più forte dell'Atmos); [S] per −16 LUFS (Production Expert 2022, iZotope). **Correzione:** la skill DJ lo dava come dato ufficiale |
| YouTube / YouTube Music | circa −14 LUFS (misure di terzi; «content loudness» in Statistiche per nerd) | −1 dBTP [S] | no, secondo misure di terzi | brano | [S] Production Advice; nessun valore in YouTube Help. [P] YouTube Help 14106294: il «Volume stabile» (compressione lato ascoltatore, attivo per impostazione) è **spento per YouTube Music e per i video musicali ufficiali** |
| Amazon Music | circa −14 LUFS (misure di terzi); Amazon documenta solo l'interruttore per l'ascoltatore | −2 dBTP secondo vari ingegneri [S] | no, secondo misure di terzi | brano [S] | [S]; nessuna specifica Amazon per artisti trovata |
| Tidal | −14 LUFS per album, sul brano più forte, attivo per impostazione | −1 dBTP [S] | no [S] | album anche in playlist [S] | [S] Grimm Audio (Eelco Grimm, autore della raccomandazione adottata da Tidal, 2017), audioXpress, iZotope; nessun articolo sul loudness nel centro di supporto Tidal (sezione «Audio Quality» controllata) |
| Deezer | −15 LUFS dichiarato da un membro dello staff nella community ufficiale Deezer (circa 2020), «may change in the future» | −1 dBTP [S] | non dichiarato | brano [S] | [S+] en.deezercommunity.com, thread «How does the Normalise Volume option work?»; Deezer Support, «Volume Normalization on Deezer»: solo l'interruttore per l'utente [P] |
| SoundCloud | normalizza in riproduzione; livello di riproduzione non dichiarato | consiglia master a −14 LUFS integrati e sotto −1 dBTP; sotto −2 dBTP se più forte di −14 (stesso testo dei consigli Spotify) | non dichiarato | non dichiarato | [P] SoundCloud Help, «Will SoundCloud play my track at the level it's mastered?» (letto via r.jina.ai) |

**Raccomandazione AES per lo streaming (AES TD1008, 24 set 2021)** [P]

| Contenuto | Loudness di distribuzione | Tolleranza superiore | Nota |
|---|---|---|---|
| Musica, normalizzazione per brano | −16 LUFS | +0,2 LU | integrato |
| Musica, normalizzazione per album | −14 LUFS sul brano più forte | +0,2 LU | l'album risulta tipicamente intorno a −16 LUFS |
| Parlato misurabile | −18 LUFS | +1 LU | dialog-gated |
| Interstiziali (pubblicità, promo) | −18 LUFS | +0,2 LU | |
| Picco reale | non oltre −1 dBTP all'ingresso del codificatore lossy | | per tutti i contenuti |

TD1008 sostituisce TD1004 (2015, finestra −16/−20 LUFS) [S]. Sono raccomandazioni ai **servizi**, non bersagli di mastering.

**Misura del loudness (definizioni)** [P]

| Grandezza | Valore | Fonte |
|---|---|---|
| Norma di misura | ITU-R BS.1770-5 (11/2023), in vigore; Apple cita ancora la -4 | ITU, Apple |
| Momentaneo | finestra mobile 0,4 s, senza gate | EBU Tech 3341-2023 |
| Breve termine | finestra mobile 3 s, senza gate; aggiornamento ≥ 10 Hz | EBU Tech 3341-2023 |
| Integrato | blocchi di 400 ms con 75% di sovrapposizione; gate assoluto −70 LUFS, relativo −10 LU | EBU Tech 3341-2023 |
| LRA | 10°-95° percentile dei valori a breve termine; gate assoluto −70 LUFS, relativo −20 LU; instabile nei primi 60 s | EBU Tech 3342, Tech 3341 |
| Calibrazione | seno stereo 1 kHz a −23 dBFS per canale = −23,0 LUFS; seno a −18 dBFS = −18,0 LUFS | EBU Tech 3341 (prova con ffmpeg superata il 2026-11-09) |
| Broadcast (solo riferimento) | −23,0 LUFS; ±1,0 LU **solo dove il target non è praticabile** (es. dirette), ±0,2 LU per gli errori di misura nel controllo qualità; picco reale ≤ −1 dBTP in produzione, tolleranza di misura ±0,3 dB (più basso in distribuzione, EBU Tech 3344). Dettaglio in `audio-per-immagine.md` | EBU R 128-2023 |
| Prova del misuratore | seno stereo 1 kHz −23 dBFS: M, S, I = −23,0 ±0,1 LUFS | EBU Tech 3341-2023, tabella 1 |

**Consegne digitali** [P salvo indicazione]

| Destinazione | Formato | Risoluzione | Note | Fonte |
|---|---|---|---|---|
| Spotify | FLAC preferito, WAV PCM (0x0001, non EXTENSIBLE) | ≥ 44,1 kHz; 24 bit se nativo, 16 solo se non esiste altro | un solo master stereo per brano, alla risoluzione nativa; riproduzione lossless fino a 44,1 kHz/24 bit FLAC; sotto 44,1/16 niente lossless | Spotify «Audio file formats» |
| Apple Music | WAV, ALAC, FLAC | 44,1-192 kHz, 16 o 24 bit; niente mono (doppio canale identico) | se esiste lo stereo, va usato | Apple Video and Audio Asset Guide 5.3.19 |
| Apple Digital Masters | come sopra | solo 24 bit, ≥ 44,1 kHz, risoluzione nativa; vietati upsampling e bit-padding | ascoltare la codifica AAC con droplet/AURoundTripAAC/Sonnox Pro-Codec; clip udibile può far perdere il badge | idem |
| Apple Hi-Res Lossless | come sopra | 24 bit a 88,2-192 kHz (44,1 e 48 non valgono) | | idem |
| Apple Dolby Atmos | ADM BWF, un file per brano | 24 bit LPCM a 48 o 96 kHz (il 96 è convertito a 48) | ≤ −18 LKFS integrati, ≤ −1 dBTP (BS.1770-4) per brano; niente banda piena nel LFE; confini gapless entro 0,5 s dallo stereo (oltre: warning, non blocco); nessun silenzio extra a fine brano; stessa frequenza di quadro nel progetto | idem |
| Apple 5.1 / 7.1 | LPCM in .mov | 48/96 kHz, 16/24 bit | stessi limiti −18 LKFS e −1 dBTP; vietati upmix da stereo e da 5.1 a 7.1 | idem |
| Dolby Atmos (loudness) | misura sulla resa Atmos nel Renderer | | Dolby: «−18 LKFS ±2 LU» (risposta su forum, 2021); binaurale tipicamente un paio di LU più forte | Dolby Professional Support |
| Dolby Atmos per podcast e audiolibri (solo per confronto) | | | −20 LKFS ±2, picco −0,1 dBTP: **non** vale per la musica | [S] estratto della pagina Dolby «Example Delivery Specification» |
| CD | DDP (per CD versione 2.0, addendum CD-Text) | Red Book 44,1 kHz/16 bit, fino a 79:57 [S] | dither alla riduzione a 16 bit | DCA [P]; Red Book [S] |

**Consegna dal mix al mastering** (std: prassi di studio, non norma; chiedere sempre la specifica del mastering engineer scelto)

| Voce | Valore di partenza |
|---|---|
| Formato | WAV 24 bit o 32 bit float, frequenza della sessione, nessun ricampionamento |
| Picco | sotto 0 dBFS, tipicamente fra −6 e −3 dBFS; nessun clip |
| Limitatore sul bus | no (eventuale versione limitata solo come riferimento d'ascolto) |
| Compressione/EQ di bus | sì se fanno parte del suono del mix, dichiarate |
| Code e inizi | mezzo secondo di silenzio prima e la coda intera dopo, niente dissolvenze tagliate |
| Nome file | titolo, versione, frequenza e bit (es. `Titolo_MIX_v3_48k24.wav`) |
| Da allegare | reference, note su dissolvenze e pause, tracklist, ISRC se già assegnati |

**Correzione** rispetto alla skill DJ: lì si chiedeva un «livello medio di programma intorno a −6/−8 dBFS» insieme a picchi a −3 dBFS: è incoerente (un medio a −6 dBFS con picco a −3 dBFS è un mix già schiacciato). Qui non si prescrive un loudness per il mix.

**Vinile: durata massima per lato** [P: Standard Vinyl, FAQ «How much music can you fit on a vinyl record?» e pagine prodotto, lette 2026-11-09; è il limite di una fabbrica, non una norma]

| Formato | Valore | Fonte |
|---|---|---|
| 7″ a 45 giri | fino a 6 min (lacca e DMM); la pagina prodotto dice «circa 5,5» | [P] Standard Vinyl |
| 10″ a 33⅓ giri | fino a 15 min | [P] Standard Vinyl |
| 10″ a 45 giri | fino a 10 min nella FAQ, 12 nella pagina prodotto: usare 10 | [P] Standard Vinyl (incoerenza interna) |
| 12″ a 33⅓ giri, lacca | fino a 25 min; oltre 22 min sovrapprezzo e possibili interventi su EQ e livello | [P] Standard Vinyl |
| 12″ a 33⅓ giri, DMM | fino a 28 min | [P] Standard Vinyl |
| 12″ a 45 giri | fino a 15 min | [P] Standard Vinyl |
| 12″ a 33⅓, ottimale | 15-20 min per un compromesso fra risposta, livello e durata | [S] Sound On Sound; varie fabbriche e tagliatori |

La durata possibile dipende da quantità di basse, livello e contenuto stereo in basso, non solo dai minuti: un lato lungo si taglia più basso, e a livello più basso il basso stereo dà meno problemi [P: Masterdisk]. Manuali Neumann VMS: non trovati in rete (da verificare).

**Ascolto Dolby Atmos** [P: Dolby, Best Practices for Dolby Atmos Music Studios]

| Voce | Valore |
|---|---|
| Disposizione minima | 7.1.4; riferimento 9.1.4 o 9.1.6 |
| Livello di ascolto calibrato | 85 dBC con +20 dB di headroom; 79-82 dBC nelle stanze piccole |
| Risposta di ogni diffusore | 40 Hz-18 kHz ±3 dB |
| Subwoofer | almeno 31,5-150 Hz |
| LFE (con ascolto a 85 dBC) | 89-91,5 dBC, con almeno 23 dB in più disponibili |
| Ingressi del Renderer | 128: 1-10 bed 7.1.2, 11-128 oggetti e bed aggiuntivi, fino a 118 canali oggetto [P: Dolby Atmos Renderer Guide v3.0] |

Fonti: Spotify for Artists, «Loudness normalization» e «Audio file formats» [P]; Apple Digital Masters (PDF, 8 pagine) e Apple Video and Audio Asset Guide 5.3.19 dell'8 set 2026 [P]; AESTD1008.1.21-9 [P, via Wayback]; ITU-R BS.1770 [P]; EBU R 128-2023, Tech 3341-2023, Tech 3342-2023 [P]; Dolby Professional Support (forum e Best Practices), pagina Dolby Atmos Renderer e Renderer Guide v3.0 [P]; DCA DDP [P]; Deezer Support [P per l'interruttore]; SoundCloud Help [P]; Apple Support 109331 [P]; YouTube Help 14106294 [P]; Standard Vinyl (FAQ e pagine prodotto) [P]; Masterdisk [P]; per YouTube, Amazon, Tidal, Deezer (valori), vinile ottimale: ricerca web con estratti di Production Advice, iZotope, audioXpress, fabbriche [S]. Tutto letto il 2026-11-09.

## Errori che si sentono

- **Master troppo forte** → in normalizzazione suona più piccolo e piatto dei brani accanto, transienti di cassa e rullante senza schiocco, distorsione sui picchi dopo la codifica → scegliere il loudness per il suono, picco reale ≤ −1 dBTP (≤ −2 se più forte di −14 LUFS su Spotify [P]); ascoltare con la normalizzazione attiva.
- **Clip intercampione** → durezza «a grana» sui picchi forti dopo la conversione in AAC/Ogg, anche se il meter di picco segnava −0,1 → limitatore a picco reale, controllo con `afclip` e con AURoundTripAAC [P: Apple].
- **Basso che sparisce sul telefono** → nel mix in studio il basso c'è, sullo smartphone resta solo la cassa → armoniche del basso (saturazione o strato medio), controllo su un piccolo altoparlante.
- **Basso enorme in una stanza non trattata** → il mix rimbomba in auto o è vuoto in cuffia → riferimento in cuffia e su più impianti, reference allo stesso loudness, analizzatore solo come conferma.
- **Mix che crolla in mono** → in mono spariscono cori, synth larghi o riverberi, il basso si assottiglia → controllo mono periodico, basso al centro, allargamento da esecuzioni reali più che da effetti di fase.
- **Sibilanti** → «S» che pungono, peggiori dopo il mastering e terribili sul vinile → de-essing nel mix, non nel mastering; controllo a volume alto.
- **Riverbero che impasta** → la voce sembra lontana e il mix fangoso nei bassi medi → pre-delay, filtri sul ritorno, ducking, meno spazi diversi.
- **Pompaggio non voluto** → il mix «respira» con la cassa anche dove non dovrebbe → sidechain solo in basso, attacco/rilascio del bus più lenti, meno riduzione.
- **Mix schiacciato consegnato al mastering** → il mastering engineer non ha margine e il master suona uguale o peggio → consegna senza limitatore (std).
- **Album pareggiato brano per brano** → la ballata è forte come il pezzo veloce e l'album non respira → livelli relativi decisi ascoltando le transizioni; normalizzazione per album sulle piattaforme che la fanno [P: Spotify; AES TD1008].
- **Atmos «finto»** → lo stereo spalmato intorno con riverbero, voce che si sposta in cuffia → è vietato da Apple [P]; partire dal multitraccia, controllare il binaurale.
- **Stem che non sommano** → riassemblati in post o al mastering, il mix non torna (più forte, più compresso, effetti persi) → test di somma in controfase prima della consegna.
- **Mastering AI su un mix sbagliato** → più brillante e più forte, con i difetti del mix ingranditi → mix approvato prima, AI solo come prova rapida, confronto allo stesso loudness.
- **Confronto a volumi diversi** → il cliente approva la versione «più forte», non la migliore → pareggio del loudness in ogni ascolto di revisione.

Fonti: Spotify for Artists [P]; Apple Digital Masters e Video and Audio Asset Guide [P]; AES TD1008 [P]; il resto è pratica di mestiere (std) dalla skill DJ `music-production-mixing-mastering` §8, riformulata. Letto il 2026-11-09.

## Novità

| Data | Novità | Perché conta per {{STUDIO}} | Fonte |
|---|---|---|---|
| 2025-09-02 | iZotope Ozone 12: Stem EQ (separazione dentro il mastering), Bass Control, Unlimiter, limitatore IRC 5, Master Assistant con flusso Custom (profili di genere, reference, target LUFS) | il mastering «in casa» ora può correggere rapporti dentro un file stereo: utile per provini, rischioso se usato al posto del mix | funzioni [P: pagina Ozone 12]; data [P: iZotope Product News, articolo di lancio del 2 set 2025] |
| 2025-09-10 | Spotify lossless per Premium, fino a 24 bit/44,1 kHz FLAC; la normalizzazione vale anche per il lossless | consegnare 24 bit nativi ha un effetto udibile su Spotify; il master oltre 44,1 kHz viene convertito | formato e normalizzazione [P: Spotify «Audio file formats», «Loudness normalization»]; data di lancio [P: Spotify Newsroom, 10 set 2025, distribuzione graduale «in select markets»] |
| 2026-01-15 | FabFilter Pro-C 3 (sei nuovi stili, modalità di carattere, supporto immersivo/Dolby Atmos) e Pro-Q 4.10 (controllo di più istanze di Pro-C 3, Pro-DS e Pro-G da un solo Pro-Q) | compressione standard ora pronta anche per sessioni Atmos | [P: FabFilter news] |
| 2026-05-19 | oeksound soothe3: modo Soft adattivo, Hard come soothe2, bassa latenza (usabile in registrazione), multicanale fino a 9.1.6, fase lineare | **correzione** rispetto alla skill DJ, che citava soothe2 come attuale | funzioni [P: oeksound]; data [P: changelog oeksound, v1.0.3 «Initial release» del 19 mag 2026] |
| 2026-09-08 | Apple Video and Audio Asset Guide 5.3.19: Atmos accettato anche a 96 kHz (convertito a 48 kHz in uscita) | nuove consegne Atmos possono restare a 96 kHz | [P: Apple] |
| vigente al 2026-11-09 | Apple: Atmos solo da multitraccia o stem da multitraccia; vietati upmix, de-mixing dallo stereo, stereo con ambienza; i contenuti non conformi possono essere rimossi | la separazione AI degli stem non è una via ammessa per fare l'Atmos di un catalogo | [P: Apple]; data di introduzione della regola: da verificare (la tabella «Previous Guide Revisions», letta, indica solo «Clarified Dolby Atmos audio» nella 5.3.8 del 4 ott 2021 e aggiornamenti dei profili immersivi nella 5.3.10 del 27 feb 2023, senza dire quale versione introduce il divieto) |

Fonti: indicate per riga. Lette il 2026-11-09.

## Verifica del 2026-11-09

- **[P] letti alla fonte:** Spotify for Artists (normalizzazione e formati); Apple Digital Masters (PDF) e Video and Audio Asset Guide 5.3.19 (stereo, ADM, Hi-Res, Atmos, 5.1/7.1); Dolby (Best Practices studi Atmos, risposta su forum, pagina Renderer, letti in Chrome); ITU-R BS.1770-5; EBU R 128, Tech 3341, Tech 3342; AES TD1008 (via Wayback); IFPI ISRC; DCA DDP; manuali UA 1176LN, Manley Variable Mu, SSL Bus Compressor 2; FabFilter, oeksound, iZotope, LANDR; una fabbrica di vinile (Standard Vinyl). Misuratore ffmpeg provato sul segnale EBU.
- **Restano [S] o aperti (prima stesura; in parte chiusi dalla verifica indipendente qui sotto):** i valori di Apple Sound Check (−16), YouTube, Amazon, Tidal, Deezer e SoundCloud: le piattaforme non pubblicano una specifica per artisti (pagine provate: YouTube Help, Amazon, supporto Tidal in Chrome senza risultati, SoundCloud e Tidal bloccati da verifica anti-bot con curl). Ripartizione 7.1.2 + 118 oggetti (Renderer Guide PDF non aperto). Valori del bus SSL classico. Shadow Hills, LA-2A, Fairchild (descrizioni std/[S]). Agenzia ISRC italiana. Compenso maggiore Apple per lo Spatial Audio. eMastered (pagina solo JavaScript). Date di uscita di Ozone 12, soothe3 e Spotify lossless (funzioni lette, date da stampa).
- **Correzioni rispetto alle skill DJ:** niente «tetto +5 dB» Spotify (il limite è il margine di picco); −2 dBTP per master forti su Spotify; Apple −16 LUFS non è un dato Apple; Tidal, Amazon, YouTube, Deezer, SoundCloud da «fatti» a misure di terzi; soothe2 → soothe3; Pro-C 2 → Pro-C 3; incoerenza «medio −6/−8 dBFS» nella consegna al mastering rimossa; aggiunti AES TD1008 e le regole Apple sull'Atmos.
- **Verifica indipendente (2026-11-09, secondo verificatore):** riaperte 22 fonti [P] (Spotify normalizzazione, formati e Newsroom; Apple Digital Masters PDF, Asset Guide 5.3.19, Support 109331; Dolby Renderer Guide; EBU R 128-2023, Tech 3341-2023, Tech 3342-2023; ITU BS.1770; AES TD1008; Standard Vinyl; FabFilter, oeksound, iZotope; UA; FIMI, SCF; SoundCloud; YouTube Help; Masterdisk): i valori Spotify, Apple Atmos e AES coincidono. **Promossi a [P]:** SoundCloud (−14 LUFS, −1/−2 dBTP), 7.1.2 + 118 oggetti, DMM 28 min e durate 7″/10″, agenzia ISRC (FIMI), date di Ozone 12, soothe3, Spotify lossless, LA-2A e Shadow Hills (UA). **Corretti:** tolleranza R 128 (±1 LU solo dove il target non è praticabile, non in generale); versione AES (1.21-9, non «v3.13»); attribuzione del «mito» delle basse mono (Masterdisk, non SOS); Spotify *consiglia* −14 LUFS nei Mastering tips (non lo impone); Deezer −15 attribuito allo staff della community; YouTube: Volume stabile spento per musica. **ffmpeg** rieseguito (9.0.1): output conforme; il true peak su segnale intercampione legge +0,6 dB sopra la teoria. **Aperti:** −16 LUFS di Apple (assente in tre documenti Apple), YouTube, Amazon, Tidal (nessuna pagina ufficiale); manuali Neumann VMS; tempi Fairchild (manuale UA bloccato, 403); bus SSL classico; compenso Apple per lo Spatial Audio; eMastered. Doppione: riga Spotify di `misura-analisi-ai.md` ridotta a rimando a questo file.
