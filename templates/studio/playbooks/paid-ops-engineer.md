# Playbook — paid-ops-engineer

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-11-04] Meta: Advantage+ è definito da tre leve

**Pattern:** una campagna è Advantage+ (sales, leads, app) solo se budget a livello campagna, Advantage+ audience (o nessun targeting oltre a `geo_locations`) e Advantage+ placement (nessuna restrizione o esclusione di placement, restano le esclusioni a livello account) sono tutte attive. Se una è spenta, `advantage_state` risulta `DISABLED`: è una campagna manuale con lo stesso obiettivo. ASC/AAC legacy: da v24.0 non si creano, da v25.0 le non migrate sono bloccate salvo eccezioni, da v26.0 nessuna modifica. Si migrano, e la migrazione riavvia l'apprendimento: avvisa {{TITOLARE}} prima. Le AAC si migrano ma non si copiano; le ASC con `existing_customer_budget_percentage` non si migrano via API; le ASC con più di 50 ad per ad set non si migrano affatto.
**Evidenza:** [P] Meta, Marketing API, Advantage campaigns (pagina senza data, letta il 2026-11-04). La data di rilascio di v24.0 (2025-10-08) viene solo da [S].
**Quando non vale:** la pagina cambia a ogni versione dell'API: rileggila prima di ogni migrazione. Non copre le campagne create da Ads Manager senza API.
**Cliente/progetto:** generale.

## [2026-11-04] Meta: apprendimento, circa 50 risultati per ad set in 7 giorni

**Pattern:** un ad set esce di solito dall'apprendimento dopo circa 50 risultati nella settimana successiva all'ultima modifica significativa. Per le Shops ads servono almeno 17 acquisti sul sito e 5 su Meta. Consolida gli ad set invece di segmentarli sotto questo volume.
**Evidenza:** [P] Meta Business Help Center, «About the learning phase» (facebook.com/business/help/112167992830700, senza data, letta il 2026-11-04). La pagina dice «results», non «optimization events». «Budget minimo = costo per risultato × 50» è una regola di terzi, non di Meta: non usarla come regola. Per Google non ho trovato una soglia ufficiale di conversioni per campagna: non ne scrivo una.
**Quando non vale:** «circa» e «di solito»: non è una soglia contrattuale. Non si applica a Google, TikTok, LinkedIn.
**Cliente/progetto:** generale.

## [2026-11-04] Meta: reporting cambiato il 2026-01-12 e a marzo 2026

**Pattern:** non confrontare i numeri Meta di prima e dopo queste date, e mettile nel log delle modifiche. Dal 2026-01-12 l'Insights API non restituisce più le finestre `7d_view` e `28d_view`; restano 1d/7d/28d click, 1d engaged view, 1d view. I breakdown con conteggi unici e quelli orari arrivano a 13 mesi, quelli per frequenza a 6: esporta ogni mese ciò che ti serve. Da marzo 2026 il click-through conta solo i clic sul link; le conversioni da condivisioni, salvataggi e altri clic non sul link passano a «engaged-view», rinominata «engage-through», e la soglia di engaged view dei video scende da 10 a 5 secondi. La fatturazione non cambia.
**Evidenza:** [P] Meta for Developers, blog 2025-10-16 (ads-insights-api-metric-availability-updates); [P] Meta, annuncio 2026-03-03 (facebook.com/business/news/click-attribution). L'annuncio dice che la modifica parte «later this month», non per tutti lo stesso giorno.
**Quando non vale:** i totali dei campi API non cambiano e restano a 37 mesi. Non ho confermato sulla pagina di marzo la finestra «1 giorno» per engage-through (la finestra `1d_ev` esiste nell'API, ma l'equivalenza no).
**Cliente/progetto:** generale.

## [2026-11-04] Meta: annunci simili contano come una sola creatività

**Pattern:** prima di caricare molte varianti verifica se l'account ha gli insight di similarità. Cambiare solo testo o call to action è iterazione, non diversificazione: Meta tratta annunci con aspetto e tema simili come varianti della stessa creatività, con apprendimento condiviso. Meta non pubblica soglie numeriche (40%, 60% sono di terzi).
**Evidenza:** [P] Meta for Business, «Demystifying creative diversification», 2025-12-16.
**Quando non vale:** gli insight creativi erano «in test»: possono non esserci nell'account.
**Cliente/progetto:** generale.

## [2026-11-04] Meta: Aggregated Event Measurement non richiede più configurazione sul web

**Pattern:** per le campagne di conversione sul sito non pianificare più il lavoro di priorità degli eventi per dominio. Non promettere al cliente che «senza verifica del dominio perdi l'ottimizzazione iOS».
**Evidenza:** [P] Meta Business Help, «Reach people using iOS 14.5 or later with Meta ads» (facebook.com/business/help/331612538028890, senza data, letta il 2026-11-04): «There are no actions you need to take to use Aggregated Event Measurement for website campaigns.»
**Quando non vale:** per le app (reengagement, promozione) la pagina chiede ancora di verificare l'idoneità o di configurare SKAdNetwork. Che il tab AEM sia sparito da Events Manager e che la verifica del dominio non serva più è in Da verificare.
**Cliente/progetto:** generale.

## [2026-11-04] Meta, TikTok, LinkedIn hanno API ufficiali: il browser è un ripiego

**Pattern:** per dati e operatività parti dall'API; `playwright-cli` solo per ciò che l'API non espone o finché non hai l'accesso. Meta: Marketing API (la documentazione descrive l'automazione degli annunci su Meta). LinkedIn: versioni mensili (oggi 202609), Conversions API, Matched Audiences API generalmente disponibile su richiesta di accesso dal Developer Portal da agosto 2026, massimo 1.000 segmenti DMP per account sponsorizzato (errore 429 oltre). Le versioni vecchie vanno in sunset (202511 il 2026-11-16): non fissare la versione.
**Evidenza:** [P] developers.facebook.com, Marketing API; [P] learn.microsoft.com, LinkedIn Marketing API, recent changes (letta il 2026-11-04); [P] business-api.tiktok.com/portal/docs esiste («TikTok API for Business»), ma i requisiti di accesso non sono verificati.
**Quando non vale:** richiede app, permessi e approvazioni, che il cliente può non avere: in quel caso il ripiego è lecito, ma in sola lettura salvo approvazione di {{TITOLARE}}.
**Cliente/progetto:** generale.

## [2026-11-04] Google: AI Max e Display cambiano ciò che è comprabile

**Pattern:** prima di mettere un tipo di campagna nel piano o nella struttura controlla lo stato nell'account. Google ha annunciato che AI Max esce dalla beta: da settembre 2026 le campagne con automatically created assets e broad match a livello di campagna passano ad AI Max; le Dynamic Search Ads passano da febbraio 2027. Display standalone si sposta in Demand Gen, migrazione prevista entro il 2027. Dopo settembre controlla campagna per campagna cosa è stato portato ad AI Max.
**Evidenza:** [P] blog.google, 2026-04-15 (aggiornato 2026-06-11); [P] blog.google, 2026-05-26 (Display → Demand Gen).
**Quando non vale:** è un piano annunciato: non so se l'upgrade di settembre sia già avvenuto in ogni account. Non scrivere «le campagne Display non si creano più» senza aver letto l'Help.
**Cliente/progetto:** generale.

## [2026-11-04] Google: Customer Match e conversioni offline partono dalla Data Manager API

**Pattern:** per Customer Match e conversioni offline Google ha limitato la Google Ads API dal 2026-04-01 e dal 2026-06-15 ai developer token che non l'avevano usata nelle finestre indicate; le richieste falliscono con `CUSTOMER_NOT_ALLOWLISTED_FOR_THIS_FEATURE`. Un nuovo cliente o progetto parte dalla Data Manager API; un'integrazione già attiva va controllata caso per caso prima di dire che è chiusa. L'hash SHA-256 resta obbligatorio: normalizza e fai l'hash prima dell'upload finché la documentazione non cambia. Il lavoro sulla Data Manager API è di `measurement-attribution-analyst` (skill `data-manager-api-*`): chiedi al lead. La base giuridica dell'upload la verifica `gdpr-marketing-consent`.
**Evidenza:** [P] Google Ads API, pagina deprecations (letta il 2026-11-04). Finestre: nessuna richiesta Customer Match fra 2025-10-01 e 2026-03-31; nessun upload offline fra 2025-12-17 e 2026-06-15.
**Quando non vale:** «chi aveva traffico nella finestra resta fuori dalla limitazione» è una mia lettura della finestra, non una frase di Google.
**Cliente/progetto:** generale.

## [2026-11-04] Google: Consent Mode, quattro segnali, e il cambio del 2026-06-15

**Pattern:** prima del lancio verifica che il gestore del consenso mandi ad_storage, analytics_storage, ad_user_data, ad_personalization. In Basic i tag Google non partono prima della scelta e non inviano nulla; in Advanced partono subito e, con consenso negato, inviano misure senza cookie e Google usa un modello specifico dell'inserzionista. Dal 2026-06-15 Google Analytics usa il Consent Mode di Google Ads come unico controllo per raccogliere i dati dal tag GA4; Google Signals regola solo l'associazione ai dati degli utenti collegati per i report comportamentali. Le audience di remarketing create in GA4 possono ridursi. La personalizzazione annunci passerà a `ad_personalization` più avanti nel 2026, con date non ancora comunicate.
**Evidenza:** [P] developers.google.com/tag-platform (guida al consenso e concetti), letta il 2026-11-04; [P] Google Analytics Help, «Updates to Google Analytics Data Controls» (support.google.com/analytics/answer/17016975). La pagina dice «Consent Mode (within Google Ads)»: che sia `ad_storage` è una deduzione ragionevole, non una frase di Google.
**Quando non vale:** per le soglie di modeling leggi la Diagnostica dell'account, non citare il numero dei 700 clic (non verificato). Il consenso e la sua base restano di `gdpr-marketing-consent`.
**Cliente/progetto:** generale.

## [2026-11-04] LinkedIn: Conversions API per cicli B2B lunghi

**Pattern:** manda via Conversions API gli eventi di CRM (lead qualificato, MQL, SQL). La finestra di attribuzione (post-click e view-through) dalla versione 202609 può essere 180 giorni **in aggiunta** alla 365: 180 è un'opzione più corta, il massimo resta 365. Vale per SUBMIT_APPLICATION, PURCHASE, ADD_TO_CART, QUALIFIED_LEAD, LEAD, MARKETING_QUALIFIED_LEAD, SALES_QUALIFIED_LEAD. Il lookback di 365 giorni è disponibile dalla 202505. MQL e SQL come tipi di conversione dalla 202608. Si può ottimizzare per lead qualificati con `MAX_QUALIFIED_LEAD` (dalla 202602). Dal 2026-03-16 i lead arrivano solo a webhook validati.
**Evidenza:** [P] learn.microsoft.com, LinkedIn Marketing API, recent changes, letta il 2026-11-04.
**Quando non vale:** per gli altri tipi di conversione i valori consentiti restano 1, 7, 30, 90 giorni. Gli eventi con dati personali richiedono base giuridica scritta.
**Cliente/progetto:** generale.

## Da verificare

(ipotesi non ancora dimostrate)
