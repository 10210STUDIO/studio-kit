# Playbook — brand-identity-designer

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

- **Glifi con contropunzoni: costruirli per sottrazione booleana** (contorno esterno meno aperture), non per unione di anelli coincidenti. L'unione lascia spigoli e punte dove i contorni si toccano. (verificato su un glifo di un marchio, 2026-10)
- **Favicon sotto i 48 px: griglie pixel disegnate a 16/24/32**, non il vettore scalato. Aste più spesse, barra almeno 2 px. Il 48 e l'apple-touch vengono dal master. Un assert nel build verifica le misure dentro il .ico. (2026-10)
- **Read comprime le immagini.** Prima di giudicare sfaccettature o curve rotte, ritaglia e ingrandisci la zona con PIL. Spesso il difetto è solo compressione. (2026-10)
- **Brand book 16:9 leggibile da esterni: HTML generato da script e render Playwright**, con un controllo automatico prima dei PNG/PDF: testo sotto i 22 px, etichette maiuscole sotto i 14 px, elementi oltre i margini della pagina. I mockup (post, homepage, deck) si disegnano a misura reale e si scalano con CSS `zoom` dentro un contenitore `.mock`: il loro contenuto è escluso dal controllo dei corpi, il contenitore no. (2026-10)
- **Mockup bianchi su pagina bianca: sempre un filetto attorno**, altrimenti si leggono come parte della pagina e il logotipo sembra ripetuto. (2026-10)
- **Segnaposto foto con id e misura in px nel riquadro**, più un dizionario id → file e un elenco generato (`foto_segnaposto.md`). Così le foto si sostituiscono senza toccare l'impaginazione. Confronta le proporzioni dei riquadri con la shot list prima dello shooting. (2026-10)
- **Usi scorretti: i marcatori "No" sono neri, mai rossi**, e le regole che vietano una figura (per esempio una parola con una lettera evidenziata) si scrivono senza disegnarle. Disegnarle diffonde proprio la figura vietata. (2026-10)
- **Foto AI nei mockup: etichetta "Esempio di stile · immagine AI" su ogni mockup, a corpo di lettura**, mai solo una dichiarazione generale in piccolo. Un mockup con foto AI non porta righe "Case / Objective / Result": anche vuote, fanno leggere la foto come un caso reale. (QA, 2026-10)
- **Etichette dati: niente monospaziato maiuscolo spaziato.** Il cliente lo legge come "font da AI". Le etichette si fanno con il carattere principale: larghezza normale, peso un gradino sopra il testo, maiuscolo +6%, cifre tabellari. Prima di ricalibrare il corpo, misura cap height e larghezza con fontTools: in un caso il grotesk principale e il mono avevano cap height quasi uguale (0,686 contro 0,698 em), quindi il corpo restava a 14 px. Cambiava solo la larghezza (−22% sulla stessa riga). (2026-11)

## [2026-11-04] Screening del segno: TMview e WIPO Global Brand Database

**Pattern:** TMview: icona della fotocamera; JPEG, PNG, GIF o TIFF, oltre 100×100 px, massimo 2 MB; l'immagine si combina con nome o numero del marchio; la casella «Colour» serve solo per i marchi di colore. Dal 15/5/2023 include le immagini dei TM5 extra UE (CNIPA, JPO, KIPO, USPTO). WIPO Global Brand Database: «Find by brand logo» nel menu in alto (jpg, png, webp); nella ricerca avanzata il campo «Vienna classification» e il link «Vienna assistant».
**Evidenza:** [P] guida TMview su tmdn.org; EUIPO, https://www.euipo.europa.eu/en/news/ai-at-euipo-in-house-image-search-in-tmview-extended-to-all-tm5-offices; FAQ WIPO e applicazione branddb.wipo.int aperta nel browser. Letti il 2026-11-04. Per aprirle: EUIPO dà 403 con WebFetch e si legge con curl e user-agent da browser; l'app WIPO è JavaScript e serve `playwright-cli`.
**Quando non vale:** è screening, non parere: la somiglianza la valutano `compliance-rights-officer` e il consulente. Non è verificata l'affidabilità sui logotipi solo tipografici. Il campo Vienna esiste, ma non è stato provato con un codice reale. Riverificare formati e copertura sopra i 90 giorni.
**Cliente/progetto:** generale.

## [2026-11-04] Segno generato con AI: tutela d'autore incerta

**Pattern:** per ogni segno toccato da un generatore tieni un registro dell'apporto umano (schizzi, scelte fra candidati, correzioni vettoriali, versioni scartate, con data) e passa da `compliance-rights-officer` prima di promettere esclusiva al cliente.
**Evidenza:** [P] Italia: L. 23/9/2025 n. 132, art. 25 (in vigore dal 10/10/2025), modifica l'art. 1 della L. 633/1941: sono protette le «opere dell'ingegno umano [...] anche laddove create con l'ausilio di strumenti di intelligenza artificiale, purché costituenti risultato del lavoro intellettuale dell'autore» (https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:legge:2025-09-23;132~art25). USA: US Copyright Office, *Copyright and Artificial Intelligence, Part 2*, gennaio 2025: «prompts do not alone provide sufficient control»; «The use of AI tools to assist rather than stand in for human creativity does not affect the availability of copyright protection for the output» (https://www.copyright.gov/ai/Copyright-and-Artificial-Intelligence-Part-2-Copyrightability-Report.pdf). Letti il 2026-11-04.
**Quando non vale:** il rapporto USCO è il parere di un ufficio federale, non una sentenza, e non vale in Italia. L'art. 25 non fissa una soglia di apporto; giurisprudenza italiana e art. 26 non letti. La tutela come marchio registrato è un'altra questione, non verificata qui: la decidono compliance e il consulente. Non serve per segni disegnati interamente a mano.
**Cliente/progetto:** generale.

## [2026-11-04] Contrasto nel brand book: WCAG 2.2, non 3.0

**Pattern:** il contrasto delle coppie testo/fondo si misura su WCAG 2.2 livello AA (criteri 1.4.3 per il testo, 1.4.11 per gli elementi non testuali); le soglie si leggono sul W3C a ogni progetto.
**Evidenza:** [P] https://www.w3.org/standards/history/wcag-3.0/: WCAG 3.0 è «Working Draft», ultima pubblicazione 10 settembre 2026, nessuna Candidate Recommendation. Letto il 2026-11-04.
**Quando non vale:** «WCAG 2.2 AA obbligatorio per legge» non è sostenuto da fonti ufficiali al 2026-11-04: non scriverlo al cliente come obbligo. Gli obblighi li dice `accessibility-compliance`.
**Cliente/progetto:** generale.

## [2026-11-04] Token di palette e scala in formato DTCG

**Pattern:** la palette e la scala tipografica si possono consegnare anche come file token DTCG 2025.10, con il colore in `oklch` accanto ai valori per la stampa.
**Evidenza:** [P] https://www.designtokens.org/: «First stable version 2025.10». https://www.designtokens.org/tr/2025.10/color/: «Final Community Group Report 28 October 2025», «This specification is considered stable»; fra gli spazi colore c'è `oklch`. Letti il 2026-11-04. Corregge il report di ricerca, che chiamava il modulo colore una bozza.
**Quando non vale:** è un report di un Community Group del W3C, non una Recommendation. Non è verificato che gli strumenti di `ui-designer` lo leggano: chiederlo prima di consegnare solo token. Non sostituisce i riferimenti colore per la stampa.
**Cliente/progetto:** generale.

## [2026-11-04] Licenza dei font variabili: tre voci da leggere

**Pattern:** nella licenza di un carattere variabile cerca tre cose separate: se il file variabile è incluso; se puoi generare istanze; se puoi estrarre istanze statiche o convertire formati (per esempio da desktop a web). La lettura passa da `rights-licensing-clearance`.
**Evidenza:** [P] BAL Foundry, EULA v1.0, marzo 2026, §14 (https://www.bal-foundry.com/eula): «For Variable Font formats, the use and generation of instances within the permitted licensed scope is allowed»; sono vietate la conversione da formato desktop a web e la creazione di derivati dal sistema di variazione. Letto il 2026-11-04. [S] Da una ricerca dello stesso giorno: altre fonderie includono il variabile con la famiglia completa (FAQ di The Foundry Types, non letta direttamente).
**Quando non vale:** è una fonderia sola: ogni EULA è diversa, si legge quella del carattere scelto.
**Cliente/progetto:** generale.

## Da verificare

(ipotesi non ancora dimostrate)
