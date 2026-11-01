---
name: martech-stack
description: Usa quando devi scegliere, collegare, ereditare o documentare uno stack di marketing technology: CRM, ESP, CDP, tag manager, analytics, piattaforme ads, identità del cliente, fonte unica di verità, integrazioni custom e debito tecnico.
---

# Stack martech

Uno stack martech non è una lista di tool: è un sistema di flussi di dati con una fonte di verità, un modello di identità e dei proprietari. Lo studio viene chiamato quasi sempre su uno stack già esistente, accumulato per stratificazione, dove nessuno sa più quale numero è quello giusto. Il lavoro è ridurre, chiarire e documentare, non aggiungere.

Principio guida: **ogni tool nuovo è un debito ricorrente** — canone, integrazione, manutenzione, formazione, rischio di conformità. Si giustifica solo se risolve un problema che qualcosa di già presente non risolve.

## Diagnosi prima di proporre

Non raccomandare nulla prima di aver prodotto la fotografia dell'esistente.

1. **Inventario**: ogni sistema in uso, con proprietario interno, piano e costo, chi ha accesso amministrativo, data di rinnovo.
2. **Mappa dei flussi**: per ogni coppia di sistemi, quali dati passano, in che direzione, con quale meccanismo (integrazione nativa, iPaaS, webhook, API custom, export CSV a mano), con quale frequenza, chi se ne accorge se si rompe.
3. **Mappa di misurazione**: dove nasce ogni numero che il cliente guarda, e quali sistemi dicono cose diverse sulla stessa metrica.
4. **Verifica sul campo**: non fidarti dell'inventario dichiarato. Ispeziona il contenitore del tag manager (tag attivi, tag in pausa, trigger duplicati, codice hardcoded nel tema oltre al tag manager), le proprietà analytics e i loro filtri, le conversioni configurate su ogni piattaforma ads e la loro fonte.
5. **Verifica di conformità**: base giuridica e consenso per ogni flusso che contiene dati personali. Vedi la skill dedicata al consenso: se non esiste, dichiara il buco e fermati prima di aggiungere flussi nuovi.

Chiudi la diagnosi con due liste: cosa è rotto (si ripara) e cosa è ridondante (si spegne). Lo spegnimento di un tool duplicato vale più dell'introduzione di uno nuovo.

## I livelli dello stack e cosa sceglie cosa

Scegli in questo ordine, perché ogni livello vincola i successivi.

1. **Sistema transazionale / di record** — e-commerce, gestionale, piattaforma di booking, fatturazione. È il luogo dove accadono gli ordini e i pagamenti, quindi è la verità sul fatturato. Non si sceglie per ragioni di marketing e non si sostituisce per comodità di marketing.
2. **CRM** — la verità sulle persone e sulle aziende e sullo stato della relazione. Serve davvero se c'è un processo di vendita con interazioni umane o un ciclo lungo; in e-commerce puro spesso il suo ruolo è già coperto dalla piattaforma e dall'ESP, e introdurlo aggiunge un terzo posto dove gli indirizzi email divergono.
3. **ESP / marketing automation** — la verità su cosa è stato inviato, consegnato, cliccato, e sullo stato di consenso e disiscrizione. Il criterio di scelta non è il numero di funzioni ma: qualità dell'integrazione nativa col sistema transazionale, modello di segmentazione comportamentale, reportistica a livello di flusso, gestione della deliverability, prezzo che scala col volume reale. Vedi `email-lifecycle-retention`.
4. **Tag management** — il punto di controllo unico del codice di terze parti sul sito. Nessun pixel installato fuori dal tag manager, mai, perché un pixel nel tema è invisibile all'audit successivo.
5. **Analytics** — la verità sul comportamento sul sito, e **non** sul fatturato. Serve per diagnosi e confronti interni, non per il conto dei soldi.
6. **CDP** — ultimo. Risolve un problema specifico: unificare identità e comportamento da più sorgenti e attivarli su più destinazioni. Si giustifica quando ci sono più sorgenti di dati di prima parte rilevanti, più destinazioni di attivazione e un volume che ripaga il canone. Se le sorgenti sono due e le destinazioni tre, l'integrazione nativa fa lo stesso lavoro a costo zero: non vendere una CDP per non dover fare l'ordine nei dati.
7. **Piattaforme ads** — a valle. Consumano eventi e audience, non generano verità. Il loro conteggio delle conversioni è una stima modellata con una propria finestra di attribuzione, e non va sommato fra piattaforme.

Prima di raccomandare un prodotto specifico, verifica con WebSearch lo stato attuale del mercato e con WebFetch la documentazione ufficiale su prezzi, limiti di piano, integrazioni disponibili e limiti di API. Non raccomandare per ricordo: i piani, i limiti di evento e le integrazioni cambiano in continuazione. Riporta la fonte e la data.

## Fonte unica di verità

Per ogni metrica che qualcuno guarda, **un solo sistema è la verità** e tutti gli altri sono copie o stime. Mettilo per iscritto e difendilo.

Assegnazione standard, da adattare e dichiarare:
- Fatturato, ordini, resi, margine → sistema transazionale.
- Stato della relazione commerciale, pipeline, proprietà del contatto → CRM, se esiste.
- Consenso, disiscrizioni, invii → ESP (o il sistema di consent management per la prova del consenso).
- Comportamento sul sito, percorsi, funnel → analytics.
- Spesa pubblicitaria → piattaforme ads. Conversioni attribuite → piattaforme ads, dichiarate come stima della piattaforma con la sua finestra, mai come fatturato.

Conseguenze operative:
- La somma delle conversioni dichiarate dalle piattaforme supera sistematicamente gli ordini reali, perché più piattaforme reclamano lo stesso ordine. Non sommarle mai e spiega al cliente perché i numeri non tornano, prima che te lo chieda.
- Quando due sistemi divergono su una metrica, non mediare e non scegliere il numero più comodo: identifica la differenza di definizione (finestra, de-duplicazione, momento della registrazione, filtri, fuso orario, gestione dei resi) e documentala.
- Ogni report porta scritto da quale sistema arriva ogni numero e con quale definizione.
- Dove il dato deve esistere in due posti, dichiara quale è l'origine e quale la copia, e la direzione della sincronizzazione. Due sistemi che si scrivono a vicenda sullo stesso campo producono conflitti silenziosi.

## Identità del cliente attraverso i sistemi

Decidi e scrivi la chiave di identità prima di collegare qualunque cosa.

- Usa una chiave **deterministica**: identificativo utente del sistema transazionale dove c'è un account, email normalizzata (minuscole, spazi rimossi, alias gestiti secondo una regola dichiarata) dove non c'è. L'email è una chiave fragile — cambia, è condivisa in famiglia, una persona ne ha diverse — ma è l'unica disponibile fra sistemi.
- Scegli una chiave **stabile e propria** come identificativo primario quando possibile, e tieni l'email come attributo. Questo rende gestibile il caso del cliente che cambia indirizzo.
- Per l'invio a piattaforme pubblicitarie usa gli hash richiesti dalla piattaforma (tipicamente SHA-256 su valore normalizzato): **verifica il formato di normalizzazione e hashing nella documentazione ufficiale corrente con WebFetch**, perché un hash calcolato su un valore normalizzato male produce un match basso senza alcun errore visibile.
- **Non usare matching probabilistico** per decisioni sui singoli clienti: va bene per audience aggregate, non per sapere a chi mandare cosa.
- Definisci la regola di **merge** (cosa fare quando due record risultano la stessa persona: quale vince, cosa si conserva) e quella di **anonimo → identificato** (quando un visitatore si logga, cosa succede alla sua storia precedente).
- Rispetta il confine del consenso: un identificativo unificato non autorizza un uso non consentito. Il consenso si propaga ai sistemi a valle, e la cancellazione deve propagarsi anche: metti per iscritto come si esegue una richiesta di cancellazione su tutto lo stack, altrimenti non sei in grado di eseguirla.

## Eventi e nomenclatura

- Mantieni un **piano di tracciamento** (tracking plan) come documento unico: nome evento, quando scatta, parametri con tipo e valori ammessi, destinazioni, proprietario. Nessun evento esiste se non è nel piano.
- Una convenzione di naming sola, scelta e applicata: minuscole, separatore unico, `oggetto_azione` al passato. Non mescolare i nomi richiesti dalle piattaforme ads con i tuoi: tieni il tuo nome canonico e mappa verso i nomi di piattaforma nel livello di invio.
- Un evento per fatto di business, con parametri. Non venti eventi distinti dove tre parametri bastano.
- Evita il dato personale nei parametri degli eventi di analytics: è una violazione dei termini d'uso di molte piattaforme oltre che un problema di conformità.
- Tracciamento server-side per gli eventi che contano (acquisto, lead qualificato) quando possibile: il browser perde eventi per blocker, errori di rete e chiusure di pagina. Mantieni la de-duplicazione fra invio client e server con un identificativo di evento, secondo lo schema documentato dalla piattaforma.

## Integrazione custom: quando è giustificata e quando è debito

**Usa, in ordine:** integrazione nativa fra i due prodotti → connettore di un iPaaS già in uso → webhook con una funzione piccola e versionata → integrazione custom completa.

Giustificata quando: non esiste nativa né connettore; la logica è specifica del business del cliente e dà un vantaggio reale; il volume o la latenza richiesti sono fuori dalla portata degli strumenti disponibili; la nativa esiste ma perde dati necessari in modo dimostrato.

È debito quando: replica una funzione nativa perché "la facciamo meglio"; esiste perché nessuno ha letto la documentazione; sincronizza dati che nessuno usa; vive su credenziali personali o su un account personale; non ha logging né allarmi; dipende da un'API senza versione dichiarata; la conosce una persona sola.

Se la fai, non è finita senza: autenticazione su credenziali di servizio (non personali), gestione degli errori con retry e idempotenza, logging consultabile, allarme su fallimento verso un destinatario umano reale, limiti di rate rispettati, ambiente di test, e una nota scritta sul comportamento atteso in caso di fallimento parziale. Un'integrazione che si rompe in silenzio è peggio dell'export manuale, perché l'export manuale fallisce in modo visibile.

Prima di costruire, **verifica con WebFetch la documentazione ufficiale dell'API**: versione corrente, deprecazioni annunciate, limiti di rate, campi disponibili, modalità di autenticazione. Non scrivere codice su un'API ricordata.

## Documentare lo stack perché lo mantenga qualcun altro

Il criterio: una persona competente che non ha mai visto questo cliente deve poter riparare un flusso rotto senza chiamare nessuno. Tieni la documentazione in `clients/<slug>/`, in testo versionato, non in uno strumento di diagramma proprietario.

Contenuto minimo:
1. **Diagramma dei flussi di dati**: sistemi, direzione, meccanismo, frequenza.
2. **Tabella dei sistemi**: nome, scopo in una riga, proprietario interno, livello di piano, costo, data di rinnovo, dove stanno le credenziali (il gestore di password, non il valore).
3. **Tabella delle fonti di verità**: metrica → sistema → definizione esatta → dove si legge.
4. **Piano di tracciamento**: eventi e parametri.
5. **Modello di identità**: chiave primaria, chiavi secondarie, regole di merge e normalizzazione.
6. **Registro delle integrazioni**: cosa fa, dove gira, chi la mantiene, come si accorge di un fallimento, come si riavvia.
7. **Runbook dei guasti ricorrenti**: sintomo → causa probabile → verifica → rimedio.
8. **Registro delle decisioni**: cosa è stato scelto, quando, perché, cosa è stato scartato. È la parte che evita che il prossimo rifaccia la stessa discussione.
9. **Data di ultima verifica su ogni sezione.** Una documentazione senza data non è affidabile e viene ignorata.

Aggiorna il documento nello stesso intervento in cui cambi lo stack. Se lo rimandi, non lo fai.

## Migrazioni e dismissioni

Un cambio di sistema è il momento di rischio più alto dello stack. Procedi così:

1. Definisci cosa deve esistere nel sistema nuovo prima di guardare i prodotti: dati, automazioni attive, report, integrazioni, storico necessario.
2. Esporta lo storico e conservalo fuori dai due sistemi, prima di qualunque cosa. Lo storico non migrato è perso per sempre.
3. Fai girare i due sistemi in parallelo per un periodo definito su un sottoinsieme, confrontando i numeri prodotti. Non spegnere il vecchio il giorno dell'accensione del nuovo.
4. Metti per iscritto cosa si romperà nei confronti nel tempo (definizioni diverse, perdita di storico) e annota la data del cambio nei report.
5. Alla dismissione: revoca gli accessi, cancella i tag residui, chiudi gli abbonamenti, aggiorna la documentazione nello stesso giorno.

## Errori che costano

- Raccomandare tool prima della diagnosi, perché raccomandare è più rapido che capire.
- Introdurre una CDP per risolvere un problema di disordine organizzativo: il disordine viene importato, con un canone in più.
- Pixel installati nel tema del sito e non nel tag manager: dopo sei mesi nessuno sa quanti ce ne sono né cosa inviano.
- Due sistemi che si sincronizzano in entrambe le direzioni sullo stesso campo, senza regola su chi vince.
- Email come unica chiave di identità, senza normalizzazione dichiarata: i duplicati arrivano con la prima maiuscola.
- Hash degli identificativi calcolato senza seguire la normalizzazione richiesta dalla piattaforma: match basso e nessun errore.
- Sommare le conversioni di più piattaforme e consegnarle al cliente come ricavo.
- Nessuna fonte di verità dichiarata: ogni riunione ricomincia discutendo di quale numero è quello giusto.
- Integrazione custom su credenziali personali di un dipendente o di un collaboratore dello studio: si rompe il giorno in cui quella persona esce.
- Nessun allarme su un flusso critico: il cliente scopre il guasto dal fatturato del mese.
- Eventi aggiunti direttamente in produzione senza passare dal piano di tracciamento: lo storico diventa illeggibile.
- Rinominare eventi o riconfigurare le conversioni senza annotare la data: ogni confronto nel tempo salta e nessuno sa perché.
- Spegnere un tool senza prima esportare i dati e verificare chi li stava usando.
- Collegare un flusso di dati personali senza base giuridica né consenso propagato, e scoprirlo durante una verifica.
- Documentazione prodotta a fine progetto come allegato: nasce già vecchia e nessuno la legge.

## Confine

Qui si scelgono e si collegano gli strumenti. L'implementazione del tracking — GTM, dataLayer, eventi, consent mode — sta in `gtm-tracking-implementation`. Scegliere lo strumento e far funzionare la misurazione sono due lavori diversi: non confonderli in un unico deliverable.
