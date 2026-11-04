# Playbook — copy-content-lead

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-10-29] Firma email e footer di clienti italiani: riga legale obbligatoria

**Pattern:** in ogni firma email e footer di sito per un'entità italiana prevedere la riga legale. P.IVA «nella home-page dell'eventuale sito web» per tutti i titolari: art. 35, comma 1, DPR 633/1972, in vigore fino al 31/12/2026; dal 1/1/2027 lo abroga il D.Lgs. 19 gennaio 2026, n. 10, e la stessa regola passa all'art. 68, comma 1, del Testo unico IVA. Per le società servono anche sede, ufficio del registro imprese e numero di iscrizione, capitale effettivamente versato (per S.p.A., S.a.p.A. e S.r.l.), socio unico, l'eventuale stato di liquidazione, negli atti e nella corrispondenza, email comprese (art. 2250 c.c.). Le società di capitali con un sito devono dare le stesse informazioni anche lì (art. 2250, ultimo comma). Le imprese individuali indicano il registro a cui sono iscritte (art. 2199 c.c.).
**Evidenza:** testi letti su Normattiva il 2026-11-01. Sanzione per chi omette le informazioni dell'art. 2250: da 103 a 1.032 euro (art. 2630 c.c., Normattiva, 2026-11-01). La ris. AdE 60/E/2006 non è stata riletta.
**Quando non vale:** entità non italiane. La forma giuridica va sempre chiesta, perché cambia la riga.
**Cliente/progetto:** generale.

## [2026-10-29] Documenti verbali che escono verso esterni: pulizia prima della consegna

**Pattern:** prima di dare un verbale a freelance e fornitori, fai un grep su nomi di agenti, "rev.", rimandi "§" a file non consegnati, percorsi temporanei e codici di discovery (D1, D5...). Ogni rimando va sul documento consegnato (brand book) o su un paragrafo che esiste nello stesso file. Se togli righe da una tabella numerata, ricontrolla i numeri citati nelle note.
**Evidenza:** in un QA i rimandi a "direzione §N" puntavano a un file interno. Un "§4" puntava al paragrafo sbagliato (era il §5). Le note citavano una headline già scartata.
**Quando non vale:** documenti che restano interni allo studio.
**Cliente/progetto:** generale.

## [2026-11-01] Alt e descrizioni di artwork del cliente: il nome delle cose dal documento del cliente, non dal brief

**Pattern:** prima di descrivere un marchio o un oggetto del cliente, cerca come lo chiama il suo materiale (brand book, schede). Se il brief interno usa un altro nome, vince il documento del cliente, e si correggono anche i testi già pubblicati che usano il nome sbagliato.
**Evidenza:** in un caso cliente brief e alt esistenti chiamavano l'animale dell'icona con un nome, il brand book del cliente con un altro.
**Quando non vale:** quando il cliente stesso usa due nomi. Allora si chiede quale va in pubblico.
**Cliente/progetto:** generale.

## [2026-11-04] Funzioni AI di Google Search: vale la SEO normale, llms.txt non serve

**Pattern:** per comparire nelle funzioni AI di Google (AI Overviews, AI Mode) non si fanno file per le macchine (llms.txt), markup schema.org speciale o contenuti spezzettati. Si lavora su intento, contenuto utile e SEO tecnica di base. Al cliente non si vende llms.txt come leva per Google.
**Evidenza:** [P] Google Search Central, guida «ai-optimization-guide» pubblicata il 2026-05-15 (pagina aggiornata il 2026-07-10): «You don't need to create new machine readable files, AI text files, markup, or Markdown to appear in Google Search», «Structured data isn't required for generative AI search», «There's no requirement to break your content into tiny pieces». Nota su llms.txt aggiunta il 2026-06-15: i file «won't negatively or positively impact your visibility or rankings». Verificato il 2026-11-04.
**Quando non vale:** altri motori e assistenti (ChatGPT, Perplexity, Claude). Google stesso dice che tenere llms.txt per altri servizi va bene. Per loro non abbiamo una fonte primaria che dica cosa funziona. Si riverifica dopo il 2027-02-02.
**Cliente/progetto:** generale.

## [2026-11-04] Rich result FAQ: non compaiono più in Google Search

**Pattern:** non si promette al cliente lo snippet FAQ in SERP e non si scrivono sezioni di domande per ottenerlo. Una sezione di domande resta solo se il lettore ha davvero quelle domande in quel punto della pagina.
**Evidenza:** [P] registro Search Central (developers.google.com/search/updates), 2026-05-08: «This feature will no longer appear in Google Search starting May 7, 2026». Documentazione rimossa a giugno 2026 (giorno esatto non fissato). Verificato il 2026-11-04.
**Quando non vale:** altri motori, o il markup FAQPage usato per scopi diversi dal rich result Google: non verificato cosa ne fanno.
**Cliente/progetto:** generale.

## [2026-11-04] Title e meta description: nessun limite di caratteri, conta il troncamento

**Pattern:** title e meta si scrivono per il senso, con le parole che contano all'inizio. Si controlla come vengono troncati su mobile e desktop, non si taglia a un numero fisso. Una skill SEO di terzi, se installata, può dare ancora un numero fisso di caratteri: su questo vale questa voce.
**Evidenza:** [P] Search Central, «title-link» (agg. 2025-12-10): «there's no limit on how long a <title> element can be, the title link is truncated [...] typically to fit the device width». «snippet» (agg. 2026-04-20): stessa frase per la meta description. Letti il 2026-11-04.
**Quando non vale:** quando il CMS o il plugin del cliente impone un limite proprio, e per i testi degli annunci, che hanno limiti propri da leggere ogni volta sulla documentazione della piattaforma. Google può anche riscrivere title e snippet.
**Cliente/progetto:** generale.

## [2026-11-04] Testi scritti con l'AI su temi di interesse pubblico: revisione umana e responsabile editoriale

**Pattern:** chi pubblica con l'AI un testo che serve a informare il pubblico su temi di interesse pubblico deve dire che è generato. L'obbligo cade se il testo ha avuto revisione umana o controllo editoriale **e** una persona o una società ne ha la responsabilità editoriale. Quindi ogni testo così ha nel file interno della consegna chi l'ha rivisto e chi ne risponde (studio o cliente).
**Evidenza:** [P] AI Act, Reg. (UE) 2024/1689, art. 50(4), secondo comma: «This obligation shall not apply [...] where the AI-generated content has undergone a process of human review or editorial control and where a natural or legal person holds editorial responsibility for the publication of the content». Si applica dal 2026-08-02 (art. 113). Il rinvio al 2026-12-02 (Reg. UE 2026/1744) vale solo per i fornitori e per la marcatura dell'art. 50(2), non per chi usa lo strumento. Testo letto su Cellar il 2026-11-04.
**Quando non vale:** il copy commerciale di prodotto di solito non ha lo scopo di «informare il pubblico su temi di interesse pubblico», ma il confine è un'interpretazione: nei casi dubbi la decide `compliance-rights-officer`. Immagini, audio e video deepfake hanno un obbligo separato (art. 50(4), primo comma), che la revisione editoriale non toglie. Non è un parere legale.
**Cliente/progetto:** generale.

## [2026-11-04] Claim ambientali: niente generici dal 27 settembre 2026

**Pattern:** «green», «eco-friendly», «sostenibile» senza prova non si scrivono. Un claim che riguarda un solo aspetto del prodotto non si estende a tutto il prodotto o a tutta l'azienda. Ogni claim ambientale passa da `ad-claims-disclosure` prima della consegna.
**Evidenza:** [P] Dir. (UE) 2024/825, Allegato I: vieta la dichiarazione ambientale generica «for which the trader is not able to demonstrate recognised excellent environmental performance» e quella sull'intero prodotto «when it concerns only a certain aspect». In Italia D.Lgs. 30/2026 (GU n. 56 del 2026-03-09), applicato dal 2026-09-27. Verificato il 2026-11-04.
**Quando non vale:** claim specifici e dimostrati, con la prova citata. Fuori dall'UE valgono altre regole.
**Cliente/progetto:** generale.

## [2026-11-04] Le risposte AI citano soprattutto media guadagnati

**Pattern:** una copertura sulla stampa può servire anche come fonte per le risposte AI. Si usa come argomento interno per la PR, mai come promessa o come numero al cliente.
**Evidenza:** [S] Muck Rack, «What Is AI Reading?», maggio 2026 (muckrack.com/blog/what-is-ai-reading-may-2026): circa l'84% delle citazioni AI da earned media. Ricerca di un fornitore di software PR, campione in gran parte USA, metodo non controllato. Non verificato sulla fonte.
**Quando non vale:** mercato italiano e settori di nicchia: non c'è un dato. Va confermato su dati con metodo pubblicato prima di diventare regola.
**Cliente/progetto:** generale.

## Da verificare

## [2026-10-29] Case study con il risultato ignoto: due versioni del "What moved"

**Pattern:** quando il risultato non è ancora noto, si scrivono due versioni. A: metrica, da x a y, periodo e fonte. B: qualitativa, ma solo su un cambiamento che si vede guardando il lavoro (come il brand si presenta), mai su un effetto sul pubblico o sulle vendite. Le frasi B sul comportamento del pubblico si pubblicano solo se c'è la prova.
**Evidenza:** nessuna ancora: proposta su due casi di un sito, in attesa delle conferme dei clienti.
**Quando non vale:** quando il cliente ha un numero pubblicabile. Allora si usa solo la A.
**Cliente/progetto:** generale.

## [2026-10-29] Clienti mostrati sul sito dello studio: controllare i legami con le altre attività del titolare

**Pattern:** prima di scrivere un caso, verificare se il cliente è collegato a un'altra attività del titolare dello studio (un'azienda in cui ha un ruolo, un socio, un familiare) e chiedere se il legame va dichiarato. Un caso autoreferenziale scoperto dopo toglie credibilità a tutto il portfolio.
**Evidenza:** in un caso reale i lavori mostrati come «clienti» erano collegati al titolare, e il sito perdeva credibilità appena qualcuno lo notava.
**Quando non vale:** clienti senza legami con le altre attività.
**Cliente/progetto:** generale.

## [2026-10-29] Nome con una lettura concorrente: assorbirla nel racconto, non vietarla

**Pattern:** se il nome ha una seconda lettura inevitabile (per esempio un nome inventato che in un'altra lingua è una parola comune), la si usa nella versione lunga del racconto per rafforzare il significato, e la si tiene lontana dai formati brevi, dove crea ambiguità.
**Evidenza:** nessuna ancora: proposta senza riscontri del cliente o del pubblico.
**Quando non vale:** quando la lettura concorrente è negativa o volgare. Lì si evita e basta.
**Cliente/progetto:** generale.
