# Playbook — compliance-rights-officer

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-10-28] Naming check: cercare anche la pronuncia, non solo la stringa

**Pattern:** per nomi numerici o stilizzati, cercare nei registri anche la forma parlata e quella scritta in lettere (es. "7x7" -> "seven by seven", "7by7", "7/7"). La stringa esatta può risultare libera mentre la pronuncia collide nella stessa classe.
**Evidenza:** su TMview la ricerca esatta di un nome stilizzato ha dato 0 risultati. La variante compatta in lettere ha trovato un marchio registrato in classe 35 da un'agenzia di marketing, e la forma parlata altri marchi in classe 35 in due paesi UE. Valgono come anteriorità contro un marchio UE (art. 8 del Reg. UE 2017/1001 — **da verificare**: articolo non riletto su EUR-Lex nella revisione del 2026-11-01).
**Quando non vale:** quando il brand non comunica mai la pronuncia. Il rischio scende ma non sparisce.
**Cliente/progetto:** generale.

## [2026-10-28] Strumenti: cosa si raggiunge dai registri e cosa no

**Pattern:** TMview funziona via `playwright-cli` con URL `#/tmview/results?criteria=I|C|F&basicSearch=...` (I = esatto, F = fuzzy). Il dettaglio da TMview spesso fallisce: aprire EUIPO eSearch `#details/trademarks/<num>` nel browser. OEPM, la pagina tariffe EUIPO e uibm.mimit.gov.it danno 403 o problemi DNS. Le tariffe UIBM sono su `uibm.mise.gov.it/index.php/it/tasse-e-tariffe/costi-marchi`. Le tariffe EUTM si verificano sull'allegato I del Reg. 2017/1001 su EUR-Lex (via browser: curl restituisce un file vuoto).
**Evidenza:** sessione del 2026-10-28.
**Quando non vale:** quando le URL cambiano. Riverificare dopo 90 giorni.
**Cliente/progetto:** generale.

## [2026-10-28] Font OFL: verifica in 3 passi

**Pattern:** 1) confrontare `OFL.txt` upstream con quello di google/fonts; 2) cercare "with Reserved Font Name" nella riga di copyright; 3) leggere la tabella `name` del TTF (ID 7 = marchio, ID 13 = licenza). Basta python con struct, se fontTools non è installato.
**Evidenza:** due famiglie Google Fonts verificate: OFL 1.1, nessuna RFN, nomi registrati come marchi dei progettisti.
**Quando non vale:** per font commerciali (EULA) serve leggere la licenza del rivenditore.
**Cliente/progetto:** generale.

## [2026-10-31] Entità legale: riverificare il registro delle imprese a ogni parere, non fidarsi del "è attiva"

**Pattern:** prima di approvare footer o informativa che nominano una società, aprire la sua pagina nel registro delle imprese del paese e lo storico dei depositi. Esempio per una Ltd del Regno Unito: Companies House e filing history (curl + sed bastano); cercare "proposal to strike off", "GAZ1", "Accounts overdue". Dopo la prima Gazette lo scioglimento può arrivare dopo 2 mesi (CA 2006 s1000(3), [legislation.gov.uk](https://www.legislation.gov.uk/ukpga/2006/46/section/1000), verificato il 2026-11-01).
**Evidenza:** in un caso reale il brief dava per attiva una società che il registro delle imprese mostrava in cancellazione d'ufficio, con bilanci non depositati.
**Quando non vale:** i segnali da cercare cambiano da registro a registro: quelli sopra valgono solo per Companies House.
**Cliente/progetto:** generale.

## [2026-10-31] Tracker sul sito live: crawl con playwright run-code

**Pattern:** `run-code` con `page.on('request')` per raccogliere gli host, poi `context().cookies()` e localStorage/sessionStorage per pagina. Usare `waitUntil: 'load'`: con video in pagina `networkidle` va in timeout. EUR-Lex: `innerText` con gli spazi normalizzati, poi `indexOf` sulla frase esatta.
**Evidenza:** 16 pagine di un sito in circa 2 minuti; EUR-Lex via WebFetch restituiva una pagina vuota.
**Quando non vale:** siti con banner che bloccano prima del consenso (serve un giro con consenso e uno senza).
**Cliente/progetto:** generale.

## [2026-10-31] Claim su un periodo non ancora chiuso

**Pattern:** se il dato è stato letto prima della fine del mese o dell'anno citato, il claim deve dire i giorni ("1–30 ottobre"), altrimenti confronta un periodo parziale con uno intero.
**Evidenza:** un dato "mese +50%" era stato letto l'ultimo giorno del mese, prima della chiusura.
**Quando non vale:** quando la fonte confronta già gli stessi giorni e lo dichiara.
**Cliente/progetto:** generale.

## [2026-11-04] AI Act art. 50: cosa vale oggi per lo studio
**Pattern:** l'art. 50 si applica dal 2/8/2026 (art. 113). Il rinvio al 2/12/2026 (Reg. UE 2026/1744, nuovo art. 111(4), GUUE 24/7/2026) vale solo per i fornitori di sistemi già sul mercato prima del 2/8/2026, e solo per la marcatura leggibile da macchina dell'art. 50(2). Lo studio usa lo strumento: per lui nessun rinvio. Deep fake (50(4), primo comma) e testi AI pubblicati per informare su temi di interesse pubblico (50(4), secondo comma) si dichiarano già, al più tardi alla prima esposizione e in modo accessibile (50(5)). Le Linee guida C(2026) 5054 del 20/7/2026 non sono vincolanti (art. 96(1)(d)).
**Evidenza:** [P] art. 50 letto su Cellar (celex 32024R1689) il 2026-11-04; Reg. 2026/1744 e Linee guida verificati; FAQ Commissione aggiornata il 24/7/2026: i contenuti generati prima del 2/8/2026 non vanno etichettati retroattivamente.
**Quando non vale:** testi con revisione umana e un responsabile editoriale; usi autorizzati per legge contro i reati; fornitore entrato sul mercato dopo il 2/8/2026 (per lui niente rinvio).
**Cliente/progetto:** generale.

## [2026-11-04] Deployer: conta chi ha autorità e controllo, non chi commissiona
**Pattern:** è deployer la persona giuridica sotto la cui autorità e il cui controllo gira lo strumento: lo studio con il proprio account e le proprie scelte creative lo è. Lo è anche il cliente se lo studio lavora per suo conto e sotto il suo controllo («remains a deployer even if third parties (e.g. contractors, freelancers) are involved»). Nel dubbio si comportano entrambi da deployer, e il SOW dice chi mette l'etichetta e chi la mantiene. Persone e luoghi inventati ma fotorealistici possono essere deep fake («can plausibly exist»). Il regime attenuato per pubblicità «creativa» vale solo caso per caso.
**Evidenza:** [P] FAQ Commissione (24/7/2026), letta il 2026-11-04; Linee guida C(2026) 5054, par. 14, 113, 116 e 122, lette sul PDF il 2026-11-01. Sostituisce la voce del 2026-11-01 che diceva «lo studio, non il cliente, è il deployer»: troppo assoluta.
**Quando non vale:** contenuti palesemente irrealistici; un prodotto reale su sfondo AI che non inganna sul prodotto. L'attribuzione del ruolo in un contratto vero va fatta validare da un legale.
**Cliente/progetto:** generale.

## [2026-11-04] Marcatura: C2PA non è un obbligo nominato
**Pattern:** né le Linee guida né il Codice di condotta (versione finale 10/6/2026, volontario) nominano C2PA. Il Codice chiede metadati firmati e filigrana non percepibile (impronta facoltativa) e propone un'icona UE «AI», nei video all'inizio e ripetuta a intervalli. C2PA (spec corrente 2.5) è un mezzo possibile, non un requisito. Google mette SynthID su tutte le immagini Gemini/Nano Banana e sui video Veo. Non scrivere «C2PA obbligatorio» né «i titoli di coda non bastano» come citazione.
**Evidenza:** [P] (spec.c2pa.org, aistudio.google.com), 2026-11-04.
**Quando non vale:** se un atto di esecuzione o una norma armonizzata fissa uno standard. SynthID sulle uscite via Higgsfield: non verificato.
**Cliente/progetto:** generale.

## [2026-11-04] Forma dell'etichetta AI: lo standard dello studio
**Pattern:** la norma chiede un'informazione «clear and distinguishable», al più tardi alla prima esposizione e accessibile (50(5)); la FAQ la vuole percepibile senza strumenti. Lo studio la traduce così (scelta nostra, non testo di legge): **immagini** su sito, ad e social: testo sovrapposto o accanto all'immagine, visibile senza clic, «Immagine generata con AI» o «Immagine modificata con AI» (EN «AI-generated image»), contrasto almeno 4,5:1, e la stessa dicitura in fondo all'alt; **video e film**: cartello o icona «Generato con AI» dal primo fotogramma, ripetuto a intervalli nei video lunghi come propone il Codice, più la riga nei crediti e nella didascalia; **audio**: annuncio parlato all'inizio; **ad**: dentro la creatività, perché il testo dell'annuncio può essere troncato, più lo strumento della piattaforma se esiste; **opere evidentemente artistiche**: cartello iniziale e crediti, senza coprire l'opera. Una riga nel footer non arriva alla prima esposizione, e il testo deve essere esatto («come riferimenti di stile» detto di immagini pubblicate è inesatto).
**Evidenza:** [P] art. 50(4) e 50(5) su Cellar e FAQ Commissione (24/7/2026), letti il 2026-11-04; icona ripetuta: Codice di condotta.
**Quando non vale:** contenuti fuori dal perimetro dei deep fake (grafica palesemente non realistica); se la piattaforma o il cliente impongono una dicitura più forte, vale quella.
**Cliente/progetto:** generale.

## [2026-11-04] Ricodifica: il manifesto C2PA e il tag AIGC si perdono
**Pattern:** la ricodifica ffmpeg dei master toglie il manifesto C2PA (Seedance, Veo) e il tag AIGC (Kling). La marcatura per macchine è un obbligo del fornitore (50(2)), non dell'utilizzatore, ma toglierla va contro lo scopo della norma. Regola dello studio: 1) archiviare il master originale con il manifesto accanto al job-id; 2) dopo la ricodifica, controllare con `c2patool <file>` cosa resta; 3) se il cliente vuole il file consegnato marcato, rifirmarlo con `c2patool --parent <master>` (il master diventa l'ingrediente), che richiede un certificato di firma dello studio; 4) mai scrivere «marcato» su un file che non lo è. L'etichetta visibile resta dovuta in ogni caso.
**Evidenza:** misura di `ai-film-director` del 2026-11-04 (non ripetuta da me); `c2patool` 0.28.4 installato, opzione `--parent` letta nell'help il 2026-11-04; explainer C2PA 2.3 §7.2.3: i metadati si possono rimuovere.
**Quando non vale:** flussi che conservano i metadati (da provare caso per caso); SynthID è nei pixel e resiste alla compressione secondo Google.
**Cliente/progetto:** generale.

## [2026-11-04] Diritto d'autore sull'output AI: tutela dubbia senza apporto umano
**Pattern:** in Italia l'art. 1 L. 633/1941, modificato dalla L. 132/2025 art. 25 (in vigore dal 10/10/2025), protegge le opere dell'ingegno «umano», anche create con l'AI «purché costituenti risultato del lavoro intellettuale dell'autore». Il nuovo art. 70-septies ammette il TDM su materiali con accesso legittimo, nei limiti degli artt. 70-ter e 70-quater. Negli USA l'Ufficio del copyright (Parte 2, gennaio 2025) dice che i soli prompt non danno controllo sufficiente: è un parere, non una sentenza, e non vale in Italia. Quindi: mai esclusiva garantita, contributo umano documentato, niente logo generato solo da prompt.
**Evidenza:** [P] (normattiva.it, copyright.gov), 2026-11-04.
**Quando non vale:** giurisprudenza italiana non verificata, art. 26 L. 132/2025 non letto.
**Cliente/progetto:** generale.

## [2026-11-04] Email promozionali B2B: consenso anche verso il professionista
**Pattern:** per l'invio promozionale a una persona fisica, anche in contesto professionale, serve il consenso (art. 130 Codice privacy): contratto e legittimo interesse non bastano. Il soft opt-in (c. 4) vale solo per l'email data in una vendita, per servizi analoghi, con opposizione ricordata a ogni invio.
**Evidenza:** [P] Garante, provv. n. 285 del 17/4/2026, doc-web 10252188; art. 130 c. 4 letto su Normattiva il 2026-11-04.
**Quando non vale:** è un caso singolo (società Aesir, destinatario un avvocato), non una linea guida. L'ammonimento e i 1.000 euro riguardano violazioni degli artt. 12 e 15 GDPR, non l'invio: non citarlo come «multa per l'email».
**Cliente/progetto:** generale.

## [2026-11-04] Outreach a giornalisti, creator e su LinkedIn: zona grigia, non via libera
**Pattern:** l'art. 130 c. 1-2 chiede il consenso per comunicazioni elettroniche «per l'invio di materiale pubblicitario o di vendita diretta [...] o di comunicazione commerciale» via email, SMS «o di altro tipo». Quindi: un DM LinkedIn promozionale va trattato come un'email; un pitch che promuove un cliente a un giornalista può essere comunicazione commerciale; una proposta di lavoro pagato a un creator è meno chiaramente promozionale verso di lui. In nessuno dei tre casi un indirizzo pubblico vale come consenso. Finché un legale non decide: messaggi uno a uno e pertinenti all'attività del destinatario, informativa breve e opposizione in un clic nel primo messaggio, nessun invio massivo, nessun secondo messaggio a chi non risponde, liste con provenienza e base scritte (legittimo interesse con bilanciamento per il GDPR).
**Evidenza:** [P] art. 130 c. 1-2 letto su Normattiva il 2026-11-04; Garante n. 285/2026 sul professionista persona fisica. Nessuna fonte primaria trovata sul pitch ai giornalisti né sul DM social: la qualificazione è una mia lettura.
**Quando non vale:** contatti che hanno chiesto di essere aggiornati (consenso documentato); rapporti già in corso.
**Cliente/progetto:** generale.

## [2026-11-04] Influencer in Italia: AGCOM 197/25/CONS, cosa dice davvero
**Pattern:** le regole specifiche valgono per gli influencer «rilevanti»: almeno 500.000 follower o un milione di visualizzazioni medie mensili su una piattaforma; elenco aggiornato entro il 15/4 e il 15/10. FAQ del 16/3/2026: diciture generiche di committenza non bastano. Verso brand e agenzie c'è un'aspettativa di vigilanza (All. A, punto 3.4), non una responsabilità sanzionatoria condivisa. La Digital Chart IAP è richiamata e incorporata dal Codice AGCOM, non è una regola «più leggera».
**Evidenza:** [P] delibera del 23/7/2025, pubblicata il 5/8/2025, e FAQ su agcom.it, 2026-11-04.
**Quando non vale:** creator sotto soglia (restano Codice del consumo e autodisciplina); le FAQ non sono vincolanti; la frase esatta del punto 3.4 non è stata copiata.
**Cliente/progetto:** generale.

## [2026-11-04] Green claim: dal 27/9/2026 sono divieti, non cautele
**Pattern:** Dir. (UE) 2024/825, recepita con il D.Lgs. 20/2/2026 n. 30 (GU n. 56 del 9/3/2026, in vigore dal 24/3/2026), si applica dal 27/9/2026. Claim ambientale generico senza «eccellenza riconosciuta», claim sull'intero prodotto per un solo aspetto, neutralità da compensazione: vietati. Il dettaglio operativo è in `ad-claims-disclosure`.
**Evidenza:** [P] Cellar 32024L0825 e normattiva.it, 2026-11-04.
**Quando non vale:** claim specifico, misurato e con perimetro dichiarato.
**Cliente/progetto:** generale.

## [2026-11-04] EAA in Italia: chi è obbligato e da quando
**Pattern:** D.Lgs. 82/2022, obblighi efficaci dal 28/6/2025. Esenti le microimprese che forniscono servizi (art. 3 c. 3): meno di 10 persone **e** fatturato o bilancio annuo fino a 2 milioni (art. 2, lett. bb). Sanzioni da 5.000 a 40.000 euro (art. 24 c. 1). Il 28/6/2030 vale solo per servizi che usano prodotti già in uso e per contratti preesistenti (massimo cinque anni), non è un rinvio generale (art. 25). Linee guida AgID: determinazione n. 38/2026 del 4/3/2026 (GU n. 69 del 24/3/2026), che richiamano EN 301 549 v3.2.1 e WCAG 2.1 AA. La v4.1.1 (2026-09, su WCAG 2.2) non è ancora il riferimento legale: WCAG 2.2 AA è la scelta prudente, non un obbligo verificato.
**Evidenza:** [P] normattiva.it (artt. 2, 3, 24, 25), gazzettaufficiale.it, ETSI e AccessibleEU 7/9/2026, art. 2 riletto il 2026-11-04.
**Quando non vale:** dal giorno in cui la v4.1.1 è citata in GUUE (controllare prima di ogni offerta); settore pubblico (altro regime).
**Cliente/progetto:** generale.

## [2026-11-04] Norme annunciate non sono norme
**Pattern:** al 4/11/2026 il Digital Fairness Act non è stato proposto (Parlamento europeo: «Announced», Q4 2026). L'Omnibus digitale sul GDPR e l'ePrivacy (COM(2025) 837, procedura 2025/0360(COD)) è «Awaiting committee decision», senza atto finale: GDPR, art. 122 Codice privacy e linee guida cookie del Garante del 2021 si applicano come sono. Non applicare nessuna norma di una proposta come vigente.
**Evidenza:** [P] Legislative Train (agg. 20/9/2026); Legislative Observatory, letto il 2026-11-04. Il mandato del Consiglio del 21/10/2026 risulta solo da fonti [S].
**Quando non vale:** dalla pubblicazione in GUUE di un atto finale.
**Cliente/progetto:** generale.

## [2026-11-04] Fonti difficili: come leggerle
**Pattern:** EUR-Lex blocca curl e WebFetch: usare Cellar `http://publications.europa.eu/resource/celex/<CELEX>` con header `Accept: application/xhtml+xml`, poi togliere i tag e cercare la frase esatta. Normattiva: un articolo alla volta, `N2Ls?urn:nir:stato:<tipo>:<data>;<num>~art<N>` (curl con user-agent da browser basta), `!vig=AAAA-MM-GG` per la versione in una data. PDF: pypdf o PDFKit. TMview via `playwright-cli` (`#/tmview/results?criteria=I|C|F&basicSearch=...`); dettaglio su EUIPO eSearch. EUIPO dà 403 a WebFetch: curl con user-agent. Tariffe UIBM su `uibm.mise.gov.it`. Le pagine Meta non si leggono da WebFetch ma si leggono con `playwright-cli` (provato da un altro agente il 2026-11-04); l'help di TikTok Ads non è stato riprovato.
**Evidenza:** sessioni 2026-10-28, 2026-11-01 e 2026-11-04 (art. 50 AI Act, art. 2 D.Lgs. 82/2022, art. 130 Codice privacy letti così).
**Quando non vale:** quando gli URL cambiano. Riverificare dopo 90 giorni.
**Cliente/progetto:** generale.

## [2026-11-04] Voce sintetica: le voci di sistema macOS non sono licenziate per il lavoro
**Pattern:** la licenza macOS Tahoe 26, sez. 2F, permette le voci di sistema (`say`) solo «for your personal, non-commercial use» e vieta «recording, publishing or redistribution [...] in a profit, non-profit, public sharing or commercial context». Quindi `say` non entra in nessun deliverable, anteprima al cliente o post dello studio: al più come guida dei tempi in bozza interna, sostituita prima di mostrarla. Ogni voce sintetica si registra al cancello come un asset: strumento, voce, licenza del piano letta quel giorno, prova. Una voce realistica è una «person» del deep fake (Linee guida par. 113: «image, voice»): annuncio parlato o cartello alla prima esposizione, salvo personaggio palesemente di finzione. Clonare la voce di una persona reale solo con liberatoria scritta: l'art. 612-quater c.p. (L. 132/2025 art. 26) punisce chi diffonde senza consenso «voci falsificati o alterati» con AI causando un danno ingiusto.
**Evidenza:** [P] SLA EA1955 (11/7/2025), dal PDF apple.com/legal/sla/docs/macOSTahoe.pdf e dall'RTF installato su macOS 26.6.2, stesso testo, letti il 2026-11-04; Linee guida C(2026) 5054 par. 113 sul PDF; art. 26 L. 132/2025 su Normattiva, 2026-11-04.
**Quando non vale:** voci con licenza commerciale scritta del fornitore. Il confine «bozza interna» è una lettura prudente, da verificare con un avvocato. Licenze di Seed Audio, `dubbing`, `voice_change`: non lette.
**Cliente/progetto:** generale

## [2026-11-04] Higgsfield: output liberi, ma gli input addestrano i modelli
**Pattern:** Termini del 23/10/2026, sez. 4.4: nessuna rivendicazione su input e output, nessun limite all'uso commerciale, diritti sublicenziabili ai clienti; ma input, contenuti e output «may be used by Company to train» i modelli, salvo Enterprise Agreement. Sez. 5.3: chi carica un volto o una voce garantisce i consensi. Quindi: nessun materiale riservato del cliente (prodotti non lanciati, volti, documenti) caricato senza autorizzazione scritta nel SOW; volti e voci di persone reali solo con liberatoria che copra anche questo uso.
**Evidenza:** [P] https://higgsfield.ai/terms-of-use-agreement, letto il 2026-11-04.
**Quando non vale:** con un Enterprise Agreement (verificare se è attivo). I termini cambiano senza preavviso (sez. 19.6): rileggerli a ogni progetto.
**Cliente/progetto:** generale.

## [2026-11-04] Volto AI che «ricorda» una persona nota: l'etichetta non basta
**Pattern:** la somiglianza si giudica a occhio, senza strumenti di riconoscimento e senza scrivere il nome. L'etichetta AI non la risolve: un deep fake è anche ciò che «assomiglia a persone esistenti» (art. 3, punto 60). Il primo controllo riguarda l'origine del personaggio: il primo prompt e i suoi input. Se manca, resta aperto. Se c'è una foto della persona reale, il rischio è alto e il volto si rifà. La misura minima è un nuovo riferimento del volto con almeno tre tratti della struttura cambiati. Lo styling resta, l'etnia non si tocca. Poi si rigenerano i fotogrammi chiave e i video da quelli, mai il ritocco fotogramma per fotogramma. Infine un test cieco con 5 persone esterne. Nel Regno Unito non c'è un diritto all'immagine, ma c'è il passing off per falsa approvazione.
**Evidenza:** [P] art. 96 L. 633/1941 (Normattiva), *Fenty v Arcadia* [2015] EWCA Civ 3, CAP Code 6.1, tutti letti il 2026-11-04. Uno spot: origine del riferimento del volto non registrata.
**Quando non vale:** personaggio nato da solo testo e test cieco negativo. Giurisprudenza italiana sui sosia non letta.
**Cliente/progetto:** generale

## [2026-11-04] Splice: uso commerciale sì, ma niente AI e niente preview
**Pattern:** i Termini (agg. 24/7/2026), sez. 3.1.1.2, permettono i Creative Works (sync, social) «for non-commercial and commercial purposes». La prova per ogni suono è la Certified License. La sez. 3.1.1.3 vieta i suoni in «preview» o non scaricati (f, g) e l'uso «as source or training material» per modelli di AI generativa (h). Quindi nessun suono Splice va caricato come riferimento in Kling o Higgsfield. La licenza è «non-transferable»: l'account deve essere di chi pubblica.
**Evidenza:** [P] splice.com/terms, letto il 2026-11-04.
**Quando non vale:** suoni presi fuori da Splice Sounds (altri termini).
**Cliente/progetto:** generale.

## Da verificare

(ipotesi non ancora dimostrate)
