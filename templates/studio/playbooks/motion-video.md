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

## Da verificare

(ipotesi non ancora dimostrate)
