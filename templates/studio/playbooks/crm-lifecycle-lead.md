# Playbook — crm-lifecycle-lead

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-11-04] Gmail: requisiti per mittenti da 5.000 messaggi al giorno

**Pattern:** sopra 5.000 messaggi al giorno verso Gmail servono SPF, DKIM e DMARC e la disiscrizione a un clic (header `List-Unsubscribe-Post: List-Unsubscribe=One-Click` più `List-Unsubscribe`, RFC 8058). Tasso di spam in Postmaster Tools da tenere sotto 0,10%, e da non far mai arrivare a 0,30%.
**Evidenza:** [P] Google, Email sender guidelines, https://support.google.com/a/answer/81126 e FAQ https://support.google.com/a/answer/14229414. Frase: "Keep spam rates reported in Postmaster Tools below 0.10% and avoid ever reaching a spam rate of 0.30% or higher." FAQ: "Starting November 2025, Gmail is ramping up its enforcement on non-compliant traffic", con rifiuti temporanei e permanenti.
**Quando non vale:** sotto i 5.000 al giorno le regole di autenticazione sono comunque buona pratica, ma la soglia formale non scatta. Il tempo di gestione delle disiscrizioni (2 giorni) NON è scritto da Gmail nella pagina letta: è di Yahoo. Non attribuirlo a Gmail.
**Cliente/progetto:** generale

## [2026-11-04] Yahoo: requisiti per mittenti di massa

**Pattern:** tasso di spam sotto 0,3%; SPF e DKIM; DMARC almeno `p=none`; header list-unsubscribe con one-click; link di disiscrizione visibile nel corpo; disiscrizioni onorate entro 2 giorni.
**Evidenza:** [P] Yahoo Sender Hub, https://senders.yahooinc.com/best-practices/. Frasi: "Honor unsubscribes within 2 days"; il metodo POST (RFC 8058) è "highly recommended", il `mailto:` è "acceptable".
**Quando non vale:** la soglia dei 5.000 invii al giorno non compare nel testo letto. Per Yahoo la pagina non la dichiara: non scriverla come regola Yahoo.
**Cliente/progetto:** generale

## [2026-11-04] Microsoft (Outlook.com): Junk oggi, rifiuto annunciato senza data

**Pattern:** per Outlook.com e per i domini sopra 5.000 invii al giorno servono SPF, DKIM e DMARC. Dal 2025-05-05 i messaggi non conformi vanno in Junk. Microsoft ha annunciato il rifiuto, con errore `550 5.7.515 Access denied, sending domain [SendingDomain] does not meet the required authentication level`. Data del rifiuto: da annunciare. Con il cliente: trattare 5.7.515 come errore possibile, non come errore già attivo.
**Evidenza:** [P] Microsoft Tech Community, post del 2025-04-02 aggiornato il 2025-04-29, https://techcommunity.microsoft.com/blog/microsoftdefenderforoffice365blog/strengthening-email-ecosystem-outlook%E2%80%99s-new-requirements-for-high%E2%80%90volume-senders/4399730
**Quando non vale:** non so se il rifiuto sia già attivo (la pagina non lo dice). Se un cliente vede 5.7.515 nei bounce, è già attivo per lui: correggi l'autenticazione prima di cercare altre cause.
**Cliente/progetto:** generale

## [2026-11-04] One-click unsubscribe (RFC 8058): come si implementa

**Pattern:** `List-Unsubscribe` con un URI HTTPS e `List-Unsubscribe-Post: List-Unsubscribe=One-Click`; entrambi gli header coperti dalla firma DKIM; la disiscrizione avviene con un HTTPS POST. Verificalo in un invio reale, leggendo gli header del messaggio ricevuto.
**Evidenza:** [P] RFC 8058 (gennaio 2017), https://www.rfc-editor.org/rfc/rfc8058. "MUST be covered by the signature"; senza firma valida il ricevente "SHOULD NOT offer a one-click unsubscribe".
**Quando non vale:** Yahoo accetta anche il solo `mailto:`; Gmail chiede gli header one-click per i mittenti sopra soglia. La RFC non dice quali provider lo impongano: per quello valgono le voci di Gmail, Yahoo e Microsoft.
**Cliente/progetto:** generale

## [2026-11-04] Le aperture non sono una metrica (Apple Mail Privacy Protection)

**Pattern:** non decidere oggetti, segmenti o vincitori di test sull'open rate. Si usano click unici sul link di azione, ordini, ricavo per destinatario. Un crollo improvviso delle aperture serve solo come segnale diagnostico di consegna.
**Evidenza:** [P] Apple, annuncio del giugno 2021, https://www.apple.com/newsroom/2021/06/apple-advances-its-privacy-leadership-with-ios-15-ipados-15-macos-monterey-and-watchos-8/ : la funzione "helps users prevent senders from knowing when they open an email" e "masks their IP address". Quota di aperture MPP sulla lista di ogni cliente: non misurata.
**Quando non vale:** liste quasi tutte non-Apple (B2B con client desktop aziendali) avranno aperture meno distorte, ma il segmento si deve verificare prima di fidarsi. I click possono essere gonfiati da scanner di sicurezza aziendali: mai un solo segnale.
**Cliente/progetto:** generale

## [2026-11-04] Garante privacy: email commerciali a persone fisiche = consenso

**Pattern:** per l'invio promozionale a una persona fisica, anche in contesto professionale, serve il consenso (art. 130 Codice privacy). Contratto e legittimo interesse non bastano. Il soft opt-in (comma 4) vale solo per prodotti o servizi simili a quelli già acquistati, e il suo uso va confermato con `compliance-rights-officer`. Prima di ogni lista: base scritta (regola 16 di STUDIO.md).
**Evidenza:** [P] Garante, provv. n. 285 del 17.4.2026, doc-web 10252188, https://www.garanteprivacy.it/home/docweb/-/docweb-display/docweb/10252188 : il trattamento "non può essere fondato sul contratto o su legittimo interesse del titolare, ma unicamente sul consenso dell'interessato."
**Quando non vale:** è un caso singolo (società Aesir, destinatario un avvocato), non una linea guida generale. L'ammonimento e i 1.000 euro riguardavano gli artt. 12 e 15 GDPR (diritti dell'interessato), non l'invio in sé. Si usa come indicazione di orientamento: la valutazione di una lista concreta è di `compliance-rights-officer`.
**Cliente/progetto:** generale

## [2026-11-04] BIMI: logo nella casella, solo con DMARC applicato e certificato

**Pattern:** BIMI si propone solo se il dominio ha DMARC `p=quarantine` o `p=reject` con `pct=100`, e il cliente ha un certificato: VMC (logo registrato come marchio) oppure CMC (senza marchio registrato). Il `p=none` non è supportato. Per Gmail il record punta a un file PEM, non a un SVG standalone. Dopo il record possono servire fino a 48 ore.
**Evidenza:** [P] Google Workspace Help, "Set up BIMI", https://support.google.com/a/answer/10911320 (ora su knowledge.workspace.google.com), "Last updated 2026-10-26 UTC". "The policy option (p) must be set to quarantine or reject." "The percent option (pct) must be set to 100." VMC consigliato; SVG minimo 96 px, file consigliato 32 KB o meno.
**Quando non vale:** costo e tempi dei certificati non verificati; la registrazione del marchio per il VMC può richiedere molto tempo e dipende dal cliente. Alzare il DMARC da `none` a `quarantine` senza leggere prima i report aggregati può bloccare invii legittimi (vedi skill).
**Cliente/progetto:** generale

## Da verificare

(ipotesi non ancora dimostrate)
