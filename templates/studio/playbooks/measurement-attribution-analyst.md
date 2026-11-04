# Playbook — measurement-attribution-analyst

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-11-04] La direzione dell'errore del dato di piattaforma non è fissa

**Pattern:** «il ROAS di piattaforma è gonfiato» è un'ipotesi da testare, non un fatto. Lo stesso canale può sottostimare con una finestra e sovrastimare con un'altra o con un tipo di campagna.
**Evidenza:** [P, dati dell'autore] Haus, 640 test Meta (2025-07-28): il click 7 giorni sottostimava in media, Advantage+ sovrastimava rispetto al manuale. Numeri, perimetro e avviso di rianalisi in `benchmarks/incrementalita-2026-11.md`.
**Quando non vale:** non dà un fattore di correzione. Grandi inserzionisti DTC; Haus ha pubblicato una rianalisi (luglio 2026) che ribalta una parte dei risultati.
**Cliente/progetto:** generale

## [2026-11-04] Consent Mode v2: quattro segnali, due modalità, soglie nella Diagnostica

**Pattern:** segnali `ad_storage`, `analytics_storage`, `ad_user_data`, `ad_personalization`. Basic: i tag Google non partono prima della scelta e non inviano nulla; Google modella le conversioni Ads con un modello generale. Advanced: i tag partono subito e con consenso negato inviano misure senza cookie; il modello è specifico dell'inserzionista. Le soglie per il modeling si leggono nella Diagnostica dell'account, non si citano.
**Evidenza:** [P] https://developers.google.com/tag-platform/security/guides/consent e https://developers.google.com/tag-platform/security/concepts/consent-mode (senza data sulla pagina, lette il 2026-11-04).
**Quando non vale:** dice cosa fa la tecnica, non se Advanced è lecito per quel cliente: quella è una decisione di base giuridica (`gdpr-marketing-consent`, compliance-rights-officer).
**Cliente/progetto:** generale

## [2026-11-04] GA4 e Google Ads dal 2026-06-15: il Consent Mode è l'unico controllo

**Pattern:** dal 2026-06-15 Google Analytics usa il Consent Mode di Google Ads come unico controllo per raccogliere i cookie e gli ID di Google Ads dal tag GA4. Google Signals regola solo l'associazione ai dati degli utenti collegati per i report comportamentali. La personalizzazione annunci passerà al segnale `ad_personalization` più avanti nel 2026, date non ancora comunicate. Dopo il cambio, controlla la dimensione delle audience di remarketing nate in GA4.
**Evidenza:** [P] Google Analytics Help, «Updates to Google Analytics Data Controls», https://support.google.com/analytics/answer/17016975 (senza data in vista, letta il 2026-11-04). La pagina dice «Consent Mode (within Google Ads)» e non nomina `ad_storage`: non attribuirle quella parola.
**Quando non vale:** proprietà senza collegamento a Google Ads. La parte sulla personalizzazione è un annuncio, non ancora in vigore.
**Cliente/progetto:** generale

## [2026-11-04] GA4: «key event» e «conversione» sono due cose

**Pattern:** in GA4 gli eventi importanti si chiamano key events; «conversione» è l'azione usata per misurare le campagne e ottimizzare il bidding, allineata a Google Ads. Nel QA scrivi quale delle due stai contando.
**Evidenza:** [P] Analytics Help, «Conversions vs. key events», https://support.google.com/analytics/answer/13965727 (letta il 2026-11-04).
**Quando non vale:** report e documenti di clienti che usano ancora «conversioni GA4»: traduci, non correggere il cliente.
**Cliente/progetto:** generale

## [2026-11-04] Customer Match e conversioni offline: nuovi progetti su Data Manager API

**Pattern:** per Customer Match e conversioni offline Google ha limitato la Google Ads API dal 2026-04-01 e dal 2026-06-15 ai developer token che non l'avevano usata nelle finestre indicate (errore `CUSTOMER_NOT_ALLOWLISTED_FOR_THIS_FEATURE`). Un nuovo cliente o progetto parte dalla Data Manager API; un'integrazione già attiva va controllata caso per caso prima di dire che è chiusa.
**Evidenza:** [P] https://developers.google.com/google-ads/api/docs/deprecations (letta il 2026-11-04). Sulla stessa pagina: developer token deprecati a favore dei progetti Google Cloud, sospensione indicata al 2026-09-09.
**Quando non vale:** la regola «chi aveva traffico resta fuori» è una lettura della finestra, non una frase di Google.
**Cliente/progetto:** generale

## [2026-11-04] Data Manager API: consenso facoltativo nel payload, hash SHA-256 ancora richiesto

**Pattern:** nell'oggetto `Consent` i campi `adUserData` e `adPersonalization` sono «Optional»: un upload senza stato di consenso passa. Mandarlo è una scelta nostra, da decidere con la base giuridica scritta (regola 16). I dati cliente si normalizzano e si passano in SHA-256 prima dell'upload, finché la documentazione dice così.
**Evidenza:** [P] https://developers.google.com/data-manager/api/reference/rest/v1/Consent (letta il 2026-11-04); verifica del 2026-11-04: nessuna pagina Google conferma la fine dell'obbligo di hash.
**Quando non vale:** se la documentazione Google cambia sull'hash, rileggila prima di toccare una pipeline.
**Cliente/progetto:** generale

## [2026-11-04] Meta Conversions API: deduplicazione ed EMQ

**Pattern:** pixel e server si deduplicano se `eventID` del pixel = `event_id` del server e `event` = `event_name`, entro 48 ore dal primo evento ricevuto con quell'ID. In alternativa Meta accetta `external_id` + `fbp`. Event Match Quality: punteggio su 10, solo eventi web, si legge in Events Manager. La pagina non dà una soglia minima: i «6+» o «8+» che circolano sono regole di agenzia.
**Evidenza:** [P] https://developers.facebook.com/docs/marketing-api/conversions-api/deduplicate-pixel-and-server-events e https://developers.facebook.com/docs/marketing-api/conversions-api/best-practices (lette il 2026-11-04).
**Quando non vale:** eventi offline, negozio, app e lead: EMQ non disponibile, Meta rimanda al referente.
**Cliente/progetto:** generale

## [2026-11-04] Meta reporting: finestre e click-through cambiati nel 2026

**Pattern:** dal 2026-01-12 l'Insights API non restituisce più `7d_view` e `28d_view`; breakdown con conteggi unici e orari fino a 13 mesi, per frequenza fino a 6. Da marzo 2026 il click-through conta solo i clic sul link; salva e condividi passano a «engage-through»; la soglia di visione video scende da 10 a 5 secondi. Non confrontare serie prima e dopo senza dirlo.
**Evidenza:** [P] https://developers.facebook.com/blog/post/2025/10/16/ads-insights-api-metric-availability-updates/ ; [P] https://www.facebook.com/business/news/click-attribution (2026-03-03).
**Quando non vale:** il rollout di marzo non è partito per tutti lo stesso giorno: controlla la data nell'account.
**Cliente/progetto:** generale

## [2026-11-04] Privacy Sandbox: non costruirci sopra

**Pattern:** Topics, Protected Audience e Attribution Reporting sono stati ritirati da Google il 2025-10-17. Chrome mantiene la scelta dell'utente sui cookie di terze parti. Il consenso UE non cambia.
**Evidenza:** [P] https://privacysandbox.google.com/blog/update-on-plans-for-privacy-sandbox-technologies (2025-10-17).
**Quando non vale:** riguarda solo quelle API di Chrome e Android; Consent Mode e modeling di Google non sono toccati. Se Google annuncia sostituti, rileggi.
**Cliente/progetto:** generale

## [2026-11-04] Strumenti open source per MMM e geo test: stato

**Pattern:** Meridian (Google) è attivo: tag v2.1.0 del 2026-09-24, PyPI `google-meridian` 2.1.0, ultimo commit su main 2026-11-03. Robyn (Meta) è fermo: release v3.12.0 del 2024-12-19, ultimo commit su main 2025-06-27, non archiviato. GeoLift (Meta): ultima release v2.6.06 del 2023-05-19, ultimo commit su main 2026-04-01, non archiviato. Per un MMM nuovo si parte da Meridian; Robyn solo per riprendere un modello già esistente.
**Evidenza:** [P] GitHub google/meridian, facebookexperimental/Robyn, facebookincubator/GeoLift, via `gh api` il 2026-11-04.
**Quando non vale:** il ramo predefinito di Robyn non è main e ha push nel 2026 su rami non esaminati. L'attività di un repository non dice la qualità del modello.
**Cliente/progetto:** generale

## Da verificare

(ipotesi non ancora dimostrate)
