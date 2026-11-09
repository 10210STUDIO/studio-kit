# Live, palco ed eventi

Copre chi fa suonare un concerto, un DJ set, un lancio di prodotto, una sfilata o una conferenza: ruoli, catena tecnica, rider, radiofrequenze, timecode, livelli e regole italiane. Serve a chi in {{STUDIO}} produce o dirige un evento (producer, account, direzione creativa) per briefare il service audio e capire che cosa sta comprando, e a chi deve controllare un rider o una ripresa audio del live.
Non copre la scenografia e il live come linguaggio visivo (`atlante-culturale/references/musica-intrattenimento.md`, «Live e scenografia»), la SIAE e i diritti dell'evento (`atlante-culturale/references/industria-musicale.md`, «Regole del settore», e la skill `rights-licensing-clearance`), il mix e il master in studio (gli altri file di questa skill).
Legenda: [P] = letto alla fonte primaria il 2026-11-09; [S] = fonte secondaria o vendor, letta ma non confermata alla fonte; **std** = fisica o pratica di mestiere consolidata, scritta senza una fonte aperta in questa sessione; «di partenza» = valore per cominciare, non una regola.

## Lessico

- **Regia di sala (FOH, front of house):** la postazione del fonico in mezzo al pubblico e, per estensione, il mix che sente il pubblico.
- **Palco / monitor (monitor world):** la postazione, spesso a lato palco, da cui si fanno i mix per i musicisti.
- **Stagebox (stage box, stage rack):** scatola di ingressi e uscite sul palco che converte i segnali e li manda al mixer su un solo cavo o una rete.
- **Split (splitter):** la divisione di ogni ingresso verso più mixer (sala, palco, broadcast); oggi spesso digitale, sulla rete.
- **Lista ingressi (input list):** tabella numerata di ogni sorgente: canale, strumento, microfono o DI, asta, phantom, note.
- **Pianta di palco (stage plot):** disegno dall'alto con posizioni di musicisti, ampli, spie, prese di corrente e linee.
- **Rider tecnico (technical rider):** il documento dell'artista che dice che cosa serve per suonare: impianto, mixer, microfoni, backline, tempi, personale.
- **Prova linee (line check):** controllo che ogni ingresso arrivi pulito al canale giusto, senza musicisti o con un tecnico che batte e parla.
- **Soundcheck (soundcheck):** la prova con i musicisti per impostare suoni, mix di palco e scene.
- **Cambio palco (changeover):** il tempo fra un artista e il successivo in cui si smonta e si rimonta il palco.
- **Line array (line array):** colonna appesa di diffusori accoppiati che si comportano come una sola sorgente controllata in verticale.
- **Diffusore puntiforme (point source):** un diffusore che lavora da solo con la propria dispersione, senza accoppiarsi in colonna.
- **Sub cardioide (cardioid sub array):** gruppo di sub disposti e ritardati per cancellare il basso dietro (sul palco) e tenerlo davanti.
- **End-fire (end-fire array):** sub in fila uno dietro l'altro, verso il pubblico, ritardati per sommarsi davanti e cancellarsi dietro.
- **Front fill / out fill / delay (front fill, out fill, delay fill):** diffusori aggiuntivi per le prime file, i lati e le zone lontane, ritardati sul principale.
- **Allineamento (time alignment):** regolazione dei ritardi perché più sorgenti arrivino in fase nel punto di ascolto.
- **Ottimizzazione dell'impianto (system tuning):** misura ed equalizzazione dell'impianto nel luogo, prima che arrivi il fonico.
- **Funzione di trasferimento (transfer function):** misura a due canali che confronta il segnale mandato con quello captato, in ampiezza e fase.
- **Coerenza (coherence):** indice di quanto la misura è affidabile (rumore, riflessioni); bassa coerenza = dato da non usare.
- **Spia (wedge):** monitor a pavimento inclinato verso il musicista.
- **Side fill (side fill):** diffusori ai lati del palco per dare a tutto il palco un mix comune.
- **In-ear (IEM, in-ear monitor):** auricolari con mix personale, quasi sempre via radio.
- **Larsen (feedback):** il fischio o il rimbombo che nasce quando il microfono riprende il diffusore e il giro si autoalimenta.
- **Guadagno prima del larsen (gain before feedback, GBF):** quanto si può alzare un microfono prima che inneschi.
- **Click (click track):** metronomo che sentono solo i musicisti, in cuffia.
- **Guida (cue track, guide):** voce registrata nelle cuffie dei musicisti che annuncia le parti («strofa», «due, tre, quattro»).
- **Basi (playback, tracks):** parti registrate che suonano insieme alla band dal vivo.
- **Timecode (SMPTE timecode, LTC, MTC):** orologio in ore:minuti:secondi:fotogrammi che sincronizza audio, luci, video ed effetti.
- **Show control (show control):** il sistema che fa partire luci, video, effetti e basi dallo stesso segnale.
- **Rig ridondante (redundant rig):** due computer di playback identici in parallelo con commutazione automatica se il primo si ferma.
- **Coordinamento frequenze (frequency coordination):** il piano delle frequenze radio di tutti i radiomicrofoni e in-ear dell'evento, senza interferenze.
- **Intermodulazione (intermodulation, IMD):** frequenze spurie nate dalla somma di più trasmettitori, che cadono su altri canali.
- **Backline (backline):** gli strumenti e gli amplificatori sul palco (batteria, ampli, tastiere), forniti dall'artista o dal service.
- **Scena (scene, snapshot):** memoria del mixer che richiama tutte le impostazioni di un brano o di un momento.
- **DCA / VCA (DCA, VCA):** fader di controllo che alzano o abbassano un gruppo di canali senza sommare l'audio.
- **Rete audio (audio network: Dante, MADI, AES67, Milan):** il trasporto digitale di molti canali su un cavo o una rete.
- **Mix per la ripresa (broadcast mix, program feed):** il mix separato fatto per la diretta, la registrazione o lo streaming.
- **Microfoni ambiente (audience mics):** microfoni che riprendono il pubblico e la sala per il mix della ripresa.
- **Coprifuoco (curfew):** l'ora in cui il suono deve fermarsi per l'autorizzazione o il contratto.
- **LAeq, LASmax, LCpeak (LAeq, LASmax, LCpeak):** livello medio ponderato A, massimo con costante lenta ponderato A, picco ponderato C; sono gli indici delle norme sui livelli.

Fonti: lessico di mestiere (std); definizioni di LAeq e LASmax dal DPCM 215/1999 e dal D.M. 16/3/1998 richiamato, di LCpeak dal WHO Global standard 2022 [P, letti 2026-11-09].

## Mestieri

#### Fonico di sala (FOH engineer)
- **Fa:** fa il mix che sente il pubblico, dalla regia in mezzo alla sala. Riceve gli ingressi dallo split, lavora sull'impianto che gli consegna il system engineer e decide equilibrio, dinamica ed effetti brano per brano. In tour è spesso il riferimento sonoro dell'artista.
- **Consegna:** il concerto; il file di show del mixer (sessione con scene, nomi, routing) salvato e copiato; la lista ingressi e il rider audio aggiornati; su richiesta la registrazione multitraccia dello show.
- **Strumenti standard:** DiGiCo (serie Quantum e SD), Avid VENUE S6L, Yamaha RIVAGE PM, Allen & Heath dLive, Midas HD96 (la serie Midas PRO è fuori produzione, si trova ancora a noleggio [S]); plug-in esterni (Waves SuperRack, Fourier); registrazione multitraccia su Pro Tools, Reaper o registratori dedicati via rete.
- **Come si briefa:** genere e riferimenti di suono (anche dischi), durata e scaletta, scaletta degli interventi parlati, capienza e tipo di luogo, limiti di livello (norma e coprifuoco), se c'è ripresa o diretta e chi la mixa, se deve consegnare la multitraccia e con quali diritti di uso.
- **Segno di livello alto:** il primo brano suona già, senza «aggiustare» per tre pezzi; voce sempre comprensibile; livello costante e sotto il limite senza che il pubblico lo percepisca come «basso»; file di show ordinato che un sostituto può aprire.
- **Errore comune:** alzare il volume per ottenere energia invece di lavorare su dinamica e chiarezza; chi lo briefa dimentica di dire chi possiede la registrazione multitraccia.

#### Fonico di palco (monitor engineer)
- **Fa:** fa i mix per i musicisti (spie, side fill, in-ear), uno per persona o per gruppo. Riceve gli stessi ingressi della sala dallo split e lavora in contatto continuo con il palco, spesso con segnali a mano. Viene prima del FOH nel soundcheck: senza palco a posto non si suona.
- **Consegna:** i mix di palco stabili per tutto lo show; il file di show; il piano delle linee in-ear e spie; la gestione del talkback fra musicisti e tecnici.
- **Strumenti standard:** gli stessi banchi della sala (DiGiCo è molto diffuso al palco), in-ear Shure Axient Digital PSM (il PSM 1000 è fuori produzione ma ancora molto diffuso a noleggio [P: shure.com]), Sennheiser (serie 2000 IEM, ew IEM G4, Spectera), auricolari personalizzati (JH Audio, Ultimate Ears), wedge del service.
- **Come si briefa:** numero di musicisti e chi usa in-ear o spie, se c'è click e chi lo sente, chi parla dal palco (presentatore, ospiti), se servono microfoni per il pubblico o ambienti in in-ear.
- **Segno di livello alto:** l'artista non chiede nulla durante lo show; palco a basso livello (meno rientro nei microfoni, sala più pulita); risposta immediata a un segnale a mano.
- **Errore comune:** portare tutto in su a ogni richiesta finché il palco è più forte della sala; nei piccoli eventi, non prevederlo affatto e far fare il palco al fonico di sala.

#### System engineer / tecnico PA (system engineer, systems tech)
- **Fa:** progetta, appende, allinea e misura l'impianto (line array, sub, fill, ritardi) prima che arrivi il fonico, e lo sorveglia durante lo show (livelli, temperatura degli amplificatori, rete). Sta fra il mixer e i diffusori: possiede processori e amplificazione.
- **Consegna:** il progetto di simulazione (file Soundvision, ArrayCalc, MAPP 3D o DISPLAY) con copertura e livelli previsti; il piano di rigging con pesi e punti di appendimento; le misure dopo la messa a punto; i registri dei livelli quando sono richiesti.
- **Strumenti standard:** software di simulazione del costruttore (L-Acoustics Soundvision, d&b ArrayCalc, Meyer Sound MAPP 3D, Martin Audio DISPLAY), software di controllo (L-Acoustics LA Network Manager, d&b R1, Meyer Nebra, giunto a Nebra 2 a marzo 2026, con Compass ancora supportato ma senza sviluppo [P: meyersound.com]), misura con Smaart (Rational Acoustics); il SIM 3 di Meyer è fuori produzione [P: documentazione Meyer, «Legacy»] e si trova solo usato, microfoni di misura, analizzatori di rete.
- **Come si briefa:** pianta quotata del luogo e della zona pubblico, altezze e portate utili per appendere (dalla struttura o dal teatro), posizione della regia, abitazioni vicine e limiti di livello, eventuali zone da tenere silenziose (ristorante, area stampa, backstage).
- **Segno di livello alto:** copertura uniforme dalla prima all'ultima fila (pochi dB di differenza); basso sul palco ridotto; tutto simulato prima di arrivare, non deciso sul posto.
- **Errore comune:** impianto scelto per potenza e marchio invece che per copertura; chi briefa non dà la pianta e il service porta «quello che ha».

#### Tecnico RF (RF coordinator, RF technician)
- **Fa:** scansiona lo spettro sul posto, calcola il piano delle frequenze per radiomicrofoni, in-ear, intercom e talkback, posiziona antenne e distribuzioni e sorveglia lo spettro durante lo show. Lavora prima di tutti gli altri: le frequenze si chiedono settimane prima.
- **Consegna:** il piano frequenze (file di Shure Wireless Workbench o Sennheiser WSM), le richieste di autorizzazione al MIMIT quando servono, l'etichettatura dei trasmettitori, il registro degli eventi radio durante lo show.
- **Strumenti standard:** Shure Wireless Workbench, Sennheiser WSM (serie 2000, G4, EW-DX) e, per Spectera, WebUI e SoundBase (LinkDesk è il programma precedente) [P: sennheiser.com], analizzatori di spettro (RF Explorer, Tektronix, Rohde & Schwarz), antenne direttive e combinatori.
- **Come si briefa:** numero di radiomicrofoni, in-ear e intercom di tutti i fornitori presenti (anche video, regia, sicurezza, catering con walkie-talkie), date e orari, indirizzo esatto, altri eventi vicini lo stesso giorno.
- **Segno di livello alto:** nessun buco o fruscio durante lo show; piano con frequenze di riserva già calcolate; dialogo con gli altri reparti sulle radio prima del montaggio.
- **Errore comune:** nessuno coordina le radio dei diversi fornitori e ognuno sceglie da sé; chi briefa non sa che servono 15 giorni per un'autorizzazione temporanea.

#### Backliner (backline technician)
- **Fa:** monta, accorda e cura strumenti e amplificatori della band (chitarre, batteria, tastiere), li cambia durante lo show e li ripara al volo. Sta prima dei microfoni: ciò che fa il backliner è la sorgente.
- **Consegna:** strumenti pronti e accordati, set di ricambio, palco in ordine per i cambi, lista del backline da noleggiare.
- **Strumenti standard:** accordatori, kit di manutenzione, flight case, sistemi di cambio rapido; per le tastiere spesso anche i computer di suono (MainStage, Gig Performer).
- **Come si briefa:** il rider backline dell'artista (marchi e modelli), che cosa porta l'artista e che cosa si noleggia sul posto, tempi di cambio fra artisti.
- **Segno di livello alto:** cambio di chitarra nel buio senza perdere una battuta; ricambi pronti per tutto ciò che si rompe (corde, pelli, cavi, alimentatori).
- **Errore comune:** noleggiare «equivalenti» non concordati di ciò che chiede il rider; l'artista lo scopre al soundcheck.

#### Stage manager e production manager (stage manager, production manager)
- **Fa:** il production manager pianifica e tiene il budget e i tempi di tutta la parte tecnica (audio, luci, video, strutture, trasporti, permessi); lo stage manager governa il palco nel giorno dello show: orari, cambi, sicurezza, chiamate. Stanno sopra tutti i reparti.
- **Consegna:** il programma di produzione (orari di carico, montaggio, prove, apertura porte, show, smontaggio), il contatto unico fra artista, location e fornitori, la documentazione di sicurezza; per i palchi in Italia il Decreto interministeriale 22/7/2014 (attuativo dell'art. 88 c. 2-bis del D.Lgs. 81/2008) applica le regole dei cantieri (Titolo IV) al montaggio e smontaggio di opere temporanee, compresi impianti audio e luci: piano di sicurezza e coordinamento e piani operativi con i contenuti dell'allegato III; restano fuori, fra gli altri, pedane fino a 2 m, americane su stativi fino a 6 m o su torri fino a 8 m, strutture prefabbricate di un solo fabbricante fino a 7 m montate secondo le sue istruzioni [P: testo del decreto nell'appendice al Testo unico 81/08 del Ministero del lavoro, ed. giugno 2016; avviso in GU n. 183 dell'8/8/2014]. Istruzioni operative: circolare del Ministero del lavoro n. 35 del 24/12/2014 [S].
- **Strumenti standard:** fogli di produzione, intercom (Clear-Com, Riedel), radio, software di pianificazione; per la sicurezza il piano di emergenza e i permessi del luogo.
- **Come si briefa:** è lui che riceve il brief di {{STUDIO}}: obiettivo dell'evento, scaletta, pubblico, budget, luogo, orari vincolanti (coprifuoco), contatti del cliente e chi decide sul posto.
- **Segno di livello alto:** l'evento parte all'orario scritto; tutti i reparti hanno lo stesso programma aggiornato; un problema arriva a chi può risolverlo in un minuto.
- **Errore comune:** il cliente parla direttamente con i singoli fornitori e cambia le cose senza passare dal production manager.

#### Tecnico playback / MD tech (playback engineer, MD tech)
- **Fa:** gestisce i computer che suonano basi, click, guide e timecode durante lo show, e spesso le tastiere e i cambi di suono. Lavora con il direttore musicale (MD) della band; manda gli stem al palco e alla sala e il timecode a luci e video.
- **Consegna:** la sessione di playback (Ableton Live, Pro Tools o altro) con un brano per scena, la mappa delle uscite (stem, click, guida, timecode), un rig ridondante provato, la documentazione per un sostituto.
- **Strumenti standard:** Ableton Live o Pro Tools in playback, due computer con interfacce identiche, commutatori di ridondanza (per esempio Radial, DirectOut, iConnectivity), controller MIDI, timecode LTC come traccia audio o generatore dedicato.
- **Come si briefa:** quali parti sono registrate e quali dal vivo, la scaletta con i brani e i tempi, che cosa deve essere sincronizzato (luci, video, effetti speciali), chi ha i diritti sulle basi e sugli stem.
- **Segno di livello alto:** il computer principale può spegnersi a metà brano e il pubblico non se ne accorge; nomi e colori delle uscite uguali sulla sessione e sul mixer.
- **Errore comune:** un solo computer, una sola interfaccia, nessuna prova di commutazione; basi consegnate già mixate in stereo, senza stem separati, così il fonico non può bilanciarle con la band.

#### Tecnico DJ (DJ tech)
- **Fa:** monta e verifica la postazione DJ (lettori, mixer, monitor DJ, rete fra lettori), prepara la configurazione del rider e assiste il DJ durante il set. Sta fra il DJ e il fonico di sala: l'uscita del mixer DJ è un ingresso del FOH.
- **Consegna:** postazione cablata e testata, lettori aggiornati allo stesso firmware, chiavette o account di prova letti, monitor DJ a livello, uscita verso la sala a livello concordato.
- **Strumenti standard:** lettori AlphaTheta (ex Pioneer DJ) CDJ-3000 e CDJ-3000X, mixer Pioneer DJ DJM-A9 e DJM-V10 (ancora a catalogo su pioneerdj.com [P]), rekordbox; Serato DJ Pro e Traktor con controller o interfacce; giradischi Technics SL-1200 per i set in vinile.
- **Come si briefa:** il rider del DJ (modelli, numero di lettori, giradischi), il software usato, se serve rete internet per lo streaming dei brani, ora e durata del set, chi suona prima e dopo (cambio senza silenzio).
- **Segno di livello alto:** cambio fra due DJ senza un secondo di silenzio; monitor DJ chiaro e non più forte della sala; lettori collegati in rete con il link funzionante prima che il DJ arrivi.
- **Errore comune:** lettori di modelli o firmware diversi fra loro; mixer DJ messo in saturazione (rosso fisso) dal DJ e il fonico che non ha margine.

#### Fonico per eventi aziendali e conferenze (corporate AV engineer, A1/A2)
- **Fa:** fa sentire bene la voce: relatori, presentatore, video con audio, collegamenti remoti, traduzione simultanea. Il primo fonico (A1) mixa; il secondo (A2) mette i microfoni ai relatori e gestisce il palco.
- **Consegna:** voce comprensibile in tutta la sala, mix per la ripresa video e per lo streaming, il ritorno ai relatori remoti senza la loro voce (mix-minus), la registrazione separata delle voci.
- **Strumenti standard:** banchi digitali Yamaha (DM7, DM3; CL e QL sono fuori produzione dal 2025 ma ancora nei parchi noleggio [S: Yamaha USA, FOH]), Allen & Heath (dLive, Avantis, SQ), radiomicrofoni ad archetto e lavalier (DPA, Shure, Sennheiser), microfoni a collo di cigno, mixer automatici per i panel (Dugan su Yamaha e altri), interfacce per Zoom e Teams.
- **Come si briefa:** scaletta minuto per minuto con chi parla e con quale microfono, video con audio e loro formati, relatori remoti, lingue e traduzione, se c'è diretta e su quale piattaforma, prove con i relatori (orario).
- **Segno di livello alto:** nessun rumore di fruscio del lavalier sulla camicia; il relatore che si gira non sparisce; il passaggio fra video e voce senza buchi né salti di livello.
- **Errore comune:** lavalier sul petto per relatori che girano la testa o hanno voce debole (meglio un archetto); nessuna prova con i relatori remoti fino al momento dell'intervento.

#### Fonico per broadcast e streaming di un live (broadcast mix engineer)
- **Fa:** fa un mix diverso da quello di sala per chi ascolta in cuffia, in TV o sul telefono: niente rinforzo della sala, più ambiente del pubblico, livello e loudness costanti. Lavora da un furgone regia o da una stanza separata, sullo split degli ingressi.
- **Consegna:** il mix per la diretta (stereo, a volte 5.1 o immersivo), il loudness richiesto dal canale, la multitraccia registrata, eventuali stem per la post-produzione.
- **Strumenti standard:** banchi broadcast (Lawo, Calrec, SSL System T) o gli stessi banchi live; misuratori di loudness conformi a ITU-R BS.1770; microfoni ambiente; codec ed encoder per lo streaming.
- **Come si briefa:** piattaforma e specifiche (loudness, formato, bitrate), durata, se si consegna anche una versione montata dopo, chi possiede la registrazione e quali diritti servono (artista, etichetta, SIAE: vedi `industria-musicale.md`).
- **Segno di livello alto:** il pubblico si sente ma non copre la voce; il livello non salta fra parlato e musica; nessuna distorsione nei momenti forti.
- **Errore comune:** mandare in diretta il mix di sala (che senza la sala è squilibrato: poco basso, voce troppo alta o troppo bassa, nessun pubblico).

#### Lighting designer e video/LED (lighting designer, video engineer) — solo per coordinarsi
- **Fa:** progetta e manda la luce e i contenuti video; per l'audio contano tre punti: il timecode che comanda le loro scene, lo spazio e i pesi sulle strutture (le luci e i LED competono con i line array per i punti di appendimento), e il rumore delle macchine (fumo, ventole) sul palco.
- **Consegna:** per il coordinamento con l'audio: frame rate del timecode, punti e pesi di rigging, posizione della regia luci accanto al FOH.
- **Strumenti standard:** console grandMA3, ChamSys, Hog; media server disguise, Resolume; per il resto vedi l'atlante.
- **Come si briefa:** con l'audio nella stessa riunione tecnica, mai separati; il linguaggio visivo si dirige con `atlante-culturale/references/musica-intrattenimento.md`.
- **Segno di livello alto:** una sola sorgente di timecode per tutti; pesi dichiarati in anticipo.
- **Errore comune:** schermo LED appeso dove doveva andare il line array, o davanti alla sua traiettoria.

Fonti: ruoli e strumenti da pratica di mestiere (std); i nomi di prodotto sono di conoscenza di mestiere, non riletti uno per uno sulle pagine dei costruttori: prima di metterli in un preventivo, controllare che il modello sia ancora a catalogo. Verificati [P] il 2026-11-09: CDJ-3000X (AlphaTheta), DJM-A9 e DJM-V10 (pioneerdj.com), Spectera (Sennheiser, scheda Base Station v2.0), DM5 (Yamaha), PSM 1000 fuori produzione e Axient Digital PSM a catalogo (shure.com), SIM 3 fuori produzione e Nebra 2 (Meyer), Soundvision e LA Network Manager (L-Acoustics), ArrayCalc e R1 (d&b), MAPP 3D (Meyer); [S]: Smaart, serie Midas PRO e Yamaha CL/QL fuori produzione. Non controllati: DiGiCo, Avid S6L, Allen & Heath, Martin Audio DISPLAY (pagine non raggiungibili da curl). Decreto 22/7/2014 [P: testo nell'appendice normativa del Testo unico 81/08, PDF del Ministero del lavoro; art. 88 c. 2-bis su Normattiva].

## Tecniche

#### Catena di un impianto (signal chain)
- **Cos'è:** il percorso del suono dal palco al pubblico: sorgente (voce, strumento, playback) → microfono o DI → stagebox (preamplificatore e conversione A/D) → split verso sala, palco e ripresa → mixer → processore dell'impianto (crossover, ritardi, equalizzazione, limiter) → amplificatori → diffusori. Oggi stagebox, mixer e processori parlano su rete (Dante, MADI, AES67, Milan) (std).
- **Si sente:** un guasto o un errore di guadagno all'inizio della catena (preamplificatore saturo, DI sbagliata) arriva fino al pubblico e nessun processore lo ripara.
- **Quando:** in ogni evento con amplificazione, dalla conferenza allo stadio.
- **Come:** disegnare la catena prima del montaggio con chi possiede ogni anello (service audio, artista, location); fissare un punto di separazione chiaro fra il fonico (fino all'uscita del mixer) e il system engineer (dal processore in poi); prevedere un percorso di riserva per i segnali critici (voce principale, playback) (std).
- **AI:** —
- **Errore comune:** non sapere di chi è il processore dell'impianto della location; il fonico dell'artista «corregge» al mixer ciò che andava corretto nel sistema.

#### Mixer digitali di livello alto (live digital consoles)
- **Cos'è:** i banchi che compaiono nei rider internazionali: DiGiCo (Quantum, SD), Avid VENUE S6L, Yamaha RIVAGE PM, Allen & Heath dLive, Midas HD96. Cambiano per numero di canali e bus, flusso di lavoro (scene, gruppi, macro), rete e stagebox compatibili, plug-in, formato dei file di show (std).
- **Si sente:** a parità di fonico la differenza di suono è piccola; si sente invece quando il fonico lavora su un banco che non conosce (show più lento, scene sbagliate).
- **Quando:** il banco si sceglie sul rider dell'artista; per eventi senza artista con rider, sul fonico che lo userà.
- **Come:** accettare un banco diverso da quello del rider solo con l'assenso scritto del fonico; il file di show di un marchio non si apre su un altro marchio (e a volte nemmeno fra versioni di software diverse dello stesso marchio): chiedere modello e versione software del service; per tour e festival, verificare stagebox e rete compatibili (std).
- **AI:** alcuni banchi e plug-in offrono funzioni assistite (per esempio riduzione automatica del rumore o del rientro); controllare sempre a orecchio.
- **Errore comune:** sostituire «un DiGiCo» con «un DiGiCo»: modello e versione contano per aprire il file di show.

#### Rete audio e ridondanza (audio networking, redundancy)
- **Cos'è:** il trasporto di decine o centinaia di canali su cavi di rete o fibra: Dante (Audinate), AES67 (standard AES di interoperabilità), Milan (profilo AVB promosso da costruttori come L-Acoustics e Meyer Sound), MADI (AES10, coassiale o fibra, 64 canali) (std).
- **Si sente:** quando funziona, niente; quando cade, silenzio totale su tutto ciò che passa da quel cavo.
- **Quando:** dal mezzo evento in su; sempre quando sala, palco e ripresa condividono gli stessi ingressi.
- **Come:** rete primaria e secondaria separate su switch diversi; un clock master unico dichiarato; frequenza di campionamento uguale su tutta la rete (48 o 96 kHz); tenere la rete audio separata da quella luci e video (std).
- **AI:** —
- **Errore comune:** collegare la rete audio allo switch di qualcun altro «perché c'era posto».

#### Line array (line array)
- **Cos'è:** colonna appesa di diffusori uguali, angolati fra loro, che si accoppiano e si comportano come una sorgente unica controllata in verticale: la parte alta della colonna lancia lontano, quella bassa copre le prime file. Si dimensiona con il software del costruttore (std).
- **Si sente:** livello e timbro simili dalla prima all'ultima fila; meno riflessioni sui soffitti e sulle pareti di fondo rispetto a diffusori puntiformi della stessa potenza.
- **Quando:** platee profonde, all'aperto, palasport e stadi; per sale piccole o larghe e poco profonde spesso bastano diffusori puntiformi.
- **Come:** pianta e sezione quotate del luogo → simulazione (Soundvision, ArrayCalc, MAPP 3D, DISPLAY) → numero di elementi, angoli, altezza e punti di appendimento → verifica dei pesi con chi gestisce la struttura → misura sul posto (std).
- **AI:** —
- **Errore comune:** colonna troppo corta per la profondità (le ultime file sentono solo gli acuti persi e il basso); appendere dove c'è posto e non dove serve.

#### Sub cardioidi, end-fire e arco (subwoofer arrays)
- **Cos'è:** disposizioni di sub che danno direzione al basso, che da solo si irradia quasi uguale in tutte le direzioni. Un sub da 18" singolo cancella dietro circa 3 dB a 70 Hz, tre sub impilati circa 5 dB [P: d&b TI 330]. Cardioide: una sorgente dietro, ritardata e invertita, che cancella il basso verso il palco; con la CSA di d&b (tre sub, quello centrale girato) il costruttore dichiara 15-20 dB di reiezione dietro [P: d&b TI 330]. End-fire: sub in fila verso il pubblico, ritardati perché si sommino davanti. Arco: sub in fila orizzontale con ritardi crescenti verso i lati per allargare o stringere la copertura (std).
- **Si sente:** palco più pulito (meno basso nei microfoni e nelle spie); basso più asciutto in sala chiusa; meno basso verso le case dietro il palco.
- **Quando:** sempre quando il palco è rumoroso o il vicinato è dietro il palco; l'end-fire richiede profondità a terra.
- **Come:** distanza fra sorgente davanti e sorgente dietro dell'ordine di un quarto della lunghezza d'onda da controllare [P: d&b TI 330]: circa 1,07 m a 80 Hz (λ = 343/80 = 4,29 m) (std); il principio regge per poco più di un'ottava [P: d&b TI 330]; ritardo di circa 2,9 ms per metro di distanza (velocità del suono 343 m/s a 20 °C) (std). Misurare davanti e dietro dopo la messa in opera.
- **AI:** —
- **Errore comune:** mettere sub cardioidi senza i ritardi e le inversioni del processore (si perde basso davanti senza guadagnarne dietro); dimenticare che la configurazione cardioide dà meno livello davanti dello stesso numero di sub tutti in avanti [P: d&b TI 330].

#### Allineamento e ritardi (time alignment, delay fills)
- **Cos'è:** regolare il ritardo elettronico di ogni gruppo di diffusori perché il suono arrivi insieme nel punto di ascolto: sub con line array, front fill con principale, torri di ritardo con il palco (std).
- **Si sente:** allineato = basso pieno e voce nitida; non allineato = buco di frequenze fra sub e principale, voce doppia o «eco» nelle zone servite dai ritardi.
- **Quando:** ogni volta che più gruppi di diffusori coprono la stessa zona.
- **Come:** misurare con funzione di trasferimento (per esempio Smaart) nel punto di sovrapposizione; distanza / 343 m/s = ritardo di partenza; per le torri di ritardo, di partenza qualche millisecondo in più del calcolo perché il suono sembri arrivare dal palco (effetto di precedenza) (std, da confermare con misura).
- **AI:** —
- **Errore comune:** calcolare il ritardo dalla pianta e non misurarlo; dimenticare che la temperatura cambia la velocità del suono fra il pomeriggio e la notte (std).

#### Simulazione dell'impianto (system prediction)
- **Cos'è:** software del costruttore che prevede copertura, livello e risposta prima di montare: L-Acoustics Soundvision, d&b ArrayCalc, Meyer Sound MAPP 3D, Martin Audio DISPLAY. Ognuno funziona solo con i diffusori del proprio marchio (std).
- **Si sente:** non si sente: si vede in mappe colorate di livello sulla zona pubblico.
- **Quando:** in ogni evento di media o grande scala, prima del preventivo definitivo.
- **Come:** chiedere al service la simulazione sulla pianta reale e le mappe esportate (PDF o immagini) con livello nelle diverse zone e verso l'esterno; usarle per discutere posizione della regia, numero di diffusori e punti di appendimento.
- **AI:** —
- **Errore comune:** accettare un preventivo senza simulazione: il numero di diffusori è una supposizione.

#### Misura e ottimizzazione (measurement, system tuning)
- **Cos'è:** misura a due canali (funzione di trasferimento) fra il segnale mandato e il microfono di misura in più punti della sala, per allineare ed equalizzare l'impianto; analizzatore in tempo reale (RTA) e fonometro per i livelli. Software standard: Smaart (Rational Acoustics); il SIM 3 di Meyer Sound è fuori produzione [P] (std per il resto).
- **Si sente:** impianto omogeneo; il fonico parte da un sistema neutro invece di correggerlo dal mixer.
- **Quando:** a ogni montaggio, prima del soundcheck; si ricontrolla con il pubblico in sala, che assorbe.
- **Come:** più posizioni di misura, non solo la regia; guardare la coerenza e scartare i dati con coerenza bassa; equalizzare le zone, non il punto singolo; a fine giornata salvare misure e impostazioni (std).
- **AI:** —
- **Errore comune:** equalizzare l'impianto con l'RTA a rumore rosa in un solo punto e chiamarlo «tarato».

#### Monitor da palco: spie e side fill (wedges, side fills)
- **Cos'è:** diffusori sul palco rivolti ai musicisti, ognuno con il suo mix; side fill ai lati per un mix comune a tutto il palco; drum fill per il batterista (std).
- **Si sente:** il musicista suona a tempo e intonato; troppa spia = palco rumoroso che entra nei microfoni e sporca la sala.
- **Quando:** band che non usano in-ear, artisti che vogliono «sentire l'aria», eventi brevi senza tempo per gli in-ear.
- **Come:** una spia per ruolo, puntata alla testa; microfoni direzionali con la parte che respinge di più rivolta alla spia (cardioide: dietro; supercardioide: dietro ai lati) (std); mix di palco a livello più basso possibile; il fonico di palco «suona» la spia dal palco per sentire ciò che sente il musicista.
- **AI:** —
- **Errore comune:** spia orientata verso il microfono invece che verso l'orecchio; tutto in tutte le spie.

#### In-ear (in-ear monitoring, IEM)
- **Cos'è:** auricolari con un mix personale, in genere via radio da un trasmettitore stereo; auricolari universali o su calco dell'orecchio (std).
- **Si sente:** per il musicista: mix preciso a livello controllato; per la sala: palco silenzioso e mix più pulito. Senza microfoni ambiente il musicista si sente isolato dal pubblico.
- **Quando:** tour, show con click e basi, palchi televisivi, artisti che si muovono molto.
- **Come:** un trasmettitore stereo per mix; microfoni ambiente per il pubblico; limiter sul trasmettitore come protezione; le frequenze entrano nel piano RF come i radiomicrofoni; i sistemi WMAS a banda larga (Sennheiser Spectera, Shure Axient Digital PSM) portano molti collegamenti in un solo canale TV da 6 o 8 MHz [P per Spectera: newsroom Sennheiser; S per il resto].
- **AI:** —
- **Errore comune:** alzare il volume dell'in-ear per «sentire meglio» invece di mettere bene l'auricolare: rischio per l'udito del musicista, che è un lavoratore (D.Lgs. 81/2008).

#### Gestione del larsen (feedback control)
- **Cos'è:** tenere il guadagno dei microfoni sotto la soglia in cui il giro microfono-diffusore si autoalimenta. Dipende da distanza sorgente-microfono, distanza microfono-diffusore, direttività di entrambi e acustica (std).
- **Si sente:** fischio acuto, rimbombo medio-basso, o prima ancora un suono «metallico» che suona da solo (ringing).
- **Quando:** sempre con microfoni aperti e diffusori vicini: conferenze con lavalier, relatori che camminano davanti ai diffusori, voci deboli, spie forti.
- **Come:** prima di tutto la geometria: microfono vicino alla bocca (raddoppiare la distanza bocca-microfono costa circa 6 dB di guadagno, legge dell'inverso del quadrato, std), diffusori principali davanti alla linea dei microfoni, area di palco segnata per chi parla; poi pochi filtri stretti sulle frequenze che suonano (ringing out), mixer automatico per i panel; soppressori automatici solo come ultima rete.
- **AI:** soppressori adattivi e funzioni di riduzione del rientro sui banchi digitali aiutano, ma non spostano la fisica: un microfono a 40 cm resta lontano.
- **Errore comune:** risolvere con decine di filtri che svuotano la voce; mettere il relatore davanti ai diffusori «perché è più bello in foto».

#### Radiofrequenze: bande e autorizzazioni in Italia (wireless spectrum, licensing)
- **Cos'è:** i radiomicrofoni professionali in Italia usano bande a uso collettivo, senza diritto di protezione: 174-223 MHz, 470-694 MHz, le porzioni 694-698 MHz e 736-738 MHz, 823-832 MHz e 1785-1805 MHz, con potenza massima 50 mW e.r.p., in regime di autorizzazione generale; 863-865 MHz e 1795-1800 MHz sono di libero uso a 10 mW e.r.p. per sistemi audio a corto raggio [P: MIMIT, Linee guida per l'uso temporaneo di frequenze 2025]. Il PNRF (D.M. 31/8/2022, ancora vigente) ammette anche 1492-1518 MHz per radiomicrofoni professionali, solo all'interno di edifici e finché la banda non sarà assegnata alle reti mobili (nota 122) [P: PNRF, GU S.O. 35 del 13/9/2022]. La banda 694-790 MHz è passata alle comunicazioni mobili (L. 205/2017), salvo le porzioni 694-698 e 736-738 MHz [P: note PNRF]; i sistemi nella vecchia banda 700 MHz vanno controllati e spesso sostituiti.
- **Si sente:** interferenze, fruscii, buchi, o la televisione digitale nel microfono.
- **Quando:** ogni evento con radiomicrofoni o in-ear; obbligatorio pensarci per i noleggi esteri (molti sistemi americani o asiatici lavorano in bande non ammesse in Italia).
- **Come:** per l'uso temporaneo di radiomicrofoni in banda collettiva si presenta al MIMIT il modulo «Richiesta uso temporaneo SRD banda collettiva radiomicrofoni e DECT» via email almeno 15 giorni prima; contributi da 50 € (1-5 apparati) a 300 € (oltre 100) [P: MIMIT 2025]; le bande gestite dalla Difesa chiedono più tempo (30 giorni) [P]. L'uso senza autorizzazione è sanzionato dall'art. 102 del Codice delle comunicazioni elettroniche: da 300 a 3.000 € senza autorizzazione generale, da 1.000 a 10.000 € senza diritto d'uso, più i contributi evasi [P: Normattiva, testo vigente].
- **AI:** —
- **Errore comune:** portare in Italia un sistema in 1,4 GHz o in 600 MHz americano senza verificare la banda (Spectera con licenza europea «zona 01» apre in 1,4 GHz solo 1350-1400 MHz, banda che il PNRF non prevede per radiomicrofoni) [P: scheda Spectera Base Station v2.0; PNRF]; non sapere che 470-694 MHz è anche la TV digitale della zona: i canali liberi cambiano da città a città.

#### Coordinamento frequenze e intermodulazione (frequency coordination, IMD)
- **Cos'è:** il calcolo delle frequenze di tutti i trasmettitori presenti (microfoni, in-ear, intercom, talkback, anche di altri fornitori) perché nessuno cada sui canali TV attivi o sulle frequenze spurie (intermodulazione) prodotte dagli altri (std).
- **Si sente:** un microfono che va e viene solo quando un altro è acceso; fruscio quando si accendono gli in-ear.
- **Quando:** da 4-6 radiomicrofoni in su; sempre nei festival con più palchi.
- **Come:** scansione sul posto il giorno del montaggio, calcolo con Shure Wireless Workbench o Sennheiser WSM, frequenze di riserva, antenne lontane dai LED e dalle strutture metalliche, in-ear e microfoni in gruppi di frequenza separati; i sistemi WMAS cambiano il calcolo perché occupano un canale intero a bassa densità (std; Spectera [P]).
- **AI:** —
- **Errore comune:** coordinare le proprie radio e non quelle della regia video o della sicurezza.

#### Lista ingressi e pianta di palco (input list, stage plot)
- **Cos'è:** i due documenti che dicono al service che cosa entra nel mixer e dove sta sul palco (std).
- **Si sente:** non si sente: senza, il soundcheck diventa il montaggio.
- **Quando:** sempre, anche per una conferenza (relatori, video, PC, collegamenti remoti sono ingressi).
- **Come:** lista ingressi con: numero di canale, sorgente, microfono o DI suggerito, asta (alta, bassa, a clip), phantom, posizione sul palco, note (radio, riserva); uscite in tabella separata (spie, in-ear, registrazione, ripresa); pianta di palco vista dall'alto con fronte del pubblico indicato, dimensioni, prese elettriche, pedane, numeri delle linee. Versione e data su ogni documento.
- **AI:** un modello linguistico può impaginare la lista da un appunto, ma i modelli dei microfoni vanno controllati da un fonico.
- **Errore comune:** inviare una lista vecchia; non numerare uscite e ritorni.

#### Rider tecnico: leggerlo e scriverlo (technical rider)
- **Cos'è:** il documento contrattuale dell'artista con le richieste tecniche (impianto, mixer, microfoni, backline, luci, tempi, personale, alimentazione) e, separato, il rider di ospitalità (std).
- **Si sente:** —
- **Quando:** a ogni ingaggio di un artista; {{STUDIO}} lo legge quando organizza un evento con musica dal vivo o un DJ, lo scrive quando produce un format proprio.
- **Come:** leggere distinguendo obbligatorio e preferito; segnare ogni voce «fornito da» (artista, service, location); confermare per iscritto ogni sostituzione al production manager dell'artista; controllare tempi (carico, soundcheck, cambio palco), potenza elettrica, numero di persone del suo staff. Scrivere: una pagina di contatti, input list e stage plot, poche richieste chiare con le alternative accettate.
- **AI:** utile per estrarre da un PDF lungo la lista delle voci da coprire; la conferma resta umana.
- **Errore comune:** firmare il contratto senza aver mandato il rider al service; scoprire le richieste il giorno prima.

#### Prova linee e soundcheck (line check, soundcheck)
- **Cos'è:** la prova linee verifica che ogni canale arrivi al posto giusto e pulito; il soundcheck imposta suoni e mix con i musicisti (std).
- **Si sente:** uno show che parte bene; senza, i primi brani servono da prova davanti al pubblico.
- **Quando:** prova linee sempre, anche nei cambi palco veloci dei festival (spesso l'unica possibile); soundcheck quando c'è tempo e palco libero.
- **Come:** prova linee nello stesso ordine della lista ingressi, con un tecnico che batte e parla su ogni microfono; poi uscite (spie, in-ear); poi soundcheck strumento per strumento, poi insieme su un brano forte e uno piano, poi le scene; in un festival il cambio palco è spesso di decine di minuti: il tempo esatto è nel contratto e va letto.
- **AI:** —
- **Errore comune:** un evento aziendale senza prova con i relatori veri; soundcheck della band tagliato perché il montaggio luci ha sforato.

#### Basi, click e guida (playback, click, cue)
- **Cos'è:** l'insieme di parti registrate che accompagnano il live: stem (cori, synth, archi, effetti), click per i musicisti, guida parlata con le parti, a volte timecode. Viene da una DAW (Ableton Live, Pro Tools) in modalità show (std).
- **Si sente:** produzione da disco anche con pochi musicisti; se gli stem arrivano già mixati in stereo il fonico non può bilanciarli con la band.
- **Quando:** pop, elettronica dal vivo, spettacoli con video e luci sincronizzati, sfilate e lanci con musica su misura.
- **Come:** uscite separate per famiglia (per esempio batteria registrata, basso, tastiere, cori, effetti, click, guida, timecode); un brano o scena per sezione con inizio controllato; due computer in parallelo con commutazione; click e guida solo verso gli in-ear, mai verso la sala.
- **AI:** la separazione degli stem da un mix stereo (con strumenti AI) può salvare un'emergenza ma suona peggio degli stem originali e non dà alcun diritto sul brano: chiedere gli stem all'artista o all'etichetta.
- **Errore comune:** il click che esce in sala per un errore di routing; basi con nomi diversi da quelli del mixer.

#### Timecode e show control (timecode, show control)
- **Cos'è:** un orologio comune che fa partire e sincronizza audio, luci, video, effetti speciali. Lo standard è SMPTE ST 12-1 (time code), con frequenze nominali da 23,98 a 60 fotogrammi al secondo, compresi 24, 25 e 29,97, con una modalità drop frame (serve a 29,97 fps per restare allineati all'orologio) [P: SMPTE, «Understanding Standards: Time Code»; il testo della norma è a pagamento]. Viaggia come audio (LTC), come MIDI (MTC) o in rete (std).
- **Si sente:** luci e video che cadono esattamente sul colpo; se il timecode salta, scene che partono a caso.
- **Quando:** show con luci e video programmati sui brani; sfilate; lanci di prodotto con cue precise.
- **Come:** una sola sorgente (di solito il rig di playback, come traccia audio LTC di ogni brano) e un solo frame rate concordato per iscritto con luci e video (in Europa spesso 25 fps); un timecode che riparte da un'ora diversa per ogni brano (es. brano 3 = 03:00:00:00) per orientarsi; prova completa con tutti i reparti.
- **AI:** —
- **Errore comune:** reparti su frame rate diversi (25 e 30): la deriva si accumula e a metà brano luci e audio non coincidono più.

#### Mix per streaming e diretta di un live (broadcast and stream mix)
- **Cos'è:** un mix separato da quello di sala, pensato per chi ascolta in cuffia o da uno schermo: più microfoni ambiente, compressione più costante, loudness controllato (std).
- **Si sente:** voce chiara, pubblico presente, livello costante; con il mix di sala: basso scarso, voce sbilanciata, nessuna atmosfera.
- **Quando:** dirette social e YouTube di un evento, riprese per video di brand, TV.
- **Come:** split degli ingressi verso un banco o una sessione dedicata; misurare il loudness con un misuratore BS.1770; per la TV europea -23 LUFS con tolleranza ±1 LU ammessa per i programmi dal vivo e true peak massimo -1 dBTP [P: EBU R 128-2023]; per YouTube Live audio AAC o MP3, 44,1 kHz e 128 kbps per lo stereo [P: YouTube Help]; per le altre piattaforme e i valori di loudness in streaming vedi il file sul loudness e le consegne di questa skill. Registrare sempre la multitraccia.
- **AI:** riduzione del rumore e della riverberazione su voci di conferenza (in post, più che in diretta); separazione per recuperare una voce coperta in un montaggio successivo, con verifica a orecchio.
- **Errore comune:** prendere l'uscita stereo del mixer di sala come audio della diretta; non avere un secondo audio di riserva se il primo cade.

#### Postazione DJ (DJ setup)
- **Cos'è:** la configurazione standard dei club e dei festival: due-quattro lettori AlphaTheta CDJ (3000 o 3000X) collegati in rete, un mixer DJM (A9 o V10), monitor DJ dedicati; il software di preparazione è rekordbox; in alternativa Serato DJ Pro o Traktor con computer (std). Il CDJ-3000X (annunciato il 9/9/2025) aggiunge Wi-Fi, accesso a cloud e servizi di streaming e uno schermo da 10,1" [P: AlphaTheta].
- **Si sente:** passaggi senza buchi; se il mixer DJ satura, il suono si indurisce e il fonico non ha margine.
- **Quando:** ogni evento con DJ, anche un aperitivo di lancio.
- **Come:** stesso modello e stesso firmware su tutti i lettori; rete fra i lettori collegata e testata; uscita del mixer DJ al FOH su linee bilanciate a livello concordato; monitor DJ con controllo di volume a portata del DJ; internet stabile se il DJ usa lo streaming (sapere che lo streaming in un evento pubblico ha anche un problema di licenze: vedi `industria-musicale.md`). AlphaTheta pubblica pagine di rider tecnici per i suoi prodotti [P: menu del sito, contenuto non letto].
- **AI:** Serato DJ Pro e altri software separano in tempo reale voce, batteria e strumenti (stem) per mixare; utile al DJ, non cambia nulla per il service (std; versioni e funzioni da verificare sulle pagine Serato e rekordbox, non lette in questa sessione).
- **Errore comune:** lettori di generazioni diverse in rete che non si vedono; monitor DJ così forti da coprire la sala.

#### Evento aziendale e conferenza (speech reinforcement)
- **Cos'è:** il rinforzo della voce parlata, dove conta la comprensione e non l'impatto (std).
- **Si sente:** consonanti chiare in ultima fila senza che la voce sembri «amplificata».
- **Quando:** convention, lanci di prodotto, panel, premiazioni, sfilate con voce fuori campo.
- **Come:** archetto (headset) per chi si muove o ha voce debole, lavalier a centro petto per chi sta fermo, collo di cigno per il leggio; mixer automatico per i panel; diffusori sopra e davanti alla linea dei relatori, fill per le prime file; mix-minus per i relatori remoti; uscita separata per traduzione simultanea e per la ripresa; prova con ogni relatore.
- **AI:** voce fuori campo generata (ElevenLabs o Higgsfield `generate_audio`) per annunci e trailer d'apertura: solo voci sintetiche o voci con consenso scritto (regole in `atlante-culturale/references/regole.md` §3 e §5).
- **Errore comune:** musica di sottofondo troppo alta sotto il parlato; un solo radiomicrofono a mano che passa fra cinque relatori.

#### Controllo dei livelli e dell'udito (sound level management, hearing safety)
- **Cos'è:** misura continua del livello in un punto di riferimento (di solito la regia) per rispettare la norma italiana nei locali, i valori di esposizione dei lavoratori e, dove il cliente lo sceglie, lo standard OMS per il pubblico (std).
- **Si sente:** uno show che resta coinvolgente senza fischio nelle orecchie il giorno dopo.
- **Quando:** sempre nei locali di pubblico spettacolo e nelle discoteche (DPCM 215/1999); sempre per i lavoratori (D.Lgs. 81/2008); come scelta di brand negli eventi con pubblico giovane o bambini.
- **Come:** fonometro di classe 1 o sistema di monitoraggio con registrazione (LAeq 15 min, LASmax, LCpeak) visibile al fonico; tappi disponibili per il pubblico; zona di riposo acustico; DPI e rotazione per lo staff vicino ai diffusori. Valori in «Numeri di riferimento».
- **AI:** —
- **Errore comune:** misurare con un'app del telefono non calibrata e chiamarla «misura»; ignorare che barman, security e fotografi sotto palco sono lavoratori esposti.

#### Rumore verso l'esterno e deroghe (environmental noise, permits)
- **Cos'è:** i limiti di rumore verso le abitazioni (L. 447/1995 e DPCM 14/11/1997) che per le manifestazioni temporanee in luogo pubblico o aperto al pubblico il comune può autorizzare anche in deroga, con prescrizioni proprie (orari, livelli, durata) [P: L. 447/1995 art. 6, c. 1, lett. h)]. Ogni comune ha il suo regolamento acustico e spesso una procedura per le deroghe (std).
- **Si sente:** coprifuoco, livelli massimi al confine, interruzione dello show se si sfora.
- **Quando:** ogni evento all'aperto o in luogo non nato per lo spettacolo (piazza, cortile, rooftop, showroom).
- **Come:** chiedere la deroga al comune con le date e la relazione del tecnico competente in acustica quando richiesta; progettare l'impianto con le simulazioni del livello verso l'esterno; sub cardioidi verso le case; coprifuoco scritto nel programma di produzione.
- **AI:** —
- **Errore comune:** dare per scontato che una location privata non abbia vincoli; scoprire il coprifuoco alle 23 durante l'evento.

Fonti: d&b audiotechnik, TI 330 «Cardioid Subwoofer Array» v1.4 en (PDF dbaudio.com) [P]; MIMIT, «Linee guida per l'uso temporaneo di frequenze» 2025, snapshot Wayback del 2025-09-07 (il sito MIMIT non risponde a richieste automatiche) [P]; EBU R 128-2023 (tech.ebu.ch) [P]; YouTube Help «Choose live encoder settings, bitrates, and resolutions» (answer 2853702) [P]; AlphaTheta, comunicato CDJ-3000X del 9/9/2025 [P]; Sennheiser newsroom, «Spectera shipping now» 24/4/2025 [P]; L. 447/1995 art. 6 su Normattiva [P]; SMPTE ST 12-1: sintesi dell'ente sul sito smpte.org [P], testo della norma a pagamento; resto std. Tutto letto il 2026-11-09.

## Numeri di riferimento

**Livelli nei locali di pubblico spettacolo in Italia (DPCM 16/4/1999 n. 215)**

| Voce | Valore | Fonte | Letto |
|---|---|---|---|
| Limite massimo, livello massimo lento ponderato A | 102 dB(A) LASmax (in vigore da 24 mesi dopo il 17/7/1999; prima 105 e 103) | [P] art. 2, c. 1, lett. a-c | 2026-11-09 |
| Limite livello equivalente ponderato A | 95 dB(A) LAeq | [P] art. 2, c. 1, lett. d | 2026-11-09 |
| Periodo a cui si riferiscono | tempo di funzionamento dell'impianto durante l'apertura al pubblico | [P] art. 2, c. 2 | 2026-11-09 |
| Dove si applica | luoghi di pubblico spettacolo o intrattenimento danzante, circoli privati autorizzati, pubblici esercizi con impianti di amplificazione, al chiuso e all'aperto | [P] art. 1, c. 1 | 2026-11-09 |
| Dove NON si applica | manifestazioni e spettacoli temporanei o mobili autorizzati dal comune ai sensi della L. 447/1995 (art. 4 c. 1 lett. g, art. 6 c. 1 lett. h): lì valgono le prescrizioni dell'autorizzazione | [P] art. 1, c. 2 | 2026-11-09 |
| Chi risponde | il gestore; chi usa autonomamente l'impianto (per esempio un organizzatore esterno) risponde in solido | [P] art. 3 | 2026-11-09 |
| Verifica dell'impianto | il gestore fa verificare da un tecnico competente in acustica se l'impianto può superare i limiti; la relazione riporta LAeq misurato senza pubblico per almeno 60 s nel punto della zona pubblico dove il livello è massimo, a 1,6 ± 0,1 m dal pavimento, con strumenti di classe 1 (EN 60651/60804), e la regolazione dell'impianto fatta con rumore rosa | [P] art. 4, c. 1 | 2026-11-09 |
| Stato | testo vigente su Normattiva senza modifiche (in vigore dal 17/7/1999). Il D.Lgs. 42/2017, art. 14, ha riscritto l'art. 11 c. 1 della L. 447/1995 prevedendo regolamenti per sorgente anche per gli «spettacoli dal vivo»: nessuno risulta adottato al 2026-11-09; il D.Lgs. 181/2026 sul rumore riguarda le macchine all'aperto, non gli spettacoli | [P] Normattiva (DPCM 215, D.Lgs. 42/2017 art. 14); [S] per l'assenza del regolamento e per il D.Lgs. 181/2026 (ReteAmbiente, TuttoAmbiente) | 2026-11-09 |

**Esposizione dei lavoratori al rumore (D.Lgs. 81/2008, Titolo VIII, Capo II)**

| Soglia | LEX,8h | Picco | Che cosa comporta | Fonte |
|---|---|---|---|---|
| Valore inferiore di azione | 80 dB(A) | 135 dB(C) (112 Pa) | il datore di lavoro mette a disposizione i DPI per l'udito (art. 193, c. 1, lett. a) | [P] art. 189 e 193 |
| Valore superiore di azione | 85 dB(A) | 137 dB(C) (140 Pa) | il datore di lavoro esige che i DPI siano usati (art. 193, c. 1, lett. b) | [P] art. 189 e 193 |
| Valore limite di esposizione | 87 dB(A) | 140 dB(C) (200 Pa) | non va superato; si tiene conto dell'attenuazione dei DPI | [P] art. 189 e 193, c. 2 |
| Variabilità giornaliera | si può usare il livello settimanale LEX,w se l'esposizione cambia molto fra un giorno e l'altro | — | tipico di chi lavora a eventi | [P] art. 189, c. 2 |
| Linee guida di settore | «Linea guida per il settore della musica e delle attività ricreative» (art. 198), Conferenza Stato-Regioni 25/7/2012: per la variabilità dei livelli raccomanda di applicare l'art. 191 (attribuire ai lavoratori un'esposizione sopra i valori superiori di azione, LEX > 85 dB(A) e/o picco > 137 dB(C), e misurare solo le sorgenti per scegliere le misure), con la UNI/TR 11347:2010; metodo di misura semplificato nell'allegato 2 | — | da leggere per concerti, teatri, discoteche | [P] testo nell'appendice al Testo unico 81/08, Ministero del lavoro, ed. giugno 2016 |

Letti su Normattiva il 2026-11-09 (art. 188, 189, 190, 193, 198); valori ricontrollati il 2026-11-09 (art. 189 e 193 vigenti, invariati).

**Standard OMS per luoghi ed eventi (WHO Global standard for safe listening venues and events, 2022)**

| Voce | Valore | Fonte | Letto |
|---|---|---|---|
| Limite del pubblico | 100 dB LAeq, 15 min, al punto di misura di riferimento | [P] F1.1.2 | 2026-11-09 |
| Eventi per un pubblico in maggioranza di bambini | al massimo 94 dB LAeq, 15 min; 90 dB o meno per i bambini piccoli; picchi entro 120 dB LCpeak | [P] F1.5.3 | 2026-11-09 |
| Picchi per adulti | 140 dB LCpeak, con limiter elettronico rapido se l'impianto può superarli | [P] F1.3, F1.3.3 | 2026-11-09 |
| Zona di riposo (quiet zone) | livello di fondo il più possibile sotto 70 dB LAeq, 15 min; materiale fonoassorbente su almeno il 20% della superficie di pareti e soffitto (minimo suggerito) | [P] F5.2.2-F5.2.3 | 2026-11-09 |
| Le sei misure | limite, monitoraggio con strumenti calibrati e personale incaricato, acustica del luogo, protezioni auricolari per il pubblico, zone di riposo, formazione e informazione | [P] indice e infografica OMS | 2026-11-09 |
| Dato di contesto | in circa un terzo di oltre 600 concerti misurati in 50 locali in Norvegia il livello alla regia superava 100 dB LAeq, 15 min, più spesso nei locali piccoli | [P] F1, studio citato dallo standard | 2026-11-09 |
| Natura | volontario; non sostituisce la legge locale | [P] testo; [S] per l'infografica | 2026-11-09 |

Fonte: PDF dello standard (ISBN 978-92-4-004311-4), copia integrale ospitata da igvw.org, letta con PDFKit; valori ricontrollati il 2026-11-09 sul testo ufficiale di iris.who.int (estrazione testo del PDF, API DSpace) [P]. Guida tecnica collegata: ITU-T HSTP-SLD-Venue (04/2024) [S, non letta].

**Radiomicrofoni e in-ear in Italia (MIMIT, Linee guida per l'uso temporaneo di frequenze, 2025)**

| Banda | Uso | Potenza max | Regime | Fonte |
|---|---|---|---|---|
| 174-223 MHz; 470-694 MHz; 694-698 MHz; 736-738 MHz; 823-832 MHz; 1785-1805 MHz | radiomicrofoni professionali, uso collettivo, nessun diritto di protezione, statuto secondario rispetto alla TV in 174-223 e 470-694 | 50 mW e.r.p. | autorizzazione generale (nota 87A PNRF); apparati conformi a ETSI EN 300 422 | [P] §4.2 lett. b |
| 863-865 MHz; 1795-1800 MHz | sistemi audio a corto raggio a trasmissione continua | 10 mW e.r.p. | libero uso (note 110 e 141 PNRF) | [P] §4.2 |
| 174-223; 470-694; 694-698; 736-738 MHz | collegamenti audio a larga banda in ausilio alla radiodiffusione | 5 W e.r.p. | autorizzazione con diritto d'uso individuale; ETSI EN 300 454 | [P] §4.2 lett. a |
| Domanda radiomicrofoni in banda collettiva | modulo «Richiesta uso temporaneo SRD banda collettiva radiomicrofoni e DECT» a frq.temp@mise.gov.it | — | almeno 15 giorni prima | [P] §2 |
| Contributi radiomicrofoni (meno di un anno) | 50 € (1-5 apparati), 70 € (6-10), 140 € (11-15), 200 € (16-100), 300 € (oltre 100) | — | — | [P] §3.1 |
| Bande gestite dalla Difesa (148-156, 410-430 MHz e altre) | serve nulla osta | — | almeno 30 giorni prima | [P] §4.1 |
| 694-790 MHz | non più per radiomicrofoni (comunicazioni mobili) salvo le porzioni sopra | — | L. 205/2017 | [P] note PNRF 2022 |
| 1492-1518 MHz | radiomicrofoni professionali solo all'interno di edifici, uso collettivo, finché la banda non va alle reti mobili (MFCN SDL) | — | autorizzazione generale (nota 122 PNRF) | [P] PNRF 2022 |
| 1350-1400 MHz (Spectera 1G4 con licenza UE «zona 01») | in Italia banda della Difesa, non prevista per radiomicrofoni; Spectera la apre in UE, ma in Italia va chiesta al MIMIT prima di noleggiare | — | — | [P] PNRF 2022 (tabella); [P] scheda Spectera Base Station v2.0 |

Letto il 2026-11-09 dallo snapshot Wayback del 7/9/2025 (nessuna edizione 2026 trovata). I rimandi del PDF al Codice delle comunicazioni elettroniche (art. 102 sanzioni, art. 104 c. 1 lett. c n. 2.3 autorizzazione generale, art. 105 c. 1 lett. k libero uso, allegato 25 contributi) esistono ancora nel testo vigente su Normattiva dopo il D.Lgs. 207/2021 [P]. Note PNRF lette sul D.M. 31/8/2022 in Gazzetta Ufficiale (S.O. 35 alla GU 214 del 13/9/2022), ancora vigente: un nuovo PNRF è in preparazione [S: AGCOM, delibera 109/26/CONS].

**Fisica e allineamento**

| Voce | Valore | Fonte |
|---|---|---|
| Velocità del suono in aria a 20 °C | circa 343 m/s; quindi circa 2,9 ms per metro | std |
| Quarto di lunghezza d'onda | 50 Hz: 1,72 m; 63 Hz: 1,36 m; 80 Hz: 1,07 m; 100 Hz: 0,86 m | std (343/f/4) |
| Campo di lavoro tipico dei sub | 35-120 Hz, lunghezze d'onda da 10 a 3 m | [P] d&b TI 330 |
| Reiezione posteriore di un sub singolo da 18" | circa 3 dB a 70 Hz; tre sub impilati circa 5 dB | [P] d&b TI 330 |
| Reiezione posteriore CSA d&b (tre sub, centrale girato) | 15-20 dB minimo, dispersione 180° | [P] d&b TI 330 |
| Legge dell'inverso del quadrato | raddoppio della distanza = -6 dB per una sorgente puntiforme in campo libero | std |

**Ripresa e streaming**

| Voce | Valore | Fonte |
|---|---|---|
| Loudness per la TV europea | -23,0 LUFS; dove non è raggiungibile in pratica (per esempio i programmi dal vivo) è ammessa una tolleranza di ±1,0 LU; ±0,2 LU di tolleranza di misura nei controlli qualità (la vecchia regola ±0,5 LU del 2014 non c'è più nella versione 2023) | [P] EBU R 128-2023, punti h-i |
| True peak massimo | -1 dBTP in produzione (audio lineare); può essere più basso per la distribuzione codificata (EBU Tech 3344) | [P] EBU R 128-2023, punto m |
| Misuratore | conforme a ITU-R BS.1770 e EBU Tech 3341 | [P] EBU R 128-2023 |
| YouTube Live, audio | AAC o MP3; 44,1 kHz e 128 kbps stereo; 48 kHz e 384 kbps per il 5.1 (solo AAC via RTMP/RTMPS) | [P] YouTube Help 2853702 |
| Frequenze di timecode | tabella completa in `registrazione.md`, «Numeri di riferimento»; per lo show control si sceglie una sola frequenza per tutti i reparti (in Europa spesso 25 fps) | [P] SMPTE (vedi registrazione.md); std per l'uso |

Fonti: Normattiva (DPCM 215/1999, D.Lgs. 81/2008, L. 447/1995); WHO 2022; MIMIT 2025 via Wayback; d&b TI 330; EBU R 128-2023; YouTube Help. Letti il 2026-11-09.

## Errori che si sentono

- **Voce che sparisce nei pezzi forti** → si capisce la musica ma non le parole del ritornello → microfono giusto e vicino, voce sopra gli strumenti nella zona 2-5 kHz, spie più basse; prima di tutto meno volume generale.
- **Basso che rimbomba e copre tutto in sala chiusa** → il basso «suona da solo», la cassa non ha attacco → sub cardioidi, allineamento sub-principale misurato, meno sub e non più sub.
- **Fischio al primo intervento di un relatore** → larsen sul lavalier o sul microfono a mano → geometria (diffusori davanti alla linea dei microfoni), prova con il relatore vero, archetto per voci deboli.
- **Voce doppia o eco in fondo alla sala** → le torri di ritardo o i fill non sono allineati → misura e allineamento con funzione di trasferimento, non solo calcolo dalla pianta.
- **Fruscio o buchi del radiomicrofono** → interferenza o intermodulazione, antenna mal posta → coordinamento di tutte le radio dell'evento, scansione sul posto, autorizzazione MIMIT, frequenze di riserva.
- **Click o guida che si sente in sala** → routing sbagliato del rig di playback → uscite separate e nominate, prova di tutte le scene, click solo verso gli in-ear.
- **Luci e video che arrivano in ritardo crescente durante il brano** → frame rate del timecode diverso fra reparti → un solo generatore e un frame rate scritto nel programma di produzione.
- **Silenzio di due secondi fra un DJ e l'altro** → cambio postazione non preparato, lettori non in rete → postazione doppia o cambio in corsa concordato con il tecnico DJ.
- **Diretta piatta, senza pubblico, con voce sbilanciata** → è stato mandato in streaming il mix di sala → mix dedicato con microfoni ambiente e loudness misurato.
- **Suono duro e stanco dopo un'ora** → livello troppo alto per troppo tempo, limiter dell'impianto che lavora → monitoraggio del LAeq in regia, dinamica invece di volume; lo standard OMS indica 100 dB LAeq, 15 min come limite.
- **Sound check che salta e primi brani «di prova» davanti al pubblico** → montaggio in ritardo, lista ingressi vecchia → programma di produzione con il soundcheck protetto, documenti con versione e data.
- **Show fermato dalla polizia locale alle 23** → coprifuoco o deroga del comune ignorati → richiesta di deroga con l'orario, coprifuoco scritto in scaletta.
- **Monitor DJ o spie più forti della sala** → palco che rientra nei microfoni e sporca il mix → in-ear dove possibile, monitor a livello, palco più silenzioso.

Fonti: pratica di mestiere (std); valore OMS [P] come sopra.

## Novità

1. **2025-04-25 — Sennheiser Spectera in consegna.** Primo sistema WMAS bidirezionale: radiomicrofoni, in-ear e dati di controllo nello stesso canale RF e in un solo bodypack; base station in 1U, versioni TV-UHF e 1,4 GHz [P: newsroom Sennheiser, 24/4/2025]. Una base station: fino a 64 canali audio (32 in, 32 out), canale RF da 6 o 8 MHz, fino a 128 collegamenti per canale RF con più base station; potenza RF regolabile 10-100 mW secondo il paese [P: scheda Spectera Base Station v2.0, sennheiser.com]. Per l'Italia: la licenza UE apre in 1,4 GHz solo 1350-1400 MHz, che il PNRF non prevede per radiomicrofoni; resta l'UHF (vedi «Radiofrequenze»).
2. **2025 — MIMIT pubblica le «Linee guida per l'uso temporaneo di frequenze 2025»** con bande, moduli, termini (15 giorni) e contributi per i radiomicrofoni negli eventi [P, snapshot del 7/9/2025].
3. **2025-08-13 — Smaart 9.6** (Rational Acoustics): nuovo modulo SPL con griglia di misuratori e compensazione; dal 20/4/2026 l'app Smaart RTA è anche su Android [S: ProSoundWeb e pagine di supporto Rational Acoustics citate da ricerca].
4. **2025-09-09 — AlphaTheta CDJ-3000X.** Nuovo lettore di riferimento dei club: Wi-Fi, cloud e streaming, accesso con NFC, schermo da 10,1"; più largo del CDJ-3000, quindi flight case nuovi [P: comunicato AlphaTheta; S: Digital DJ Tips per le misure].
5. **2025-12-17 — Avid, scheda Dante HD per VENUE S6L** (128×128 canali a 96 kHz) e, a NAMM 2026, anteprima di VENUE 8.1 e dei motori E6LX [S: Mix, Live Design, comunicato Avid NAMM 2026 non letto].
6. **2026-05-19 — Allen & Heath serie SQ+** (SQ5+, SQ6+, SQ7+), con elaborazioni prima riservate a dLive e Avantis [S: ProSoundWeb, Mixonline].
7. **2026-09 — DiGiCo Quantum638** (256 canali, 128 bus, versione T per il teatro) [S: ProSoundWeb]; nel 2025 erano usciti Quantum112 e Quantum225T [S].
8. **2026-09-10 — Yamaha DM5 e DM5 Compact:** 60 e 48 canali, Dante fino a 64×64 a 96 kHz, 24 bus mix; insieme a nuovi I/O RUio e firmware DM7 V2.0 [P: comunicato Yamaha Corporation].

Fonti: come indicato per ogni voce; letti il 2026-11-09.

## Verifica del 2026-11-09

- **[P]:** DPCM 215/1999 (art. 1-5, Normattiva, testo vigente), D.Lgs. 81/2008 (art. 188-190, 193, 198), L. 447/1995 art. 6, WHO Global standard 2022 (PDF integrale), linee guida MIMIT 2025 (via Wayback), d&b TI 330, EBU R 128-2023, YouTube Help, comunicati AlphaTheta, Sennheiser, Yamaha.
- **Correzione importante:** il DPCM 215/1999 non si applica ai concerti e agli eventi temporanei autorizzati in deroga dal comune (art. 1 c. 2): lì contano le prescrizioni del comune, più il D.Lgs. 81/2008 per chi ci lavora.
- **Chiuso (vedi sotto):** note PNRF, regolamento dopo il D.Lgs. 42/2017, decreto palchi e linee guida 2012, frame rate SMPTE.
- **Aperto:** Novità su Avid, Allen & Heath, DiGiCo e Smaart: solo stampa di settore [S].
- **Skill DJ di origine:** `music-production-mixing-mastering` non parla di live; da `ableton-live-mastery` si è preso solo il principio che Session View serve a suonare dal vivo, senza istruzioni d'uso. Le sue fonti sono blog di vendor e non sono state riusate.
- Prossima revisione: 2027-02-07, prima per le bande radio e le novità di prodotto.

**Verifica indipendente (2026-11-09).** Controllati: DPCM 215/1999 art. 1, 2, 4 e stato (Normattiva), D.Lgs. 42/2017 (art. 10, 14), D.Lgs. 81/2008 art. 88, 189, 193, 198, L. 447/1995 art. 3 e 6, Codice comunicazioni elettroniche art. 102, 104, 105 (testo vigente), linee guida MIMIT 2025, PNRF 2022 (GU), scheda Spectera, WHO 2022 (testo di iris.who.int), EBU R 128-2023, YouTube Help, d&b TI 330, SMPTE, decreto palchi e linee guida musica 2012 (appendice del Testo unico, Ministero del lavoro), pagine di Shure, Meyer, AlphaTheta, Pioneer DJ, L-Acoustics, d&b.
**Promossi a [P]:** L. 205/2017 sulla banda 700, decreto 22/7/2014, linee guida musica 2012, frame rate SMPTE, note PNRF.
**Corretti:** R 128 non ha più la tolleranza ±0,5 LU (solo ±1,0 LU per il live, ±0,2 LU di misura); il D.Lgs. 42/2017 (art. 14) prevede un regolamento sugli «spettacoli dal vivo», che non risulta adottato [S], e il DPCM 215 resta vigente; la verifica dell'art. 4 si fa senza pubblico nel punto di livello massimo (non «nel punto più alto»); in Italia 1492-1518 MHz è ammessa per radiomicrofoni solo al chiuso (nota 122 PNRF), mentre Spectera con licenza UE apre solo 1350-1400 MHz, banda non prevista; gli articoli del Codice citati dal MIMIT valgono ancora, con sanzioni da 300 a 10.000 €; fuori produzione PSM 1000, SIM 3, Midas PRO, Yamaha CL/QL; tolto il «drop frame valido per 29,97 e 30», che veniva da Wikipedia.
**Spostato:** la tabella delle frequenze di timecode resta in `registrazione.md`, qui c'è solo il rimando.
**Aperti:** DiGiCo, Avid S6L, Allen & Heath e Martin Audio DISPLAY non controllati a catalogo; circolare 35/2014 e UNI/TR 11347 non lette; il sito MIMIT non risponde (si legge solo da Wayback); nuovo PNRF in preparazione.
