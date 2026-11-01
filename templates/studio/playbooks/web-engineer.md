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

## Da verificare

(ipotesi non ancora dimostrate)
