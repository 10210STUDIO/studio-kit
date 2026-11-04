# Playbook — insight-research

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-10-28] Verifica handle e domini: sempre con controlli positivo e negativo

**Pattern:** per ogni piattaforma testa un account sicuramente esistente e uno inventato, poi confronta titolo/og:title. Instagram risponde 200 anche a profili inesistenti (distingue il titolo: "(@nome) • Instagram" vs "Instagram"); X, Behance e YouTube danno 404 reale; LinkedIn company dà 404 se assente ma blocca con Cloudflare 403 gli slug numerici; TikTok va in login-wall, e oEmbed (`tiktok.com/oembed?url=.../@nome`) distingue (400 = assente) ma va in rate limit dopo 3-4 chiamate. Domini: RDAP Verisign (`rdap.verisign.com/com/v1/domain/`), Identity Digital per .studio (`rdap.identitydigital.services/rdap/domain/`), `whois -h whois.nic.it` per .it, `whois -h whois.registry.co` per .co. `whois` generico per .co/.studio restituisce il record IANA del TLD, non del dominio.
**Evidenza:** naming check del 2026-10-28, controlli incrociati con `google.co`, `adobe`, `@google`, `microsoft`.
**Quando non vale:** una risposta HTTP non è una prenotazione; nomi riservati o account sospesi sfuggono. Il formato dei risultati può cambiare, ricontrollare i controlli ogni volta.
**Cliente/progetto:** generale.

## [2026-11-01] Ricerca di riferimenti visivi: handle dal sito ufficiale, e WebFetch non vede le immagini

**Pattern:** per ogni riferimento prendi l'Instagram dal link nel sito ufficiale (WebFetch lo restituisce); la ricerca da sola porta a fan site o a varianti sbagliate dell'handle (underscore fra nome e cognome, suffisso «studio», dominio usato come handle, nome della casa editrice al posto della rivista). WebFetch restituisce testo: il "principio visivo" è sempre dedotto, va dichiarato e serve un agente con browser per gli screenshot. Siti con 403/429/handshake SSL si ripetono o si leggono dagli snippet di ricerca, dichiarandolo.
**Evidenza:** ricerca riferimenti del 2026-11-01, 20 riferimenti di arte, fotografia e grafica verificati uno per uno; per un fotografo esistevano solo account fan.
**Quando non vale:** se il richiedente ha già screenshot o accesso al browser; i siti cambiano handle e struttura.
**Cliente/progetto:** generale.

## [2026-11-04] Leggere una fonte primaria: scala di tenacia

**Pattern:** WebFetch non è una lettura: è una sintesi fatta da un modello piccolo e spesso torna vuoto, con solo il CSS o solo il titolo. Scala, in ordine: 1) WebFetch; 2) `curl -sL -A "<user-agent da browser>" URL -o file`, poi testo con regex/python e ricerca della frase esatta; 3) `playwright-cli` per le pagine JavaScript (Help di Google e Meta, Gmail Help, Yahoo dopo il banner cookie, WIPO), poi `innerText`; 4) per il software `gh api repos/<o>/<r>/releases`, oppure sorgente, README e LICENSE su GitHub; 5) un'altra URL primaria della stessa fonte. Percorsi per tipo:
- EUR-Lex: curl dà 202 vuoto, WebFetch vuoto. Cellar: `https://publications.europa.eu/resource/celex/<CELEX>` con header `Accept-Language: ita`. Testato su 32024R1689: 1,3 MB, art. 50 presente. Da browser: `innerText` con spazi normalizzati, poi `indexOf` sulla frase.
- Normattiva: l'atto intero dà solo indice o art. 1; l'articolo singolo funziona anche con curl: `https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legislativo:2022-05-27;82~art24` (testato: testo dell'art. 24, sanzione 5.000-40.000 euro). Codici: `regio.decreto:1942-03-16;262:2` (c.c.), `regio.decreto:1930-10-19;1398:1` (c.p.); versione vigente a una data: `!vig=AAAA-MM-GG`.
- PDF (Commissione, AgID, Gazzetta, USCO, ETSI): WebFetch salva il binario. Testo con uno script Swift (`import PDFKit; PDFDocument(url:).string`), testato su un PDF di prova. Non c'è `pdftotext` e `pypdf` non è nel python3 dello studio.
- EUIPO: WebFetch 403, curl con user-agent da browser funziona.
Se tutta la scala fallisce, la fonte è «non letta»: il fatto passa a [S] o a «Da verificare», mai a [P].
**Evidenza:** [P] pagine lette il 2026-11-04: ho rieseguito io Cellar, Normattiva, PDFKit. I percorsi playwright-cli (Meta, Google, WIPO) e gh api vengono da verifiche di altri dello stesso giorno, non rieseguiti da me.
**Quando non vale:** URL e protezioni cambiano: riverificare dopo 90 giorni. I login-wall (LinkedIn 999, Instagram, TikTok) non si scalano senza cookie, e i cookie di {{TITOLARE}} non si usano senza ok. Nessun aggiramento di paywall o termini d'uso.
**Cliente/progetto:** generale.

## [2026-11-04] Una secondaria non diventa regola: tre errori trovati dalle verifiche

**Pattern:** un limite, una soglia o una data letti solo in stampa, studi legali o blog si scrivono come «[S], da verificare» e non entrano in una regola né in `benchmarks/` come verificati. La primaria si apre prima di consegnare.
**Evidenza:** [P] 1) Customer Match via Google Ads API «chiuso dal 1/4/2026»: la pagina deprecations dice che sono limitati i developer token senza richieste Customer Match tra 1/10/2025 e 31/3/2026 (2026-11-04). 2) Proroga art. 50 AI Act al 2/12/2026: vale solo per i fornitori di sistemi già sul mercato e solo per la marcatura dell'art. 50(2), non per chi usa lo strumento (Reg. UE 2026/1744, art. 111(4), via Cellar). 3) Nel report che ha generato questo aggiornamento: «2-5 sotto-agenti» per le ricerche medie, ma la fonte Anthropic dice 2-4; e il CitationAgent di Anthropic attribuisce le affermazioni alle fonti, non ricontrolla i numeri. Il punto 3 l'ho letto io sull'HTML grezzo il 2026-11-04; i punti 1 e 2 vengono da verifiche altrui, non rilette.
**Quando non vale:** quando la secondaria è l'unica che esiste (dati di mercato privati, margini di agenzia): allora resta MEDIA o BASSA dichiarata, mai usata come soglia o limite.
**Cliente/progetto:** generale.

## [2026-11-04] Passata separata di verifica delle citazioni

**Pattern:** prima di consegnare, seconda passata: per ogni numero, data, soglia e frase tra virgolette riapri la pagina citata (testo grezzo, non la sintesi di WebFetch), trova la frase esatta e segna OK / CORRETTO / NON TROVATO. Chi ha scritto non è il verificatore giusto (regola 12): da sotto-agente chiedi nel resoconto un'altra istanza al lead; se non arriva, la passata è tua, sul testo e non sulla memoria, e la dichiari «non indipendente». Ciò che non passa si toglie o scende a [S] / «Da verificare».
**Evidenza:** [S] verifica interna, 2026-11-04: sul solo fatto «art. 50» tre correzioni a un report scritto su secondarie (rinvio solo per i fornitori; C2PA non nominato da Linee guida e Codice; «i titoli di coda non bastano» non è una frase letterale dei documenti).
**Quando non vale:** non sostituisce la lettura primaria, e se la pagina non si apre il numero resta «non verificato». Per contesto che non decide nulla bastano le righe a rischio.
**Cliente/progetto:** generale.

## [2026-11-04] Scala dello sforzo: prima di cercare, decidi quanto

**Pattern:** fatto semplice = 1 agente, 3-10 chiamate; confronto diretto = 2-4 sotto-agenti, 10-15 chiamate ciascuno; ricerca complessa = oltre 10 sotto-agenti con compiti separati. Da sotto-agente non ne lancio (regola 14): per me è un budget di chiamate per angolo, e per le ricerche complesse propongo al lead nel resoconto come dividerle.
**Evidenza:** [P] Anthropic Engineering, «How we built our multi-agent research system», pubblicato 13 giu 2025, letto sull'HTML grezzo il 2026-11-04. Costo dichiarato da loro: agenti circa 4 volte i token di una chat, sistemi multi-agente circa 15 volte.
**Quando non vale:** sono le regole nei prompt del loro sistema e numeri loro, non una misura valida per ogni ricerca. Con maxTurns 50 il limite reale è il mio: scrivere il file presto.
**Cliente/progetto:** generale.

## [2026-11-04] Benchmark di costo media per Paese: i riassunti della ricerca sbagliano, e i panel di vendor hanno i dati sulla pagina

**Pattern:** per CPM/CPC per Paese cerca prima i panel di vendor con campione dichiarato (Superads, Lebesgue, Kiin, smec: HTML statico, `curl` con user-agent funziona) e apri la tabella, non il riassunto. Prima di scrivere un numero ricontrolla anno, valuta e definizione di «clic».
**Evidenza:** [P] letto 2026-11-04. 1) Il riassunto della ricerca attribuiva al 2025 i 2,9 miliardi del Video, ma il comunicato del Politecnico li collega al 2026 (41% di 7 miliardi). 2) Dreamdata: il riassunto dava CPM 34,33 e CTR 0,57%, la pagina secondaria letta ha solo il CPC 5,98 euro. 3) Kiin: «CPC» vale 4,19 o 17,54 dollari secondo la definizione (clic LinkedIn o clic sulla landing). 4) Superads cambia valuta da pagina a pagina. Per LinkedIn il bucket Kiin «Europa, singolo Paese (FR, ES, IT...)» è il più vicino all'Italia.
**Quando non vale:** i panel sono di vendor e auto-selezionati. Per Google, YouTube e TikTok in Italia non esiste una fonte con metodologia: l'assenza è il risultato (`benchmarks/media-italia-2026-11.md`). Riverificare dopo 90 giorni.
**Cliente/progetto:** generale.

## Da verificare

(ipotesi non ancora dimostrate)
