---
name: bi-warehouse
description: Usa quando un cliente chiede un data warehouse, una BI o un reporting centralizzato: decidere se serve davvero o basta un foglio, modellare i dati di marketing, riconciliare sorgenti divergenti, controllare i costi e consegnare un sistema autonomo.
---

# BI e Data Warehouse per il marketing

Un warehouse è infrastruttura: costa, va mantenuta, e la maggior parte delle richieste che la invocano si risolve altrove. Questa skill serve a decidere prima, e a costruire solo quando la decisione regge.

Lo scopo di un sistema dati non è "avere i dati". È ridurre il tempo che separa una domanda ricorrente dalla decisione che ne consegue. Se nessuno prende decisioni diverse grazie al sistema, il sistema è un costo.

## La domanda più importante: serve davvero?

Prima di proporre qualsiasi cosa, rispondi a questa: **quali decisioni ricorrenti sono oggi impossibili o troppo lente, e chi le prende?** Se non ottieni una lista concreta con dei nomi, non c'è progetto: c'è un desiderio di ordine.

Un **foglio di calcolo** (o un export periodico con un paio di query) basta quando:
- le sorgenti sono poche e i connettori nativi coprono già l'80% delle domande;
- i volumi stanno nei limiti dello strumento e non crescono rapidamente;
- la frequenza di aggiornamento utile è settimanale o mensile;
- una persona sola consuma il dato e sa cosa guarda;
- la storia necessaria è breve, o le piattaforme la conservano comunque;
- non serve unire i dati di spesa con i dati di vendita a livello di singolo ordine.

Serve un **warehouse** quando almeno due o tre di queste sono vere:
- i dati di spesa pubblicitaria vanno uniti a vendite, margine o valore nel tempo, per prendere decisioni di budget;
- le piattaforme cancellano lo storico che serve per confronti anno su anno;
- più persone devono leggere lo stesso numero e oggi leggono numeri diversi;
- esistono regole di business (cos'è un lead qualificato, cosa si esclude, come si attribuisce) che oggi vivono nella testa di qualcuno o in formule di un file;
- serve alimentare altri sistemi (audience, MMM, modelli di propensione, vedi `mmm-incrementality`);
- i volumi o il numero di sorgenti rendono manuale il lavoro ogni settimana.

Via intermedia, da proporre prima del warehouse: dashboard sui connettori nativi dello strumento BI, più un singolo foglio di riconciliazione mantenuto con disciplina. Spesso è la risposta giusta per un anno.

Se il cliente chiede un warehouse ma le decisioni non esistono ancora, vendi prima il lavoro che le definisce. Costruire infrastruttura per domande non formulate produce tabelle che nessuno apre.

## Architettura minima

Non progettare oltre il necessario. Lo schema che regge quasi sempre:

**Ingestione → area grezza → trasformazione → modelli di consumo → visualizzazione**

- **Ingestione**: connettori gestiti per le sorgenti standard (ads, analytics, e-commerce, CRM, email). Scrivi codice solo per ciò che nessun connettore copre. Un connettore pagato costa meno di uno script che un junior deve riparare ogni volta che l'API cambia.
- **Area grezza**: scrivi i dati come arrivano, immutabili, con timestamp di ingestione. Non trasformare in ingestione: perdi la possibilità di ricostruire.
- **Trasformazione** in SQL versionato, con test. Un livello intermedio di pulizia e conformazione, un livello di modelli di business.
- **Consumo**: tabelle pensate per le domande, non per l'eleganza del modello.
- **Visualizzazione**: vedi `dashboard-builder`. Non costruire qui la logica di business.

Usa lo stack che il cliente già possiede o che il suo fornitore IT sa gestire. Lo studio non introduce una tecnologia che il cliente non può mantenere solo perché è migliore in astratto.

## Modellare i dati di marketing

Separa i due tipi di tabella e non mescolarli:

- **Fatti**: eventi con una data e delle misure — spesa giornaliera per annuncio, ordini, sessioni, invii email, click.
- **Dimensioni**: le entità che descrivono — campagna, canale, creatività, prodotto, cliente, geografia.

Punti dove i progetti marketing si rompono, in ordine di frequenza:

1. **Grana.** Decidi il livello minimo e dichiaralo: data × piattaforma × campagna × gruppo × annuncio. Non aggregare in ingestione: non si torna indietro. Attenzione: le metriche di utenti unici e di conversione modellata **non si sommano** fra giorni o fra campagne. Non costruire una tabella che permette di sommarle.
2. **Tassonomia di canale.** Serve una tabella di mappatura unica che traduca i nomi delle piattaforme in canale, sottocanale, obiettivo, mercato. Mantienila come dato, non come `CASE WHEN` dentro una query. Vedi `gtm-tracking-implementation` per la coerenza dei parametri a monte.
3. **Nomenclatura delle campagne.** Se la convenzione non è imposta a monte, nessuna modellazione a valle la salva. Imponi lo standard nelle piattaforme prima di costruire.
4. **Valute e fusi orari.** Dichiara la valuta di riferimento, la fonte dei cambi e la data di conversione. Dichiara un fuso unico per le date e ricorda che ogni piattaforma usa il proprio: la stessa giornata non contiene gli stessi eventi.
5. **Definizioni che cambiano nel tempo.** Una dimensione cambia (un prodotto cambia categoria, una campagna cambia obiettivo). Decidi se conservare la storia o sovrascrivere, e scrivi la scelta nella documentazione: è la causa più comune di numeri storici che "cambiano da soli".
6. **Costi veri.** La spesa di piattaforma non è il costo: aggiungi fee, produzione, IVA dove rilevante. Un ROAS calcolato sulla sola spesa media sovrastima il ritorno.
7. **Ricavo che usi.** Lordo, netto resi, al netto di sconti, a margine. Scegline uno come riferimento, esponi gli altri come colonne separate e non lasciare ambiguità nei nomi.

## Riconciliazione: le sorgenti non coincideranno mai

Non è un bug, e prometterne la soluzione è l'errore commerciale più costoso del progetto. Le differenze sono strutturali:

- **Attribuzione diversa**: ogni piattaforma rivendica la conversione secondo le proprie regole e finestre; le piattaforme non si parlano, quindi la somma delle conversioni dichiarate supera gli ordini reali.
- **Finestre temporali diverse**: la piattaforma attribuisce la conversione al giorno del click, l'e-commerce al giorno dell'ordine.
- **Modellazione e stime**: parte delle conversioni riportate dalle piattaforme è stimata, non osservata.
- **Consenso e tracciamento**: il rifiuto dei cookie, il blocco degli script e le restrizioni dei browser fanno mancare eventi lato analytics ma non lato gestionale.
- **Deduplicazione e perimetro**: resi, ordini di test, canali offline, ordini telefonici.

Come si gestisce:

1. Nomina **una fonte di verità per ogni metrica**: gestionale o e-commerce per ricavi e ordini, piattaforma per spesa e impression. Scrivilo nella documentazione e nel dashboard.
2. Non sommare mai conversioni di piattaforme diverse. Riportale per piattaforma, etichettate come "conversioni dichiarate da X".
3. Costruisci una **tabella di riconciliazione** che mostri lo scostamento fra sorgenti nel tempo, con una soglia di tolleranza concordata. Lo scopo non è annullare lo scostamento: è accorgersi quando cambia, perché un cambio di scostamento segnala una rottura del tracciamento.
4. Documenta ogni differenza nota con la sua causa. Il documento vale quanto il sistema.
5. Per capire quanto un canale ha davvero contribuito, non cercare la riconciliazione perfetta: usa `mmm-incrementality`.

## Report contro fonte di verità

Non sono la stessa cosa e confonderli crea il caos che il cliente chiama "i dati non tornano".

Una **fonte di verità** è un modello governato: definizione unica per ogni metrica, logica in un solo posto, versionata, testata, con un responsabile e un ciclo di revisione. Cambia con una procedura.

Un **report** è una vista sopra la fonte di verità, costruita per una domanda e per un pubblico. Può nascere e morire in una settimana.

Conseguenze operative:
- la logica di business non vive nel tool di visualizzazione, né in un foglio a valle, né in una query incollata in una slide;
- se due report mostrano numeri diversi per la stessa metrica, è un difetto da chiudere, non una sfumatura da spiegare;
- metrica senza definizione scritta e senza responsabile non va in dashboard;
- tieni un glossario delle metriche nel repository, accanto al codice.

## Costi che crescono senza che nessuno guardi

Le piattaforme cloud e i tool fanno pagare consumo, e il consumo cresce in silenzio. Non citare cifre: i prezzi cambiano e vanno letti sulla pagina ufficiale del fornitore al momento della proposta, con la data. Stima sempre con i volumi reali del cliente e dichiara l'incertezza.

Cause tipiche di costo fuori controllo:
- dashboard con aggiornamento automatico frequente che rilancia query pesanti a ogni apertura;
- ricostruzione completa dei modelli quando basterebbe l'incrementale;
- query che leggono tutta la tabella perché manca partizionamento o filtro sulla data;
- connettori a pagamento per volume lasciati attivi su sorgenti che nessuno usa più;
- ambienti di sviluppo e tabelle temporanee mai cancellate;
- un errore in un job schedulato che riprova in loop.

Cosa fare, sempre:
- imponi un **tetto di budget con avviso** sul progetto cloud, dal primo giorno;
- partiziona per data e filtra per data in ogni modello;
- scegli frequenze di aggiornamento in base alla decisione che servono, non alla sensazione di tempo reale. Quasi nessuna decisione di marketing richiede dati di un'ora prima;
- metti in dashboard il costo del sistema stesso, visibile al cliente;
- fai una revisione periodica di cosa nessuno apre, e spegnilo.

## Consegnare un sistema che il cliente usa senza di noi

Il criterio di qualità: se lo studio sparisce, il sistema continua a funzionare e qualcuno può modificarlo. Minimo da consegnare:

- **credenziali e proprietà** intestate al cliente, non allo studio, su tutto: progetto cloud, strumento BI, connettori. Lo studio ha accessi, non la proprietà;
- **codice in un repository del cliente**, con le trasformazioni leggibili e commentate dove la logica non è ovvia;
- **glossario delle metriche** e documento di riconciliazione;
- **mappa delle sorgenti**: cosa entra, da dove, con che frequenza, chi è il proprietario interno di ogni sistema;
- **runbook**: cosa fare quando un job fallisce, chi chiamare, come rilanciare;
- **monitoraggio della freschezza** con avviso a una persona nominata. Un dashboard vecchio di cinque giorni che nessuno segnala è peggio di nessun dashboard;
- **una sessione di passaggio registrata** e una persona interna identificata come referente;
- la riga su cosa non è stato verificato e quali numeri restano inaffidabili.

Non consegnare un sistema la cui manutenzione richiede competenze che il cliente non ha e non intende acquisire. In quel caso o si vende un contratto di manutenzione esplicito, o si semplifica l'architettura.

## Errori che costano

- **Costruire prima di avere la lista delle decisioni.** Il progetto più caro e più inutile.
- **Promettere che i numeri torneranno.** Si perde la fiducia esattamente alla prima riunione sui dati.
- **Aggregare in ingestione.** Il dato granulare perso non torna.
- **Logica di business dentro il tool di visualizzazione.** Due dashboard, due verità, nessun modo di sapere quale.
- **Nessuna tabella di mappatura dei canali.** `CASE WHEN` duplicati in dieci query che divergono.
- **Ignorare valute e fusi orari** finché il cliente non apre un mercato estero.
- **Nessun tetto di budget cloud.** La fattura a sorpresa chiude il progetto e la relazione.
- **Sommare conversioni di piattaforme diverse.** Ricavi raddoppiati in dashboard.
- **Aggiornamento orario perché "fa più professionale".** Costo moltiplicato, zero decisioni migliori.
- **Nessun avviso sulla freschezza.** Decisioni prese su dati fermi.
- **Credenziali e progetto cloud intestati allo studio.** Diventa un ostaggio: eticamente sbagliato e commercialmente fragile.
- **Nessuna documentazione delle definizioni.** Il sistema muore quando la persona che lo capiva cambia lavoro.
- **Replicare in warehouse report che i connettori nativi già producono.** Costo senza beneficio.
