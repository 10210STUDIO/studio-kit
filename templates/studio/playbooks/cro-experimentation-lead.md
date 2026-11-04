# Playbook — cro-experimentation-lead

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-11-04] SRM: controllo di salute obbligatorio prima di leggere un test

**Pattern:** dopo le prime 24 ore e a fine test, test chi-quadro fra i conteggi per variante e lo split previsto. Con SRM il risultato non si legge: si cerca la causa in uno dei quattro passaggi (assegnazione, esecuzione della variante, raccolta ed elaborazione dei log, filtri dell'analisi). Se lo SRM compare solo il primo giorno e poi sparisce, la causa è di solito legata al tempo (cache, partenza ritardata di una variante).
**Evidenza:** [P] Fabijan et al., «Diagnosing Sample Ratio Mismatch in Online Controlled Experiments», KDD 2019, https://exp-platform.com/Documents/2019_KDDFabijanGupchupFuptaOmhoverVermeerDmitriev.pdf (letto il 2026-11-04): circa il 6% degli esperimenti Microsoft dell'ultimo anno mostrava uno SRM; circa il 10% delle analisi «triggered» su LinkedIn. Il paper indica il chi-quadro per rilevarlo.
**Quando non vale:** i numeri sono di piattaforme enormi, non la frequenza attesa per i clienti di {{STUDIO}}. Con pochissimo traffico nelle prime 24 ore il chi-quadro ha poca potenza: un controllo pulito non esclude lo SRM, ripetilo a fine test. Nei disegni senza randomizzazione per utente (geo, switchback) non si applica così.
**Cliente/progetto:** generale.

## [2026-11-04] Strumenti di test: chi esiste ancora

**Pattern:** non raccomandare Statsig o Eppo come prodotti autonomi. Per clienti piccoli: GrowthBook o i test nativi della piattaforma in uso, dopo averne letto il metodo statistico.
**Evidenza:** [P] Statsig: accordo con OpenAI firmato il 2025-09-02; dal 2026-05-05 prodotto, marchio e clienti sono passati ad Amplitude, mentre il team originale è rimasto in OpenAI (nota sul post https://www.statsig.com/blog/openai-acquisition). [P] Eppo acquisita da Datadog il 2025-05-05 (https://www.datadoghq.com/about/latest-news/press-releases/datadog-acquires-eppo-to-expand-its-ai/); il prodotto è diventato Datadog Experiments il 2026-04-02 (https://www.datadoghq.com/about/latest-news/press-releases/datadog-experiments-launches/). [P] GrowthBook: repository github.com/growthbook/growthbook non archiviato, release v5.2.0 del 2026-11-03 (API GitHub, letta il 2026-11-04).
**Quando non vale:** stato al 2026-11-04, riverificare sopra i 90 giorni. «Mantenuto» non dice nulla su licenza, costi o adeguatezza: la licenza GrowthBook va letta nel repository (l'API non la riconosce come licenza standard). Prezzi e confronti dei vendor non si usano.
**Cliente/progetto:** generale.

## [2026-11-04] Accessibilità nel friction audit: obbligo EAA in Italia

**Pattern:** nel friction audit di un e-commerce B2C l'accessibilità di checkout e moduli è un difetto da correggere, non un'ipotesi da testare. Se c'è un obbligo di legge, il punto va a `accessibility-compliance` prima di qualunque promessa al cliente.
**Evidenza:** [P] D.Lgs. 82/2022 (recepisce la direttiva 2019/882), obblighi efficaci dal 28.6.2025 (art. 25). Le microimprese che forniscono servizi sono esentate (art. 3 c. 3). Sanzioni da 5.000 a 40.000 euro (art. 24). Il 28.6.2030 vale solo per servizi che usano prodotti già in uso e per contratti preesistenti (art. 25), non è un rinvio generale. Linee guida AgID: determinazione n. 38/2026 del 4.3.2026, GU n. 69 del 24.3.2026; richiamano EN 301 549 v3.2.1 e WCAG 2.1 AA. Fonte: normattiva.it e gazzettaufficiale.it, verificato il 4.11.2026. La EN 301 549 v4.1.1 (settembre 2026, su WCAG 2.2 AA) non è ancora il riferimento legale (AccessibleEU, 7.9.2026): per i lavori nuovi WCAG 2.2 AA è la scelta prudente, non un obbligo verificato.
**Quando non vale:** microimprese che forniscono servizi. Siti che non rientrano fra i servizi coperti: il perimetro lo decide `accessibility-compliance`, non tu. Non si dice a un cliente «sei conforme» o «sei esente» sulla base di questa voce.
**Cliente/progetto:** generale.

## Da verificare

(ipotesi non ancora dimostrate)
