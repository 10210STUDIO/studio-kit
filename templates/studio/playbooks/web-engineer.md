# Playbook — web-engineer

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-10-29] Cambio di proporzione per breakpoint: un ritaglio per breakpoint, mai il ritaglio desktop adattato in CSS

**Pattern:** se un componente immagine cambia `aspect-ratio` su mobile, genera il ritaglio mobile dalla sorgente (una `<source media>` con il suo rapporto). Adattare in CSS (`object-fit: cover`) un'immagine già ritagliata in 2.2:1 dentro un riquadro 4:5 la ingrandisce.
**Evidenza:** in un sito Astro + sharp, Playwright a 390 px, DPR 3: gli hero di quattro pagine scaricavano 1280x582 e li mostravano in 390x488 CSS (1170x1464 px fisici), cioè circa 2,5 volte in altezza. La misura: confronta `naturalHeight` (corretto per densità) con `getBoundingClientRect().height * devicePixelRatio` di ogni `<img>`.
**Quando non vale:** immagini decorative sfocate di proposito, o sorgenti già del rapporto mobile.
**Cliente/progetto:** generale.

## [2026-10-29] Lo script di pulizia post-build può nascondere lavoro sprecato

**Pattern:** quando esiste uno `prune` che cancella file dalla build, confronta il numero di file prima e dopo: la differenza è lavoro che la pipeline fa e butta. Si toglie alla fonte, non si lascia a prune.
**Evidenza:** 106 file in `_astro` prima, 74 dopo; 12 erano gli originali, 20 erano jpg di `srcset` mai scritti nel markup (il componente immagine li generava e non li usava).
**Quando non vale:** originali che l'hosting o l'ottimizzatore emette per forza (import.meta.glob eager): quelli si potano.
**Cliente/progetto:** generale.

## [2026-10-29] Costo di aggiungere un elemento: contare i punti di modifica prima che il cliente cresca

**Pattern:** per ogni lista che crescerà (casi, servizi, persone) grep dell'identificatore dell'ultimo elemento aggiunto: se serve toccare più di 3 file, i dati vanno in un array e le pagine in `getStaticPaths`. Gli id interni non portano nomi di clienti: `case-01`, non il cliente.
**Evidenza:** in un sito aggiungere un terzo caso richiedeva 11 file e circa 25 punti (config, immagini, copy in 3 punti per lingua, view con ternari, header, sitemap, 2 pagine).
**Quando non vale:** liste fisse di 2-3 voci che non cambiano per anni.
**Cliente/progetto:** generale.

## [2026-10-29] Cancello sui segnaposto prima di pubblicare

**Pattern:** se il brief dice «le parentesi quadre non si pubblicano», il build deve poterlo far fallire (conta `[` nei titoli e nei `class="ph"` di `dist/`, esci con errore se `PUBLISH=1`). La regola scritta in un file di testi non ferma nessuno.
**Evidenza:** 50 segnaposto per lingua, anche in `<title>` e nella sitemap, senza alcun controllo automatico.
**Quando non vale:** siti che usano le quadre nel testo vero.
**Cliente/progetto:** generale.

## [2026-11-04] Core Web Vitals: condizione di consegna, mobile e desktop separati

**Pattern:** prima di consegnare, LCP ≤ 2,5 s, INP ≤ 200 ms, CLS ≤ 0,1 al 75° percentile delle visite, segmentate mobile e desktop. Su un sito appena nato non esistono dati di campo: misuri in lab (Lighthouse mobile con throttling, più interazioni reali in browser per l'INP, che il Lighthouse di navigazione non misura) e lo scrivi come stima. Dopo il lancio si controlla il dato di campo (CrUX/Search Console).
**Evidenza:** [P] web.dev/articles/vitals (pagina del 2024-10-31), soglie e percentile letti il 2026-11-04. Nessun cambio di soglia nelle note di rilascio CrUX 2026; il dataset di settembre 2026 aggiunge varianti sperimentali con le soft navigation per le SPA.
**Quando non vale:** le soglie «da migliorare» e «scarse» non le ho lette (sono in immagini sulla pagina). Le varianti soft navigation non sono ancora il criterio. Blog che parlano di LCP a 2,0 s dal 2026 non hanno riscontro nelle fonti Chrome: ignorarli. Rileggere la pagina sopra i 90 giorni.
**Cliente/progetto:** generale.

## [2026-11-04] Next.js e React: ultima patch stabile della linea, avvisi controllati a ogni consegna

**Pattern:** niente versioni fisse nei file. Ogni progetto Next.js sta sull'ultima patch stabile della sua linea (`npm view next dist-tags`, `npm audit`) e prima di consegnare si legge la pagina degli avvisi di sicurezza. React2Shell (CVE-2025-55182, RCE senza autenticazione, React 19 Server Components) è chiusa da dicembre 2025, ma le versioni di allora non bastano più: sono seguiti altri CVE su React (DoS, esposizione del sorgente) e nel 2026 diverse RCE su Next.js (Image Optimization con SVG, funzioni `use cache`, `next/og`).
**Evidenza:** [P] react.dev/blog/2025/12/03/critical-security-vulnerability-in-react-server-components, vercel.com/kb/bulletin/react2shell, GitHub Advisory API di vercel/next.js, lette il 2026-11-04.
**Stato al 2026-11-04:** release di sicurezza di novembre (2026-11-03): patch 16.4.5 (Active LTS) e 15.5.29 (Maintenance LTS), 7 problemi (1 High: cache fra tenant con `unstable_cache` + `use cache`; 6 Medium: `use cache` annidati e argomenti binari, shell cache con `next start`, framing di risposte compresse dietro proxy HTTP/1.1, cookie nell'header `x-middleware-set-cookie` delle Edge route, bypass del rifiuto SVG in Image Optimization). Chi usa quelle funzioni legge l'advisory; senza Cache Components, Edge route e Image Optimization la superficie è minore.
**Evidenza (stato):** [P] nextjs.org/blog/november-2026-security-release.md, letto con curl il 2026-11-04. Gravità e versioni sono quelle del vendor; i GHSA non sono stati aperti. Il comando nel post riporta «# for 16.5» accanto a 16.4.5: vale il numero di versione.
**Quando non vale:** progetti senza Server Components né Next.js (Astro statico): il rischio è quello delle dipendenze in generale. Il post non dice quali altre versioni (diverse da 15.5.x e 16.4.x) siano colpite: controllare l'advisory. Voce che invecchia in settimane: riverificare lo stato a ogni consegna, comunque entro 30-90 giorni.
**Cliente/progetto:** generale.

## [2026-11-04] Base npm contro la catena di fornitura

**Pattern:** in CI `npm ci`. `ignore-scripts=true` salvo eccezioni scritte per pacchetto (non blocca gli script che lanci tu con `npm run`). Ritardo minimo sulle release appena uscite: npm `min-release-age` (valore in giorni, npm ≥ 11.10.0) con `min-release-age-exclude` per i pacchetti nostri e per le patch urgenti; pnpm `minimumReleaseAge` (in minuti, da pnpm 10.16.0, attivo di default a 1440 dalla v11). Il valore lo scegli e lo scrivi nel progetto: la fonte non ne raccomanda uno.
**Evidenza:** [P] npm/cli (`definitions.js`, release 11.10.0 del 2026-02-11), pnpm.io/settings/dependency-resolution e release pnpm, letti il 2026-11-04.
**Quando non vale:** se il ritardo blocca una patch di sicurezza, `npm audit fix` resta sulla versione vulnerabile e dà errore: serve l'eccezione. Dipendenze con build nativa che richiedono lo script: eccezione scritta, non `ignore-scripts` spento ovunque. Il testo di `ignore-scripts` l'ho letto dal ramo `main` di npm/cli, che include novità di npm 12 (`allow-scripts`, `strict-allow-scripts`): non so in quale 11.x siano arrivate.
**Cliente/progetto:** generale.

## [2026-11-04] Accessibilità: progetta per WCAG 2.2 AA, dichiara quanto la norma vigente richiede

**Pattern:** costruisci e testa per WCAG 2.2 AA (include 2.4.11 Focus Not Obscured: barre fisse e banner cookie non devono coprire del tutto l'elemento in focus; e 2.5.8 Target Size). Al cliente scrivi cosa hai testato e come, non «a norma». Riferimento legale oggi, per l'EAA: EN 301 549 v3.2.1 (WCAG 2.1 AA). In Italia D.Lgs. 82/2022, obblighi dal 2025-06-28, sanzioni da 5.000 a 40.000 euro (art. 24), microimprese che forniscono servizi esentate (art. 3 c. 3); linee guida AgID determinazione 38/2026 (GU n. 69 del 2026-03-24) richiamano v3.2.1 e WCAG 2.1 AA. Se un cliente rientra nell'ambito lo decide `compliance-rights-officer` con il legale.
**Evidenza:** [P] normattiva.it (D.Lgs. 82/2022, artt. 3, 24, 25), Gazzetta Ufficiale 2026-03-24, ETSI EN 301 549 v4.1.1 (2026-09), AccessibleEU 2026-09-07, W3C WCAG 2.2; lette il 2026-11-04.
**Quando non vale:** la v4.1.1 si allinea a WCAG 2.2 ma non è ancora il riferimento legale finché non è citata in Gazzetta UE; non ho controllato se lo sia diventata dopo il 7 settembre 2026: rileggere prima di ogni offerta con promesse di conformità. «WCAG 2.2 AA obbligatorio» non ha fonte ufficiale. Il «2030» dell'art. 25 vale solo per prodotti già in uso e contratti preesistenti, non per i servizi nuovi. WCAG 3.0 è Working Draft (10 set 2026): non è un riferimento.
**Cliente/progetto:** generale.

## [2026-11-04] Componente etichetta «contenuto generato da IA»

**Pattern:** un componente unico per immagini e video IA realistici (persone, luoghi o oggetti che possono plausibilmente esistere): etichetta visibile e leggibile da screen reader già alla prima esposizione, quindi su hero, poster e primo fotogramma, mai solo nel footer. Testo, icona, posizione e ripetizione nei video le fornisce `compliance-rights-officer`; il componente le riceve come dati, non le inventa. Chi usa lo strumento e pubblica è deployer (art. 50(4)): per lui nessun rinvio.
**Evidenza:** [P] AI Act art. 50 (Reg. UE 2024/1689, applicabile dal 2026-08-02); il rinvio al 2026-12-02 vale solo ai fornitori e solo per l'art. 50(2) (Reg. UE 2026/1744). Linee guida C(2026) 5054 del 2026-07-20 non vincolanti; il Codice di condotta (2026-06-10) chiede l'icona all'inizio del video, ripetuta a intervalli. Dal playbook di compliance-rights-officer (2026-11-01).
**Quando non vale:** grafica palesemente non fotografica; prodotto reale su sfondo IA che non inganna sul prodotto. Né le linee guida né il Codice nominano C2PA, e «i titoli di coda non bastano» non è una frase loro: non scriverli ai clienti come obblighi.
**Cliente/progetto:** generale.

## Da verificare

(ipotesi non ancora dimostrate)
