# Registrazione e voce

Chi cattura il suono prima del mix: fonico e assistente di studio, tecnico di manutenzione, vocal producer ed editor della voce, direttore e speaker dello speakeraggio per spot e podcast, fonico di presa diretta e microfonista sul set. Serve a {{STUDIO}} per briefare uno studio o una sala di speakeraggio, scegliere e dirigere una voce, controllare che i file arrivati siano registrati bene (livelli, formato, nomi, rumore di fondo).
Non copre il mix e il mastering (`mix-mastering.md`), il montaggio dialoghi, l'ADR, il loudness e le consegne per spot e film (`audio-per-immagine.md`, che per la presa diretta rimanda qui), restauro, misure e clonazione vocale (`misura-analisi-ai.md`), i diritti su voci e output AI (`atlante-culturale/references/regole.md` §3 e §6). Ableton qui è una DAW fra le altre.
**Legenda.** [P] = fonte primaria letta il 2026-11-09: norma (EBU), documentazione del produttore (Neumann, Shure, Sennheiser, Royer, Coles, DPA, Source Elements, Celemony, ElevenLabs), linee guida di committenti (Netflix Partner Help Center, ACX/Audible), stampa tecnica di riferimento (Sound On Sound, Tape Op), sindacato di categoria (ANAD). [S] = secondaria o letta solo in sintesi (risultato di ricerca, blog di vendor, Wikipedia). **std** = definizione o calcolo di mestiere consolidato, scritto senza una fonte aperta in questa sessione. **da verificare** = non letto; non usarlo in un preventivo né in un contratto.
Letto e redatto il 2026-11-09. Revisione: 2027-02-07 (90 giorni), prima per versioni dei software e regole sulle voci AI.

## Lessico

- **Fonico** (*recording engineer*): chi sceglie microfoni, piazzamento, catena e livelli e fa girare la sessione.
- **Presa** (*take*): una singola esecuzione registrata dall'inizio alla fine di un passaggio.
- **Comping** (*comping, da composite*): montare la traccia migliore scegliendo frammenti da più prese.
- **Playlist / corsia di presa** (*playlist, take lane*): contenitore della DAW che tiene le prese una sotto l'altra per il comping.
- **Punch-in** (*punch-in*): ri-registrare solo un tratto di una presa, entrando e uscendo al volo.
- **Diagramma polare** (*polar pattern*): come la sensibilità del microfono cambia con l'angolo: omni, cardioide, supercardioide, ipercardioide, figura a otto.
- **Effetto prossimità** (*proximity effect*): aumento dei bassi quando un microfono direzionale si avvicina alla sorgente.
- **Plosiva** (*plosive, pop*): colpo d'aria delle consonanti P e B che fa «scoppiare» il microfono.
- **Sibilante** (*sibilant, ess*): consonanti S, Z, SC troppo brillanti e taglienti.
- **Filtro antipop** (*pop filter, pop shield*): schermo di tessuto o metallo forato tra bocca e microfono.
- **Rumore proprio** (*self-noise, equivalent noise level*): rumore che il microfono produce da solo, in dB-A; più basso è, meglio regge le sorgenti piano.
- **SPL massimo** (*max SPL*): pressione sonora oltre la quale il microfono distorce (di solito allo 0,5% di THD).
- **Alimentazione phantom** (*phantom power, P48*): 48 V portati sul cavo XLR per i condensatori.
- **Preamplificatore** (*preamp, mic pre*): porta il segnale del microfono a livello di linea; il primo stadio di guadagno.
- **Convertitore** (*AD/DA converter*): trasforma il segnale analogico in numeri e viceversa.
- **dBFS** (*decibels relative to full scale*): livello digitale; 0 dBFS è il massimo, oltre si taglia (clipping).
- **Livello di allineamento** (*alignment level*): il livello di riferimento del tono di prova; in Europa −18 dBFS (EBU R 68).
- **Margine** (*headroom*): spazio tra il picco e lo 0 dBFS.
- **Frequenza di campionamento** (*sample rate*): campioni al secondo (44,1, 48, 96 kHz).
- **Profondità di bit** (*bit depth*): risoluzione di ogni campione (16, 24 bit, 32 bit virgola mobile).
- **Mix cuffia** (*cue mix, foldback*): il mix che il musicista o lo speaker sente in cuffia, separato da quello della regia.
- **Rientro** (*bleed, spill*): suono di una sorgente captato dal microfono di un'altra.
- **Filtro a pettine** (*comb filtering*): cancellazioni a frequenze regolari quando lo stesso suono arriva a un microfono due volte con un ritardo; suono «vuoto», metallico.
- **Coppia coincidente** (*coincident pair*): due capsule nello stesso punto (XY, Blumlein, M/S): l'immagine stereo nasce solo dalle differenze di livello.
- **Coppia spaziata** (*spaced pair, AB*): due microfoni distanti: l'immagine nasce dalle differenze di tempo.
- **Albero Decca** (*Decca Tree*): tre microfoni a T sopra il direttore d'orchestra.
- **Cabina** (*vocal booth, VO booth*): stanza piccola, isolata e assorbente, per voce e speakeraggio.
- **Tempo di riverberazione** (*reverberation time, RT60*): tempo perché il suono decada di 60 dB.
- **Curve NR / NC** (*Noise Rating, Noise Criterion*): curve per bande d'ottava che classificano il rumore di fondo di una stanza (NR in Europa, NC negli USA).
- **Timecode** (*SMPTE timecode*): indirizzo ore:minuti:secondi:fotogrammi che lega audio e video.
- **Jam sync** (*jam sync*): allineare all'inizio del giorno i generatori di timecode di camera e registratore.
- **Broadcast Wave** (*BWF, BWAV*): WAV con metadati (data, ora, timecode d'inizio, note) nel blocco «bext» (EBU Tech 3285).
- **iXML** (*iXML*): metadati di scena, ciak, presa e nome delle tracce dentro il file del registratore da set.
- **Polifonico** (*poly WAV*): un solo file con tutte le tracce di una presa.
- **Rapporto del fonico** (*sound report, take sheet*): elenco di prese, tracce, note e prese buone (cerchiate).
- **Tono d'ambiente** (*room tone*): 30-60 secondi di «silenzio» della stanza, registrati per il montaggio.
- **Sinc a distanza** (*remote session, source-connect session*): sessione in cui speaker e regia sono in luoghi diversi, collegati in rete.
- **Asta** (*boom pole*): asta telescopica che porta il microfono sopra l'inquadratura sul set.
- **Radiomicrofono** (*wireless lavalier, radio mic*): microfono miniaturizzato nascosto sull'attore con trasmettitore.

Fonti: definizioni std; alignment level [P] EBU R 68; BWF [P] EBU Tech 3285 (pagina di presentazione); iXML e poly WAV [P] Netflix Partner Help Center (vedi Tecniche). Letto 2026-11-09.

## Mestieri

#### Fonico di registrazione (recording engineer, tracking engineer)
- **Fa:** traduce in suono registrato la visione del produttore: sceglie la sala, i microfoni e il loro piazzamento, la catena (preamp, compressione in ripresa se serve), i livelli, il mix cuffia, e tiene in ordine la sessione. Sta dopo arrangiamento e pre-produzione, prima di editor e mixer.
- **Consegna:** sessione della DAW (di solito Pro Tools) ordinata, con tracce nominate, prese scelte segnate, playlist conservate; export WAV 24 bit alla frequenza del progetto, tutte con lo stesso punto d'inizio; foglio con microfoni e catena usati per ogni traccia.
- **Strumenti standard:** Pro Tools (anche Logic, Cubase/Nuendo); console o preamp a canale (Neve 1073, API 512c, SSL), convertitori (Avid MTRX, Prism, RME, Universal Audio Apollo), microfoni della tabella in «Numeri».
- **Come si briefa:** brani di riferimento, organico, numero di brani e minuti, chi produce e chi decide in sala, formato (frequenza e bit), date e ore di sala, chi paga gli straordinari, a chi va la sessione a fine lavoro e in che formato, chi detiene il master (fonogramma).
- **Segno di livello alto:** quando il fader è a zero i suoni stanno già in equilibrio; nessuna presa da salvare in mix; fase controllata fra i microfoni della stessa sorgente; la sessione si apre a casa del mixer senza file mancanti.
- **Errore comune:** registrare «caldo» per avere un segnale grande e tagliare i picchi; non annotare la catena, così un ritocco una settimana dopo non suona uguale.

#### Assistente di studio (assistant engineer, second engineer)
- **Fa:** prepara la sala (microfoni, cavi, aste, cuffie), cambia le patch, segna le prese, salva e fa il backup, prepara i mix cuffia. Spesso è il ruolo d'ingresso del mestiere.
- **Consegna:** foglio delle prese (take sheet), schema dei microfoni (input list e foto della disposizione), backup verificato a fine giornata.
- **Strumenti standard:** gli stessi della sala; un sistema di cuffie personali (per esempio Aviom o Hear Back) e una disposizione dei canali stampata.
- **Come si briefa:** di solito non lo briefa {{STUDIO}} ma lo studio; va chiesto chi è e se c'è, perché senza assistente la sessione rallenta.
- **Segno di livello alto:** il fonico non aspetta mai; ogni cavo e canale è etichettato; la presa buona è segnata prima che qualcuno la chieda.
- **Errore comune:** non avere backup su un secondo disco prima che l'artista vada via.

#### Tecnico di studio e manutenzione (technical engineer, maintenance tech)
- **Fa:** tiene in efficienza console, macchine, microfoni, preamp e cablaggi; misura e allinea; ripara; progetta il cablaggio e il patch. Lavora prima e fuori dalle sessioni.
- **Consegna:** registro della manutenzione, misure di calibrazione (livelli di riferimento, risposta dei monitor), schemi del cablaggio.
- **Strumenti standard:** analizzatore audio, oscilloscopio, tester di cavi, software di misura acustica.
- **Come si briefa:** solo se {{STUDIO}} allestisce una sala propria o un set: chiedere la calibrazione dei monitor e la verifica del rumore di fondo prima della prima sessione.
- **Segno di livello alto:** ronzii e rumori di massa non esistono; i canali dello stesso tipo suonano uguali.
- **Errore comune:** considerarlo un costo evitabile; un cavo difettoso scoperto in sessione costa una giornata.

#### Vocal producer (vocal producer)
- **Fa:** dirige la performance della voce cantata: interpretazione, intonazione, pronuncia, respiri, doppi e cori; decide cosa tenere e lo segna per il comping. In sala accanto al fonico, prima dell'editor.
- **Consegna:** voce principale montata o le indicazioni per montarla, doppi, armonie, ad lib, con una mappa della struttura.
- **Strumenti standard:** la sessione del fonico, il testo stampato con segni a margine, Melodyne o Auto-Tune per i controlli rapidi.
- **Come si briefa:** brano, tonalità e tempo definitivi, riferimenti di interpretazione (non di timbro di un artista riconoscibile, vedi `regole.md` §3), quante ore, se servono doppi e cori, chi approva.
- **Segno di livello alto:** ottiene la presa intera e sentita invece di cucire sillabe; il cantante esce dalla sala più sicuro di quando è entrato.
- **Errore comune:** far ripetere la stessa frase fino a sfinire la voce; «tanto si intona dopo».

#### Editor della voce (vocal editor: comping, tuning, timing)
- **Fa:** dopo la registrazione e prima del mix monta la presa composita, corregge intonazione e tempo, pulisce respiri e rumori di bocca, allinea doppi e cori alla voce principale.
- **Consegna:** traccia montata e «stampata» (renderizzata) più la versione non corretta, con le dissolvenze su ogni taglio; per ogni traccia, cosa è stato corretto.
- **Strumenti standard:** Melodyne 5 (versione 5.4.2 [P] Celemony), Auto-Tune Pro 11 o AutoTune Advanced (Antares), Synchro Arts VocAlign e Revoice Pro per l'allineamento, iZotope RX per la pulizia (vedi `misura-analisi-ai.md`).
- **Come si briefa:** quanto deve sentirsi la correzione (invisibile o effetto), se il vibrato va lasciato, se i respiri restano, i riferimenti di genere; consegna sia corretto sia originale.
- **Segno di livello alto:** la voce sembra cantata così; il vibrato e gli scivolamenti espressivi sono rimasti; nessun taglio si sente.
- **Errore comune:** quantizzare tutto alla griglia e tutte le note al centro: la voce diventa piatta e meccanica.

#### Direttore dello speakeraggio e del doppiaggio (voice-over director, dubbing director)
- **Fa:** sceglie le voci con il cliente (provino o casting), dirige lo speaker sul testo: ritmo, intenzione, accenti, durata sul video. Nel doppiaggio dirige anche il sincrono labiale con l'adattatore dei dialoghi. Sta dopo copy e montaggio, prima del mix.
- **Consegna:** prese buone segnate, versioni per durata (per esempio 30" e 15"), alternative di lettura sulle frasi chiave, note di pronuncia (nomi, marchi, termini stranieri).
- **Strumenti standard:** sala di speakeraggio con il video in sincrono, testo con tempi; per le sessioni a distanza Source-Connect, ipDTL, SessionLinkPRO (vedi Tecniche).
- **Come si briefa:** testo definitivo approvato, video montato con durate bloccate, riferimenti di tono (aggettivi e azioni, non «come la voce di X»), pronunce scritte (vedi skill `naming`), chi approva in sala o in collegamento, diritti d'uso della voce (media, territori, durata), uso consentito con AI.
- **Segno di livello alto:** due o tre indicazioni d'azione cambiano la lettura; arriva alla presa buona in poche prove; sa dire al cliente che il testo è troppo lungo per la durata.
- **Errore comune:** del cliente: cambiare il testo in sala; dirigere con aggettivi vaghi («più energia», «più caldo»). Del brief: un testo troppo lungo per la durata (vedi skill `video-scriptwriting`).

#### Speaker e voice talent (voice-over artist, voice actor)
- **Fa:** presta la voce a spot, documentari, istituzionali, podcast, audiolibri, doppiaggio. Lavora in sala o dalla propria cabina, con il direttore e il fonico.
- **Consegna:** se registra da sé: file WAV 24 bit / 48 kHz (o il formato chiesto), una presa per file o una sessione con le prese segnate, rumore di fondo basso e senza elaborazioni non richieste; tono d'ambiente.
- **Strumenti standard:** in cabina professionale: Neumann U 87 Ai (Neumann lo indica per voice-over, doppiaggio e audiolibri [P]), Sennheiser MKH 416 (diffuso nel voice-over e nei trailer [S]), Shure SM7B per radio e podcast; preamp pulito; collegamento Source-Connect.
- **Come si briefa e si sceglie:** sentire il provino sul testo vero, non lo showreel; chiedere se ha una cabina propria e un file di prova registrato lì (rumore di fondo, riverbero); verificare l'iscrizione sindacale se il lavoro è di doppiaggio (CCNL Doppiaggio, ANAD [P]); mettere per iscritto media, territori, durata e il divieto (o il permesso pagato) di usare la voce per addestrare o clonare con AI. ANAD ha ottenuto dal 17/06/2024 una clausola nelle cessioni dei diritti delle major contro l'uso delle voci per l'AI non concordato [P anad.it]; il CCNL Doppiaggio firmato il 6/12/2023 contiene l'articolo 22 su AI e cessione dei diritti [P anad.it].
- **Segno di livello alto:** cambia intenzione su un'indicazione sola; tiene la durata al decimo di secondo; il file arriva pulito, senza respiri tagliati male né rumori di bocca.
- **Errore comune:** di chi sceglie: scegliere sullo showreel lavorato in post e scoprire in sala una voce diversa; usare o imitare la voce di un attore noto (`regole.md` §3).

#### Fonico di presa diretta (production sound mixer)
- **Fa:** registra dialoghi e suoni sul set: sceglie radiomicrofoni e boom, mixa in tempo reale, registra ogni microfono su traccia separata (ISO) più un mix, tiene il timecode, compila il rapporto. Partecipa ai sopralluoghi per segnalare rumori (generatori, traffico, luoghi rimbombanti) [P Netflix]. Prima del montaggio e del montaggio dialoghi.
- **Consegna:** file Broadcast WAV polifonici 24 bit / 48 kHz con metadati iXML (scena, ciak, presa, nomi tracce, prese cerchiate), un rullo audio per giorno di ripresa, rapporto PDF o CSV al DIT a fine giornata, backup proprio separato da quello del DIT [P Netflix].
- **Strumenti standard:** registratori Sound Devices, Zaxcom, Sonosax, Aaton; microfoni DPA, Schoeps, Sanken, Sennheiser, Neumann, Countryman, Shure; radiomicrofoni Lectrosonics, Zaxcom, Sennheiser 6000, Wisycom, Audio Limited, Shure, Sony; generatori di timecode Ambient, Deneke, Mozegear, Betso, Timecode Systems, Tentacle Sync (elenco [P] Netflix Partner Help Center).
- **Come si briefa:** chiamarlo ai sopralluoghi, dargli lista delle location e orari, la frequenza dei fotogrammi del progetto, se ci sono playback musicali, quante persone parlano in contemporanea; per produzioni con dialoghi scritti Netflix indica una squadra suono di almeno tre persone [P].
- **Segno di livello alto:** il dialogo del set arriva al mix senza bisogno di ADR; tono d'ambiente e suoni «selvaggi» registrati per ogni location; metadati corretti (Netflix avverte che il suo sistema di dailies usa il timecode e i metadati del BWAV come fonte di verità, «non prova a correggere errori né a indovinare»: i valori sbagliati scendono a valle così come sono [P Netflix, «MPS Dailies – OnSet Sound Mixer Guidance»]).
- **Errore comune:** della produzione: considerare il suono «da sistemare in post», mettere il generatore vicino al set, non lasciare al microfonista uno spazio dove stare.

#### Microfonista (boom operator)
- **Fa:** tiene il microfono direzionale sull'asta il più vicino possibile agli attori fuori quadro, segue chi parla, evita ombre e rumori di maneggio; spesso piazza i radiomicrofoni sugli attori.
- **Consegna:** il segnale del boom (la traccia di dialogo principale), radiomicrofoni piazzati senza fruscii di vestiti.
- **Strumenti standard:** asta in carbonio, sospensione e antivento; microfono a fucile (Sennheiser MKH 416, Schoeps CMIT 5, DPA 4017) all'esterno, ipercardioide (Schoeps CMC 641) negli interni [S per gli ultimi tre: uso diffuso, non letto].
- **Come si briefa:** dal fonico di presa diretta; {{STUDIO}} deve solo garantire con il direttore della fotografia che la luce lasci un passaggio al boom.
- **Segno di livello alto:** il dialogo ha sempre la stessa distanza percepita anche cambiando inquadratura.
- **Errore comune:** puntare il microfono alla bocca da sotto il mento (si prende il torace) o lasciarlo fermo mentre gli attori si girano.

Fonti: Netflix, «Live Action: Production Sound Best Practices» e «MPS Dailies – OnSet Sound Mixer Guidance» (nuovo Studio Partner Help Center, studiopartner.netflix.net, aperti in Chrome) [P]; Celemony Help Center, «Latest version» [P]; ANAD, «Firmato rinnovo Contratto Nazionale Doppiaggio» (7/12/2023) e «Comunicato Clausola Cessioni Diritti per IA» (22/6/2024) [P]; Netflix «Remote Dub Recording Recommendations» [P]; letto 2026-11-09. Ruoli e prassi di sala: std.

## Tecniche

### Microfoni

#### Microfono dinamico (dynamic, moving coil)
- **Cos'è:** una membrana mossa dal suono muove una bobina in un campo magnetico; non serve alimentazione. Robusto, regge pressioni altissime, poco sensibile: chiede molto guadagno al preamp.
- **Si sente:** medio-alti presenti, alti meno estesi, poco ambiente; la voce sembra vicina e «di radio».
- **Quando:** rullante, tom, amplificatori di chitarra, voce in stanze non trattate, podcast e radio, live.
- **Come:** Shure SM57 da 40 a 15.000 Hz, cardioide, −56 dBV/Pa [P]; Shure SM7B da 50 a 20.000 Hz, cardioide, −59 dBV/Pa: Shure avverte che serve un preamp con più di 60 dB di guadagno o un booster in linea [P]; Sennheiser MD 421 (oggi anche MD 421 Kompakt, da 30 a 17.000 Hz, cardioide, 2 mV/Pa [P sennheiser.com]) su tom, ottoni, cassa della chitarra.
- **AI:** —
- **Errore comune:** collegare un SM7B a un'interfaccia economica al massimo del guadagno: si sente il fruscio del preamp, non del microfono.

#### Microfono a condensatore (condenser, capacitor)
- **Cos'è:** la membrana è un'armatura di un condensatore polarizzato; serve la phantom a 48 V (o un alimentatore a valvole). Sensibile, esteso negli alti, rumore proprio basso. A membrana grande (voce, strumenti solisti) o piccola (overhead, acustici, coppie stereo).
- **Si sente:** dettaglio, aria, transitori precisi; capta anche la stanza e i suoi difetti.
- **Quando:** voce cantata e parlata in cabina trattata, chitarra acustica, pianoforte, archi, overhead, coppie stereo.
- **Come:** Neumann U 87 Ai: tre diagrammi (omni, cardioide, otto), rumore proprio 12 dB-A in cardioide, SPL massimo 117 dB (127 dB con attenuatore) [P]. Per la voce partire a 20-30 cm (vedi «Ripresa della voce cantata»).
- **AI:** —
- **Errore comune:** usarlo in una stanza non trattata «perché è il microfono migliore»: registra benissimo il rimbombo della stanza.

#### Microfono a nastro (ribbon)
- **Cos'è:** un nastro d'alluminio sottilissimo sospeso in un campo magnetico; per costruzione è a figura a otto (stessa sensibilità davanti e dietro). Alti morbidi, forte effetto prossimità.
- **Si sente:** suono «scuro», levigato, naturale; alti mai aspri; ottimo su sorgenti dure.
- **Quando:** amplificatori di chitarra elettrica, ottoni, overhead e ambienti di batteria, archi, voci aspre.
- **Come:** Royer R-121: figura a otto, da 30 a 15.000 Hz ±3 dB, SPL massimo oltre 160 dB a 1 kHz [P]. Coles 4038: progetto BBC, figura a otto, risposta piatta da 30 a 15.000 Hz [P]. La phantom non serve: verificare sul manuale se il modello la tollera.
- **AI:** —
- **Errore comune:** soffiarci dentro o metterlo davanti a una cassa senza protezione: il nastro si deforma o si rompe.

#### Diagrammi polari (polar patterns)
- **Cos'è:** omnidirezionale (capta da tutti i lati), cardioide (davanti, reietta dietro), supercardioide e ipercardioide (più strette, con un piccolo lobo posteriore), figura a otto (davanti e dietro, cieca ai lati), a fucile o lobare (molto stretta in alto).
- **Si sente:** l'omni ha bassi pieni e niente effetto prossimità, ma più stanza; il cardioide isola e scalda da vicino; l'otto prende la stanza dietro e ignora i lati.
- **Quando:** omni per coppie spaziate e stanze belle; cardioide per isolare in sala; otto per Blumlein, M/S, o per escludere un altro strumento messo di lato; fucile per presa diretta e voice-over.
- **Come:** l'effetto prossimità è più forte con la figura a otto, un po' meno con il cardioide, assente con l'omni [P Neumann]. MKH 416: supercardioide in basso e medio, lobare sopra 2 kHz circa [P scheda Sennheiser].
- **AI:** —
- **Errore comune:** usare un fucile in una stanza piccola e riverberante: le riflessioni che entrano fuori asse suonano colorate.

#### Microfoni di riferimento (reference microphones)
- **Cos'è:** i modelli che si trovano in quasi tutti gli studi di livello alto e che un fonico nomina per descrivere un suono. I dati misurabili sono in tabella in «Numeri di riferimento».
- **Si sente:**
  - Neumann U 87 Ai: medi presenti, risposta piatta in asse; «lo standard per voce e parlato» secondo Neumann, usato anche su overhead, chitarra, pianoforte in coppia [P].
  - Neumann U 47 (a valvole, anni '50) e U 47 fet (1972-1986, oggi U 47 fet i, ristampa): cassa, basso elettrico, ottoni, voci potenti; il fet regge 137 dB [P].
  - Neumann M 49 (ristampa M 49 V): valvole, diagramma variabile con continuità, voci [P]. Il primo Decca Tree del 1954 usava tre M 49 [P Sound On Sound].
  - AKG C12 (costruito 1953-1960): valvole, capsula CK12; la ristampa C12 VR ha nove diagrammi comandati a distanza dall'alimentatore [P scheda AKG C12 VR].
  - Shure SM7B: voce dinamica di radio, podcast e di molti dischi; con antivento A7WS per il parlato a contatto [P].
  - Shure SM57: rullante, amplificatori, il microfono «da lavoro» [P].
  - Sennheiser MD 421: tom, ottoni, amplificatori (usi: std).
  - Sennheiser MKH 416: fucile corto a condensatore RF, regge l'umidità; presa diretta, voice-over, trailer [P scheda].
  - Coles 4038: nastro di progetto BBC, risposta piatta 30-15.000 Hz [P]; overhead di batteria, ottoni, archi (usi: std, la pagina Coles non li elenca).
  - Royer R-121: nastro moderno, «il primo microfono da chiamare per la chitarra elettrica» secondo Royer [P, affermazione del produttore].
- **Quando:** chiedere allo studio la lista microfoni prima di prenotare: è il modo più rapido per capirne il livello.
- **Come:** un valvolare d'epoca originale e la sua ristampa non suonano uguali per definizione: chiedere quale si usa.
- **AI:** —
- **Errore comune:** credere che il microfono famoso faccia il suono: piazzamento, stanza e interpretazione contano di più.

#### Effetto prossimità (proximity effect)
- **Cos'è:** nei microfoni a gradiente di pressione (cardioide, otto) i bassi crescono quando la sorgente si avvicina.
- **Si sente:** voce più calda e «da radio»; oltre misura, rimbombante e meno intelligibile; chitarra acustica «boomy».
- **Quando:** usarlo per dare corpo a voci sottili e a cassa e basso; evitarlo su chitarra acustica e voci già scure.
- **Come:** Shure misura sull'SM57 un aumento di 6-10 dB sotto 100 Hz a circa 6 mm dalla sorgente [P]. Neumann: conta soprattutto sotto 200 Hz, più sulle voci maschili gravi; per aggiungere bassi a una voce sottile su un multi-diagramma, passare a figura a otto [P]. SM7B: più vicino = più bassi, più lontano = meno [P].
- **AI:** —
- **Errore comune:** lasciare che il cantante si avvicini e allontani a ogni frase: il colore della voce cambia, e in mix non si corregge.

#### Distanza e fase tra più microfoni (3:1 rule, phase)
- **Cos'è:** due microfoni che captano la stessa sorgente a distanze diverse sommano il suono con un ritardo e producono un filtro a pettine.
- **Si sente:** suono vuoto, «a tubo», che cambia colore quando si alza un fader.
- **Quando:** batteria, chitarra con due microfoni, pianoforte, ensemble.
- **Come:** Shure indica di tenere la distanza fra due microfoni almeno tre volte la distanza di ciascuno dalla propria sorgente [P]. Su due microfoni della stessa sorgente (sopra e sotto il rullante, dentro e fuori la cassa) controllare l'inversione di polarità; in DAW si allineano i tempi di arrivo spostando la traccia di pochi campioni.
- **AI:** —
- **Errore comune:** «aggiustare» con l'EQ un buco che è di fase.

### Ripresa per sorgente

#### Ripresa della voce cantata (vocal recording)
- **Cos'è:** microfono a membrana grande su asta stabile con sospensione e antipop, cantante in cuffia chiusa.
- **Si sente:** voce vicina e intima se a 10-15 cm; più aperta, con un po' di stanza, a 30 cm.
- **Quando:** sempre, adattando la distanza al genere: pop e rap più vicini, jazz e lirica più lontani.
- **Come:** di partenza: 20-30 cm dalla capsula, antipop inclinato non parallelo alla capsula, cuffie chiuse; il guadagno lascia circa 10 dB di margine sopra i picchi più forti, e se il cantante vuole sentirsi più forte si alza la cuffia, non il preamp [P Neumann]. In stanza: lontano da angoli e superfici riflettenti, ma non al centro esatto [S, sintesi dello stesso articolo]. Pochi effetti in cuffia: un riverbero leggero aiuta, troppo copre l'intonazione [P Neumann].
- **AI:** la separazione della voce da un provino (stem) aiuta a fare una guida, non sostituisce la presa (vedi `misura-analisi-ai.md`).
- **Errore comune:** lasciare le casse accese in regia con il microfono aperto, o cuffie aperte vicino al microfono: rientro e rischio di innesco.

#### Plosive e sibilanti in ripresa (plosives, sibilance)
- **Cos'è:** le P e le B spingono aria sulla membrana; le S e le Z hanno energia acuta che i condensatori brillanti esaltano.
- **Si sente:** colpi sordi nei bassi; S che fischiano e pungono in cuffia.
- **Quando:** sempre sulla voce, soprattutto a distanza ravvicinata.
- **Come:** antipop ad almeno 10 cm dal microfono e inclinato, perché un antipop parallelo e vicino crea riflessioni e filtro a pettine sulle sibilanti; i filtri a rete grandi colorano meno degli antivento in spugna [P Neumann]. Per le sibilanti: spostare il microfono di pochi centimetri sopra o di lato rispetto alla bocca (fuori dal flusso diretto); scegliere un microfono meno brillante; il de-esser si fa in mix (std). Nelle lingue non tonali, come l'italiano, le consonanti decidono la comprensione e stanno soprattutto fra 2 e 4 kHz [P DPA]: non tagliarle per togliere le S.
- **AI:** i moduli di de-plosive e de-ess di iZotope RX rimediano a casi isolati (vedi `misura-analisi-ai.md`).
- **Errore comune:** risolvere le plosive con un passa-alto molto alto che toglie il corpo della voce.

#### Chitarra acustica (acoustic guitar)
- **Cos'è:** ripresa a un microfono o in coppia (XY o due microfoni su manico e cassa).
- **Si sente:** puntando la buca si ha rimbombo; puntando il 12° tasto un suono più equilibrato (std).
- **Quando:** cantautorale, folk, pop acustico, spot con chitarra sola.
- **Come:** di partenza: condensatore a membrana piccola o U 87 a 15-30 cm, puntato fra il 12° tasto e l'attacco del manico (std, da confermare all'ascolto). L'effetto prossimità rende «boomy» la chitarra acustica ripresa troppo vicino: il Mi grave è intorno a 80 Hz [P Neumann]. Il Royer R-121 è indicato anche per acustiche suonate con le dita [P].
- **AI:** —
- **Errore comune:** il microfono davanti alla buca a 5 cm.

#### Chitarra elettrica (electric guitar amp)
- **Cos'è:** microfono davanti al cono dell'altoparlante dell'amplificatore, spesso affiancato da un nastro o da un microfono d'ambiente.
- **Si sente:** al centro del cono più brillante e aggressivo, sul bordo più scuro; allontanandosi, più morbido e con meno bassi.
- **Quando:** rock, pop, funk; nel jingle con chitarra.
- **Come:** Shure SM57: a 2,5 cm sul centro del cono = attacco netto e bassi enfatizzati; a 2,5 cm sul bordo = più alti; a 15-30 cm = suono pieno e bilanciato; a 60-90 cm = attacco morbido, meno bassi [P]. Classica coppia SM57 più R-121, con controllo della fase fra i due (std).
- **AI:** i simulatori d'amplificatore (plugin e profilatori) sono un'alternativa; la scelta va decisa prima, non «si ri-amplifica dopo» senza aver registrato anche la traccia diretta (DI).
- **Errore comune:** non registrare la traccia DI in parallelo: niente piano B se il suono non va.

#### Batteria: microfoni vicini, overhead, ambiente (drums: close mic, overheads, room)
- **Cos'è:** un microfono per pezzo (cassa dentro e fuori, rullante sopra e sotto, tom), una coppia overhead per piatti e immagine stereo, uno o due microfoni d'ambiente lontani.
- **Si sente:** i vicini danno attacco e controllo; gli overhead la batteria intera; l'ambiente dimensione e «colla».
- **Quando:** rock e pop registrati; nei generi elettronici spesso solo per campionare.
- **Come:** Shure SM57 a 2,5-7,5 cm sopra il bordo della pelle di rullante e tom, puntato alla pelle; un secondo microfono sotto il rullante per la cordiera [P]. Coppia NOS (cardioidi a 30 cm, 90°) a circa 50 cm sopra i piatti per un'immagine larga [P DPA]. Invertire la polarità del microfono sotto il rullante rispetto a quello sopra (std).
- **AI:** il rimpiazzo dei colpi con campioni (trigger, per esempio Slate Trigger) è prassi: va dichiarato nel brief se la batteria «deve restare vera».
- **Errore comune:** overhead troppo bassi e troppo vicini ai piatti: piatti aspri, batteria piccola.

#### Metodo Glyn Johns (Glyn Johns method)
- **Cos'è:** batteria intera con due condensatori cardioidi a membrana grande: uno sopra il rullante, l'altro più basso, dietro il timpano, che «guarda» il rullante attraverso la batteria; i due devono essere quasi equidistanti dal centro del rullante. Spesso si aggiungono un microfono per la cassa e uno per il rullante.
- **Si sente:** rullante solido al centro, batteria naturale ed equilibrata, movimento stereo sui tom, bassi della cassa presenti [P SOS].
- **Quando:** rock classico, indie, ogni volta che si vuole una batteria «di stanza» con pochi microfoni.
- **Come:** di partenza: microfono alto a circa 1,5-1,8 m (5-6 piedi) sopra il rullante; secondo microfono all'altezza del timpano e oltre; misurare con un metro o un cavo le due distanze dal rullante; pan non necessariamente agli estremi: il microfono centrale un po' da un lato, quello basso più largo [P SOS]. Variante Recorderman: microfono sul rullante più basso (poco più di due bacchette) e secondo sopra la spalla destra del batterista, entrambi equidistanti da rullante e cassa [P SOS].
- **AI:** —
- **Errore comune:** non misurare le distanze: il rullante esce da un lato e suona vuoto.

#### Pianoforte (piano)
- **Cos'è:** pianoforte a coda ripreso con coppia sopra le corde, a coperchio aperto, ed eventualmente con una coppia più lontana.
- **Si sente:** vicino alle corde: attacco e meccanica; più in alto e più lontano: strumento intero e stanza.
- **Quando:** classica, jazz, pop, colonne sonore, spot con pianoforte solo.
- **Come:** DPA misura che a circa 50 cm sopra le corde lo spettro è il più equilibrato, con più peso nei bassi [P]; uso comune: due microfoni sopra le corde, uno per i bassi e uno per gli acuti, o una coppia sopra i martelletti e una più giù lungo le corde [P DPA]; una coppia ORTF nella curva della coda con coperchio aperto dà un suono diretto e un buon equilibrio fra gravi e acuti [P DPA]. Neumann cita la coppia di U 87 Ai come scelta di molti fonici per il pianoforte [P].
- **AI:** —
- **Errore comune:** microfoni troppo vicini a pedali e meccanica: si registrano rumori di tasti e pedale.

#### Archi (strings)
- **Cos'è:** violini, viole e violoncelli ripresi da sopra (lo strumento irradia molto verso l'alto) e da una certa distanza, perché il suono si forma nell'aria.
- **Si sente:** troppo vicino: fruscio dell'arco, suono aspro, «nasale»; a distanza giusta: corpo e brillantezza naturali.
- **Quando:** sessioni d'archi per pop e colonne sonore; quartetto; solista.
- **Come:** di partenza: solista a 50 cm-1 m sopra e davanti allo strumento (std); per sezioni: coppia principale o Decca Tree più microfoni di sezione. Il violino arriva fino a 10 kHz di armoniche dirette e 16 kHz di componenti più deboli, il violoncello 8 / 16 kHz [P tabella DPA]. Neumann cita l'U 87 Ai come microfono di supporto per solisti come il violoncello [P]; nastri (Coles, Royer) per ammorbidire violini aspri (std).
- **AI:** le librerie campionate (vedi `produzione-composizione.md`) bastano per un provino; per la consegna finale di uno spot «premium» la sessione vera si sente.
- **Errore comune:** riprendere ogni leggio da 20 cm come fosse una band: si perde la sezione e si sente solo fruscio.

### Stereo

#### Coppie coincidenti: XY, Blumlein, M/S (coincident pairs)
- **Cos'è:** due capsule nello stesso punto. XY: due cardioidi angolati; Blumlein: due figure a otto a 90°; M/S: un cardioide (Mid) verso la sorgente e un otto (Side) di lato, poi una matrice L = M+S, R = M−S.
- **Si sente:** immagine stabile e precisa, compatibile in mono; meno sensazione di spazio dell'AB. Il Blumlein aggiunge ambiente da dietro.
- **Quando:** XY per chitarra, overhead, registrazioni compatte; Blumlein in sale belle; M/S quando la larghezza va decisa dopo (e in mono resta solo il Mid).
- **Come:** XY standard: cardioidi a 90° (±45°); più larga la sorgente, più stretto l'angolo; Blumlein: otto a ±45°; in M/S il lato in fase dell'otto va a sinistra per convenzione; M/S è di Holger Lauridsen [P DPA].
- **AI:** —
- **Errore comune:** capsule non sovrapposte in verticale: non è più coincidente e la fase si muove.

#### Coppie quasi coincidenti e spaziate: ORTF, NOS, AB (near-coincident and spaced pairs)
- **Cos'è:** ORTF: due cardioidi a 17 cm con 110° fra gli assi; NOS: due cardioidi a 30 cm e 90°; AB: due omni distanziati e paralleli.
- **Si sente:** più spazio e profondità dell'XY; l'AB ha i bassi più pieni e l'ambiente più bello, ma l'immagine meno precisa e in mono può dare filtro a pettine.
- **Quando:** ORTF per ensemble, pianoforte, overhead; NOS per overhead larghi; AB per orchestre e cori in sale buone, a distanza (gli omni non perdono bassi allontanandosi).
- **Come:** AB: DPA calcola per una sorgente di 140° (±70°) riprodotta a ±30° una distanza di 40 cm fra gli omni [P]. ORTF: due cardioidi a 17 cm, angolati verso l'esterno a 110° fra loro (±55°), definito dalla radio francese ORTF intorno al 1960 con microfoni Schoeps [P Schoeps, storia del MSTC e «ORTF Stereo Outdoor Set»]; la pagina DPA scrive «±110°», da leggere come 110° totali. NOS 30 cm, 90° [P DPA]; DIN 20 cm, 90° [P DPA].
- **AI:** —
- **Errore comune:** un AB troppo lontano dalla sorgente: troppo riverbero e «buco» al centro.

#### Albero Decca (Decca Tree)
- **Cos'è:** tre omni a T: sinistro e destro a circa 2 m, il centrale circa 1,5 m più avanti, sospesi sopra e poco dietro il direttore. Nato nel 1954 da Roy Wallace e Arthur Haddy a Decca Studios, con tre M 49; poi lo standard è diventato il Neumann M 50 [P SOS e Tape Op].
- **Si sente:** immagine larga e articolata con un centro solido; il suono delle grandi colonne sonore orchestrali.
- **Quando:** orchestra per film, televisione, videogiochi, spot sinfonici; oggi con microfoni di sezione e due «outrigger» ai lati [P SOS, Tape Op].
- **Come:** sinistro e destro panoramicati agli estremi, centrale al centro; altezza 2,4-3 m (8-10 piedi) sopra il direttore secondo la sala; laterali puntati verso l'interno e in basso; controllare in mono, perché gli omni danno facilmente un'onda di ambiente [P Tape Op]. Le misure cambiano con sala e organico: Decca stessa usava più formazioni [S].
- **AI:** —
- **Errore comune:** togliere il microfono centrale: si apre un buco in mezzo, che è proprio ciò che il centrale deve riempire [P Tape Op].

Fonti: Shure SM57 e SM7B user guide (pubs.shure.com) [P]; Neumann, pagine prodotto U 87 Ai, U 47 fet i, M 49 V Set, U 67 Set e Home Studio Academy («Recording vocals… part 1», «How to protect your microphone against pops», «What is the proximity effect») [P]; Royer R-121 [P]; Coles 4038 [P]; scheda Sennheiser MKH 416 (PDF) [P]; DPA Mic University («Stereo recording techniques and setups», «Piano sound fields and miking implications», «Acoustical characteristics of musical instruments», «Facts about speech intelligibility») [P]; Sound On Sound, «Recording Drum Kits With Only Two Mics» e «Recording The Orchestra» (O. Paris, 2020) [P]; Tape Op, «Microphones: The Decca Tree Technique» [P]; Schoeps, «MSTC» (storia dei prodotti) e «ORTF Stereo Outdoor Set» [P]; AKG, scheda C12 VR [P]; Sennheiser, pagina MD 421 Kompakt e specifiche MKH 416 (docs.cloud.sennheiser.com) [P]. Letto 2026-11-09.

### Catena, livelli, sala

#### Preamplificatori e convertitori (preamps, AD/DA conversion)
- **Cos'è:** il preamp alza il segnale del microfono (decine di dB) a livello di linea; il convertitore lo trasforma in digitale. Preamp «trasparenti» (pochissima colorazione) o «di carattere» (trasformatori, valvole, saturazione).
- **Si sente:** il preamp di carattere aggiunge spessore e armoniche se spinto; un preamp debole su un microfono poco sensibile aggiunge fruscio.
- **Quando:** carattere su voce, basso, batteria nel pop e nel rock; trasparenza in classica, jazz acustico, speakeraggio.
- **Come:** nomi di riferimento: Neve 1073, API 512c, SSL, Universal Audio 610 (carattere); Grace Design, Millennia, RME, Prism (trasparenza); convertitori Avid MTRX, Prism, RME, Universal Audio Apollo (std). Verificare che il guadagno disponibile basti per il microfono: con l'SM7B servono più di 60 dB [P Shure].
- **AI:** —
- **Errore comune:** pagare il preamp famoso e collegare il microfono con un cavo da pochi euro e un'interfaccia satura.

#### Livelli di registrazione e margine (recording levels, headroom)
- **Cos'è:** il livello digitale al quale si registra; in digitale lo 0 dBFS è un muro, e oltre il segnale si taglia senza rimedio.
- **Si sente:** troppo alto: distorsione dura e irreparabile sui picchi; troppo basso a 24 bit: quasi niente, perché il rumore della catena analogica sta comunque sopra quello digitale (std).
- **Quando:** sempre.
- **Come:** il riferimento europeo è il livello di allineamento a −18 dBFS: il tono di prova sta 18 dB sotto il massimo, indipendentemente dal numero di bit [P EBU R 68]; negli USA il tono di riferimento è un seno a 1 kHz a −20 dBFS [P SMPTE RP 155:2014, §5.1]. È il livello del tono di allineamento, non il livello del programma: quello si regola in loudness (EBU R 128, vedi `audio-per-immagine.md`), come ricorda la stessa RP 155 nell'allegato A [P]. Neumann consiglia di lasciare circa 10 dB di margine sopra i picchi più forti della voce [P]; Sound On Sound (H. Robjohns) suggerisce a 24 bit circa 20 dB di margine sopra il livello nominale, con la maggior parte dei picchi non oltre −10 dBFS circa [P SOS]. La skill DJ indica come partenza una media intorno a −18 dBFS con picchi fra −12 e −6 dBFS [S: skill interna, fonti blog di vendor; più spinta del consiglio SOS]. Il registratore a 32 bit virgola mobile permette di salvare file oltre 0 dBFS, ma non elimina la saturazione analogica: il livello massimo d'ingresso del registratore deve stare sopra l'uscita massima del microfono, e il guadagno analogico va ancora impostato [P DPA].
- **AI:** il de-clip (iZotope RX) ricostruisce picchi tagliati leggeri; un clipping forte non torna (vedi `misura-analisi-ai.md`).
- **Errore comune:** guardare solo il fader del mix e non il livello d'ingresso; regolare il guadagno del preamp per accontentare il cantante che vuole «sentirsi di più» (si alza la cuffia).

#### Frequenza di campionamento e profondità di bit (sample rate, bit depth)
- **Cos'è:** la frequenza decide la banda registrabile (fino a metà della frequenza); i bit decidono la gamma dinamica (circa 6 dB per bit: 16 bit ≈ 96 dB, 24 bit ≈ 144 dB teorici, std).
- **Si sente:** a 24 bit, con livelli giusti, la differenza fra 48 e 96 kHz all'ascolto è minima; 96 kHz serve soprattutto per rallentare, intonare o elaborare molto il suono (sound design, effetti), con file più pesanti (std).
- **Quando:** video e broadcast: 48 kHz, 24 bit [P Netflix: dialoghi di set, mix e doppiaggio a distanza]; effetti e ambienti registrati sul campo: 48 kHz o più [P Netflix]; musica: 24 bit a 44,1, 48 o 96 kHz secondo lo studio (il master per Apple Digital Masters parte da master a 24 bit [P Apple]); audiolibro ACX: consegna MP3 CBR 192 kbps o più a 44,1 kHz [P ACX].
- **Come:** decidere la frequenza prima della prima sessione e non cambiarla; per musica destinata a uno spot, registrare a 48 kHz evita una conversione.
- **AI:** molti generatori consegnano 44,1 o 48 kHz compressi: verificare il formato reale con una misura, non con il nome del file (vedi `misura-analisi-ai.md`).
- **Errore comune:** sessione musicale a 44,1 kHz che poi va su video a 48 kHz senza dirlo: conversione fatta male da qualcuno a valle o, peggio, audio che scorre a velocità sbagliata.

#### Cuffie e mix cuffia in sala (headphones, cue mix)
- **Cos'è:** il mix che sente chi suona o parla; spesso uno per musicista, separato dal mix della regia.
- **Si sente:** dal risultato: chi si sente bene canta intonato e suona a tempo; chi si sente male forza la voce o rallenta.
- **Quando:** sempre in sovraincisione; per lo speaker con video, anche il sonoro guida del montaggio a basso volume.
- **Come:** cuffie chiuse vicino ai microfoni sensibili (le aperte rientrano nel microfono) [P Neumann]; un po' di riverbero per il comfort, non tanto da coprire l'intonazione [P Neumann]; click a volume utile ma non tale da rientrare nel microfono della voce (std). Modelli diffusi in sala: Sony MDR-7506, Beyerdynamic DT 770, Audio-Technica ATH-M50x (std).
- **AI:** —
- **Errore comune:** clic del metronomo che rientra nel microfono della voce o della chitarra acustica, e non si toglie più.

#### Acustica della sala e cabina voce (room acoustics, isolation, vocal booth)
- **Cos'è:** due problemi distinti. Isolamento: impedire al rumore esterno di entrare (massa, stanza nella stanza, porte doppie, impianti silenziosi). Trattamento: controllare le riflessioni interne (assorbitori, trappole per i bassi, diffusori).
- **Si sente:** stanza non isolata: traffico, condizionatore, ronzii sotto la voce. Stanza non trattata: voce «in scatola», risonanze, riflessioni che si sommano al diretto.
- **Quando:** per speakeraggio e doppiaggio la cabina deve essere quasi «morta», perché il mixer aggiunge l'ambiente che vuole [P Netflix: le voci di doppiaggio vanno registrate in ambienti silenziosi per poterle mixare come interne o esterne].
- **Come:** per le sale d'ascolto critico l'EBU chiede rumore di fondo preferibilmente non oltre NR 10 e mai oltre NR 15, senza componenti impulsive, cicliche o tonali, e un tempo di riverberazione nominale fra 0,2 e 0,4 s [P EBU Tech 3276]. Per le stanze di produzione esiste una norma tedesca, DIN 15996 (edizione 2020-12, a pagamento, non letta): assegna a ogni uso della stanza una curva limite GK, derivata dalle curve NR, misurata per terzi d'ottava con impianti accesi [P DAGA 2011, IRT]; per le stanze di registrazione del parlato le fonti secondarie riportano GK 5-15 [S: tesi TU Graz e Handbuch der Tonstudiotechnik, lette in sintesi]. Un esempio realizzato (studi radio tedeschi) chiedeva GK 10 / GK 15, isolamento DnT,w oltre 65-70 dB e T60 di 0,4-0,5 s per lo studio [P DAGA 2011]. Per la cabina voce i valori correnti dei progettisti sono NR 15 / NC 15 come massimo, RT60 fra 0,1 e 0,35 s circa, isolamento oltre 70 dB [S: siti di progettisti acustici e Engineering Toolbox, letti in sintesi]. In casa, Netflix suggerisce stanze tranquille con poche infiltrazioni dall'esterno e tessuti sul maggior numero di superfici (gli armadi funzionano bene) e di stare ad almeno 30 cm (12 pollici) dal microfono [P, linee guida del 2020]; il problema principale è di solito la stanza più che il microfono (std).
- **AI:** de-reverb e de-noise con reti neurali recuperano registrazioni d'emergenza, ma il risultato si sente quando va in mix con voci registrate in cabina (vedi `misura-analisi-ai.md`).
- **Errore comune:** confondere i pannelli fonoassorbenti con l'isolamento: assorbono le riflessioni, non fermano il traffico.

### Voce: montaggio e correzione

#### Comping e allineamento ritmico (comping, timing edit)
- **Cos'è:** registrare più prese intere e costruire la traccia migliore frase per frase; poi allineare il tempo di doppi, cori e strumenti alla traccia guida.
- **Si sente:** fatto bene, una presa sola, viva e coerente; fatto male, cambi di colore e di distanza fra una frase e l'altra, respiri tagliati.
- **Quando:** voce pop, rap, rock; speakeraggio con più letture; cori e doppi stretti.
- **Come:** 3-5 prese intere prima di andare sui dettagli (std); il vocal producer segna le scelte durante la sessione; dissolvenze brevi su ogni taglio, tagli sulle consonanti o nei respiri (std). Per i doppi: Synchro Arts VocAlign o Revoice Pro allineano tempo (e, se si vuole, intonazione) a una traccia guida; in alternativa l'editor dell'audio della DAW (std).
- **AI:** gli strumenti di allineamento e intonazione usano analisi automatica, non generazione: restano montaggio di prese vere.
- **Errore comune:** comping di prese registrate in giorni diversi a distanze diverse dal microfono: la voce cambia di colore a ogni frase.

#### Correzione dell'intonazione: correzione ed effetto (pitch correction, Melodyne, Auto-Tune)
- **Cos'è:** due modi d'uso degli stessi strumenti. Correzione grafica nota per nota (Melodyne, Auto-Tune Pro in Graph Mode) che deve restare invisibile; correzione automatica in tempo reale, che con tempi rapidi diventa l'effetto «robotico» riconoscibile (Auto-Tune in Classic Mode, che ricrea Auto-Tune 5 [P SOS]).
- **Si sente:** correzione invisibile: la voce è intonata e conserva vibrato e scivolamenti; correzione aggressiva: salti di nota a gradino, formanti strane, voce «da plastica»; effetto: scelta stilistica di trap, pop, reggaeton, hyperpop.
- **Quando:** quasi sempre come correzione leggera nel pop; come effetto se il genere lo chiede, deciso con l'artista prima della sessione (spesso il cantante canta già con l'effetto in cuffia).
- **Come:** Melodyne 5 (5.4.2 è l'ultima versione [P Celemony]) si integra con ARA in Pro Tools, Logic, Cubase/Nuendo, Studio One (std; ARA in Pro Tools e Logic [P Celemony]). Antares: AutoTune 2026 (Modern Mode con Flex Tune e Humanize, Classic Mode) e Auto-Tune Pro 11 con Graph Mode; dal 25/9/2026 AutoTune Advanced con il motore DVA che riconosce e preserva il vibrato naturale e una modalità Live a 0,84 ms di latenza a 44,1 kHz [P SOS]. Correggere il tempo prima dell'intonazione e lavorare sulla presa già montata (std).
- **AI:** Antares Metamorph (trasformatore vocale AI, novembre 2025 [S, non riletto]) e i «voice changer» (anche `voice_change` di Higgsfield, vedi skill `higgsfield-audio`) trasformano il timbro: è cambio di voce, non correzione, e tocca i diritti sulla voce (`regole.md` §3).
- **Errore comune:** intonare prima di aver scelto le prese; consegnare solo la voce corretta senza l'originale.

### Voce parlata, distanza, sincrono

#### Speakeraggio per spot e podcast (voice-over recording for ads and podcasts)
- **Cos'è:** registrare una voce parlata pulita, asciutta, a distanza costante, spesso sul video montato.
- **Si sente:** voce vicina, piena, intelligibile, senza stanza; nel podcast, voci con lo stesso colore e livello.
- **Quando:** spot radio e TV, video social, istituzionali, documentari, podcast, audiolibri.
- **Come:** catena tipica: condensatore a membrana grande (U 87 Ai) o fucile (MKH 416) o dinamico da radio (SM7B, a 2,5-15 cm, con antivento A7WS per il parlato a contatto [P Shure]); preamp pulito; nessuna compressione forte in ripresa (std). Rumore di fondo: per l'audiolibro ACX chiede un fondo non oltre −60 dB RMS e da 1 a 5 secondi di tono d'ambiente in testa e in coda, file fra −23 e −18 dB RMS e picchi sotto −3 dB [P]: utile come soglia minima anche per spot e podcast. Sincrono: lo speaker legge sul video con il sonoro guida; si registrano le versioni per durata. File per il mixer: una presa buona per file o sessione con le prese segnate, WAV 24 bit / 48 kHz, mono, senza EQ né compressione stampati, nomi con progetto, versione, durata e numero di presa (std).
- **AI:** la sintesi vocale (ElevenLabs, Higgsfield `text2speech_v2`, `qwen_audio_tts`, vedi skill `higgsfield-audio`) serve per animatic e provini interni; per una consegna con voce sintetica vanno verificati termini, etichetta AI Act e il divieto di imitare voci riconoscibili (`regole.md` §3 e §6). ACX vieta su sue opere TTS e AI non autorizzati [P].
- **Errore comune:** registrare lo speaker in una stanza qualunque «tanto poi si pulisce»; consegnare la voce già compressa e con EQ: il mixer non può tornare indietro.

#### Registrazione a distanza (remote recording, Source-Connect)
- **Cos'è:** lo speaker registra nella propria cabina, regia e cliente ascoltano e dirigono da un altro luogo in tempo reale; la presa definitiva viene registrata in locale in alta qualità e trasferita.
- **Si sente:** se la cabina dello speaker è buona, come in studio; altrimenti si sente la stanza di casa.
- **Quando:** speaker all'estero o di altre città, sessioni con cliente in collegamento, doppiaggio a distanza.
- **Come:** Source-Connect 4 (uscito il 18/03/2025): fino a 6 partecipanti, timecode LTC/MTC, recupero automatico dell'audio originale se la rete perde pacchetti, fino a 24 canali con la licenza Facility, codec AAC-ELD v2 [P Source Elements]; 4.1 (29/01/2026) con certificazione Dolby Atmos (solo licenza Facility su macOS) [P]; 4.2 (24/03/2026) con 96 kHz nativi [P]; ultima versione letta 4.3.1 (03/11/2026) [P note di rilascio]. Alternative: ipDTL, SessionLinkPRO, Cleanfeed (std). Netflix per il doppiaggio a distanza indica SessionLinkPRO (validato, con microfono USB spedito all'attore) e Source-Connect Standard, e registrazione a 24 bit / 48 kHz WAV salvo accordi diversi [P; pagina del 2020, v1.x, nata con il COVID: Netflix ricorda che non sostituisce una sala di doppiaggio vera]. L'ISDN, che per decenni ha collegato gli studi, è superato: nel Regno Unito Openreach lo spegne il 31/01/2027 [S].
- **AI:** —
- **Errore comune:** accettare come presa definitiva lo stream compresso della chiamata invece del file registrato in locale.

#### Timecode e sincrono (timecode and sync)
- **Cos'è:** l'indirizzo temporale (ore:minuti:secondi:fotogrammi) scritto nei file di camera e registratore, che permette di sincronizzare in automatico.
- **Si sente:** non si sente; si vede quando manca: labiale fuori sincrono, ore di sincronizzazione a mano.
- **Quando:** ogni ripresa video con audio separato; speakeraggio su video; musica suonata in playback sul set.
- **Come:** camera e registratore in jam sync a una sorgente comune all'inizio della giornata; la frequenza dei fotogrammi (time of day o free run) si decide con camera e montaggio; prevedere il passaggio della mezzanotte durante una presa; gli user bits possono portare rullo, camera, data [P Netflix]. Per i playback musicali registrare su 2-3 canali la traccia di playback e il timecode SMPTE LTC alla frequenza del progetto [P Netflix]. SMPTE ST 12-1 copre le frequenze nominali 23,98, 24, 25, 29,97, 30, 47,95, 48, 50, 59,94 e 60 fps, con 32 user bits e un modo drop frame; ST 12-3 estende a 72, 96, 100 e 120 [P SMPTE, «Understanding Standards: Time Code»]. In Europa il video televisivo è a 25 fps; il cinema a 24 o 23,976; il broadcast USA a 29,97 drop frame (std). Il drop frame salta le etichette 00 e 01 a ogni minuto tranne i decimi; non toglie fotogrammi [S Wikipedia]. Frequenze d'immagine in post, pull-up e pull-down: `audio-per-immagine.md` («Sincronizzazione e frame rate»); timecode per luci e video dal vivo: `live-palco.md`.
- **AI:** —
- **Errore comune:** frequenza di timecode diversa fra camera e audio, scoperta in montaggio.

#### Presa diretta: boom e radiomicrofoni (production sound: boom and lavaliers)
- **Cos'è:** il dialogo del set si prende con un microfono sull'asta fuori quadro (suono naturale, prospettiva coerente) e con radiomicrofoni nascosti sugli attori (vicinanza, isolamento). Si registrano entrambi su tracce separate.
- **Si sente:** boom: voce naturale con un po' di spazio; radiomicrofono: voce vicina ma più scura e a rischio di fruscii di vestiti.
- **Quando:** ogni ripresa con parlato: spot con dialogo, film di marca, interviste, documentari.
- **Come:** la posizione del microfono cambia il timbro: sul petto e sul collo si perde la banda 2-4 kHz che dà l'intelligibilità; sulla fronte il suono è quasi uguale a quello a 1 m; dietro l'orecchio si perdono gli alti sopra 1 kHz [P DPA]. Registrare tono d'ambiente in ogni location (std); segnare nel rapporto prese buone, prese «selvagge» (wild) e scartate; un rullo per giorno, file polifonici con metadati, almeno 8 secondi di pre-roll per presa (anche con la cache di pre-registrazione) [P Netflix]; rifare il jam sync dopo cambi di batteria, riavvii e riprese a velocità variata [P Netflix, OnSet Sound Mixer Guidance]. Chiedere ai reparti: costumi per i radiomicrofoni, macchinisti per il generatore lontano e per il carrello silenzioso, elettricisti per le luci rumorose [P Netflix].
- **AI:** l'isolamento del dialogo con reti neurali (iZotope RX Dialogue Isolate) salva molte prese rumorose, ma va provato prima di rinunciare al microfonista (vedi `misura-analisi-ai.md`).
- **Errore comune:** contare solo sui radiomicrofoni e rinunciare al boom: le voci diventano tutte uguali e in mix «non stanno nella scena».

#### File e consegna: BWF, nomi, take sheet (file delivery, naming, take sheet)
- **Cos'è:** il pacchetto che accompagna una registrazione: file nel formato giusto, nomi leggibili, metadati, foglio delle prese.
- **Si sente:** non si sente; si paga in ore di chi riceve.
- **Quando:** a fine di ogni giornata di sala o di set e a ogni consegna a un mixer.
- **Come:** Broadcast WAV (EBU Tech 3285, versione 2 con metadati di loudness [P EBU]); sul set file polifonici 24 bit / 48 kHz con iXML corretto e prese cerchiate segnate e confermate con la segretaria di edizione [P Netflix]; il rapporto audio contiene almeno nome della produzione, date, rullo, frequenza e bit, timecode, modello di registratore e mixer, microfoni, nome e contatti del fonico [P Netflix]; non ripetere i numeri di rullo [P Netflix]. In studio: nomi traccia uguali in sessione e negli export, tutti i file dallo stesso punto d'inizio, una cartella per brano, un foglio con microfono, preamp e note per traccia (std).
- **AI:** —
- **Errore comune:** file chiamati «Audio 1_03.wav»; consegnare solo il mix senza le tracce separate.

Fonti: EBU R 68 (2000) e EBU Tech 3276 2ª ed. (maggio 1998, PDF letto con PDFKit) [P, riletti nella verifica indipendente]; SMPTE RP 155:2014 (PDF da pub.smpte.org) e SMPTE, «Understanding Standards: Time Code» (smpte.substack.com) [P]; Sound On Sound, «Q. What are the reference levels in digital audio systems?» [P]; DEGA, DAGA 2011, «Akustik im Rundfunk» (IRT) [P]; Netflix, «MPS Dailies – OnSet Sound Mixer Guidance» [P]; EBU Tech 3285 v2, pagina di presentazione [P]; Netflix Partner Help Center: «Live Action: Production Sound Best Practices» e «Remote Dub Recording Recommendations & Security Guidelines» [P]; ACX, «ACX Audio Submission Requirements» (aperta in Chrome) [P]; Apple, «Apple Digital Masters» [P]; DPA Mic University, «32-bit floating-point and other conversions» e «How mic placement affects the voice» [P]; Neumann Home Studio Academy [P]; Source Elements, comunicato Source-Connect 4 (PR Newswire, 18/3/2025) e note di rilascio 4.1.0 e 4.2.0 [P]; Celemony Help Center [P]; Sound On Sound, notizie su AutoTune 2026 e AutoTune Advanced (25/9/2026) [P]; switch-off ISDN e valori per cabine voce [S]. Letto 2026-11-09.

## Numeri di riferimento

Tutti i valori di distanza sono **di partenza**: si confermano all'ascolto.

**Microfoni di riferimento (dati del costruttore)**

| Modello | Tipo | Diagramma | Rumore proprio (A) | SPL max (0,5% THD) | Banda | Fonte |
|---|---|---|---|---|---|---|
| Neumann U 87 Ai | condensatore, membrana grande | omni / cardioide / otto | 15 / 12 / 14 dB-A | 117 dB (127 con attenuatore) | 20 Hz-20 kHz | [P] neumann.com, scheda, letto 2026-11-09 |
| Neumann U 67 Set (ristampa) | valvole | omni / cardioide / otto | 21 / 17 / 20 dB-A | 114 dB (124 con attenuatore) | 20 Hz-20 kHz | [P] neumann.com |
| Neumann U 47 fet i (ristampa del fet 1972-1986) | condensatore FET | cardioide | 18 dB-A | 137 dB (147 con attenuatore) | 40 Hz-16 kHz | [P] neumann.com |
| Neumann M 49 V Set (ristampa) | valvole | variabile omni-cardioide-otto | 21 / 20 / 19 dB-A | 125 dB (cardioide) | 40 Hz-16 kHz | [P] neumann.com |
| AKG C12 VR (ristampa del C12 1953-1960) | valvole, capsula CK12 | nove diagrammi (omni, cardioide, otto e sei intermedi) | 22 dB-A | 128 dB (al 3% di THD, non 0,5%) | 30 Hz-20 kHz; 10 mV/Pa | [P] scheda AKG C12 VR (akg.com); SPL max: [P] scheda tecnica AKG, copia su cdn-docs.av-iq.com |
| Shure SM7B | dinamico | cardioide | — | — | 50 Hz-20 kHz; −59 dBV/Pa; serve preamp > 60 dB di guadagno | [P] pubs.shure.com |
| Shure SM57 | dinamico | cardioide | — | — | 40 Hz-15 kHz; −56 dBV/Pa | [P] pubs.shure.com |
| Sennheiser MD 421 Kompakt | dinamico | cardioide | — | non dichiarato | 30 Hz-17 kHz; 2 mV/Pa ±2,5 dB | [P] sennheiser.com, pagina prodotto |
| Sennheiser MKH 416 | condensatore RF, fucile corto | supercardioide / lobare | circa 13 dB-A (24 dB CCIR) | 130 dB | 40 Hz-20 kHz; 25 mV/Pa | [P] docs.cloud.sennheiser.com, specifiche MKH 416 |
| Coles 4038 | nastro | otto | — | — | 30 Hz-15 kHz piatta | [P] coleselectroacoustics.com |
| Royer R-121 | nastro (offset) | otto | — | > 160 dB a 1 kHz, > 135 dB a 20 Hz | 30 Hz-15 kHz ±3 dB; −47 dBV/Pa | [P] royerlabs.com |

**Livelli e formati**

| Grandezza | Valore | Uso | Fonte |
|---|---|---|---|
| Livello di allineamento | −18 dBFS (18 dB sotto il massimo, a qualsiasi numero di bit) | Europa, broadcast e studio | [P] EBU R 68 (2000), letto 2026-11-09 |
| Livello di riferimento USA | −20 dBFS, seno a 1 kHz (24 bit: picchi 0CCCCD / F33333 hex) | broadcast e cinema USA | [P] SMPTE RP 155:2014 §5.1-5.2 (pub.smpte.org), letto 2026-11-09 |
| Margine sopra i picchi in ripresa voce | circa 10 dB | voce in studio | [P] Neumann Home Studio Academy |
| Margine a 24 bit | circa 20 dB sopra il nominale; picchi per lo più ≤ −10 dBFS circa | registrazione | [P] Sound On Sound, «Q. What are the reference levels in digital audio systems?» |
| Media e picchi in ripresa | media ≈ −18 dBFS, picchi −12…−6 dBFS | musica | [S] skill DJ interna; più spinta del consiglio SOS |
| Frequenza e bit per video, broadcast, doppiaggio | 48 kHz, 24 bit, WAV/BWF | dialoghi di set, mix, doppiaggio | [P] Netflix Partner Help Center |
| Effetti e ambienti sul campo | 48 kHz o più, 24 bit | sound design | [P] Netflix |
| Musica | 24 bit; 44,1, 48 o 96 kHz secondo progetto | album, singoli | [P] Apple Digital Masters (24 bit); frequenze: std |
| Audiolibro ACX | RMS fra −23 e −18 dB; picchi ≤ −3 dB; fondo ≤ −60 dB RMS; tono d'ambiente 1-5 s in testa e coda; MP3 CBR ≥ 192 kbps a 44,1 kHz | audiolibri, soglia utile anche per voce di podcast | [P] acx.com, letto 2026-11-09 |
| Gamma dinamica teorica | 16 bit ≈ 96 dB; 24 bit ≈ 144 dB | calcolo, ≈ 6,02 dB per bit | std |
| Source-Connect 4.2 e successive (ultima: 4.3.1, 3/11/2026) | 96 kHz nativi | sessioni a distanza | [P] note di rilascio 4.2.0 (24/3/2026) e 4.3.1 |

**Distanze di partenza**

| Situazione | Distanza / disposizione | Fonte |
|---|---|---|
| Voce cantata, membrana grande | 20-30 cm | [P] Neumann |
| Antipop | ≥ 10 cm dal microfono, inclinato | [P] Neumann |
| SM7B, parlato | 2,5-15 cm | [P] Shure |
| SM57, voce | < 15 cm o a contatto con la griglia | [P] Shure |
| Voce in casa (doppiaggio, VO di emergenza) | ≥ 30 cm (12 pollici) | [P] Netflix |
| Parlato «naturale» di riferimento | 1 m davanti a chi parla; parlato normale a 1 m ≈ 55-65 dB SPL | [P] DPA |
| Rullante e tom | 2,5-7,5 cm sopra la pelle | [P] Shure |
| Amplificatore chitarra | 2,5 cm (centro o bordo del cono); 15-30 cm; 60-90 cm | [P] Shure |
| Regola fra due microfoni | distanza fra i microfoni ≥ 3 × distanza microfono-sorgente | [P] Shure |
| Overhead NOS | circa 50 cm sopra i piatti | [P] DPA |
| Glyn Johns | microfono alto ≈ 1,5-1,8 m sopra il rullante; due microfoni equidistanti dal rullante | [P] Sound On Sound |
| Pianoforte a coda | circa 50 cm sopra le corde: spettro più equilibrato | [P] DPA |
| Chitarra acustica | 15-30 cm, fra 12° tasto e attacco del manico | std |
| Effetto prossimità | +6-10 dB sotto 100 Hz a circa 6 mm (SM57) | [P] Shure |

**Coppie stereo**

| Tecnica | Microfoni | Distanza fra capsule | Angolo | Fonte |
|---|---|---|---|---|
| XY | 2 cardioidi | coincidenti | 90° (±45°) di riferimento | [P] DPA |
| Blumlein | 2 figure a otto | coincidenti | 90° (±45°) | [P] DPA |
| M/S | cardioide (M) + otto (S) | coincidenti | otto a 90° dall'asse, lato in fase a sinistra | [P] DPA |
| ORTF | 2 cardioidi | 17 cm | 110° totali (±55°) | [P] Schoeps (distanza e angolo); [P] DPA (distanza) |
| NOS | 2 cardioidi | 30 cm | 90° | [P] DPA |
| AB | 2 omni paralleli | esempio: 40 cm per sorgente di ±70° resa a ±30° | 0° | [P] DPA |
| Decca Tree | 3 omni (M 50 lo standard storico) | L-R ≈ 2 m, centrale ≈ 1,5 m avanti | L e R verso l'interno e in basso; altezza 2,4-3 m sopra il direttore | [P] Tape Op; [P] SOS per la storia |

**Sala e rumore di fondo**

| Grandezza | Valore | Ambito | Fonte |
|---|---|---|---|
| Rumore di fondo, sala d'ascolto critico | preferibilmente ≤ NR 10, mai > NR 15; niente rumori impulsivi, ciclici o tonali | ascolto di riferimento | [P] EBU Tech 3276 2ª ed., §2.6 |
| Tempo di riverberazione nominale (media 200 Hz-4 kHz) | 0,2 < Tm < 0,4 s, crescente con il volume (Tm = 0,25 (V/V0)^1/3) | sala d'ascolto | [P] EBU Tech 3276 |
| Stanze di produzione (Germania) | curve limite GK 0-25 derivate dalle NR, per uso della stanza; parlato GK 5-15 | studi radio e TV, speakeraggio | metodo: [P] DAGA 2011 (IRT) su DIN 15996; valori per il parlato: [S]; DIN 15996:2020-12 non letta (a pagamento) |
| Cabina voce, rumore di fondo | NR 15 / NC 15 (≈ 20-25 dBA) come massimo | voice-over, doppiaggio | [S] progettisti acustici; criteri BBC (Guide to Acoustic Practice, 1990) non letti |
| Cabina voce, RT60 e isolamento | RT60 ≈ 0,1-0,35 s; isolamento > 70 dB | voice-over | [S] |
| Studio di registrazione (USA) | NC 15-20 | sale di ripresa | [S] Engineering Toolbox |

**Sincrono e squadra**

| Grandezza | Valore | Fonte |
|---|---|---|
| Frequenze di timecode | ST 12-1: 23,98, 24, 25, 29,97, 30, 47,95, 48, 50, 59,94, 60 fps; uso: 25 (TV europea), 24 e 23,976 (cinema), 29,97 drop frame (TV USA) | [P] SMPTE, «Understanding Standards: Time Code» (frequenze); uso: std |
| Squadra suono di set per contenuti con dialoghi scritti | almeno 3 persone | [P] Netflix |
| Playback sul set | 2-3 canali: playback e timecode LTC alla frequenza del progetto | [P] Netflix |

Fonti: quelle indicate nelle tabelle; letto 2026-11-09.

## Errori che si sentono

- **Clipping in ripresa** → crepitio duro sui picchi, sulle consonanti forti o sui colpi di rullante; la forma d'onda ha la cima piatta → registrare con il livello di allineamento a −18 dBFS e circa 10 dB di margine sopra i picchi; un registratore a 32 bit virgola mobile non protegge dalla saturazione analogica.
- **Stanza nella voce** → voce «in scatola» o lontana, code corte metalliche, timbro diverso da quello delle altre voci → cabina trattata, microfono più vicino, coperte e tessuti in emergenza; il de-reverb non rende la voce uguale a una presa in cabina.
- **Rumore di fondo** → soffio, condizionatore, frigorifero, traffico nelle pause → spegnere gli impianti durante le prese, misurare il fondo (soglia pratica: −60 dB RMS come ACX), registrare il tono d'ambiente.
- **Plosive** → colpi sordi sui P e B, il cono delle casse «salta» → antipop ad almeno 10 cm, inclinato; microfono leggermente fuori dal flusso d'aria.
- **Sibilanti** → S che fischiano, fastidiose in cuffia → microfono meno brillante o spostato di lato; de-esser in mix; non tagliare tutta la banda 2-4 kHz.
- **Effetto prossimità variabile** → la voce cambia corpo da una frase all'altra → distanza costante (antipop come «paletto»), cantante che non si muove.
- **Fase fra microfoni** → batteria o chitarra vuota, «a tubo», che migliora spegnendo un microfono → regola 3:1, misurare le distanze (Glyn Johns), controllare la polarità dei microfoni opposti, allineare i tempi.
- **Rientro del click o della cuffia** → tic del metronomo o musica sottile sotto la voce nelle pause → cuffie chiuse, volume del click ragionevole, controllo in solo della traccia dopo la presa.
- **Comping che si sente** → cambi di colore, respiri mozzati, tagli a metà vocale → prese nella stessa giornata e alla stessa distanza, tagli su consonanti, dissolvenze.
- **Intonazione eccessiva** → voce senza vibrato, note a gradino, timbro «di plastica» quando non è voluto → correzione nota per nota, vibrato preservato, consegnare anche l'originale.
- **Radiomicrofono sul petto** → voce scura e poco intelligibile, fruscii di vestiti → boom come traccia principale, radiomicrofono piazzato dai costumi, tracce separate.
- **Sincrono perso** → labiale fuori tempo, deriva lenta durante la presa → jam sync a inizio giornata, stessa frequenza di fotogrammi su camera e registratore, timecode dentro i file.
- **Voce consegnata già lavorata** → compressione e EQ stampati che il mixer non può togliere, respiri tagliati a zero → consegnare la presa asciutta; le elaborazioni restano in sessione.
- **Frequenza sbagliata nel progetto video** → audio a 44,1 kHz in una timeline a 48 kHz: tono leggermente diverso o scorrimento di velocità se il file è interpretato male → 48 kHz per tutto ciò che va su video.

Fonti: sintesi delle Tecniche sopra; letto 2026-11-09.

## Novità

- **Source-Connect 4** (18/03/2025): fino a 6 partecipanti, timecode LTC/MTC, recupero automatico dell'audio originale, fino a 24 canali (licenza Facility), nessun iLok per lo speaker [P PR Newswire / Source Elements]. **4.1** (29/01/2026): primo strumento di collaborazione a distanza con certificazione Dolby Atmos, 128 canali (licenza Facility, Atmos solo su macOS) [P note di rilascio]. **4.2** (24/03/2026): ASIO completo su Windows, 96 kHz nativi [P note di rilascio]. **4.3.0** (14/09/2026) e **4.3.1** (03/11/2026): sincrono provabile senza sessione, opzione «solo P2P» per Facility, avviso di reset della latenza [P note di rilascio]. Sound On Sound l'ha recensito a luglio 2026 [S].
- **Antares AutoTune 2026** (21/10/2025 [P SOS], licenza perpetua 300 USD [P SOS]): Modern Mode con Flex Tune e Humanize, Classic Mode che ricrea Auto-Tune 5; ritirati AutoTune Artist e Access (ancora scaricabili dagli abbonati Unlimited [P Antares Help Center]); restano AutoTune 2026 e Auto-Tune Pro 11 con Graph Mode [P SOS].
- **Antares AutoTune Advanced** (25/09/2026): nuovo algoritmo Auto-Mode, motore DVA che riconosce e preserva il vibrato naturale, Vibrato FX, modalità Live a 0,84 ms a 44,1 kHz, Formant Designer, tastiera a 78 note, MIDI Perform [P SOS]. Prezzo 450 USD [P SOS].
- **Melodyne**: nessuna versione 6; la corrente è la 5.4.2 [P Celemony]. Celemony ha lanciato nel gennaio 2026 **Tonalic** (musicisti di sessione registrati che si adattano a armonia e tempo del brano, motore derivato da Melodyne) [S MusicTech, SOS in sintesi].
- **ElevenLabs Eleven v3** generalmente disponibile dal 02/02/2026: il produttore dichiara errori ridotti del 68% (dal 15,3% al 4,9%) su un benchmark interno in 8 lingue [P elevenlabs.io]. **Iconic Marketplace** (novembre 2025): voci di personaggi noti e di archivio concesse in licenza dai titolari dei diritti, per pubblicità e intrattenimento [S]; per {{STUDIO}} resta valido `regole.md` §3 (niente voci riconoscibili senza consenso e contratto).
- **Audible / ACX**: sulle opere ACX TTS e AI non autorizzati sono vietati; Audible dichiara di lavorare per accettare TTS di terzi da editori e autori [P acx.com, letto 2026-11-09].
- **Doppiatori e AI in Italia**: CCNL Doppiaggio firmato il 6/12/2023 con l'articolo 22 su AI e cessione dei diritti [P ANAD]; parte normativa in vigore dal 1/1/2024 [P ANAD]; decorrenza 1/10/2023 e scadenza 31/12/2026 [S: intestazione del testo consolidato su ilccnl.it, banca dati privata; il CCNL del doppiaggio artigiano è un contratto diverso]; al 9/11/2026 anad.it non riporta trattative di rinnovo (ultima notizia del 23/10/2026) [P]: prima di un contratto di doppiaggio nel 2027 verificare se è in proroga o rinnovato. Dal 2/8/2026 si applicano gli obblighi di trasparenza dell'AI Act art. 50 sui contenuti sintetici, anche audio: dettaglio e scadenze in `regole.md` §6.
- **ISDN**: nel Regno Unito Openreach chiude ISDN2 e ISDN30 il 31/01/2027 (spostato da dicembre 2025) [S]; per l'Italia non ho letto una data.

Fonti: Source Elements (comunicato su PR Newswire, note di rilascio 4.1.0 e 4.2.0) [P]; Sound On Sound, «Antares release AutoTune Advanced» (25/9/2026) e «Antares release AutoTune 2026» (21/10/2025) [P]; Antares Help Center (Artist e Access fuori produzione) [P]; Celemony Help Center [P]; ElevenLabs blog, «Eleven v3 is Now Generally Available» (2/2/2026) [P]; ACX [P]; ANAD [P]; resto [S]. Letto 2026-11-09.

## Verifica del 2026-11-09

- **[P] verificato:** specifiche Neumann (U 87 Ai, U 67, U 47 fet i, M 49 V), Shure (SM7B, SM57, effetto prossimità, regola 3:1, distanze), Royer R-121, Coles 4038, MKH 416 (diagramma, rumore, banda), tecniche stereo e pianoforte DPA, Glyn Johns e Decca Tree (SOS, Tape Op), EBU R 68 (−18 dBFS) e Tech 3276 (NR 10/15, Tm), Netflix (presa diretta, doppiaggio a distanza), ACX, versioni di Source-Connect, Melodyne, AutoTune Advanced, Eleven v3, ANAD.
- **Correzioni rispetto alle skill DJ:** il −18 dBFS «perché i plugin analogici lo preferiscono» diventa il livello di allineamento EBU R 68; i picchi −12/−6 restano [S]. La skill `pro-audio-plugins` non ha sezioni su intonazione e voce: aggiunte qui da fonti Celemony, Antares (via SOS), Neumann.
- **Aperto (stato prima della verifica indipendente, vedi sotto):** angolo ORTF (DPA scrive «±110°», la definizione corrente è 110° totali: Schoeps → 404); SMPTE RP 155 (−20 dBFS) e SMPTE ST 12-1 non letti; nessuna norma letta per il rumore delle cabine voce (valori NR/NC 15 solo da progettisti [S]); MD 421 Kompakt e SPL massimo MKH 416 solo in sintesi; AKG C12 senza dati di scheda (pagina AKG vuota); data di AutoTune 2026; pagina Netflix «OnSet Sound Mixer Guidance» non aperta (404 via proxy); tariffe e condizioni economiche degli speaker italiani non cercate.
- **Scelta di perimetro:** la presa diretta (fonico e microfonista) è trattata qui; `audio-per-immagine.md` deve rimandare a questo file.

**Verifica indipendente (2026-11-09).** Controllati sulla fonte primaria 30 punti: EBU R 68 e Tech 3276 (PDF), Tech 3285 v2, SMPTE RP 155:2014 (PDF), pagina SMPTE su ST 12, schede Neumann (U 87 Ai, U 67, U 47 fet i, M 49 V), Shure SM57 e SM7B, Royer R-121, Coles 4038, Sennheiser MKH 416 e MD 421 Kompakt, AKG C12 VR, DPA (stereo, voce, 32 bit), Schoeps (ORTF), Tape Op (Decca Tree), Neumann Academy, Netflix (tre pagine, ora su studiopartner.netflix.net), ACX, Celemony, Antares, SOS (due notizie), Source Elements (note 4.1-4.3.1), ElevenLabs, ANAD.
Promossi a [P]: −20 dBFS di SMPTE RP 155; frequenze di SMPTE ST 12-1; angolo ORTF 110° totali (Schoeps); MKH 416 SPL max 130 dB; MD 421 Kompakt; AKG C12 VR (22 dB-A, 128 dB al 3% di THD); OnSet Sound Mixer Guidance; data di AutoTune 2026 (21/10/2025) e prezzi Antares.
Corretti: «tono d'ambiente» e «il problema è la stanza» non sono nelle pagine Netflix (ora std); usi del Coles 4038 non dichiarati dal produttore (std); Source-Connect 24 canali solo con licenza Facility, aggiunte 4.3.0 e 4.3.1; CCNL Doppiaggio: scadenza 31/12/2026 [S], non «autunno 2026»; aggiunta la nota che R 68 e RP 155 fissano il tono di allineamento, non il livello del programma; aggiunto il margine SOS (picchi ≤ −10 dBFS circa), più prudente della skill DJ.
Ancora aperti: testo di DIN 15996:2020-12 e criteri BBC per le cabine (a pagamento o bloccati); stato del rinnovo del CCNL Doppiaggio dopo il 31/12/2026; data di Tonalic e di Antares Metamorph [S]. `audio-per-immagine.md` rimanda qui per la presa diretta e non la ripete.
