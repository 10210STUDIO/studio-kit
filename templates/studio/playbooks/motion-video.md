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

## Da verificare

(ipotesi non ancora dimostrate)
