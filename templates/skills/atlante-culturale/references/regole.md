# Regole d'uso dei riferimenti

**Questa è una checklist operativa per chi scrive direction, moodboard e prompt. Non è un parere legale.** Dove la legge non è chiara, la regola indica la scelta prudente. Nei casi della sezione 7 decide `compliance-rights-officer`, e se serve un avvocato.
Fonti consultate il **2026-11-01**. Riverificarle ogni 90 giorni: termini dei fornitori AI e policy delle piattaforme cambiano spesso.

Ogni regola ha la forma: **cosa fare**, seguito da *perché* in una riga.

## 1. Nomi nei prompt

1. **I nomi restano nel moodboard interno.** Artisti, fotografi, registi, maison, brand, opere, film e brani si scrivono solo nei file `_interno/`. Non entrano nel prompt, nel nome dei file, negli alt text, nei metadati o nel deliverable. *Perché: il deliverable parla a chi non sa nulla, e un nome scritto diventa una prova di imitazione.*
2. **Nel prompt va la traduzione visiva**, presa dal campo «Higgsfield» della voce: sorgente e direzione della luce, obiettivo e distanza, palette, materiali, set, casting, movimento di camera. *Perché: il modello rende ciò che descrivi, non un nome.*
   - Sbagliato: «foto nello stile di [fotografo], campagna come [maison]».
   - Giusto: «luce laterale dura da una finestra alta, ombre nette, 85 mm a due metri, pietra calda e lana cammello, figura ferma al centro di un ambiente vuoto».
3. **Niente formule-scorciatoia**: «nello stile di», «alla maniera di», «come in [film]», «tipo campagna [brand]». Valgono anche i soprannomi e le opere famose usate al posto del nome. *Perché: sono il nome travestito.*
4. **Non caricare opere o campagne altrui come immagine di riferimento** (`--image`): né foto di campagne, né opere d'arte, né fotogrammi di film. Come input usa solo materiale nostro o del cliente, con i diritti in regola. *Perché: con i termini Higgsfield §4.2 dichiari di avere i diritti su ciò che carichi.*
5. **Se Higgsfield blocca la generazione per IP, riscrivi in modo descrittivo. Non cercare di aggirare il filtro.** *Perché: aggirare i filtri è vietato (§5.2(xiii)) e il blocco è un segnale che il prompt era troppo vicino al riferimento.*

**Perché la regola esiste:**
- Imitare lo stile riconoscibile di un artista vivente espone a contestazioni. Imitare servilmente o creare confusione con un concorrente è concorrenza sleale (art. 2598 c.c.). Agganciarsi alla notorietà di un marchio altrui per trarne profitto è vietato dal Codice di Autodisciplina (art. 13; 71ª edizione, in vigore dal 30/10/2024, [IAP](https://www.iap.it/codice-e-altre-fonti/il-codice/), letto il 2026-11-01).
- I modelli possono rifiutare il prompt o restituire una copia quasi letterale.
- Il cliente riceve un lavoro che si riconosce come imitazione (regola 9 di STUDIO.md).

**Cosa dicono i termini Higgsfield.** Testo letto: [Terms of Use](https://higgsfield.ai/terms-of-use-agreement), «Last updated: October 23, 2026», consultato il 2026-11-01.
- §4.2: chi carica contenuti che contengono nome, volto, voce o altri tratti identificabili di una persona dichiara di avere i consensi necessari. Dichiara anche che i contenuti non violano copyright, marchi, diritti di immagine o privacy.
- §5.1(ii)(b): sono vietati i contenuti che violano diritti di terzi o che ritraggono persone senza permesso. §5.2(xiii): è vietato aggirare filtri e moderazione.
- §13.2: Higgsfield **non fa alcuna verifica dei diritti**. La clearance prima di pubblicare tocca all'utente. §4.4: nessuna garanzia di originalità o esclusività dell'output, che altri utenti possono ricevere simile o identico. Lo stesso paragrafo permette di trasferire o sublicenziare l'output ai clienti, e Higgsfield può usare input e output per addestrare i modelli, salvo i contratti Enterprise. §12: l'utente tiene indenne Higgsfield da eventuali pretese di terzi.
- I termini **non parlano esplicitamente dello stile degli artisti**. Lo fa l'help center: [Why was my generation blocked for copyright or IP?](https://higgsfield.ai/creator-hub/help-center/troubleshooting/my-generation-blocked-for-copyright-or-ip) (pubblicata l'1/8/2026, modificata l'1/9/2026, consultata il 2026-11-01). Possono essere bloccati personaggi, nomi di franchise, marchi e loghi, e «named living artists or photographers whose style is specifically referenced». Alcuni modelli, per esempio Seedance, fanno un controllo IP proprio che Higgsfield non può scavalcare. Il consiglio della pagina è usare un linguaggio descrittivo al posto dei nomi propri.

## 2. Stile o opera

**Cosa si può prendere** da un riferimento: i principi. Qualità e direzione della luce, rapporto fra figura e spazio, scala, materia, palette, ritmo del montaggio, distanza della camera, il modo di mettere in posa (non una posa precisa).

**Cosa non si prende mai:**
- la composizione riconoscibile di un'opera o di uno scatto preciso, o un fotogramma iconico ricostruito;
- personaggi, costumi iconici, scenografie e set famosi;
- loghi, monogrammi, intrecci, motivi e pattern che identificano una maison, e le combinazioni di colore usate come segno distintivo;
- design di prodotto e di arredo riconoscibili: la sedia, la lampada o la borsa «che tutti conoscono»;
- architetture riconoscibili (vedi sezione 4).

*Perché: la legge protegge le opere, non le idee. La L. 633/1941 art. 2 protegge pittura, scultura, architettura (n. 5) e design industriale con carattere creativo e valore artistico (n. 10). Monogrammi e motivi sono spesso marchi registrati, e l'imitazione che crea confusione è concorrenza sleale (art. 2598 c.c.). Nessuna norma traccia il confine fra «stile» e «opera»: per questo usiamo il test qui sotto.*

**Test «somiglia a colpo d'occhio?»** Va fatto su ogni output prima che esca, affiancandolo al moodboard.
1. Una persona del settore direbbe il nome del riferimento entro tre secondi?
2. Si riconosce un'opera, una campagna o una scena precisa (inquadratura, posa, set)?
3. Coprendo eventuali loghi, si capisce comunque di quale brand o designer si tratta?
4. Sono presenti oggetti, motivi o edifici che hanno un proprietario riconoscibile?

Basta **un sì** per rifare il lavoro. Sulle immagini chiave di una campagna fai anche una ricerca per immagine inversa. *Perché: chi guarda non conosce il nostro moodboard e giudica solo ciò che vede.*

**Fondi almeno tre riferimenti di discipline diverse** (SKILL.md, punto 2). *Perché: con un riferimento solo si copia, con tre ne nasce uno nuovo.*

## 3. Persone reali, sosia e voci

1. **Niente volti noti, niente sosia, niente prompt come «somiglia a…» o «ricorda…».** Vale per il prompt, per le immagini di riferimento e per il casting descritto. *Perché: il volto di una persona non si usa senza il suo consenso (art. 10 c.c., L. 633/1941 art. 96).*
2. **L'eccezione per la notorietà non copre la pubblicità.** L'art. 97 della L. 633/1941 esclude il consenso quando l'uso è giustificato da notorietà, giustizia, scopi scientifici, didattici o culturali, o da fatti di interesse pubblico. Vendere un prodotto non rientra nell'elenco, quindi la lettura prudente è: **consenso sempre**. *Perché: anche dove il consenso non serve, il ritratto non si può usare se reca pregiudizio a onore, reputazione o decoro (art. 97, comma 2).*
3. **Niente voci clonate o imitate di persone riconoscibili** (attori, cantanti, speaker). L'art. 10 c.c. parla di «immagine» e non cita la voce: la tutela della voce non è stata verificata su fonte. **Scelta prudente: trattare la voce come il volto.** *Perché: la voce identifica una persona quanto il viso.*
4. **Persone reali solo con una release scritta che copre l'uso con AI.** Vale anche per Soul ID (`higgsfield-soul-id`): media, territorio, durata. Mai ritratti finti di {{TITOLARE}} o di chi lavora nello studio. *Perché: lo richiedono i termini Higgsfield §4.2 e §5.3(a).*
5. **I deepfake non consensuali sono un reato.** Dal 10/10/2025 il codice penale ha l'art. 612-quater (L. 132/2025, art. 26). Diffondere senza consenso immagini, video o voci falsificati con AI, idonei a ingannare e che causano un danno ingiusto, è punito con la reclusione da 1 a 5 anni. *Perché: il rischio non è solo civile.*
6. Usare il volto o la voce di un personaggio noto per vendere fa anche credere a un endorsement che non esiste. *Perché: è pubblicità ingannevole e sfruttamento della notorietà altrui (Codice di Autodisciplina, art. 13).*

## 4. Luoghi e architetture

1. **In pubblicità niente edifici riconoscibili come protagonisti.** Si descrive il principio: «portico razionalista in travertino, archi ripetuti, luce radente». Non si nomina il palazzo. *Perché: le opere di architettura sono protette (L. 633/1941 art. 2 n. 5), e non abbiamo verificato un'eccezione che ne permetta l'uso commerciale senza autorizzazione.*
2. **Monumenti, musei, chiese, siti archeologici e altri beni culturali pubblici**: in un uso commerciale servono la concessione dell'ente e il canone. *Perché: il D.Lgs. 42/2004 rende libera la riproduzione solo «senza scopo di lucro» (art. 108, comma 3-bis); altrimenti la consente l'ente che ha il bene in consegna (art. 107).* Non è chiaro se un'immagine generata con AI conti come «riproduzione». **Scelta prudente: sì.**
3. **Niente interni di negozi di marca riconoscibili** (boutique, flagship, concept store), né ricostruiti né «ispirati». *Perché: l'allestimento è un segno distintivo del brand, e imitarlo crea confusione (art. 2598 c.c.).*
4. **Usa luoghi composti, non luoghi esistenti, ma non pensare che questo ti esenti dall'etichetta.** Un luogo vero e riconoscibile, reso in modo realistico, è un deep fake. Secondo le linee guida della Commissione basta anche che persone, luoghi o scene «can plausibly exist»: un luogo inventato ma fotorealistico può quindi richiedere l'etichetta (sezione 6). *Perché: l'AI Act, art. 3 n. 60, cita i «luoghi esistenti», e le linee guida C(2026) 5054, par. 113, estendono la definizione a ciò che può plausibilmente esistere.*

## 5. Musica e suono

1. **Si può descrivere uno stile**: genere, epoca, tempo in bpm, strumenti, atmosfera, dinamica. Esempio: «downtempo a 90 bpm, Rhodes, spazzole sul rullante, basso caldo, nessuna voce». *Perché: un genere non ha proprietario.*
2. **Non si imita un brano**: niente melodie, riff, giri armonici o testi riconoscibili, niente «come [brano]», niente nome dell'artista nel prompt audio, niente soundalike su richiesta del cliente. *Perché: un brano ha due titolari, la composizione e la registrazione, e l'imitazione servile è vietata (art. 2598 c.c.; Codice di Autodisciplina, art. 13).*
3. **Non si imita la voce di un cantante.** Vale la regola 3.3. *Perché: la voce è della persona.*
4. **Musica generata con AI o campioni Splice**: prima dell'uso, licenza verificata con `rights-licensing-clearance`. Su YouTube la musica generata con AI che è al centro del video va dichiarata ([YouTube Help](https://support.google.com/youtube/answer/14328491), consultato il 2026-11-01). *Perché: non si può garantire al cliente ciò che il fornitore non garantisce a noi.*

## 6. Dichiarazione dell'uso di AI

**Regola dello studio (decisa): le immagini AI si dichiarano sempre nei crediti**, anche quando la legge non lo chiede. Per ogni consegna si registra in `rights/` quali asset sono AI, con modello, data e prompt. *Perché: sono condizioni Higgsfield (§5.5, §11.7) e il cliente deve sapere cosa riceve.*

**AI Act, Reg. (UE) 2024/1689** ([EUR-Lex](https://eur-lex.europa.eu/legal-content/IT/TXT/HTML/?uri=CELEX:32024R1689), consultato il 2026-11-01):
- **Si applica dal 2 agosto 2026** (art. 113). Lo conferma la [FAQ della Commissione](https://digital-strategy.ec.europa.eu/en/faqs/transparency-obligations-under-article-50-ai-act), aggiornata al 24/07/2026.
- **Art. 50(2): obbligo dei fornitori** (Higgsfield e i modelli). Gli output devono essere marcati in modo leggibile da una macchina. Per i sistemi già sul mercato prima del 2/8/2026 c'è un periodo transitorio fino al **2 dicembre 2026** (nuovo art. 111, par. 4). Lo introduce il Digital Omnibus, [Reg. (UE) 2026/1744](https://eur-lex.europa.eu/eli/reg/2026/1744/oj/eng) dell'8/7/2026, pubblicato in GU UE il 24/7/2026 (testo letto il 2026-11-01).
- **Art. 50(4): obbligo nostro.** Chi usa l'AI sotto la propria autorità è «deployer». La FAQ e le linee guida (par. 14) fanno l'esempio di «an advertising company», e il deployer resta tale anche se lavora con freelance. Il cliente che commissiona soltanto lo spot, senza decidere se e come usare l'AI, **non** è deployer: l'obbligo è dello studio. Il deployer deve dichiarare i **deep fake**, cioè immagini, audio o video che somigliano a persone, oggetti, luoghi, entità o eventi esistenti e che sembrerebbero falsamente autentici (art. 3 n. 60).
- La dichiarazione va data in modo **chiaro e distinguibile, al più tardi alla prima esposizione**, e deve essere accessibile (art. 50(5)). **Il watermark del fornitore non basta** (FAQ). I contenuti generati prima del 2/8/2026 non vanno etichettati a posteriori (FAQ).
- Per le opere «manifestamente artistiche, creative, satiriche o fittizie» basta una dichiarazione che non ostacoli la fruizione dell'opera (art. 50(4)).
- **Linee guida della Commissione sull'art. 50**, C(2026) 5054 final del 20/07/2026 ([PDF sull'AI Act Service Desk](https://ai-act-service-desk.ec.europa.eu/sites/default/files/2026-07/guidelines_on_the_implementation_of_the_transparency_obligations_for_certain_ai_systems_under_article_50_of_the_ai_act_bzptwqhk0ikg1dtlddap41psfy_131215.pdf), lette il 2026-11-01):
  - è deep fake anche ciò che «can plausibly exist» (par. 113), cioè persone e luoghi inventati ma realistici;
  - **sono deep fake**: un influencer famoso generato con AI in un contesto pubblicitario, e un'immagine AI di prodotto che fa sembrare il prodotto diverso o migliore di com'è;
  - **non sono deep fake**: un prodotto reale su uno sfondo generato con AI, se non inganna sul prodotto; scene palesemente impossibili; correzioni minori come colore, sfondi estetici e ridimensionamenti (par. 116 ed esempi);
  - la pubblicità **può** rientrare nel regime attenuato solo in situazioni specifiche, da valutare caso per caso. Ne resta fuori il contenuto «exclusively informative or commercial», e se un contenuto ha più caratteri prevale quello informativo (par. 122). Tra gli esempi esclusi ci sono la televendita con consumatori sintetici e l'influencer sintetico che prova un prodotto sponsorizzato. **Scelta dello studio: in pubblicità etichetta piena.**
- C'è un [Codice di buone pratiche](https://digital-strategy.ec.europa.eu/en/news/commission-publishes-code-practice-marking-and-labelling-ai-generated-content) del 10/06/2026, volontario, con icone UE per le etichette. Le icone non sono state lette.

**Legge italiana sull'AI, L. 23 settembre 2025 n. 132** (GU n. 223 del 25/09/2025, in vigore dal 10/10/2025; [Gazzetta Ufficiale](https://www.gazzettaufficiale.it/eli/id/2025/09/25/25G00143/sg), testo letto sul PDF il 2026-11-01):
- **Non contiene un obbligo di etichetta per la pubblicità.** Per l'etichetta valgono AI Act e piattaforme.
- Art. 25: il diritto d'autore protegge le opere dell'ingegno «umano», anche create con l'aiuto dell'AI, purché siano frutto del lavoro intellettuale dell'autore. Un output puramente generato potrebbe non essere protetto. **Quindi si documenta il contributo umano**: direction, selezione, ritocco, file di lavoro. E non si promette al cliente l'esclusiva su un output AI.
- Art. 26: introduce il reato di deepfake (art. 612-quater c.p., vedi 3.5).
- Decreti attuativi. Il **D.Lgs. 7 ottobre 2026, n. 179** (poteri delle autorità e formazione; [Normattiva](https://www.normattiva.it/eli/id/2026/10/08/26G00200/ORIGINAL)) è stato controllato il 2026-11-01 solo con una ricerca per parole chiave: non aggiunge obblighi di etichetta e affida alle autorità nazionali per l'AI (AgID e ACN) le sanzioni dell'art. 99 dell'AI Act. Il **D.Lgs. 9 settembre 2026, n. 160** (forze di polizia, responsabilità civile e penale) è **da verificare**: lo conosco solo da fonti secondarie.

**Piattaforme** (consultate il 2026-11-01):
- **Meta** ([Community Standards, Misinformation](https://transparency.meta.com/policies/community-standards/misinformation/)): nei contenuti organici, video fotorealistici o audio realistici creati o alterati digitalmente vanno dichiarati con lo strumento di disclosure. La stessa pagina dice che Meta può etichettare, o «reject content submitted as an advertisement», quando il contenuto è fotorealistico e c'è un rischio particolarmente alto di inganno su temi di importanza pubblica (testo letto il 2026-11-01). **Da verificare:** le regole Meta per le inserzioni con AI, cioè la policy SIEP e l'etichetta «AI info» automatica annunciata da giugno 2026. Le pagine non si sono aperte né dal browser né con WebFetch: [SIEP](https://transparency.meta.com/policies/ad-standards/SIEP-advertising/SIEP/), [AI nelle inserzioni](https://www.meta.com/help/artificial-intelligence/355108217670024/).
- **TikTok** ([Community Guidelines, Integrity and Authenticity](https://www.tiktok.com/community-guidelines/en/integrity-authenticity), pubblicate il 25/08/2026, in vigore dal 24/09/2026): va etichettato il contenuto generato con AI, o molto modificato, che mostra scene o persone realistiche. Senza etichetta il contenuto può essere rimosso, limitato o etichettato d'ufficio. Per le ads esiste in Ads Manager il toggle «This ad contains AI-generated content» ([help Ads](https://ads.tiktok.com/help/article/about-ad-disclaimers-in-tiktok-ads-manager)). Quella pagina risponde 403 anche al 2026-11-01: il toggle è **da verificare** in Ads Manager.
- **YouTube** ([Disclosing use of GenAI content](https://support.google.com/youtube/answer/14328491)): va dichiarato il contenuto realistico che fa dire o fare a una persona reale cose mai dette o fatte, che altera filmati di eventi o luoghi reali, che genera scene realistiche mai avvenute, o che ha musica AI al centro. YouTube può applicare l'etichetta da solo se trova metadati C2PA, e in quel caso il creator non può toglierla.
- **Sempre:** non rimuovere watermark e metadati di provenienza (C2PA) dagli output. *Perché: lo vietano i termini Higgsfield §5.5, e le piattaforme li leggono comunque.*

## 7. Quando fermarsi e chiamare `compliance-rights-officer`

Ti fermi e lo chiedi al lead (STUDIO.md, regola 13) quando:
- il brief chiede di **evocare un artista, una maison, un film o un brano preciso** («deve sembrare [nome]»), oppure il cliente vuole il nome nel copy;
- l'output **non supera il test della sezione 2** dopo due tentativi, oppure Higgsfield continua a bloccare per IP;
- nel lavoro compaiono **una persona reale, un sosia, una voce riconoscibile o un minore**, anche come sola ispirazione;
- serve un **edificio, un bene culturale, un interno di negozio o un oggetto di design** riconoscibile;
- il cliente vuole **registrare come marchio** qualcosa che nasce da un output AI, o chiede **esclusiva o manleva** su asset AI;
- il contenuto AI realistico va in **paid media** o tocca **temi pubblici** (salute, politica, finanza, ambiente);
- il contenuto contiene **claim** sul prodotto: in quel caso vale anche `ad-claims-disclosure`;
- arriva una **contestazione** da un artista, un brand, un'etichetta o una piattaforma. Non si risponde, non si ammette nulla e non si cancella niente prima del parere.

**Verificato su fonte primaria il 2026-11-01:** AI Act (art. 3 n. 60, 50 e 113, su EUR-Lex), Reg. 2026/1744, linee guida e FAQ sull'art. 50, Codice di buone pratiche, L. 132/2025 (art. 25 e 26), art. 612-quater c.p., L. 633/1941 (art. 1, 2, 96 e 97), artt. 10 e 2598 c.c., D.Lgs. 42/2004 (art. 107 e 108), Codice di Autodisciplina, termini e help center Higgsfield, pagine Meta Misinformation, TikTok Community Guidelines e YouTube.
**Non verificato in questo file:** le icone UE, la policy Meta per le inserzioni, la pagina TikTok Ads (ancora 403), il D.Lgs. 160/2026 e il testo completo del 179/2026, la tutela della voce nella giurisprudenza italiana, un'eventuale eccezione per l'architettura in uso commerciale. Su questi punti vale la scelta prudente indicata.
