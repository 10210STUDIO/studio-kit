# Playbook — ui-designer

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## Sito statico con animazioni (Astro, vanilla)
- Hidden state di reveal e line mask solo sotto `html.motion`, impostato da uno script inline nel head (assente con JS off o reduced motion) + timeout di sicurezza: il contenuto resta visibile senza JS.
- Il `clip-path` di un reveal va sull'elemento interno (`picture`), mai sulla cornice osservata dall'IntersectionObserver: a area zero non scatta e l'immagine resta invisibile.
- Screenshot full-page: prima scroll a passi con attesa, `decode()` di tutte le immagini, poi cattura; le immagini lazy e i reveal altrimenti risultano vuoti.
- `getImage` di sharp accetta solo parole chiave per `position`, non percentuali: arrotondare a left/center/right e tenere la percentuale in `object-position`.
- Con `import.meta.glob` fuori da `src/` Astro emette anche gli originali: script di prune post-build; su percorsi con spazi usare `fileURLToPath`, non `.pathname`.
- Su mobile dare un `row-gap` di default alla griglia: i titoli di sezione altrimenti si incollano al testo.

## Sito con linguaggio cinematico (2026-10)
- Pattern: pile di pannelli sticky a 100svh, hero video con still sotto, titoli condensed enormi dimensionati su `min(vw, svh)`, barre fisse alto e basso, cortina nera fra le pagine, footer con wordmark gigante.
  Evidence: Lighthouse 97-100 ovunque, LCP 0,2-0,9 s con hero `preload=auto`; verificato a 1440, 390, no JS, reduced motion, IT.
  Quando non vale: siti con molto testo da leggere; lì conta la misura di riga, non il display.
- Pattern: video con tre file (16:9, 4:5, still) e controllo di esistenza al build.
  Evidence: un nome file divergente fra due elenchi lasciava lo still senza alcun errore; tenere un solo elenco di nomi. Quando non vale: video lunghi o con audio.
- Pattern: la barra fissa in basso su fondo scuro vuole un gradiente quasi opaco (0,88): a 0,5 si sovrappone al testo del footer. Evidence: catture mobile prima e dopo.
- Pattern: un grigio medio vicino alla soglia cade sotto 4,5:1 appena il riquadro si scurisce di poco (es. #6E6A64 su #EDEAE5 fa 4,48:1 e Lighthouse lo segnala; su #F2EFEA fa 4,68:1). Controllare segnaposto e micro-etichette sui riquadri grigi. Evidence: audit color-contrast, pagina caso da 97 a 100.
- Pattern: apostrofi e virgolette dritte si normalizzano nel file dei testi, una volta, non a render.
- Pattern: numero grande decorativo accanto a un titolo che comincia con lo stesso numero è ridondanza: togliere dal titolo visibile e tenerlo `sr-only`.

## Sito costruito su un brand book (colore di marca solo nel marchio, 2026-10)
- Pattern: se il generatore di immagini è vietato, il comp è la pagina del book più i registri fotografici approvati; dichiararlo nel report.
- Pattern: un solo campo del colore di marca per schermata si ottiene con header sticky col marchio colorato, nessun colore di marca in CSS e nessun marchio nel footer. Verifica: contare gli elementi DOM con quel colore o sfondo (0 attesi).
- Pattern: griglia a 12 colonne con `--c` per figlio applicata solo da 768px; sotto, tutto a larghezza piena. Evidence: nessun overflow orizzontale a 390.
- Pattern: togliere preloader, cortina, Lenis, parallax e video porta la home a circa 165 KB al primo caricamento. Il solo JS rimasto è menu e form.
- Pattern: il mono sotto 14px rompe il token; i segnaposto dentro `.lbl` vanno a `font-size:1em`.
- Pattern: nomi cliente senza autorizzazione: segnaposto in testo e meta, ma slug e sitemap li portano ancora; decidere gli slug prima di costruire le route.
- Pattern: Playwright con revisione browser mancante: passare `executablePath` (variabile `CHROME`) a un build esistente.
- Pattern: un componente con prop `slot` passato come figlio diretto di un layout con `<slot />` sparisce senza errori (Astro lo legge come slot con nome). Evidence: un componente immagine non rendeva in 4 pagine. Avvolgerlo in un `<div>` o rinominare la prop.
- Pattern: `getImage` arrotonda la posizione a parole chiave, quindi un taglio al 30% diventa `top`. Per tagli larghi da foto verticali scegliere il rapporto dopo aver visto dove cade il soggetto, non solo la percentuale.
- Pattern: un campo del colore di marca a tutta larghezza con l'SVG del marchio tagliato: SVG dentro un contenitore con `aspect-ratio` più basso dell'SVG (es. 400/90 contro 400/110), così il taglio resta proporzionale a ogni larghezza. Decorativo, `aria-hidden`.
- Pattern: sezioni su nero si fanno ridefinendo solo i token semantici in `.dark` (bg, text, muted, rule); rule e testo secondario si adattano da soli.
- Pattern: rivelazione a taglio netto con `clip-path: inset()` solo sotto `.js` e `prefers-reduced-motion: no-preference`; immagini sopra la piega escluse (LCP). Senza JS o con movimento ridotto restano visibili.
- Pattern: slug dei casi senza nome cliente (`case-01`) dal primo giorno; cambiarli dopo tocca config, sitemap, link e script di cattura.
- Pattern: il materiale video solo verticale va in composito largo sul fondo del token di pagina (non un nero diverso) e in trio 9:16.
- Pattern: con video in vista `networkidle` non si chiude mai: nelle catture usare `waitUntil: 'load'` più un'attesa (ma vedi sotto: con autoplay anche `load` può bloccarsi).

## [2026-11-01] Pagine di un PDF sul sito: render, numeri di pagina, schermate
**Pattern:** senza pdftoppm/magick/gs, un piccolo script Swift con CGPDFDocument (`drawPDFPage` su un CGContext, JPEG con ImageIO) rende ogni pagina; per leggere si fa un contact sheet con sharp, per il sito si rende a 2400 px. Nomina i file per contenuto (`<cliente>_bb_logo`), non per numero: il numero stampato nel book è quello del PDF meno uno (la copertina non è numerata), e scegliendo dal contact sheet ci si sbaglia. Controlla le pagine scelte con un secondo sheet prima della build. Sulle pagine A4 orizzontali: `ratio` 297/210 su ogni breakpoint, mai ritagliate, `max-height: none` sul frame. Il blocco scuro riusa il componente a tre colonne (scorrimento su mobile) con due colonne da 768 px.
**Evidenza:** pagina caso con il brand book di un cliente; build e catture a 1440 e 390, nessun overflow.
**Quando non vale:** pagine con testo piccolo (corpo sotto ~12 pt sul PDF) a metà larghezza sono texture, non si leggono: scegli pagine con titolo grande.
**Cliente/progetto:** generale.

## [2026-11-01] Catture Playwright: `waitUntil: 'load'` si blocca con video in autoplay
**Pattern:** `domcontentloaded` + attesa fissa + `Promise.race` sul decode delle immagini. Con `load` lo script è rimasto fermo oltre 3 minuti senza errore, due volte. Lanciare lo script in sottoprocesso e controllare i file, non aspettare il comando.
**Evidenza:** pagina caso con video hero, stesso script chiuso in 20 s dopo la correzione.
**Quando non vale:** pagine senza video.
**Cliente/progetto:** generale.

## [2026-10-31] Comandi fissi senza fondo: fascia solo al ritorno
**Pattern:** scritte fisse senza biglietto + padding-top in apertura risolvono solo il primo schermo; scorrendo su cadono sopra testi e foto (bianco su foto chiara illeggibile). Fascia a tutta larghezza (`header::before`, 64px) col colore della sezione sotto, visibile solo con i comandi (sopra 80px di scroll), niente in cima. Il colore delle scritte segue la fascia, non la foto.
**Evidenza:** misura Playwright con uno script di sovrapposizione (testo/foto sotto i comandi) a 390/768/1440/1920 su 5 pagine: da 2-9 schermi con sovrapposizione per pagina a 0.
**Quando non vale:** se i comandi non spariscono scorrendo giù, la fascia sarebbe sempre presente e diventa una barra.
**Cliente/progetto:** generale.

## Da verificare

(ipotesi non ancora dimostrate)
