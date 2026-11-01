# Playbook — compliance-rights-officer

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-10-28] Naming check: cercare anche la pronuncia, non solo la stringa

**Pattern:** per nomi numerici o stilizzati, cercare nei registri anche la forma parlata e quella scritta in lettere (es. "7x7" -> "seven by seven", "7by7", "7/7"). La stringa esatta può risultare libera mentre la pronuncia collide nella stessa classe.
**Evidenza:** su TMview la ricerca esatta di un nome stilizzato ha dato 0 risultati. La variante compatta in lettere ha trovato un marchio registrato in classe 35 da un'agenzia di marketing, e la forma parlata altri marchi in classe 35 in due paesi UE. Valgono come anteriorità contro un marchio UE (art. 8 del Reg. UE 2017/1001 — **da verificare**: articolo non riletto su EUR-Lex nella revisione del 2026-11-01).
**Quando non vale:** quando il brand non comunica mai la pronuncia. Il rischio scende ma non sparisce.
**Cliente/progetto:** generale.

## [2026-10-28] Strumenti: cosa si raggiunge dai registri e cosa no

**Pattern:** TMview funziona via `playwright-cli` con URL `#/tmview/results?criteria=I|C|F&basicSearch=...` (I = esatto, F = fuzzy). Il dettaglio da TMview spesso fallisce: aprire EUIPO eSearch `#details/trademarks/<num>` nel browser. OEPM, la pagina tariffe EUIPO e uibm.mimit.gov.it danno 403 o problemi DNS. Le tariffe UIBM sono su `uibm.mise.gov.it/index.php/it/tasse-e-tariffe/costi-marchi`. Le tariffe EUTM si verificano sull'allegato I del Reg. 2017/1001 su EUR-Lex (via browser: curl restituisce un file vuoto).
**Evidenza:** sessione del 2026-10-28.
**Quando non vale:** quando le URL cambiano. Riverificare dopo 90 giorni.
**Cliente/progetto:** generale.

## [2026-10-28] Font OFL: verifica in 3 passi

**Pattern:** 1) confrontare `OFL.txt` upstream con quello di google/fonts; 2) cercare "with Reserved Font Name" nella riga di copyright; 3) leggere la tabella `name` del TTF (ID 7 = marchio, ID 13 = licenza). Basta python con struct, se fontTools non è installato.
**Evidenza:** due famiglie Google Fonts verificate: OFL 1.1, nessuna RFN, nomi registrati come marchi dei progettisti.
**Quando non vale:** per font commerciali (EULA) serve leggere la licenza del rivenditore.
**Cliente/progetto:** generale.

## [2026-10-31] Entità legale: riverificare il registro delle imprese a ogni parere, non fidarsi del "è attiva"

**Pattern:** prima di approvare footer o informativa che nominano una società, aprire la sua pagina nel registro delle imprese del paese e lo storico dei depositi. Esempio per una Ltd del Regno Unito: Companies House e filing history (curl + sed bastano); cercare "proposal to strike off", "GAZ1", "Accounts overdue". Dopo la prima Gazette lo scioglimento può arrivare dopo 2 mesi (CA 2006 s1000(3), [legislation.gov.uk](https://www.legislation.gov.uk/ukpga/2006/46/section/1000), verificato il 2026-11-01).
**Evidenza:** in un caso reale il brief dava per attiva una società che il registro delle imprese mostrava in cancellazione d'ufficio, con bilanci non depositati.
**Quando non vale:** i segnali da cercare cambiano da registro a registro: quelli sopra valgono solo per Companies House.
**Cliente/progetto:** generale.

## [2026-10-31] Tracker sul sito live: crawl con playwright run-code

**Pattern:** `run-code` con `page.on('request')` per raccogliere gli host, poi `context().cookies()` e localStorage/sessionStorage per pagina. Usare `waitUntil: 'load'`: con video in pagina `networkidle` va in timeout. EUR-Lex: `innerText` con gli spazi normalizzati, poi `indexOf` sulla frase esatta.
**Evidenza:** 16 pagine di un sito in circa 2 minuti; EUR-Lex via WebFetch restituiva una pagina vuota.
**Quando non vale:** siti con banner che bloccano prima del consenso (serve un giro con consenso e uno senza).
**Cliente/progetto:** generale.

## [2026-10-31] Claim su un periodo non ancora chiuso

**Pattern:** se il dato è stato letto prima della fine del mese o dell'anno citato, il claim deve dire i giorni ("1–30 ottobre"), altrimenti confronta un periodo parziale con uno intero.
**Evidenza:** un dato "mese +50%" era stato letto l'ultimo giorno del mese, prima della chiusura.
**Quando non vale:** quando la fonte confronta già gli stessi giorni e lo dichiara.
**Cliente/progetto:** generale.

## Da verificare

(ipotesi non ancora dimostrate)
