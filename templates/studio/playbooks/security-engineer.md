# Playbook — security-engineer

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-10-31] PHP: FILTER_VALIDATE_EMAIL non protegge le intestazioni della mail

**Pattern:** quando un indirizzo del visitatore finisce in un header di `mail()` (Reply-To, From, Cc), `filter_var(..., FILTER_VALIDATE_EMAIL)` non basta. Il "quoted-pair" (`"\` + qualsiasi carattere ASCII, a capo compreso) passa, e il controllo `php_mail_detect_multiple_crlf` lascia passare un `\n` singolo. Chiedere sempre un rifiuto esplicito: `preg_match('/[^\x21-\x7E]|["\\\\]/', $email)`. Segnale: un commento nel codice che dice «filter_var rifiuta a capo».
**Evidenza:** regex `regexp1` di php-src PHP-8.3 (`ext/filter/logical_filters.c`) eseguita in Perl: accetta `"\<LF>Bcc:x@e.test,a"@example.com`. Il porting di `mail.c:374` non rifiuta l'header. Così l'iniezione arriva al server di posta senza toccare il sito vivo. Trovato sul form di contatto PHP di un sito statico.
**Quando non vale:** header costruiti come array (PHP ≥7.2 valida i valori), PHPMailer/Symfony Mailer con API per indirizzi. L'invio della copia `Bcc` dipende da `sendmail -t` sul server: da dichiarare needs_validation.
**Cliente/progetto:** generale.

## [2026-10-31] Sito statico: la superficie è lo script lato server, e npm audit va letto avviso per avviso

**Pattern:** su un sito generato in anticipo (Astro, Next export, Hugo), dedicare il tempo all'unico script che gira sul server (form PHP, funzione serverless). Gli avvisi critici del framework vanno letti uno per uno: XSS e bypass sono quasi sempre solo per il rendering a richiesta (SSR), e la RCE delle immagini riguarda la build con input non fidato. Prima di tutto, confrontare l'hash di 2–3 pagine vive con `dist/` per sapere che si sta controllando proprio la build pubblicata.
**Evidenza:** un sito Astro: npm audit con 1 critico e 1 alto su astro 6.4.8, nessuno raggiungibile in produzione. Il rilievo vero era nel form PHP. Gli hash delle pagine live e di `dist/` coincidevano.
**Quando non vale:** se ci sono rotte SSR o un adapter (`output: 'server'/'hybrid'`), oppure se la build elabora file caricati da terzi o da un CMS aperto.
**Cliente/progetto:** generale.

## [2026-11-04] Stato degli standard e degli strumenti (riverificare dopo il 2027-02-02)

**Pattern:** classifica i rilievi web con OWASP Top 10:2025 e quelli su chatbot e agenti con OWASP LLM Top 10 2026. Gli elenchi stanno nella skill `security-audit`, se installata. La LLM Top 10 2025 è superata: Excessive Agency sale a LLM03 e System Prompt Leakage diventa LLM08 Hidden Context Exposure. Per la Top 10:2025 non citare una data: OWASP non la pubblica.
**Evidenza:** [P] top10.owasp.org/2025; genai.owasp.org e il repo GenAI-Security-Project, cartella `2026/final` (uscita il 3-4 agosto 2026). Letti il 2026-11-04.
**Quando non vale:** se esce un'edizione più nuova. L'elenco OWASP Agentic Top 10 (codici ASI) non l'ho letto sulla fonte: non citarne i codici senza leggerlo.
**Cliente/progetto:** generale.

## [2026-11-04] Next.js: dopo React2Shell non esiste una «versione sicura» fissa

**Pattern:** in ogni progetto Next.js confronta il lockfile con gli avvisi GitHub di `next` e `react-server-dom-*`, e chiedi l'ultima patch stabile della linea. Un numero copiato da un bollettino invecchia in poche settimane. Poi leggi le precondizioni di ogni avviso: decidono se il progetto è esposto. Su un avviso appena uscito leggi sia il bollettino sia la pagina GHSA, perché possono non coincidere.
**Evidenza:** [P] react.dev, 3/12/2025: CVE-2025-55182, RCE senza autenticazione, CVSS 10, chiusa da 19.0.1, 19.1.2 e 19.2.1. Poi sono arrivati 55183, 55184, 67779 e CVE-2026-23864 (ultimo backport React: 19.0.4, 19.1.5, 19.2.4, gennaio 2026). Next.js nel 2026: RCE in `next/og` (30/9), nell'Image Optimization con SVG (chiusa in 15.5.28 e 16.4.1, 22/10) e in `use cache` (16.4.1). Ultime stabili al 3/11/2026: 16.4.5 (Active LTS) e 15.5.29 (Maintenance LTS). Fonte: GitHub Advisory e release.
[P] Bollettino Next.js del 3/11/2026 (nextjs.org/blog/november-2026-security-release.md, letto il 2026-11-04): 1 problema High e 6 Medium, dichiarati corretti in 16.4.5 e 15.5.29. Precondizioni:
- **Cache Components:** la stessa funzione `use cache` che legge un parametro radice, chiamata anche dentro `unstable_cache`, può passare dati fra tenant (High, GHSA-mfr8-8qww-v76h). Lo stesso rischio c'è nei `use cache` annidati (GHSA-vc7v-qv4w-wrv8) e con argomenti binari che distinguono gli utenti (GHSA-rhh4-g77r-r9qj). Avvelenamento dello shell condiviso con `next start` e Partial Prefetching spento (senza GHSA nel post).
- **Proxy:** self-hosted che rimanda tal quale una `Response` controllata dall'attaccante, dietro un proxy HTTP/1.1 che accoda richieste pipelined (GHSA-pc58-hwjq-p385).
- **Edge:** route Edge con `NextResponse.cookies.set()`: il cookie, anche `HttpOnly`, si legge da `x-middleware-set-cookie`. Serve JavaScript dell'attaccante sulla stessa origine (GHSA-f3mh-rxg3-f5g2).
- **Immagini:** aggira `dangerouslyAllowSVG: false` su un backend che decodifica SVG. Il post non dimostra XSS né RCE (GHSA-7qx7-33qx-rqx2).

Pagine GHSA su `vercel/next.js`, tre lette con WebFetch (sintesi) il 2026-11-04: GHSA-mfr8 è Moderate 6.3 e colpisce `>= 16.3.0`, mentre il post dice High. Tutte e tre danno «Patched versions: None», anche GHSA-f3mh, che ha un limite superiore (16.4.2 e 15.5.28): il campo sembra non compilato, ma non è provato. GHSA-mfr8 indica un workaround completo: non annidare `use cache` dentro `unstable_cache()`.
**Quando non vale:** export statico senza server: leggi gli avvisi uno per uno (vedi la voce del 2026-10-31). Il post non dice quali altre linee siano colpite. Nel suo comando `# for 16.5` sta accanto a 16.4.5: vale il numero di versione. Non dichiarare chiusi gli avvisi di novembre 2026 finché non hai letto l'avviso del vendor.
**Cliente/progetto:** generale.

## [2026-11-04] Catena npm: ritardo sulle release, niente script e provenance letta per quello che è

**Pattern:** nei progetti dei clienti chiedi:
- `npm ci`;
- `ignore-scripts=true` con le eccezioni scritte;
- `min-release-age=<giorni>` (npm 11.10.0 o successivo), con `min-release-age-exclude` per le patch urgenti. Se il ritardo blocca una patch, `npm audit fix` dà errore: serve l'eccezione;
- con pnpm, `minimumReleaseAge` in minuti: esiste dalla 10.16.0 ed è attivo di default (1440) dalla 11.

La provenance prova da dove arriva il pacchetto, non che sia innocuo. Il trusted publishing accetta i token finché non si sceglie «disallow tokens». Non ha un campo per il branch: il branch si limita con l'ambiente protetto e con la protezione dei tag.
**Evidenza:** [P] npm/cli `definitions.js` e release 11.10.0 (2026-02-11); pnpm.io settings. Sorgente dei documenti npm (`npm/documentation`, ultimo commit 2026-10-06), per provenance: «does not guarantee the package has no malicious code». Per il trusted publishing: npm 11.5.1 o successivo e Node 22.14.0; solo runner cloud (GitHub, GitLab.com, CircleCI); niente provenance da repository privati né da CircleCI; `npm stage publish` dalla 11.15.0; con `workflow_call` npm controlla il nome del workflow chiamante.
**Quando non vale:** pacchetti interni pubblicati su un registry privato. Le opzioni cambiano fra npm 11 e 12: leggi i nomi sulla versione installata.
**Cliente/progetto:** generale.

## [2026-11-04] Anchor 1.x: `anchor test` resta, cambia il motore

**Pattern:** leggi la versione di Anchor nel lockfile prima di giudicare un programma. Dalla 1.0:
- gli account mutabili duplicati sono rifiutati salvo `#[account(mut, dup)]`, quindi ogni `dup` va giustificato;
- `AccountInfo` dentro `Accounts` è deprecato;
- `.reload()` ricontrolla anche l'owner;
- `CpiContext::new` prende l'ID del programma;
- il pacchetto TS è `@anchor-lang/core` (prima `@coral-xyz/anchor`);
- la 1.0 usa Solana 3.x; la 1.2.2 raccomanda Solana 4.1.2, platform-tools v1.57 e SBPF v3;
- dalla 1.2.2 chiudere un account su se stesso restituisce `ConstraintClose`: sotto quella versione controlla i `close`.

`anchor test` usa Surfpool di default (`--validator legacy` per il vecchio validator) e `anchor init` crea test LiteSVM. Surfpool può copiare lo stato di mainnet dalla rete: nella sandbox va usato offline.
**Evidenza:** [P] note di rilascio 1.0.0 (anchor-lang.com) e release GitHub di Anchor: 1.0.0 del 2026-04-02, l'ultima è la 1.2.2 del 2026-10-28 (note lette solo nelle prime 40 righe). docs.rs anchor-lang 1.2.2 per `.reload()`. README di Surfpool. Classi return-data ed estensioni Token-2022 verificate su docs.rs `solana_cpi::get_return_data` e sull'enum `ExtensionType` di `solana-program/token-2022`. L'indirizzo `solana-foundation/anchor` ora porta a `otter-sec/anchor` (WebFetch, 2026-11-04: nessuna nota di trasferimento in pagina).
**Quando non vale:** programmi su Anchor 0.x o nativi: lì i duplicati non sono bloccati e servono confronti espliciti fra le chiavi. La linea 0.x ha le patch 0.32.3, 0.31.3 e 0.30.4 del 2026-11-03, ma non so se correggano una falla: il CHANGELOG della 0.32.3 ha le sezioni vuote. Prima di dire a un cliente su 0.30–0.32 di non aggiornare, leggi il diff del tag.
**Cliente/progetto:** generale.

## [2026-11-04] Pagine di documentazione che WebFetch non apre: leggere il sorgente

**Pattern:** se WebFetch restituisce solo CSS o una pagina senza testo (succede con docs.npmjs.com), cerca il sorgente dei documenti su GitHub con `gh api "search/code?q=repo:<org>/<docs-repo>+filename:<pagina>.mdx"` e leggilo con `gh api repos/.../contents/...`. È la stessa fonte primaria, con la data del commit. Per gli avvisi, `github.com/advisories/<GHSA>` può dare 404 a WebFetch: apri `github.com/<org>/<repo>/security/advisories/<GHSA>`.
**Evidenza:** trusted publishing e provenance di npm letti così il 2026-11-04, dopo due WebFetch vuoti. Avvisi Next.js aperti allo stesso modo lo stesso giorno.
**Quando non vale:** documentazione che non ha un repository pubblico. In quel caso usa curl con lo user-agent di un browser, oppure `playwright-cli`.
**Cliente/progetto:** generale.

## [2026-11-04] Plugin e skill di terzi: il rischio è nelle istruzioni, non nel manifest

**Pattern:** prima di installare un plugin Claude Code di terzi, oltre a hook/MCP/agenti nel manifest, cerca nelle skill: `npx <pkg>@latest` o non fissato, `pip install` senza versione, istruzioni del tipo «aggiorna senza chiedere», telemetria accesa di default e server locali che ascoltano su tutte le interfacce. Un plugin da marketplace GitHub si aggiorna: ciò che oggi non ha hook può averli domani. Correzione minima: copiare solo le skill da un commit fissato, togliere le righe di auto-aggiornamento, CLI a versione fissa con telemetria spenta via env.
**Evidenza:** HyperFrames 0.9.10 (HeyGen): manifest pulito (niente hook, MCP, agenti), ma 434 `npx hyperframes` non fissati, `hyperframes@latest upgrade` «act on the signal», `pip install` di torch/transformers nell'interprete di default, PostHog acceso di default, `play`/`present` in ascolto su tutte le interfacce.
**Quando non vale:** plugin interni dello studio o fissati a un commit con aggiornamento automatico spento.
**Cliente/progetto:** generale.

## Da verificare

(ipotesi non ancora dimostrate)
