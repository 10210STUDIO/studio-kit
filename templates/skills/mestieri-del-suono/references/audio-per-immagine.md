# Audio per l'immagine: spot, film, social

Chi fa il suono di ciò che si guarda: sound designer, foley, dialogue editor, re-recording mixer, music supervisor, sonic branding, audio interattivo. Serve a {{STUDIO}} per briefare la post-produzione audio di spot, film di brand, social e video AI, e per controllare in casa un deliverable (loudness, stem, versioni, frame rate, licenze della musica e delle voci) prima che lo rifiuti un'emittente o una piattaforma.
Non copre la presa diretta e lo speakeraggio (`registrazione.md`), la scrittura della musica e il compositore per spot (`produzione-composizione.md`), mix e mastering musicale (`mix-mastering.md`), gli strumenti di misura in dettaglio, la clonazione vocale e i termini dei generatori musicali (`misura-analisi-ai.md`), i diritti su volti, voci e output AI (`atlante-culturale/references/regole.md` §3, §5, §6), la filiera dei diritti musicali, la SIAE e i diritti connessi (`atlante-culturale/references/industria-musicale.md`, «Regole» §1-3, e la tecnica «Scegliere e licenziare musica per uno spot») e le licenze in consegna (skill `rights-licensing-clearance`).
**Legenda.** [P] = fonte primaria letta il 2026-11-09: norma o raccomandazione (EBU, ATSC, AGCOM, legge), specifica del committente (Rai, Publitalia, Netflix, Amazon Studios), documentazione del produttore o della piattaforma (Dolby, ffmpeg, YouTube Help, TikTok, Meta, ElevenLabs, Google). [S] = secondaria (podcast, stampa, blog di vendor, sintesi di un motore di ricerca). [M] = misurato in questa sessione con ffmpeg 9.0.1 su file di prova. [Studio] = osservato nei lavori di {{STUDIO}} (playbook `motion-video` e `ai-film-director`). **std** = definizione o calcolo di mestiere, scritto senza una fonte aperta oggi.
Letto e redatto il 2026-11-09. Revisione: 2027-02-07 (90 giorni); prima per le specifiche delle emittenti e delle piattaforme, che cambiano senza preavviso.

## Lessico

- **Colonna sonora** (*soundtrack*): tutto l'audio di un film: dialoghi, musica, effetti, ambienti, foley. Non solo la musica.
- **DME / stem DME** (*Dialogue, Music, Effects stems*): il mix finale diviso in tre file (dialoghi, musica, effetti) che sommati danno il mix completo. Netflix li chiede così [P].
- **M&E** (*Music & Effects*): la colonna senza dialoghi originali, per doppiare in un'altra lingua. Deve contenere anche i rumori registrati in presa diretta insieme ai dialoghi (riempiti col foley).
- **Full mix / printmaster** (*full mix, printmaster*): il mix completo approvato, quello che va in onda.
- **Spotting session** (*spotting session*): riunione su montaggio bloccato in cui si decide, scena per scena, dove entrano musica, effetti, silenzi.
- **Montaggio bloccato** (*picture lock*): montaggio che non cambierà più di un fotogramma; da qui parte la post audio. Prima, ogni lavoro è da rifare.
- **Cambio di montaggio / conform** (*conform, change list*): riportare il suono su un montaggio modificato dopo il lock.
- **Sound design** (*sound design*): creazione dei suoni che non esistono o che vanno costruiti (whoosh, impatti, interfacce, creature, mondi).
- **Foley** (*foley*): rumori del corpo e degli oggetti rifatti in sala, a sincrono con l'immagine: passi, vestiti, oggetti maneggiati.
- **Ambiente / atmosfera** (*ambience, backgrounds, BG*): il fondo continuo di un luogo (stanza, città, bosco). Tiene insieme i tagli.
- **Room tone** (*room tone*): 30-60 secondi di «silenzio» del set registrati in presa diretta, per riempire i buchi del dialogo (std).
- **Effetti a sincrono / hard effects** (*hard FX, spot effects*): suoni legati a un evento visibile (porta, sparo, auto).
- **Hit / impatto** (*hit, impact*): colpo sonoro su un taglio o su un evento grafico.
- **Whoosh** (*whoosh, swish*): passaggio d'aria su un movimento di camera, un oggetto, una transizione.
- **Riser** (*riser, build*): suono che sale in altezza o densità e prepara un impatto.
- **Sweetening** (*sweetening*): strati aggiunti a un suono reale per dargli peso o carattere.
- **ADR / doppiaggio in sala** (*ADR, automated dialogue replacement*): ridire in sala le battute rovinate sul set, a sincrono col labiale.
- **Walla** (*walla, loop group*): brusio di folla registrato da un gruppo di attori, senza parole intelligibili.
- **Re-recording mix / mix finale** (*re-recording mix, final mix, dub*): il mix di dialoghi, musica ed effetti sull'immagine.
- **Loudness integrato** (*integrated / programme loudness*): la forza percepita media di tutto il programma, in LUFS (= LKFS) [P: EBU R128, nota 1].
- **Loudness di dialogo** (*dialogue-gated loudness*): loudness misurato solo dove c'è parlato. È la misura di Netflix e Amazon [P].
- **Short-term massimo** (*Maximum Short-term Loudness*): il valore più alto della media su 3 secondi; per gli spot EBU non deve superare −18 LUFS [P: R128 s1].
- **True peak** (*true peak, dBTP*): il picco del segnale ricostruito tra un campione e l'altro; quello che fa distorcere codifiche e convertitori [P: R128].
- **LRA** (*Loudness Range*): quanto varia il loudness in un programma, in LU; non ha senso sotto il minuto [P: R128, nota 2].
- **Rapporto loudness/dialogo** (*LDR, Loudness-to-Dialogue Ratio*): differenza fra loudness del programma e del dialogo; EBU chiede che per il cinema in TV non superi 5 LU [P: R128 s4].
- **Livello di riferimento in sala** (*reference monitoring level*): quanti dB SPL produce un rumore rosa a −20 dBFS in regia; cinema 85 dBC; streaming near field 79 o 82 dB (Netflix); TV da 76 a 85 dB secondo il volume della stanza (ATSC, con rumore rosa 500 Hz-2 kHz) [P: Dolby, Netflix, ATSC].
- **Near field / campo vicino** (*near field mix*): mix per casa (TV, streaming), ascoltato a 79 o 82 dB SPL [P: Netflix].
- **Fold-down / downmix** (*LoRo, downmix*): la versione stereo ricavata da un 5.1; standard ITU-R BS.775 con LFE muto [P: Netflix].
- **Frame rate** (*frame rate*): fotogrammi al secondo; 23,976 = 24000/1001, 29,97 = 30000/1001 (std).
- **Pull-down / pull-up** (*pull-down, pull-up*): rallentare o accelerare l'audio dello 0,1% per seguire il passaggio da 24 a 23,976 (o viceversa) (std).
- **Timecode drop frame** (*drop-frame timecode*): numerazione che salta due numeri al minuto a 29,97 per restare al passo con l'orologio; non cambia la velocità (std).
- **Cutdown** (*cutdown, lift*): versione più corta di uno spot (30" → 15" → 6").
- **Sync / licenza di sincronizzazione** (*sync licence*): permesso dell'editore di unire una composizione alle immagini.
- **Master / licenza master** (*master use licence*): permesso del discografico di usare quella registrazione.
- **Musica di libreria** (*production / library music*): catalogo pre-licenziabile, con diritti centralizzati.
- **Needle drop** (*needle drop*): uso di un brano commerciale esistente in un video.
- **Temp track** (*temp track, temp love*): musica provvisoria messa dal montatore; pericolosa perché il cliente si affeziona.
- **Audio logo / mnemonica** (*sonic logo, audio mnemonic*): firma sonora di pochi secondi di un marchio.
- **Sistema sonoro di marca** (*sonic identity, sound architecture*): audio logo più musiche, suoni d'interfaccia, attese, voce, con regole d'uso.
- **Middleware** (*audio middleware*): software (Wwise, FMOD) che fa suonare l'audio di un gioco in base allo stato, non a una timeline.

## Mestieri

La catena di un film o di uno spot girato: presa diretta sul set (`registrazione.md`) → montaggio bloccato → spotting session → montaggio dialoghi, effetti, ambienti, foley, musica (in parallelo) → premix → mix finale → versioni e consegne → controllo di qualità. In uno spot piccolo due o tre di questi mestieri stanno nella stessa persona; in un film di brand con budget sono persone diverse. Il compositore per spot e per immagine è in `produzione-composizione.md`; il fonico di presa diretta e il microfonista in `registrazione.md`; il tecnico che controlla le consegne in `misura-analisi-ai.md`.

#### Supervisore del suono (supervising sound editor, sound supervisor)
- **Fa:** dirige la post-produzione audio: divide il lavoro fra editor, decide il suono del film con il regista, tiene budget e calendario. Sta fra montaggio bloccato e mix finale; negli spot spesso coincide con il mixer dello studio audio.
- **Consegna:** la sessione pronta per il mix (dialoghi, effetti, foley, ambienti montati e ordinati per traccia), il piano delle consegne, le note della spotting session.
- **Strumenti standard:** Pro Tools (Avid) come formato di scambio della post audio; librerie di effetti gestite con Soundminer o BaseHead; iZotope RX per la pulizia (std: nomi di prodotto, non riletti oggi).
- **Come si briefa:** montaggio bloccato con timecode, AAF/OMF dal montaggio con le maniglie (2-5 secondi prima e dopo ogni clip, valore di partenza std), presa diretta originale con i metadati, riferimenti sonori (film, spot, non brani da copiare), elenco delle consegne finali **prima** di iniziare (formati, loudness, versioni, lingue), numero di giri di revisione, data di onda.
- **Segno di livello alto:** fa domande sulle consegne il primo giorno; propone il suono di una scena prima che glielo si chieda; difende il silenzio.
- **Errore comune:** di chi briefa: mandare il montaggio «quasi bloccato» e cambiarlo dopo: ogni cambio è un conform pagato. Del mestiere: lasciare le consegne all'ultimo giorno.

#### Sound designer (sound designer)
- **Fa:** crea i suoni che il film o lo spot non ha registrato: transizioni, impatti, interfacce, prodotti (il clic di un tappo, il motore di un'auto elettrica), mondi astratti. Lavora sul montaggio, in parallelo al dialogue editor e prima del mix.
- **Consegna:** tracce montate a 48 kHz / 24 bit sulla sessione, divise per famiglia (hard FX, design, ambienti), o stem stampati se il mix lo fa un altro; per i suoni di marca anche i file singoli nominati.
- **Strumenti standard:** Pro Tools o Nuendo; librerie commerciali (Sound Ideas, Pro Sound Effects, Boom Library) e registrazioni proprie con registratori portatili; sintesi e granulare (Kyma, Serum, plugin di Krotos, Sound Particles) (std: nomi di prodotto, non riletti oggi).
- **Come si briefa:** il montaggio, una frase sul carattere («materico, vicino, niente cinema d'azione»), 2-3 riferimenti di **suono** con il minuto esatto, i punti dove il suono deve portare il racconto (taglio, logo, prodotto), la durata di ogni versione, cosa va consegnato separato. Chiedere chi possiede i suoni originali creati (cessione o licenza) e da quali librerie vengono gli altri.
- **Segno di livello alto:** pochi suoni ben scelti invece di tanti strati; il suono del prodotto diventa riconoscibile; usa il silenzio prima del colpo; i suoni funzionano anche dal telefono.
- **Errore comune:** riempire ogni taglio di whoosh; usare preset riconoscibili di librerie diffuse (il «braaam» da trailer); non controllare la licenza di un suono preso da un pacchetto gratuito.

#### Foley artist e foley mixer (foley artist, foley mixer)
- **Fa:** l'artist rifà in sala, guardando l'immagine, passi, vestiti, oggetti; il mixer (o fonico di foley) sceglie microfoni e distanze e registra. Lavorano dopo il montaggio bloccato e prima del mix; il foley serve anche a riempire l'M&E.
- **Consegna:** tracce di foley a sincrono, separate per categoria (passi per personaggio, vestiti, oggetti), registrate pulite e senza riverbero aggiunto.
- **Strumenti standard:** sala con pavimenti diversi (le «fosse»: legno, pietra, ghiaia, sabbia), oggetti di scena, microfoni da ripresa vicina (std).
- **Come si briefa:** elenco delle scene con foley necessario, quali personaggi hanno scarpe e abiti particolari, se serve per l'M&E (allora va coperto **tutto** il movimento in scena), consegna per categoria.
- **Segno di livello alto:** i passi hanno il carattere del personaggio; il suono dei vestiti si sente solo quando deve; nessuno si accorge che è foley.
- **Errore comune:** saltarlo negli spot di prodotto: è il foley (tocco, apertura, versamento) che fa sentire la materia. Nei video AI l'audio nativo dei modelli non ha un foley pulito separabile (vedi Tecniche).

#### Dialogue editor e ADR (dialogue editor, ADR supervisor)
- **Fa:** monta i dialoghi: sceglie la presa migliore fra i microfoni del set, toglie rumori, uniforma il tono fra le inquadrature, riempie i buchi con il room tone, decide quali battute vanno rifatte in ADR e le dirige in sala. Lavora subito dopo il lock: è il primo a toccare l'audio.
- **Consegna:** tracce di dialogo divise per personaggio o microfono, con room tone continuo; lista ADR con timecode; le battute ADR registrate e montate.
- **Strumenti standard:** Pro Tools; iZotope RX (Dialogue Isolate, De-noise, De-reverb); per l'ADR un registratore a sincrono e un sistema di cue (std).
- **Come si briefa:** presa diretta completa con **tutte** le tracce dei microfoni (boom e radiomicrofoni separati) e i rapportini del fonico; AAF dal montaggio; lista delle battute che il regista vuole cambiare; disponibilità degli attori per l'ADR.
- **Segno di livello alto:** non si sentono i tagli fra le inquadrature; la voce resta naturale anche dopo la pulizia; poche battute rifatte.
- **Errore comune:** di chi briefa: consegnare solo il mix della camera invece delle tracce del registratore. Del mestiere: pulire troppo, la voce diventa metallica (artefatti della riduzione del rumore).

#### Re-recording mixer (re-recording mixer, dubbing mixer)
- **Fa:** mescola dialoghi, musica, effetti e ambienti sull'immagine, in sala calibrata, e stampa il mix finale, gli stem e le versioni. Nei film lavorano due o tre mixer insieme (dialoghi e musica; effetti). Sta alla fine della catena, prima del controllo di qualità.
- **Consegna:** full mix stereo e, se richiesto, 5.1 o Dolby Atmos; stem DME che sommati danno il mix [P: Netflix]; M&E; versioni per durata e per lingua; rapporto di misura del loudness; file WAV 48 kHz / 24 bit (Netflix: «48kHz/24-bit» per mix originale, M&E e stem; mai audio compresso) [P].
- **Strumenti standard:** Pro Tools con superficie Avid S6 o simili; Dolby Atmos Renderer per l'immersivo; meter di loudness conformi a BS.1770: Nugen VisLM (riferimento di Amazon Studios: VisLM2 [P]), Dolby Media Meter, RTW, iZotope Insight, Youlean (elenco dei meter con preset Netflix [P: Netflix]).
- **Come si briefa:** specifica tecnica di **ogni** destinazione (TV italiana, cinema, web, social: valori in Numeri), elenco delle versioni e delle lingue, monitoraggio previsto (cinema a 85 dB o casa a 79-82 dB), presenza del cliente al mix (una sessione di ascolto su date fisse), giri di revisione, data di consegna al broadcaster o all'agenzia di distribuzione digitale.
- **Segno di livello alto:** il dialogo si capisce a basso volume senza che la musica sembri bassa; il mix regge su TV, telefono e cuffie; consegna in specifica alla prima e con il rapporto di misura allegato.
- **Errore comune:** mixare uno spot per la TV al loudness del web (o viceversa) e scoprirlo al rifiuto; consegnare stem che sommati non danno il mix (un limiter sul master non applicato agli stem).

#### Music supervisor (music supervisor)
- **Fa:** sceglie la musica esistente per un film, una serie o uno spot e ne ottiene le licenze: sync dall'editore (composizione) e master dal discografico (registrazione); tratta costi, territori, durata, mezzi; prepara la cue sheet per le società di gestione. Sta fra la creatività (agenzia, regista) e i titolari dei diritti, prima del montaggio definitivo.
- **Consegna:** shortlist di brani con stato dei diritti e preventivo per ciascuno; licenze firmate (sync e master separate); cue sheet (titolo, autori, editori, durata, tipo d'uso).
- **Strumenti standard:** banche dati dei titolari (repertori SIAE, ASCAP/BMI Songview, GEMA, PRS), Discogs per i crediti, codici ISWC (composizione) e ISRC (registrazione) per non confondere i titolari (vedi la riga sui repertori in `sampling-and-crate-digging/references/clearance-and-licensing.md` del progetto DJ, letta il 2026-11-09).
- **Come si briefa:** budget musica **separato** dalla produzione, mezzi (TV, cinema, web organico, paid social, OOH con audio, in-store, eventi), territori, durata della licenza, numero di cutdown, se servono modifiche al brano (taglio, remix, strumentale, testo cambiato: richiedono un permesso a parte), data di onda, alternative accettabili. Dare 2-3 riferimenti di brani **come direzione**, non come obiettivo.
- **Segno di livello alto:** porta sempre un piano B licenziabile; sa dire in un giorno se un brano è trattabile; non fa innamorare il cliente di un brano che non si può avere.
- **Errore comune:** di chi briefa: montare con un brano famoso come temp track e chiedere la licenza dopo: costa di più, e il no arriva quando il film è finito. Credere che pagare la SIAE copra la sincronizzazione: non la copre (vedi Tecniche, «Musica di libreria, commissionata o brano noto»).

#### Sound designer di sonic branding (sonic branding designer, audio branding agency)
- **Fa:** progetta l'identità sonora di un marchio: audio logo, motivo musicale da declinare in generi diversi, suoni di prodotto e d'interfaccia, attese telefoniche, voce del marchio, regole d'uso. Lavora con brand strategist e designer dell'identità, prima delle campagne.
- **Consegna:** audio logo in più durate e versioni (piena, corta, solo melodia, per ambienti rumorosi), il motivo in più arrangiamenti, file dei suoni d'interfaccia, manuale d'uso con regole di livello e di contesto (in che punto dello spot, a che volume, dopo cosa).
- **Strumenti standard:** gli stessi del compositore e del sound designer; test di riconoscibilità e associazione con panel (metodi da verificare caso per caso: nessuno standard pubblico letto oggi).
- **Come si briefa:** piattaforma di marca (valori, tono di voce), identità visiva, tutti i punti di contatto in cui il suono vivrà (spot, app, punto vendita, telefono, eventi, assistenti vocali), concorrenti e i loro suoni, durata massima del logo, chi possiede composizione e registrazione (cessione piena, deposito come marchio sonoro).
- **Segno di livello alto:** il logo si riconosce dopo 1-2 secondi e anche suonato da uno strumento diverso; il sistema funziona dal telefono al cinema; Mastercard lo dichiara fondamento di «sound logos and ringtones, to hold music and point-of-sale acceptance sounds» [P: comunicato Mastercard, febbraio 2019].
- **Errore comune:** commissionare solo il logo e poi usarlo sopra musiche che non c'entrano; logo troppo lungo che negli spot da 6" non entra.

#### Audio per videogiochi e interattivo (game audio designer, technical sound designer)
- **Fa:** crea i suoni e li **implementa**: nel gioco il suono non segue una timeline, risponde allo stato (passo su erba o metallo, distanza, velocità, musica che cambia con la tensione). Lavora con sviluppatori e game designer per tutto lo sviluppo. Per {{STUDIO}} serve in installazioni interattive, web con audio, app, esperienze per eventi.
- **Consegna:** file audio (variazioni multiple per ogni suono, per non ripetersi), progetto del middleware (Wwise o FMOD) con eventi e parametri, specifiche di memoria e formato per piattaforma.
- **Strumenti standard:** Audiokinetic Wwise, FMOD Studio, motori Unity e Unreal (con il loro audio nativo, MetaSounds in Unreal) (std: nomi di prodotto, licenze e versioni non lette oggi).
- **Come si briefa:** elenco degli eventi sonori (cosa può succedere e quando), piattaforme (web, mobile, installazione con quali casse), limiti di peso dei file, se la musica deve essere adattiva; chi programma l'integrazione.
- **Segno di livello alto:** nessuna ripetizione percepibile dopo dieci minuti; la musica cambia senza salti; il livello resta controllato in ogni stato.
- **Errore comune:** commissionare «i suoni» come file lineari a un sound designer da spot e scoprire che manca l'implementazione.

Fonti: Netflix, «Sound Mix Specifications and Best Practices» (studiopartner.netflix.net, aperto in Chrome, change log OC-1-6 del 2024-10-29) [P]; Amazon Studios, «Delivery & QC» (portal.amazonstudios.com) [P]; Mastercard, «Sound On: Mastercard Debuts Sonic Brand», comunicato del febbraio 2019, newsroom EEMEA aperta in Chrome [P] (giorno 8/2 solo da sintesi [S]); skill `sampling-and-crate-digging` del progetto DJ (repertori e titolari) [S, da fonti di settore]; il resto è mestiere consolidato (std).

## Tecniche

### A. Costruire il suono di un film o di uno spot

#### Spotting session (spotting session)
- **Cos'è:** la riunione su montaggio bloccato in cui regista, montatore, supervisore del suono e compositore guardano il film e decidono per ogni scena: dove entra ed esce la musica, quali suoni portano il racconto, dove serve silenzio, cosa va rifatto (ADR, foley).
- **Si sente:** in un film fatto bene la musica entra e esce senza che lo spettatore lo noti, e i momenti chiave hanno un suono pensato; senza spotting si sentono musica e effetti che si pestano.
- **Quando:** ogni film di brand e ogni spot con più di due figure audio; per un social di 15" basta una lista scritta.
- **Come:** montaggio bloccato con timecode impresso in sovraimpressione (*burn-in*); si guarda tutto una volta senza fermarsi, poi scena per scena; si scrive una tabella: timecode di entrata, uscita, cosa (musica / effetto / silenzio / ADR), funzione nel racconto, chi la fa. Si chiude con il calendario: premix, ascolto con il cliente, mix finale, consegne (std).
- **AI:** si può preparare la tabella facendo «ascoltare» il montaggio provvisorio (skill `watch` e `audio-understand`): dà i tempi del parlato e le zone di musica, non le decisioni.
- **Errore comune:** farla su un montaggio che cambierà; non invitare il compositore; non scrivere le decisioni (al mix nessuno se le ricorda uguali).

#### Montaggio per famiglie e stem DME (sound editorial, DME stems)
- **Cos'è:** organizzare la sessione in famiglie fisse (dialoghi, musica, effetti, con foley e ambienti dentro gli effetti o in stem propri) fin dal montaggio, così che il mix esca diviso in stem che sommati danno il mix completo.
- **Si sente:** nulla, se è fatto bene. Se è fatto male, l'M&E ha buchi (i rumori registrati insieme al dialogo spariscono con il dialogo) e le versioni per lingua suonano vuote.
- **Quando:** sempre in un film o in uno spot che avrà versioni in altre lingue, cutdown o rimontaggi; Netflix chiede per la versione originale stem D, M, E 5.1 «that equal the 5.1 mix when combined» [P].
- **Come:** tracce nominate per famiglia; ogni processore del master (compressore, limiter) applicato in modo identico a ogni stem o messo sui singoli bus; prova di somma: stem sommati meno mix in controfase = silenzio (o residuo sotto −60 dBFS, valore di partenza std); i rumori della presa diretta che fanno parte dell'azione rifatti in foley sullo stem effetti. Netflix: per il film «DME separation must be maintained whenever possible» [P, change log OC-1-6].
- **AI:** se si ha solo un mix stereo (un vecchio spot, un audio nativo AI), la separazione con modelli (Demucs; vedi `misura-analisi-ai.md`) dà una voce e un fondo usabili per bozze e adattamenti, non un M&E da consegna: restano artefatti sulle sibilanti e sui transienti.
- **Errore comune:** un limiter sul master che non c'è sugli stem: la somma non torna e il broadcaster rifiuta; musica con voce cantata messa nello stem dialoghi o viceversa (si decide prima, per iscritto).

#### Sound design di uno spot: hit, whoosh, riser (commercial sound design)
- **Cos'è:** l'insieme dei suoni costruiti che danno ritmo e peso a uno spot: impatti sui tagli e sul logo, whoosh sui movimenti, riser che preparano un momento, suoni del prodotto, ambienti che dicono dove siamo.
- **Si sente:** lo spot sembra più veloce e più «costoso»; il prodotto ha una materia (il vetro suona vetro); il logo atterra. Troppo design e lo spot sembra un trailer di un videogioco.
- **Quando:** spot e social di prodotto, lanci, film di brand con montaggio a ritmo; meno nei film narrativi, dove conta di più l'ambiente.
- **Come:** (1) Prima l'ambiente (il luogo), poi il foley del prodotto, poi gli hard effects, per ultimi i suoni di design: si toglie finché lo spot regge. (2) L'impatto dura poco e ha corpo in basso; il riser lo prepara di solito per 1-4 secondi e si interrompe un istante prima del colpo (valori di partenza std). (3) Il colpo più importante va preceduto da un vuoto: anche 3-6 fotogrammi di quasi silenzio fanno sembrare il colpo più forte senza alzarlo (std). (4) Un suono per evento, non uno per taglio. (5) Il basso degli impatti sparisce al telefono: dare anche armoniche o un clic acuto (vedi `mix-mastering.md`). (6) Lo studio ha misurato che un colpo «schiacciato» dal limiter non guadagna picco: si sente dal corpo (RMS) e dal contrasto con ciò che lo precede, non dal picco [Studio: playbook `motion-video`, 2026-11-04].
- **AI:** Higgsfield `seed_audio` ed ElevenLabs Sound Effects generano impatti, whoosh e ambienti da testo; utili per bozze e per suoni che non esistono in libreria; da rinominare, misurare e ritagliare a mano (vedi «Audio generato con l'AI»). Il riconoscimento automatico (`audio-understand`) sbaglia i suoni corti di prodotto: nello studio i tacchi venivano letti come «martello» o «blocco di legno» [Studio].
- **Errore comune:** riser e whoosh su ogni taglio; impatto sul logo più forte della voce del claim (lo short-term massimo sale e l'emittente rifiuta, vedi Numeri); suoni presi da pacchetti «free» senza licenza scritta.

#### Il silenzio come scelta (silence, negative space)
- **Cos'è:** togliere suono di proposito (anche la musica) per un tratto, per far ascoltare una battuta, un gesto, il prodotto, o preparare un colpo.
- **Si sente:** il pubblico si sporge in avanti; il dettaglio (un respiro, un tappo) diventa enorme. Un silenzio digitale vero (zero) invece suona come un guasto.
- **Quando:** prima del claim o del logo, nei film di brand sul gesto finale, negli spot che vogliono distinguersi in un blocco pubblicitario rumoroso.
- **Come:** mai zero assoluto: lasciare un fondo d'ambiente o di stanza. Lo studio ha usato un'aria di stanza piatta a −52 dBFS (−47 dBFS sul finale) per coprire il buco lasciato da un riser tolto [Studio: playbook `motion-video`]. Il silenzio e il fondo molto piano non abbassano il loudness integrato: il gate scarta ciò che sta sotto −70 LUFS (soglia assoluta, la usa anche AGCOM [P: Allegato A 219/09/CSP]) e ciò che sta oltre 10 LU sotto la media (R128 v2: «relative gate changed from −8 to −10 LU») [P: EBU R128, storia del documento]. Quindi il silenzio non «compra» volume per il resto dello spot.
- **AI:** i modelli video con audio nativo riempiono ogni secondo di suono o di musica: il silenzio va chiesto per esteso e controllato, o rifatto in post.
- **Errore comune:** confondere il silenzio con il volume basso; mettere un silenzio di 2 secondi in un social (sull'autoplay sembra un video rotto); nella TV italiana un silenzio troppo lungo in testa o in coda viene tagliato: Rai usa nero e silenzio delle code (3" in testa, almeno 3" in coda) per rifilare la clip [S: specifiche Rai, febbraio 2021, copia readkong].

#### Mix con il dialogo al centro (dialogue-driven mix, ducking)
- **Cos'è:** costruire il mix attorno alla voce (dialogo o speaker): la musica e gli effetti si abbassano o si svuotano nelle frequenze della voce quando si parla.
- **Si sente:** ogni parola si capisce anche a basso volume e dal telefono; la musica sembra piena nelle pause.
- **Quando:** sempre negli spot con speaker e nei film di brand parlati; è anche il criterio di misura di Netflix e Amazon (loudness di dialogo) e di ATSC per i programmi (*anchor element*: «typically, the Dialogue Level»); per gli spot ATSC misura invece il mix intero [P: A/85:2026-07, Annex M].
- **Come:** automazione della musica di 3-6 dB sotto la voce, o compressione in sidechain dalla voce, o EQ dinamica che scava 2-4 kHz nella musica solo quando c'è voce (valori di partenza std; dettagli in `mix-mastering.md`). Nello studio: musica a −10 dB con uno scalino di −6 dB quando entrano i suoni di scena [Studio]. Una voce mono messa su due canali conta circa +3 LU nel mix stereo [Studio, misurato]: misurare sempre il mix finale, non la traccia da sola; ffmpeg ha l'opzione `dualmono` apposta [P: ffmpeg].
- **AI:** le voci AI escono a loudness diversi (anche 20 dB fra due clip, vedi Numeri): allinearle prima del mix, non dopo.
- **Errore comune:** alzare la voce invece di abbassare il resto; misurare il loudness integrato su uno spot quasi tutto musica e credere che il dialogo sia a posto.

#### Sincronizzazione e frame rate (sync, frame rate, pull-up, pull-down)
- **Cos'è:** tenere il suono allineato al fotogramma lungo tutta la catena. Le frequenze d'immagine in uso: 23,976 (= 24000/1001), 24, 25, 29,97 (= 30000/1001), 30; in Italia la TV va a 25 (Rai: profilo 1080i25 [S: copia readkong]; Publitalia: 1080i25 [P: Specifiche TV 20/10/2026]). Pull-down: rallentare l'audio dello 0,1% quando l'immagine passa da 24 a 23,976; pull-up: l'inverso. Il drop-frame cambia solo la numerazione del timecode a 29,97, non la velocità (std).
- **Si sente:** senza correzione, una deriva di 3,6 secondi all'ora (0,1% di 3.600 s, calcolo): le labbra vanno fuori sincrono a metà film. Il passaggio da 24 a 25 fotogrammi (velocizzazione europea) accelera del 4,17% e alza l'intonazione di circa 0,71 semitoni (25/24; 12·log₂(25/24) = 0,707, calcolo): voci più acute, musica fuori tono rispetto all'originale.
- **Quando:** ogni volta che girato, montaggio e consegna non hanno la stessa frequenza; nei video AI (i modelli escono a 24 o 30 fps, i social chiedono 25 o 30, la TV italiana 25) e quando si mescolano materiali di provenienze diverse.
- **Come:** (1) Fissare la frequenza del progetto **prima** del girato o della generazione e scriverla nel brief. (2) Netflix: tutto l'audio «at native project frame rate» e in sincrono con la consegna IMF/ProRes finale [P]. (3) Registrazione a 48.048 Hz o pull-down 47.952 Hz sono le due vie per il passaggio 24 ↔ 23,976 [S: Trew Audio, forum Avid]. (4) Su un cambio di velocità dell'immagine (24 → 25) decidere se l'audio va accelerato con correzione dell'intonazione o rimontato. (5) Controllo: lampo e bip di sincrono (*2-pop*: un fotogramma con bip a 2 secondi dall'inizio del programma, std) e verifica a fine programma. Netflix accetta leader e 2-pop su printmaster, M&E e stem, ma non sui doppiaggi [P].
- **AI:** i clip generati con audio nativo sono già in sincrono fra loro, ma se si cambia la velocità dell'immagine (rallentatore, retime) l'audio nativo va rifatto o rimontato; Seedance 2.5 esce con audio AAC a 32 kHz, da ricampionare a 48 kHz [Studio: playbook `ai-film-director`].
- **Errore comune:** sessione audio a 48 kHz importata come 48,048 kHz (Pro Tools converte e annulla il pull-down) [S]; consegnare uno spot a 23,976 a un'emittente che vuole 25.

### B. Mix per ogni destinazione

#### Mix per la TV (broadcast mix, Italia ed Europa)
- **Cos'è:** il mix di uno spot o di un programma per la televisione lineare, misurato in loudness integrato (EBU R128) e, per gli spot, anche in short-term massimo (R128 s1).
- **Si sente:** in un blocco pubblicitario normalizzato, uno spot schiacciato a forza non è più forte degli altri: suona solo più piatto e più stanco. Uno spot con dinamica e una voce chiara sembra più forte a parità di misura.
- **Quando:** ogni spot che va in onda; in Italia anche le sponsorizzazioni e i promo.
- **Come:** (1) **Chiedere la specifica della concessionaria** prima di mixare: Rai (febbraio 2021) chiede −23,0 LUFS ±0,2 LU integrato, short-term massimo −18,0 LUFS ±0,2 LU, true peak massimo −2,0 dBTP ±0,3, misurato su tutto lo spot, 8 canali mono PCM 48 kHz / 24 bit con la colonna sui primi due e silenzio sugli altri [S: copia readkong del PDF Rai, riletta; il sito di Rai Pubblicità non pubblica la specifica della TV lineare, controllato il 2026-11-09]; gli stessi tre valori sono nel documento ufficiale di Rai Pubblicità per l'Addressable TV (spot replacement, settembre 2026) [P]; per il video digitale (RaiPlay, v3.2 settembre 2026) e l'audio digitale (v1.6 giugno 2025) Rai Pubblicità chiede −23 LUFS ±0,2, short-term −18 LUFS, ma true peak **−1** dBTP [P]. Publitalia (Mediaset), specifica TV in vigore (zip del 20/10/2026): MXF OP-1a XDCAM HD 422 1080i25, 8 tracce AES mono PCM 48 kHz / 24 bit, «Requisiti Loudness coerenti con le normative EBU di – 24db», consegna solo via Cape.io o Extreme Reach almeno 4 giorni lavorativi prima [P: publitalia.it, «Specifiche TV»]. Il documento precedente (PDF del 29/11/2021, non più linkato) diceva −24 ±0,5 LKFS, riferimento −18 dBFS, picchi QPPM −9 dBFS, canali 1-2 duplicati su 3-4 [P, superato]. La7 (Cairo): il documento in vigore (maggio 2022) rimanda alle schede di Adstream e Peach e non dà valori; quello del 2016 chiedeva −24 LKFS ±0,5 LU misurati col metodo AGCOM 219/09/CSP e true peak −2 dBTP [P, superato]. Sky Media Italia non pubblica la specifica della TV lineare (da chiedere). Due concessionarie, due valori (−23 Rai, −24 Mediaset): la specifica vale più della norma. (2) La legge italiana non fissa un numero assoluto: il TUSMA (d.lgs. 208/2021), art. 44, c. 1, dice «Il livello sonoro delle comunicazioni commerciali audiovisive non deve essere di potenza superiore a quella ordinaria dei programmi e deve essere contenuto entro i limiti fissati con delibera dell'Autorità»; il c. 11 lo estende alla pubblicità radiofonica [P: Normattiva, testo vigente]. La regola AGCOM è la delibera 34/09/CSP («non possono diffondere messaggi pubblicitari e televendite con una potenza superiore a quella ordinaria dei programmi», emittenti terrestri e satellitari), con l'Allegato A sostituito dalla 219/09/CSP (applicata al digitale terrestre); AGCOM non elenca delibere successive che la modifichino [P: pagine delle due delibere su agcom.it]. Il metodo: ITU-R BS.1770, soglia assoluta −70 LKFS e gate relativo a **8 LU** (non i 10 di R128), livello del canale sui 5 giorni precedenti, 50 spot consecutivi dello stesso giorno: è infrazione se almeno l'8% supera il canale di oltre 1,0 LU [P: Allegato A, punti 4, 5, 9-11]. Il controllo è sull'emittente; per chi produce, l'obbligo arriva tramite la specifica della concessionaria. (3) Valori EBU per gli spot: −23,0 LUFS, short-term massimo −18,0 LUFS (+5 LU), true peak −1 dBTP, LRA non applicabile [P: R128 s1]. (4) Misurare con un meter conforme a BS.1770 e EBU Tech 3341 [P], o in casa con ffmpeg (vedi «Controllo di un deliverable»).
- **AI:** —
- **Errore comune:** mandare in TV il mix fatto per il web (−14/−16 LUFS): viene abbassato o rifiutato; rispettare l'integrato e sforare lo short-term con il logo finale; misurare il true peak sul WAV invece che sul file consegnato.

#### Mix per il web e lo streaming video (online video mix)
- **Cos'è:** il mix per YouTube, siti, pre-roll e piattaforme di streaming che non hanno una specifica pubblica di consegna per gli inserzionisti.
- **Si sente:** su YouTube un file troppo forte viene abbassato e perde solo dinamica; uno troppo piano resta piano accanto agli altri.
- **Quando:** pre-roll, video sul sito del cliente, film di brand pubblicati online.
- **Come:** (1) EBU R128 s2 (2023) raccomanda di distribuire a −23 LUFS con metadati, oppure, senza metadati, un livello «in the range of −20.0 to −16.0 LUFS» come valore provvisorio [P]. (2) ATSC A/85 (luglio 2026): per lo streaming «a single Target Loudness between –23 to –27 LKFS is recommended» [P]. (3) YouTube non pubblica un valore: la Guida ufficiale descrive solo «Volume stabile», attivo per impostazione, che riduce le differenze fra parti piane e forti ed è spento per YouTube Music e video musicali ufficiali [P: YouTube Help 14106294]; che YouTube abbassi i file più forti di circa −14 LUFS e non alzi mai quelli piani è misurato da terzi («content loudness» nelle Statistiche per nerd) [S]. (4) Scelta dello studio per web e social: −16 LUFS integrati, true peak fra −1,6 e −1,9 dBTP misurato sul file AAC finale [Studio: tre consegne, playbook `motion-video`]: sta nella fascia R128 s2 e non viene abbassato da YouTube. È una scelta, non una norma.
- **AI:** —
- **Errore comune:** consegnare un file a −9 LUFS «perché si sente di più»; usare un solo master per TV e web.

#### Mix per i social (social video mix: smartphone, autoplay, verticale)
- **Cos'è:** il mix di un video per feed, Reels, Stories, TikTok, Shorts, ascoltato dall'altoparlante del telefono, spesso senza audio, in verticale, con la decisione di restare presa nei primi 2 secondi.
- **Si sente:** dal telefono il basso sotto i 100-150 Hz non esiste (valore di partenza std); la voce si capisce solo se ha presenza fra 1 e 4 kHz; un attacco lento sembra un video muto.
- **Quando:** ogni contenuto social e paid social.
- **Come:** (1) **Funzionare senza audio e meglio con l'audio.** Il principio dello studio («muto per default») resta per il messaggio: testo in sovraimpressione o sottotitoli impressi sempre. Ma Meta scrive che «Over 75% of Reels views on Instagram are sound on» e consiglia voce, musica o effetti [P: Meta for Developers, blog «Unlock the Power of Reels Ads», 7/11/2024, riletto]; TikTok per le inserzioni Reservation In-Feed chiede che «All video creatives must have sound» e che musica e video non si interrompano di colpo [P: TikTok Ads Help, «Reservation In-Feed ad specifications», aggiornata a luglio 2025, riletta]. Quindi: audio curato su Reels e TikTok, messaggio leggibile ovunque. (2) **Primi 2 secondi:** suono già presente al fotogramma 1 (niente dissolvenza in entrata), voce o evento sonoro riconoscibile entro il primo secondo (valore di partenza std). (3) **Loudness:** nessuna specifica pubblica di loudness trovata per Meta e TikTok il 2026-11-09 (cercata su help center TikTok Ads e Meta; i −14 LUFS dei siti di settore non hanno fonte) [P per l'assenza nelle pagine lette]; lo studio consegna a −16 LUFS / circa −1,7 dBTP sull'AAC [Studio]. (4) Controllare in mono e dall'altoparlante di un telefono vero; basso con armoniche, non solo sub. (5) Verticale: la voce resta al centro; niente effetti stereo larghi che spariscono in mono.
- **AI:** `audio-understand` può verificare che nei primi 2 secondi ci sia parlato o un evento; i sottotitoli si generano con whisper in locale (`hyperframes transcribe`, vedi agente `motion-video`) e vanno ricontrollati a mano sui tempi.
- **Errore comune:** musica che parte in dissolvenza; mix fatto in cuffia con molto sub che al telefono diventa vuoto; testo che dipende dalla voce («come dice lei…»); usare un brano di tendenza su un post sponsorizzato (vedi «Librerie musicali di Meta e TikTok»).

#### Mix per lo streaming premium (Netflix, Prime Video: dialog-gated)
- **Cos'è:** il mix per piattaforme che misurano il loudness **solo sul dialogo**, non sul programma intero.
- **Si sente:** a −27 LKFS di dialogo, musica ed esplosioni possono andare molto più su del parlato senza che la piattaforma abbassi il film: più dinamica che in TV.
- **Quando:** film di brand o documentari consegnati a una piattaforma, o quando il cliente chiede «specifica Netflix» come garanzia di qualità.
- **Come:** Netflix (titoli «Netflix branded», cioè prodotti o commissionati da Netflix: non vuol dire contenuto di marca; per i titoli in licenza vale un'altra specifica): specifica obbligatoria −27 LKFS ±2 LU dialog-gated, ITU-R BS.1770-1 su tutto il programma, true peak −2 dBTP; monitoraggio near field «most common» a 79 o 82 dB SPL [P]. Nelle «Best Practices», che Netflix dichiara non obbligatorie: limiter a −2,3, LRA del programma 4-18 LU, LRA del dialogo 10 LU o meno, programma a −24 LKFS ±2 LU (BS.1770-3 o -4) se il dialogo è meno del 15%, downmix LoRo secondo ITU-R BS.775-1 con LFE muto [P: studiopartner.netflix.net, aperto in Chrome il 2026-11-09, change log OC-1-6 del 2024-10-29]. Amazon Studios: −27 LKFS ±2 LU con «1770-1 with Dialogue Gating»/Dolby Dialogue Intelligence, true peak −2 dBTP; l'Atmos non ha requisito di loudness [P]. Apple (film e TV venduti o noleggiati sull'app Apple TV): nel file Dolby Atmos il loudness medio del dialogo deve stare fra −31 e −10 LKFS, idealmente fra −30 e −18, misurato con BS.1770 + Dialogue Intelligence su un render 5.1; senza dialogo come ancora, programma intero fra −31 e −5 LKFS [P: Apple Video and Audio Asset Guide 5.3.19, 8/9/2026]; per Apple TV Originals la specifica non è pubblica.
- **AI:** —
- **Errore comune:** misurare con ffmpeg e credere di avere il valore Netflix: `ebur128` misura il programma intero, non ha il gate di dialogo [P: opzioni del filtro, nessuna per il dialogo]. Per il dialog-gated serve un meter con Dolby Dialogue Intelligence (Dolby Media Meter, Nugen VisLM e gli altri dell'elenco Netflix).

#### Mix per il cinema (theatrical mix: Dolby, livello di riferimento)
- **Cos'è:** il mix per la sala, fatto in una regia calibrata come una sala: ogni canale frontale produce 85 dBC con rumore rosa al livello di riferimento.
- **Si sente:** dinamica molto ampia; lo stesso mix ascoltato a casa sembra con dialoghi troppo bassi ed effetti troppo forti. Per questo si fa una seconda versione near field.
- **Quando:** film di brand in sala, spot per la pubblicità al cinema, proiezioni a eventi con impianto cinema.
- **Come:** (1) Calibrazione: 85 dBC per ogni diffusore dello schermo; surround stereo 82 dBC per lato «at the reference pink noise level» [P: Dolby, guida tecnica cinema 1994, copia d'archivio Film-Tech]; per la TV ATSC dà 85 dB solo per stanze sopra 20.000 piedi cubi e scende fino a 76 dB nelle stanze piccole (Tabella 10.2, rumore rosa 500 Hz-2 kHz a −20 dBFS, misura in pesatura C, lenta) [P: A/85:2026-07]. (2) Netflix: il mix theatrical va fatto a 85 dB SPL, non ha requisito LKFS, può arrivare a 0 dBTP, va consegnato a rulli, e se esiste un mix theatrical servono **due** set di consegne, sala e near field [P]. (3) EBU R128 s4 (2023) per portare un film in TV o streaming: rapporto loudness/dialogo (LDR) non oltre 5 LU, poi normalizzare a −23 LUFS; esplicitamente «not intended as production advice for feature films» [P]. (4) Pubblicità in sala: in Italia Rai Pubblicità (concessionaria anche per il cinema) chiede loudness massimo **82 dB Leq(m)** e true peak massimo −2 dBTP ±0,1, e si riserva di attenuare gli spot più forti [P: «Specifiche tecniche per la fornitura di contenuti pubblicitari per distribuzione nelle sale cinema», v1.0 del 7/10/2025]; il valore viene dalla SAWA (associazione mondiale della pubblicità al cinema), che raccomanda tre soglie, ≤82, ≤80 e ≤78 dB Leq(m), con la sala al fader 6-7 [P: SAWA, «Loudness Control Implementation», ed. 2, copia Wayback del PDF sawa.com]. Leq(m) è una misura diversa da LUFS (pesatura e scala diverse): serve un meter che la misuri, non `ebur128`; il fonico di sala lo deve avere (std). Per altri circuiti (es. Opus Proxima) chiedere la specifica: non trovata pubblica.
- **AI:** —
- **Errore comune:** usare il mix theatrical per lo streaming o il web (dialoghi illeggibili); mixare «da cinema» in una stanza piccola con il monitor a 85 dB (risultato troppo scuro e piano per la sala vera).

### C. Versioni, consegne e controllo

#### Versioni e consegne (deliverables: full mix, M&E, stem, lingue)
- **Cos'è:** l'insieme dei file audio che escono da un mix e che il cliente o la piattaforma usa per mandare in onda, doppiare, rimontare.
- **Si sente:** —; si nota solo quando manca qualcosa (un doppiaggio senza effetti, un cutdown senza musica pulita).
- **Quando:** sempre; si concorda **prima** del mix, nel preventivo.
- **Come:** set di partenza per uno spot {{STUDIO}} (valori di partenza, adattare alla specifica): full mix stereo; versione senza voce fuori campo (*music & effects + no VO*); musica sola; stem DME; per ogni lingua il full mix con la voce nuova; per ogni durata lo stesso set; tutto WAV 48 kHz / 24 bit; nomi con progetto, durata, versione, lingua, loudness. Per film: anche 5.1 o Atmos, M&E completo, mix theatrical e near field separati se serve [P: Netflix]. Netflix accetta per i doppiaggi 16 o 24 bit, mai audio compresso, mono duplicato su due canali se l'originale è mono [P]. Allegare il rapporto di misura (integrato, short-term massimo, true peak, LRA) di ogni file.
- **AI:** un riepilogo di misura per tutti i file si ottiene in un ciclo con ffmpeg (vedi tecnica successiva).
- **Errore comune:** consegnare solo il mix: al primo adattamento si torna dallo studio audio e si paga; nomi di file uguali per durate diverse.

#### Cutdown 30", 15", 6" (cutdowns)
- **Cos'è:** le versioni più corte di uno spot, ciascuna con un suo mix.
- **Si sente:** un cutdown fatto tagliando il 30" ha la musica che salta o finisce a metà frase; uno fatto bene sembra nato così.
- **Quando:** ogni campagna con TV e digitale; su YouTube i bumper durano fino a 6" (vedi `produzione-composizione.md`, «Spot da 6", 15", 30"…»).
- **Come:** musica scritta o montata per ogni durata (regola in `produzione-composizione.md`); il suono del logo e del claim identico in tutte; loudness e true peak rimisurati su ogni versione (un 6" con logo finale ha uno short-term massimo diverso dal 30"); in TV il file non deve sforare il formato di un fotogramma [P: listino Publitalia, letto in `produzione-composizione.md`].
- **AI:** —
- **Errore comune:** misurare il 30" e copiare il rapporto sugli altri; tenere nel 6" un riser di 2 secondi.

#### Controllo di un deliverable in casa con ffmpeg (loudness QC)
- **Cos'è:** misurare loudness integrato, short-term massimo, LRA e true peak di un file finito (anche un MP4) prima di consegnarlo, con il filtro `ebur128` di ffmpeg (conforme a ITU-R BS.1770 e EBU R128) [P: documentazione ffmpeg]. Dettagli sugli strumenti in `misura-analisi-ai.md`.
- **Si sente:** —; serve a non farsi rifiutare il file.
- **Quando:** su ogni file consegnato, **sul file finale** (MP4 con AAC, MXF), non sul WAV del mix: la codifica AAC alza i picchi; nello studio un tetto di −3,0 dBFS sul WAV è uscito a −1,0 dBTP sull'AAC [Studio, misurato].
- **Come:**
  1. Misura completa: `ffmpeg -hide_banner -nostats -i FILE.mp4 -map 0:a:0 -af ebur128=peak=true -f null - 2>&1 | grep -A 13 "Summary:"` (con `tail -12` ffmpeg 9 taglia la riga `I:`, perché dopo il riepilogo stampa ancora due righe di statistiche [M, verifica indipendente]). Leggere il blocco finale: `I:` = integrato (LUFS); `LRA:` (LU, da ignorare sotto 1 minuto); sotto «True peak» la riga `Peak:` è il true peak, anche se ffmpeg scrive «dBFS» [M]. La riga `TARGET:-23 LUFS` del log non è un risultato. `-map 0:a:0` sceglie la prima traccia audio; per un MXF a 8 canali mono (Rai) misurare i canali 1-2 insieme: `ffmpeg -hide_banner -nostats -i FILE.mxf -filter_complex "[0:a:0][0:a:1]amerge=inputs=2,ebur128=peak=true" -f null - 2>&1 | grep -A 13 "Summary:"` [M: provato su un MXF di prova con 8 tracce mono PCM 24 bit, colonna su 1-2: stesso risultato dell'MP4 d'origine; non provato su un MXF Rai vero].
  2. Short-term massimo (serve per gli spot, ffmpeg non lo mette nel riepilogo): `ffmpeg -hide_banner -nostats -i FILE.mp4 -map 0:a:0 -af ebur128 -f null - 2>&1 | awk '/ S:/{for(i=1;i<=NF;i++) if($i=="S:"){s=$(i+1)+0; if(!n||s>m){m=s;n=1}}} END{print "Max short-term:", m, "LUFS"}'` [M: provato su file di prova].
  3. Confronto con la specifica (esempio Rai): I fra −23,2 e −22,8; short-term massimo ≤ −17,8; true peak ≤ −1,7 (−2,0 + tolleranza 0,3) [S: specifiche Rai, copia readkong]; mirare comunque a −2,0: la tolleranza non è un margine da spendere (std). Per il web dello studio: I fra −16,5 e −15,5 (valore di partenza), true peak ≤ −1,5 sull'AAC [Studio].
  4. Voce mono: aggiungere `:dualmono=true` solo se il file è davvero mono e sarà ascoltato in stereo [P: ffmpeg].
- **AI:** il ciclo su una cartella si scrive in una riga (`for f in *.mp4; do …; done`) e produce il rapporto da allegare.
- **Errore comune:** misurare la traccia della voce o della musica da sola (lo strumento `normalize-audio` di HyperFrames lo fa: misura l'elemento, non il mix) [Studio]; dimenticare `-map` su un file con più tracce; usare il valore Netflix con ffmpeg (manca il gate di dialogo).

#### Correggere il loudness in casa (gain, limiter, loudnorm a due passate)
- **Cos'è:** portare un mix già bilanciato al valore di consegna senza cambiarne il suono.
- **Si sente:** se è lineare, nulla cambia tranne il volume; se il filtro comprime, il mix si appiattisce e i colpi perdono forza.
- **Quando:** per adattare un mix approvato a un'altra destinazione (web → TV); non per rimediare a un mix sbagliato.
- **Come:** (1) Via più semplice: misurare `I`, applicare `-af volume=XdB` con X = obiettivo − I, rimisurare; se il true peak sfora, un limiter (`alimiter`) prima del volume finale, poi rimisurare fino a ±0,15 LU [Studio: procedura del playbook]. (2) `loudnorm` a due passate: prima passata con `print_format=json`, seconda con `measured_I`, `measured_TP`, `measured_LRA`, `measured_thresh`, `offset` e `linear=true`; controllare «Normalization Type: Linear» nel riepilogo: se dice «Dynamic» il filtro sta comprimendo (succede se il LRA obiettivo è più basso di quello del file o se il guadagno porterebbe il true peak oltre il limite) [P: documentazione ffmpeg]. In modo dinamico sovracampiona a 192 kHz: mettere sempre `-ar 48000` in uscita [P]. Prova: rumore rosa modulato a −30,9 LUFS portato in due passate a −22,7 LUFS (bersaglio −23), modo lineare: dopo `loudnorm` si rimisura e si corregge col volume [M]. Comandi completi in `misura-analisi-ai.md`.
- **AI:** —
- **Errore comune:** la passata singola `loudnorm=I=-16:TP=-1.5:LRA=11` (è nella skill `video-editing`) lavora sempre in modo dinamico: comprime il mix [P: ffmpeg «single pass … dynamic»]; con un limiter **prima** di `loudnorm` il guadagno lineare diventa impossibile e il filtro alza di molto le parti piane [Studio: «alzando di 18 dB la musica piano»]. Anche in due passate `loudnorm` ricade in modo dinamico se il LRA misurato è 0,00 (segnale costante: usare `volume`) e il suo «Output True Peak» in lineare è un picco di campione: controllare `normalization_type` e rimisurare il file finale con `ebur128` [M, verifica in `misura-analisi-ai.md`].

### D. Musica e marca

#### Musica di libreria, commissionata o brano noto (library vs commissioned vs licensed track)
- **Cos'è:** le tre vie per avere musica in uno spot. **Libreria**: brano di catalogo con licenza standard. **Commissionata**: scritta apposta da un compositore o una music house (vedi `produzione-composizione.md`). **Brano noto**: licenza di sincronizzazione dall'editore (composizione) **e** licenza master dal discografico (registrazione); se si fa risuonare il brano (*cover*), serve solo la parte editoriale.
- **Si sente:** la libreria è pulita ma può sentirsi in altri spot; la commissionata è sul montaggio e solo del marchio; il brano noto porta con sé ricordi e pubblico.
- **Quando:** libreria per social, web, budget bassi e tempi stretti; commissionata quando la musica deve diventare del marchio o servono molte versioni; brano noto quando la canzone è l'idea della campagna.
- **Come:** (1) Ogni licenza dice **mezzi** (TV, cinema, web organico, paid social, radio, OOH, punto vendita, eventi), **territori**, **durata** (spesso 1 anno per la pubblicità, poi si rinnova: valore da verificare caso per caso), **numero di versioni e cutdown**, **modifiche ammesse**. (2) Tempi: libreria in ore; commissionata in giorni o settimane; brano noto da settimane a mesi, e il titolare può dire di no o chiedere quanto vuole [S: studi legali italiani]. (3) Costi: nessun listino pubblico per sync e master di brani noti; dipendono da notorietà, mezzi, territori e durata (vedi `sampling-and-crate-digging`: «There is no standard rate card») [S]. (4) SIAE, collecting alternative e diritti connessi: la sync si chiede a editori e autori, il master all'etichetta; la diffusione genera compensi separati per autori (SIAE o altre collecting) e, per il fonogramma, per produttori e interpreti (L. 633/1941, art. 73; SCF, Nuovo IMAIE, ITSRIGHT): voce completa, con l'elenco AGCOM delle collecting, in `atlante-culturale/references/industria-musicale.md`, «Regole» §1-3 [P, lì verificato]. (5) Prima della consegna: licenza scritta di ogni brano in `rights/` e controllo con `rights-licensing-clearance`. Le condizioni Splice coprono film, TV, sincronizzazione e video social ma non elencano la pubblicità: per uno spot serve conferma scritta [Studio: playbook `motion-video`].
- **AI:** la musica generata (ElevenLabs Music, Suno) ha termini propri e limiti su TV e film: vedi `produzione-composizione.md` e `misura-analisi-ai.md`. Non si chiede all'AI «un brano come [titolo]» (`regole.md` §5.2).
- **Errore comune:** temp track con un brano famoso approvato dal cliente prima della licenza; licenza di libreria «web» usata in TV; un sound-alike commissionato per evitare la licenza: è il caso delle cause per plagio e imitazione servile (`regole.md` §5.2).

#### Librerie musicali di Meta e TikTok (Sound Collection, Commercial Music Library)
- **Cos'è:** le musiche che le piattaforme mettono a disposizione dentro le loro app, con licenze diverse per uso personale e commerciale.
- **Si sente:** —
- **Quando:** contenuti organici e inserzioni di un brand su quella piattaforma, **solo lì**.
- **Come:** (1) **Meta:** la Sound Collection dà una licenza gratuita «for commercial or non-commercial purposes» ma solo sui prodotti Meta (termini del 16/3/2022); la musica normale di Facebook e Instagram non si usa per scopi commerciali senza licenze proprie (Music Guidelines) [P, riletti]. (2) **TikTok:** solo la Commercial Music Library per gli usi commerciali, e solo dentro TikTok («Commercial Uses outside of TikTok are not permitted», esclusi anche TV, radio e cinema) [P: CML User Terms]; i «Sounds» generali sono solo «for personal entertainment and non-commercial purposes» [P: Music Terms EEA, luglio 2025]. (3) Quindi lo stesso spot su Reels, TikTok e YouTube ha bisogno di una musica licenziata per tutti, o di tre musiche. Voce completa (Usable Placements, brani Premium, creator pagati, disclosure) in `atlante-culturale/references/industria-musicale.md`, «Regole» §5.
- **AI:** —
- **Errore comune:** scaricare un brano dalla libreria TikTok per metterlo in un video del sito o in un'inserzione Meta; usare un brano di tendenza su un post sponsorizzato perché «era nella libreria dell'app».

#### Audio logo e sistema sonoro di marca (sonic logo, sonic identity)
- **Cos'è:** una firma sonora di pochi secondi associata al marchio, e il sistema che la declina (musiche, suoni d'interfaccia, suoni di prodotto, voce). Regola di scrittura in `produzione-composizione.md` (1-3 altezze con un timbro proprio).
- **Si sente:** dopo un secondo si sa chi parla, anche senza guardare. Esempi: Intel ha introdotto il «bong» nella pubblicità radio e TV nel 1995 e lo ha rinnovato nel settembre 2020 [P: timeline.intel.com; la data 1994 e il nome del compositore Walter Werzowa sono [S]]; Mastercard ha presentato nel 2019 una melodia di marca usata in loghi sonori, suonerie, attese e suoni di accettazione del pagamento [P: comunicato]; il «ta-dum» di Netflix (2015) nasce secondo i realizzatori da un anello battuto su un mobile e strati di altri suoni, opera del sound designer Lon Bender [S: podcast Twenty Thousand Hertz, intervista ai realizzatori]; McDonald's «I'm lovin' it» parte nel settembre 2003 da Monaco con l'agenzia Heye & Partner [S: stampa, autori del jingle contesi].
- **Quando:** marchi con molti punti di contatto sonori (spot, app, negozi, telefono, eventi); non serve a un marchio che compare due volte l'anno.
- **Come:** (1) Partire dai punti di contatto, non dal logo. (2) Logo in più durate (lungo per lo spot, corto per il bumper, ridotto per l'interfaccia) e in più strumentazioni con la stessa melodia. (3) Stesso livello e stessa posizione in ogni spot (es. sul pack shot), con il suo short-term misurato: un logo che sale di 3 LU sopra lo spot fa sforare il limite di −18 LUFS (R128 s1). (4) Cessione piena dei diritti e valutazione del deposito come marchio sonoro (da verificare con `compliance-rights-officer`). (5) Test: riconoscimento dopo 1-2 ascolti, con panel, prima del lancio (metodo da definire caso per caso).
- **AI:** si possono generare varianti di timbro e di arrangiamento per esplorare; la melodia finale va scritta e posseduta da un autore umano (L. 132/2025, art. 25, in `regole.md` §6): un logo generato non garantisce esclusiva.
- **Errore comune:** logo sonoro troppo simile a quello di un altro marchio (i suoni corti si somigliano facilmente: verificare); cambiarlo a ogni campagna.

### E. AI, voci e diritti

#### Audio generato con l'AI per video (AI audio for video)
- **Cos'è:** effetti, ambienti, musica e voci generati da modelli: standalone (Higgsfield `seed_audio` e gli altri strumenti di `generate_audio`, ElevenLabs Sound Effects e voci) o nativi nei modelli video (Veo 3 e 3.1, Seedance 2.0/2.5, Kling 3.0: audio e video generati insieme) [P: Google, annuncio Veo 3 del 20/5/2025, «can also generate videos with audio»; elenco modelli in skill `higgsfield-audio`].
- **Si sente:** ambienti e impatti credibili; voci native con sincronismo labiale buono sulle frasi brevi; musica nativa generica. Problemi tipici: suoni corti di prodotto sbagliati (un tonfo letto come esplosione), livelli casuali, code tagliate, silenzio impossibile da ottenere, voce e fondo fusi in un'unica traccia.
- **Quando:** bozze, animatic, temp, social a volume, ambienti e design di supporto; il film AI che deve «sembrare girato» (agente `ai-film-director`) con l'audio rifatto o ricomposto in post.
- **Come:** (1) Nei film AI generare con `generate_audio false` se l'audio si rifà, e tenere l'audio nativo solo se serve il labiale. (2) Misurare ogni file generato: lo studio ha trovato passi generati a −57 LUFS (da alzare di circa 34 dB) e una voce a −30 LUFS con picco a −10 dBFS, cioè 20 dB di cresta [Studio]. (3) Ricampionare a 48 kHz (Seedance esce AAC 32 kHz; ElevenLabs v4 MP3 44,1 kHz mono) [Studio]. (4) Separare voce e fondo con Demucs se serve un M&E di bozza. (5) Controllare a orecchio i suoni corti: il riconoscimento automatico li sbaglia [Studio]. (6) Licenze: ElevenLabs piano gratuito «does not include a commercial license and cannot be used for any commercial purpose»; i piani a pagamento sì, ma il contenuto generato con servizi Beta non si può usare commercialmente; ciò che è generato fuori da un abbonamento resta non commerciale anche dopo [P: ElevenLabs Help Center]. Termini Higgsfield (output trasferibile ai clienti, nessuna garanzia di originalità) in `regole.md` §1. (7) Registro: modello, job-id, prompt, data di ogni suono nel `.md` del progetto (come per le immagini).
- **AI:** è la voce stessa.
- **Errore comune:** montare l'audio nativo così com'è (livelli e code casuali); usare un effetto generato con un account gratuito in uno spot; chiedere nel prompt «come il suono di [marchio]» o la musica di un film.

#### Voci sintetiche e cloni (synthetic voices, voice cloning)
- **Cos'è:** voci fuori campo o dialoghi generati da un modello di sintesi, con una voce di catalogo, creata da descrizione o clonata da una persona reale. Tecnica e confronto degli strumenti in `misura-analisi-ai.md`; qui le regole per il video.
- **Si sente:** voci di catalogo pulite ma riconoscibili come tali sulle frasi lunghe (intonazione uguale, respiri finti); risate e reazioni difficili (lo studio ha speso 26 job per qualche risata con Eleven v4) [Studio].
- **Quando:** bozze e animatic sempre; consegna finale solo con licenza commerciale del fornitore, consenso scritto se la voce è di una persona, ed etichetta dove serve.
- **Come:** (1) Voci di sistema macOS (`say`) solo per i tempi in bozza interna: non sono licenziate per uso commerciale [Studio: agente `motion-video`, licenza macOS letta il 2026-11-04]. (2) Clone di una persona reale solo con liberatoria scritta che copra l'uso con AI, mezzi, territorio e durata; mai voci di persone note o imitazioni (`regole.md` §3.3-3.6; diffondere senza consenso voci falsificate idonee a ingannare è reato dal 10/10/2025, art. 612-quater c.p.). (3) **AI Act, art. 50(4)**: dal 2 agosto 2026 lo studio, come deployer, deve dichiarare in modo chiaro, al più tardi alla prima esposizione, l'audio generato che sembra autentico (deep fake); una voce sintetica realistica può rientrarvi (Linee guida, par. 113); in pubblicità lo studio applica l'etichetta piena (`regole.md` §6, verificato il 2026-11-01). Per un annuncio audio-video: cartello o dicitura all'inizio, e a voce se il contenuto è solo audio (forma da decidere con `compliance-rights-officer`). (4) Doppiaggio di uno spot in un'altra lingua con voce clonata dell'attore: consenso dell'attore anche per le lingue.
- **AI:** è la voce stessa.
- **Errore comune:** clonare la voce di un dipendente del cliente «perché tanto è d'accordo» senza liberatoria scritta; usare una voce che somiglia a un doppiatore famoso; non tenere la prova della licenza della voce usata.

Fonti: EBU R 128 v5.0 (novembre 2023), R 128 s1 v3 (agosto 2020), R 128 s2 (2023), R 128 s4 (2023), PDF da tech.ebu.ch letti con PDFKit [P]; ATSC A/85:2026-07 (8/7/2026), PDF da atsc.org [P]; AGCOM delibera 219/09/CSP e Allegato A, PDF da agcom.it [P]; TUSMA art. 44 su Normattiva e delibera AGCOM 34/09/CSP [P]; Rai, «Specifiche tecniche per la fornitura di spot pubblicitari televisivi in formato HD», febbraio 2021 (copia readkong [S]: il sito di Rai Pubblicità non la pubblica); Rai Pubblicità, PDF ufficiali: cinema v1.0 (7/10/2025), Addressable TV (settembre 2026), video digitale v3.2 (settembre 2026), audio digitale v1.6 (giugno 2025) [P]; SAWA, «Loudness Control Implementation» ed. 2 (Wayback) [P]; Publitalia, «Specifiche TV», zip del 20/10/2026 [P] (il PDF «Commercials on Mediaset Italian channel» del 29/11/2021 è superato); Cairo, «Standard per materiali emissione pubblicità» La7, maggio 2022 e 2016 [P]; Apple Video and Audio Asset Guide 5.3.19 [P]; Netflix Sound Mix Specifications (Chrome) [P]; Amazon Studios Delivery & QC [P]; Dolby, guida tecnica cinema 1994 (Film-Tech) [P]; documentazione ffmpeg (ffmpeg.org, `-h filter=…` di ffmpeg 9.0.1) [P] e prove [M]; YouTube Help 14106294 [P]; Meta for Developers 7/11/2024, Meta Sound Collection Terms, Meta Music Guidelines [P]; TikTok Ads Help (Reservation In-Feed), TikTok CML User Terms [P]; ElevenLabs Help Center [P]; Google, «Generative media models I/O 2025» [P]; Intel timeline, Mastercard newsroom [P]; Twenty Thousand Hertz, stampa su McDonald's, Trew Audio, studi legali italiani su sincronizzazione [S]; playbook dello studio `motion-video` e `ai-film-director` [Studio].

## Numeri di riferimento

Tutti letti il 2026-11-09 salvo dove indicato. LUFS e LKFS sono la stessa unità (EBU R128, nota 1) [P].

**Loudness di consegna per destinazione**

| Destinazione | Integrato | Short-term max | True peak max | Misura / note | Fonte |
|---|---|---|---|---|---|
| EBU R128, programmi | −23,0 LUFS; ±1,0 LU solo dove l'obiettivo non è raggiungibile (dirette); ±0,2 LU di tolleranza di misura | — | −1 dBTP (±0,3 dB di misura) | programma intero, senza privilegiare voce o musica; LRA sconsigliato sotto 1 minuto | [P] EBU R 128 v5.0, nov. 2023 |
| EBU R128 s1, spot e promo | −23,0 LUFS (±0,2 di misura) | −18,0 LUFS (+5 LU) | −1 dBTP | LRA non applicabile | [P] R 128 s1 v3, ago. 2020 |
| EBU R128 s2, streaming senza metadati | −20,0 / −16,0 LUFS (fascia provvisoria) | — | — | preferito −23 con metadati | [P] R 128 s2, 2023 |
| EBU R128 s4, film in TV/streaming | −23,0 LUFS dopo LDR ≤ 5 LU | — | −1 dBTP | normalizzazione sul dialogo fino a −23 ammessa | [P] R 128 s4, 2023 |
| Italia, Rai (spot TV lineare) | −23,0 LUFS ±0,2 | −18,0 LUFS ±0,2 | −2,0 dBTP ±0,3 | tutta la durata; 8 canali mono PCM 48 kHz/24 bit, colonna su 1-2 | [S] specifiche Rai feb. 2021, copia readkong (non pubblicata da Rai Pubblicità) |
| Italia, Rai Pubblicità Addressable TV | −23,0 LUFS | −18,0 LUFS | −2,0 dBTP | MP4, AAC-LC stereo 256 kbps, 25 fps | [P] PDF Rai Pubblicità, set. 2026 |
| Italia, Rai Pubblicità video e audio digitali | −23 LUFS ±0,2 | −18 LUFS ±0,2 | −1 dBTP ±0,3 | RaiPlay, RaiPlay Sound, radio digitali; «vedi EBU R 128-s1» | [P] PDF v3.2 set. 2026 (video), v1.6 giu. 2025 (audio) |
| Italia, Publitalia (Mediaset) | «coerenti con le normative EBU di – 24db» | — | — | MXF XDCAM HD 422, 8 tracce mono 48 kHz/24 bit; Cape.io o Extreme Reach; il PDF 2021 superato diceva −24 ±0,5 LKFS, QPPM −9 dBFS | [P] «Specifiche TV», zip del 20/10/2026 |
| Italia, La7 (Cairo) | nessun valore nel documento in vigore (rimanda ad Adstream e Peach); 2016: −24 LKFS ±0,5 LU, metodo AGCOM | — | 2016: −2 dBTP | chiedere a Cairo la specifica attuale | [P] PDF mag. 2022 e 2016 |
| Italia, Rai Pubblicità cinema | massimo 82 dB Leq(m) (non LUFS) | — | −2 dBTP ±0,1 | 5.1 in sei WAV mono; Rai può attenuare gli spot più forti; valore SAWA (≤82 / ≤80 / ≤78 dB Leq(m)) | [P] specifiche cinema v1.0, 7/10/2025; [P] SAWA ed. 2 (Wayback) |
| Italia, Sky Media | non pubblicata | — | — | da chiedere alla concessionaria | ricerca su skymedia.it, nessun PDF |
| Italia, AGCOM | nessun valore assoluto: spot ≤ livello del canale +1,0 LU | — | — | infrazione se ≥8% di 50 spot consecutivi supera; livello del canale = 5 giorni; gate relativo 8 LU, assoluto −70 LKFS | [P] TUSMA art. 44 c. 1 (Normattiva); delibere 34/09/CSP e 219/09/CSP, Allegato A |
| USA, ATSC A/85 (CALM Act per la TV) | −24 LKFS senza metadati (±2 dB di misura, da non usare come margine) | — | −2 dBTP (±0,5) | spot (*short form*): mix intero, BS.1770-3 o successive; programmi (*long form*): dialogo, BS.1770-1 con dialogue gating; streaming: un solo valore fra −23 e −27 LKFS; per la FCC il CALM non fissa un tetto assoluto: lo spot non deve superare il programma | [P] A/85:2026-07, Annex M; [P] FCC «Loud Commercials» |
| USA, California SB 576 | spot non più forti del contenuto, come da regole CALM | — | — | per i servizi di streaming con pubblicità, dal 1/7/2026 | [P] SB 576, Chapter 336, 6/10/2025 |
| Netflix (titoli Netflix branded = originali, non «contenuto di marca») | −27 LKFS ±2 LU dialog-gated (BS.1770-1); buona pratica: −24 ±2 LU di programma se dialogo <15% | — | −2 dBTP (buona pratica: limiter a −2,3) | buone pratiche non obbligatorie: LRA programma 4-18 LU, dialogo ≤10 LU; theatrical: nessun requisito LKFS, 0 dBTP | [P] Netflix Sound Mix Specs, OC-1-6 |
| Amazon Studios | −27 LKFS ±2 LU dialog-gated (Dolby Dialogue Intelligence) | — | −2 dBTP | near field 5.1/2.0; Atmos senza requisito; meter di riferimento Nugen VisLM2 | [P] Amazon Studios Delivery & QC |
| Prime Video (partner) | certificazione di conformità ATSC A/85 per contenuti e spot dal 1/7/2026 | — | — | controlli trimestrali | [P] Video Central, giugno 2026 |
| Apple (film Atmos, Asset Guide) | dialogo fra −31 e −10 LKFS, ideale −30 / −18 (BS.1770 + Dialogue Intelligence, render 5.1) | — | — | senza dialogo: −31 / −5 LKFS; Apple TV Originals: non pubblico | [P] Asset Guide 5.3.19, 8/9/2026 |
| YouTube | nessun valore pubblicato; «Volume stabile» attivo per impostazione | — | — | abbassa i file forti (circa sopra −14 LUFS), non alza: misure di terzi | [P] YouTube Help 14106294; [S] per −14 |
| Meta, TikTok | nessuna specifica pubblica di loudness trovata | — | — | TikTok Reservation: «All video creatives must have sound» | [P] pagine lette, nessun valore |
| Scelta dello studio, web e social | −16 LUFS | — | −1,6 / −1,9 dBTP sul file AAC | dentro la fascia R128 s2 | [Studio] tre consegne 2026-11 |

**Livelli di monitoraggio**

| Contesto | Livello | Segnale | Fonte |
|---|---|---|---|
| Cinema, canali dello schermo | 85 dBC per diffusore | rumore rosa di riferimento Dolby | [P] Dolby, guida tecnica 1994 |
| Cinema, surround stereo | 82 dBC per lato | idem | [P] stessa guida |
| Netflix theatrical | 85 dB SPL | — | [P] Netflix |
| Netflix near field | 79 o 82 dB SPL («most common») | — | [P] Netflix |
| TV (ATSC), stanza > 20.000 ft³ | 85 dB SPL | rumore rosa 500 Hz-2 kHz a −20 dBFS, pesatura C, lenta | [P] A/85:2026-07, tab. 10.2 (da SMPTE RP 200) |
| TV, 10.000-19.999 / 5.000-9.999 / 1.500-4.999 / < 1.499 ft³ | 82 / 80 / 78 / 76 dB SPL | idem | [P] stessa tabella |
| Dolby Atmos home | 79-82 dB SPL(C) secondo la stanza | rumore rosa −20 dBFS RMS | [P] Dolby Atmos Home Theater Installation Guidelines, dic. 2018 |

**Frame rate e sincrono** (calcolo, std)

| Grandezza | Valore |
|---|---|
| 23,976 / 29,97 / 59,94 fps | 24000/1001 / 30000/1001 / 60000/1001 |
| Pull-down / pull-up | −0,1% / +0,1% (rapporto 1000/1001) |
| Deriva senza correzione | 3,6 s all'ora |
| Frequenze di campionamento con pull | 47.952 Hz / 48.048 Hz [S: Trew Audio, forum Avid] |
| Velocizzazione 24 → 25 fps | +4,17%, +0,71 semitoni |
| Frequenze accettate da Netflix per Atmos in IMF | 23,976, 24, 25, 30 fps [P] |
| TV italiana | 25 fps (Rai 1080i25) [P] |

**Formati di consegna**

| Committente | Formato audio | Fonte |
|---|---|---|
| Netflix, mix originale, M&E, stem | WAV/BWAV LPCM 48 kHz / 24 bit, mai compresso; doppiaggi 16 o 24 bit; mono duplicato su 2 canali | [P] |
| Rai, spot HD | 8 canali mono PCM 48 kHz / 24 bit; colonna su 1-2, silenzio sugli altri | [S] copia readkong feb. 2021 |
| Publitalia, spot | MXF OP-1a XDCAM HD 422 1080i25; 8 tracce AES, 1 canale PCM 48 kHz / 24 bit ciascuna; solo Cape.io o Extreme Reach; consegna 4 giorni lavorativi prima della messa in onda | [P] «Specifiche TV», 20/10/2026 |
| Rai Pubblicità, spot cinema | 5.1 in sei WAV mono PCM 48 kHz (minimo 16 bit), banda 20 Hz-20 kHz, LFE 20-120 Hz | [P] specifiche cinema v1.0, 7/10/2025 |

**Licenze di piattaforme e generatori**

| Fonte musicale | Uso commerciale | Dove | Fonte |
|---|---|---|---|
| Meta Sound Collection | sì, gratuito, non esclusivo | solo sui prodotti Meta | [P] Terms, 16/3/2022 |
| Musica della libreria Facebook/Instagram | no, senza licenze proprie | — | [P] Music Guidelines |
| TikTok Commercial Music Library | sì | solo su TikTok | [P] CML User Terms |
| ElevenLabs piano gratuito | no | — | [P] Help Center |
| ElevenLabs piani a pagamento | sì, tranne servizi Beta; vale anche dopo la disdetta per ciò che è generato durante l'abbonamento | — | [P] Help Center |
| ElevenLabs Sound Effects, libreria del sito | «royalty free», gratuito con attribuzione | — | [P] pagina Sound Effects (contrasta con l'Help Center sul piano gratuito: vale la regola più stretta) |

**Valori misurati nei lavori dello studio** [Studio: playbook `motion-video` e `ai-film-director`, 2026-11-04 / 2026-11-07]

| Osservazione | Valore |
|---|---|
| Passi generati con `seed_audio` | −57 LUFS (alzati di circa 34 dB) |
| Scena AI con voce | −30 LUFS, picco −10 dBFS (20 dB di cresta) |
| Voce mono su due canali nel mix stereo | circa +3 LU |
| Tetto del limiter −3,0 dBFS sul WAV → AAC | −1,0 dBTP (sovraelongazione 1,1 dB) |
| Tetto −3,6 dBFS sul WAV → AAC | −1,6 dBTP a −16,1 LUFS |
| Audio nativo Seedance 2.5 | AAC 32 kHz |
| Eleven v4 (Higgsfield) | MP3 44,1 kHz mono, asciutto |

Fonti: come nella riga «Fonti» delle Tecniche; in più California SB 576 su leginfo.legislature.ca.gov, FCC «Loud Commercials», Prime Video Video Central «Supply Chain Updates, June 2026», Dolby Atmos Home Theater Installation Guidelines (dolby.com) [P].

## Errori che si sentono

- **Spot «più forte» degli altri in TV** → piatto, stanco, abbassato dal broadcaster o rifiutato al controllo; il rapporto mostra integrato o short-term massimo fuori specifica → mixare alla specifica della concessionaria (Rai −23 / −18 / −2 dBTP; Publitalia «−24» EBU; cinema Rai 82 dB Leq(m)) e misurare il file consegnato.
- **Logo finale che sfora** → l'integrato è in regola ma il rapporto segna short-term massimo sopra −18 LUFS proprio sul pack shot → livellare il logo con la voce del claim e misurare lo short-term (comando in Tecniche).
- **Picchi che rompono dopo la codifica** → leggera distorsione dura sui colpi nell'MP4; il true peak dell'AAC supera quello del WAV di circa 1 dB [Studio] → tetto del limiter più basso e misura sul file AAC finale.
- **Dialoghi che non si capiscono a casa** → si alza il volume del televisore a ogni battuta e lo si riabbassa a ogni esplosione; il mix è quello della sala → versione near field separata, LDR ≤ 5 LU (R128 s4), dialogo come riferimento.
- **Video social che sembra muto** → il suono parte in dissolvenza o dopo un secondo; il primo fotogramma è silenzioso → suono pieno al fotogramma 1, evento riconoscibile entro il primo secondo, messaggio leggibile anche muto.
- **Basso sparito al telefono** → lo spot suona vuoto dall'altoparlante; in cuffia è pieno → armoniche sul basso e sugli impatti; ascolto finale su un telefono vero e in mono.
- **M&E con buchi** → nel doppiaggio spariscono passi, porte, vestiti quando l'attore parla → foley completo su tutte le scene con dialogo e prova di ascolto dell'M&E da solo.
- **Stem che non sommano** → la somma degli stem non suona come il mix, più dinamica o più forte → stessi processori sul master e sugli stem, prova di somma in controfase.
- **Labiale che scivola** → a inizio film tutto va, a fine film le bocche sono avanti o indietro → frequenza fissata prima del girato; pull-down corretto; controllo del 2-pop in testa e in coda.
- **Voce più acuta nella versione europea** → l'attore sembra più giovane, la musica sta un po' sopra il tono → nel passaggio 24 → 25 fps correggere l'intonazione o rimontare l'audio a velocità originale.
- **Audio AI incollato com'era** → livelli diversi fra un'inquadratura e l'altra, code tagliate, un «tonfo» che è un'esplosione → misurare ogni clip, rifare i suoni corti, rimontare gli ambienti su tutto il film.
- **Musica con licenza sbagliata** → audio muto o post rimosso su Instagram o TikTok, contestazione Content ID su YouTube → licenza per ogni piattaforma e mezzo; Sound Collection e CML solo dentro la loro app.
- **`loudnorm` a una passata sul mix finito** → mix appiattito, colpi senza forza, il brano «respira» → misura e guadagno lineare, o due passate con controllo «Linear».
- **Voce sintetica senza dichiarazione** → contestazione della piattaforma o di un utente; per legge, dal 2/8/2026, un deep fake audio non dichiarato → etichetta decisa con `compliance-rights-officer` prima della consegna (`regole.md` §6).

## Novità

- **2025-05-20** — Google presenta Veo 3, il primo modello video di Google che genera anche l'audio (ambienti, effetti, dialoghi con labiale) [P: blog Google I/O 2025]. Da allora l'audio nativo è nei principali modelli video (Seedance, Kling: skill `higgsfield-audio`).
- **2025-07** — TikTok aggiorna i Music Terms (versione EEA «Effective Date: July 2025»): tre vie per la musica (Sounds solo personali, Commercial Sounds per i brand, Original Sounds propri) [P]; il giorno 25/7 viene solo da una sintesi [S].
- **2025-10-06** — California, SB 576 firmato (Chapter 336): dal **1/7/2026** i servizi di streaming con pubblicità non possono trasmettere spot più forti dei contenuti, secondo le regole CALM [P]. Prime Video chiede ai partner, dal giugno 2026, una certificazione scritta di conformità ad ATSC A/85 per contenuti e spot, con controlli trimestrali [P: Video Central]. Primo obbligo di legge sul loudness degli spot in streaming trovato: per gli spot di clienti italiani pianificati negli USA è un controllo in più.
- **2025-10-07** — Rai Pubblicità pubblica le specifiche per la pubblicità al cinema (v1.0): massimo 82 dB Leq(m), true peak −2 dBTP ±0,1 [P].
- **2025-10-10** — Italia: in vigore l'art. 612-quater c.p. sui deepfake, anche vocali (L. 132/2025) [P, verificato in `regole.md`].
- **2026-07-08** — ATSC pubblica A/85:2026-07: per lo streaming raccomanda un unico obiettivo fra −23 e −27 LKFS; per i programmi misura il dialogo, per gli spot il mix intero [P].
- **2026-08-02** — Si applica l'art. 50 dell'AI Act: obbligo per lo studio di dichiarare l'audio generato che sembra autentico [P, verificato in `regole.md` il 2026-11-01].
- **2026-10-20** — Publitalia aggiorna le «Specifiche TV»: solo MXF XDCAM HD 422 con 8 tracce mono, consegna solo via Cape.io o Extreme Reach, loudness «coerenti con le normative EBU di – 24db» [P].
- **2026-11** — ElevenLabs annuncia il ritiro di `music_v1` il 31/1/2027 ed `eleven_text_to_sound_v2` (effetti sonori) il 1/3/2027 [P: avviso nella documentazione]: i flussi dello studio che li chiamano per nome vanno aggiornati.
- **Ultima revisione Netflix** delle Sound Mix Specifications: OC-1-6 del 2024-10-29 (separazione DME «whenever possible», tolto il true peak per l'Atmos) [P]; nessuna revisione 2025-2026 trovata.

Fonti: Google blog I/O 2025; leginfo.legislature.ca.gov (SB 576); Video Central; ATSC A/85:2026-07; documentazione ElevenLabs; Netflix change log [P]; `regole.md` (AI Act, L. 132/2025).

## Verifica del 2026-11-09

- **[P], letto sulla fonte:** EBU R128 v5, s1, s2, s4 (PDF); ATSC A/85:2026-07 (PDF); AGCOM 219/09/CSP e Allegato A (PDF); Netflix Sound Mix Specs (Chrome); Amazon Studios Delivery & QC; Prime Video giugno 2026; SB 576; FCC; Dolby (guida cinema 1994, Atmos home 2018); documentazione ffmpeg e prove [M]; YouTube Help; Meta (Sound Collection Terms, Music Guidelines, blog Reels); TikTok (Ads Help, CML Terms); ElevenLabs Help Center; Google Veo 3; Intel timeline; comunicato Mastercard.
- **Correzioni rispetto alle skill DJ:** la tolleranza ±0,5 LU di R128 non compare più nella v5 (2023): resta −23,0 con ±1,0 LU solo per le dirette e ±0,2 LU di misura. La riga «Netflix −27 LKFS, true peak N/A» era sbagliata: il limite è −2 dBTP. Per gli spot in Italia il valore non è −23 per tutti: Publitalia scrive «−24» (EBU). La skill `video-editing` usa `loudnorm` a una passata, che comprime.
- **Per lo studio:** «muto per default» vale per il messaggio, non per l'audio. Su Reels Meta misura più del 75% di visualizzazioni con audio e TikTok vuole l'audio in tutti gli annunci Reservation.
- **Aperti (dopo la verifica indipendente):** la specifica Rai per la TV lineare resta solo su copia esterna (readkong, feb. 2021): Rai Pubblicità non la pubblica, va chiesta all'ufficio traffico. Sky Media Italia e La7 non pubblicano valori attuali. Specifica di Apple TV Originals non pubblica. Date esatte degli audio logo (Intel 1994 o 1995, McDonald's, Netflix). Meta e TikTok non pubblicano un valore di loudness.
- **Verifica indipendente (2026-11-09, secondo verificatore).** Riaperti sulla fonte 24 riferimenti: TUSMA art. 44 (Normattiva), AGCOM 34/09/CSP e 219/09/CSP con Allegato A e pagine «atti collegati», EBU R 128 v5, s1, s2, s4 (PDF), ATSC A/85:2026-07 e Annex M, FCC, SB 576, Netflix (Chrome), Amazon Studios, Prime Video giugno 2026, Apple Asset Guide 5.3.19, YouTube Help, blog Meta del 7/11/2024, Sound Collection Terms, Music Guidelines, TikTok Reservation, CML User Terms e Music Terms EEA, PDF Rai Pubblicità e Publitalia, Cairo/La7, SAWA. **Promossi a [P]:** art. 44 TUSMA (testo esatto), Apple Atmos, limiti cinema (Rai Pubblicità 82 dB Leq(m) e −2 dBTP; SAWA 82/80/78), Music Terms TikTok. **Corretti:** Publitalia (specifica in vigore del 20/10/2026: MXF 8 tracce mono, «EBU di – 24db», Cape.io/Extreme Reach; il PDF −24 ±0,5 LKFS del 2021 è superato); Rai TV declassata a [S] perché letta solo su copia esterna, e aggiunte le specifiche ufficiali Rai digitali (true peak −1, non −2); ATSC: gli spot si misurano sul mix intero, non sul dialogo; Netflix: «branded» significa titoli Netflix, e LRA, regola del 15% e limiter a −2,3 sono buone pratiche non obbligatorie; AGCOM: gate relativo 8 LU. **Comandi ffmpeg rieseguiti [M]** su segnali `lavfi` (MP4 AAC e MXF a 8 tracce mono, cartella cancellata): `tail -12` tagliava la riga `I:` (sostituito con `grep -A 13 "Summary:"`); short-term massimo, `dualmono` (+3,0 LU), guadagno con `volume` e due passate di `misura-analisi-ai.md` funzionano come scritti (modo Linear; la passata singola esce Dynamic a 192 kHz). **Spostato:** le librerie Meta/TikTok e SIAE/diritti connessi restano complete in `industria-musicale.md`; qui un riassunto e il rimando.
