---
name: gtm-tracking-implementation
description: Usa quando implementi o revisioni il tracking via tag manager — progettazione del data layer, naming di eventi e parametri, tag server-side, integrazione del consenso, debug end-to-end, versioning e documentazione. Coordina sempre con gdpr-marketing-consent.
---

# Implementazione del tracking con tag manager

## Regole di ingaggio

1. **Il data layer si progetta prima dei tag.** Sempre. Un tag manager riempito di tag che leggono il DOM è un sistema che si rompe al primo restyling, e nessuno saprà perché.
2. **Consulta `gdpr-marketing-consent` ogni volta che tocchi dati personali.** Identificatori, email, telefono, dati di acquisto, ID utente, parametri di advertising: sono dati personali. La base giuridica e la gestione del consenso non sono un dettaglio da aggiungere dopo l'implementazione, sono un vincolo di progetto.
3. **Verifica la documentazione ufficiale corrente con WebFetch** per nomi di eventi raccomandati, parametri richiesti, modalità di consenso e capacità server-side. Questi oggetti cambiano, e le guide di terze parti invecchiano in silenzio.
4. **Nessun tracking senza misurazione verificata.** Un evento non testato end-to-end non esiste. Peggio: produce un numero in cui il cliente crede.

## 1. Architettura del data layer

Il data layer è il **contratto** fra il sito e la misurazione. Il sito pubblica fatti; il tag manager li consuma. Il tag manager non deve sapere com'è fatto l'HTML.

Progettazione:
- Parti dalle **domande di business**, non dagli eventi. Cosa il cliente deve poter decidere con questo dato? Se nessuna decisione dipende da un evento, non implementarlo: ogni evento inutile è manutenzione, rumore e rischio privacy.
- Ricava da lì la lista degli eventi, e per ciascuno i parametri necessari e chi li fornisce.
- Fai pubblicare gli eventi **dal codice dell'applicazione**, in punti dove il fatto è certo: l'aggiunta al carrello la dichiara chi gestisce il carrello, non un listener sul click di un bottone. Il click può fallire, l'azione può avvenire senza click.
- Inizializza il data layer **prima** del contenitore del tag manager, altrimenti i valori di pagina non sono disponibili ai tag che partono subito.
- Distingui **contesto di pagina** (tipo di pagina, lingua, categoria, stato di login, ID contenuto) da **eventi** (qualcosa è accaduto). Il contesto si pubblica al caricamento; gli eventi quando accadono.
- Su siti a navigazione client-side (single page app), gestisci esplicitamente il cambio di vista: senza un evento dedicato, le pageview mancano o si duplicano, e il contesto resta quello della pagina precedente.
- Stabilisci la **persistenza**: il data layer non si azzera a ogni push se i tag successivi dipendono da valori precedenti. Attenzione all'opposto: valori che restano appiccicati fra eventi e contaminano quelli successivi. È una causa classica di dati sbagliati e difficili da diagnosticare.
- **Niente scraping del DOM**, niente selettori CSS come fonte di dati, niente testo dell'interfaccia come identificatore. Il testo è tradotto, cambia e dipende dalla lingua.
- **Niente dati personali nel data layer** se non è necessario e giuridicamente coperto. Mai email, telefono o nome in chiaro in un push, mai dati in URL che finiscono nei log. Se serve un identificatore utente, usa un ID pseudonimo stabile, e verifica la base giuridica.
- Scrivi il data layer come **specifica concordata con chi sviluppa**, prima dello sviluppo: evento, quando si scatena, parametri, tipo, obbligatorietà, esempio. È il documento che rende il tracking manutenibile.

## 2. Convenzioni di naming

Il naming si decide una volta e non si cambia: rinominare un evento spacca lo storico e i report in due.

- Una sola convenzione per tutto il progetto: un solo stile di maiuscole e separatori, deciso e scritto. La coerenza vale più della scelta.
- Nomi in **inglese**, in minuscolo, con separatore uniforme. I nomi in italiano creano attrito con la documentazione delle piattaforme e con i nomi riservati.
- Struttura **oggetto + azione al passato** o lo schema raccomandato dalla piattaforma di destinazione. **Se la piattaforma ha eventi e parametri raccomandati, usa i suoi nomi esatti**: cambiarli impedisce di usare le funzionalità native. Verificali sulla documentazione ufficiale.
- **Nomi stabili, valori variabili.** Non creare `click_bottone_homepage_v2`: crea un evento con parametri che descrivono posizione ed elemento. Il nome di evento che contiene la pagina moltiplica gli eventi e rende impossibile l'analisi aggregata.
- Niente nomi derivati dall'aspetto o dalla campagna del momento. `scarica_pdf_promo_natale` è morto a gennaio.
- Valori normalizzati: minuscole, senza accenti negli identificatori, valuta in codice ISO, prezzi come numero senza simbolo e senza separatore di migliaia, booleani come booleani. Un prezzo stringa diventa somma impossibile.
- Tieni un **dizionario degli eventi** versionato: nome, descrizione, trigger, parametri con tipo e obbligatorietà, destinazioni, data di introduzione, proprietario. Se non esiste il dizionario, il tracking non è consegnato.

## 3. Client-side e server-side

**Client-side**: i tag girano nel browser. Semplice da implementare, visibile, ma esposto a blocco degli script, limiti sulla durata dei cookie, peso sulla pagina e perdita di eventi su reti lente.

**Server-side**: il browser manda i dati a un endpoint controllato, che li smista verso le destinazioni.

Cosa risolve davvero:
- riduce il codice di terze parti nella pagina, quindi peso e dipendenze;
- dà controllo su **quali dati escono verso chi**: puoi filtrare, anonimizzare, troncare prima dell'invio. Questo è il vero argomento, anche dal lato privacy;
- consente arricchimento dei dati da fonti server e conversioni inviate dal back-end, che sono più affidabili di quelle dal browser;
- migliora la resistenza al blocco degli script e offre più controllo sui cookie di prima parte.

Cosa **non** risolve:
- non rende lecito il trattamento. Il consenso serve comunque. Il server-side non è un modo per tracciare chi ha rifiutato: se lo usi così, è una violazione, ed è il peggior uso possibile di questa tecnologia.
- non elimina la necessità di implementazione client per gli eventi di interazione;
- non è gratis: c'è infrastruttura da gestire, costi ricorrenti, monitoraggio, e un punto di guasto in più. Su un sito piccolo spesso non vale.
- non migliora un data layer sbagliato. Spazzatura in ingresso, spazzatura in uscita, più veloce.

Criterio: proponi server-side quando il volume lo giustifica, quando il cliente ha bisogno di controllo sui dati in uscita o di conversioni dal back-end, e quando esiste qualcuno che lo manutiene. Altrimenti è complessità venduta. Verifica costi e capacità correnti sulla documentazione ufficiale prima di preventivare.

## 4. Integrazione del consenso

Questa parte è dove si fanno i danni legali. Coordina con `gdpr-marketing-consent`: lì stanno le basi giuridiche, qui l'implementazione.

- **Nessun tag di marketing o di analisi non essenziale parte prima di una scelta esplicita.** Il default è: non attivo. Attendere la scelta non è una penalizzazione tecnica, è l'impostazione corretta. Nel Consent Mode di Google questa è la modalità Basic. In Advanced i tag Google partono subito e, con consenso negato, inviano misure senza cookie (Google Tag Platform, letta il 2026-11-04): se è ammissibile per quel cliente lo decide la revisione privacy, non il tag manager.
- Usa il meccanismo di consenso nativo del tag manager e delle piattaforme, non condizioni fatte a mano con variabili improvvisate. I meccanismi nativi comunicano lo stato di consenso alle destinazioni; una condizione fatta a mano blocca il tag ma non informa nessuno.
- Mappa **ogni tag** a una categoria di consenso, esplicitamente. Un tag senza categoria assegnata è un tag che parte sempre: controllali uno per uno, incluse le integrazioni installate da app o plugin.
- Cosa deve accadere al rifiuto: il tag **non parte**, non scrive cookie o storage, non invia richieste di rete, non raccoglie identificatori. Verificalo osservando le richieste di rete e lo storage, non fidandoti dell'interfaccia del tag manager.
- Gestisci il **cambio di stato**: consenso dato dopo il caricamento (i tag devono poter partire senza ricaricare) e consenso revocato (i tag devono smettere, e i cookie già scritti vanno gestiti secondo quanto dichiarato).
- Documenta la **mappatura categoria → tag → cookie** e tienila allineata con il cookie banner e l'informativa. Se divergono, la dichiarazione al pubblico è falsa.
- Non usare fingerprinting, identificatori alternativi o misurazioni "senza cookie" come scorciatoia al consenso. Il consenso riguarda il trattamento, non la tecnologia del cookie.
- Fai rivedere la configurazione da chi segue la privacy del cliente prima del rilascio. Lo studio implementa, non certifica.

## 5. Debug e verifica end-to-end

Verifica a quattro livelli. Fermarsi al primo è il motivo per cui il tracking sembra funzionare e non funziona.

1. **Data layer**: l'evento è pubblicato, con i parametri attesi, nei tipi attesi, nel momento giusto, una volta sola.
2. **Tag manager**: il trigger scatta, le variabili si risolvono (niente `undefined`, niente stringhe vuote), il tag parte una volta sola, lo stato di consenso è quello previsto.
3. **Rete**: la richiesta esce verso la destinazione, con i parametri corretti, e riceve risposta positiva. Guarda la richiesta reale nel pannello di rete: è l'unica verità sul lato client.
4. **Destinazione**: il dato arriva nel report e **coincide con la fonte autoritativa**. Per l'e-commerce la fonte è il back-office (su Shopify, Shopify stesso: vedi `shopify-ecommerce`), non l'analytics.

Disciplina:
- Verifica in **anteprima o in ambiente di staging** prima di pubblicare, e di nuovo in produzione dopo.
- Prova i percorsi reali e completi, non solo l'evento isolato: acquisto fino alla conferma, form fino al messaggio di successo, con rifiuto del consenso, con accettazione, su mobile, su browser diversi, in ogni lingua e valuta.
- Caccia i **doppi conteggi**: tag duplicati, codice presente sia nel tema sia nel tag manager, integrazioni native della piattaforma attive insieme a tag manuali. È l'errore più frequente e gonfia tutto.
- Escludi il traffico interno e i test dalle destinazioni, dichiarando come.
- Dopo il rilascio, **monitora**: volumi per evento confrontati con l'atteso, tasso di parametri mancanti, scostamento rispetto alla fonte autoritativa. Un tracking che si rompe in silenzio produce decisioni sbagliate per mesi.

## 6. Versioning e rollback

- Ogni pubblicazione ha un **nome e una descrizione** che dicano cosa cambia e perché. "Update" non è una descrizione: a tre mesi di distanza è inutile.
- Pubblica **un cambiamento logico per volta**. Dieci modifiche in una versione rendono impossibile capire quale ha rotto cosa.
- Prima di modifiche rilevanti, **esporta il contenitore** e archivia il file con data nel repo del progetto. L'export è il backup che non dipende dall'accesso all'account.
- Sappi come si torna indietro **prima** di pubblicare, e dichiaralo: quale versione è quella buona. Il ripristino di una versione precedente non annulla i dati già raccolti male: il rollback limita il danno, non lo cancella.
- Non lavorare direttamente nell'area di lavoro condivisa se più persone pubblicano: aree separate, e nessuna pubblicazione sopra il lavoro in corso di un altro.
- Niente pubblicazioni il venerdì sera e niente pubblicazioni in campagna attiva senza verifica immediata.
- Gli accessi stanno in capo al **cliente**: il contenitore è suo. Lo studio opera con un proprio account nominale, non con credenziali condivise. All'uscita dal progetto gli accessi si revocano, e il cliente resta proprietario.

## 7. Documentazione della configurazione

Il tracking non documentato è tracking usa e getta: alla prima persona nuova si rifà. Consegna, versionato nel repo del progetto:

- il **dizionario degli eventi** (vedi sezione naming);
- la **specifica del data layer** con esempi di payload reali;
- la mappa **tag → trigger → variabili → destinazione → categoria di consenso**;
- la mappa **cookie e storage** usati, con finalità e durata, allineata all'informativa;
- l'export del contenitore con data;
- che cosa è stato verificato, come, su quali browser e dispositivi, e **che cosa non è stato verificato**;
- gli scostamenti noti rispetto alla fonte autoritativa e la loro spiegazione.

## Errori che costano

- **Tag costruiti su selettori del DOM o sul testo dei bottoni.** Si rompono al primo restyling o alla prima traduzione, in silenzio. Il cliente scopre mesi dopo che non ha dati.
- **Nessun data layer: tutto dedotto dalla pagina.** Il tracking non è manutenibile e nessun'altra persona può metterci mano.
- **Doppio conteggio.** Conversioni raddoppiate, ROAS gonfiato, budget allocato su un numero falso. È il bug più costoso del mestiere perché sembra un buon risultato.
- **Tag che partono prima del consenso.** Esposizione sanzionatoria del cliente, con lo studio nel mezzo. Non negoziabile.
- **Consenso implementato con condizioni fatte a mano invece del meccanismo nativo.** Il tag non parte ma le piattaforme non sanno perché: perdi le funzionalità previste per il traffico senza consenso e resti comunque non conforme.
- **Server-side usato per aggirare il rifiuto.** Non è ottimizzazione: è un illecito, costruito deliberatamente, documentato nella configurazione.
- **Dati personali nel data layer o negli URL.** Finiscono nei log, nei report e nelle piattaforme di terzi. Difficili da rimuovere a posteriori.
- **Eventi rinominati a sistema avviato.** Storico spaccato, confronti anno su anno impossibili, segmenti e audience da ricostruire.
- **Nomi che includono pagina o campagna.** Proliferazione di eventi, analisi aggregata impossibile, pulizia manuale costosa.
- **Pubblicare senza verificare in anteprima.** Dati sbagliati in produzione, e la finestra di raccolta sbagliata non si recupera.
- **Nessun export e nessuna descrizione delle versioni.** Quando qualcosa si rompe, non c'è nulla a cui tornare né modo di capire cosa è cambiato.
- **Tracciare tutto il tracciabile.** Centinaia di eventi che nessuno guarda, costo di manutenzione, superficie privacy, e i tre eventi che contano sepolti nel rumore.
- **Credenziali condivise.** Nessuna tracciabilità di chi ha pubblicato cosa, e un problema di sicurezza alla prima persona che lascia il progetto.
- **Non riconciliare con la fonte autoritativa.** Lo scostamento si scopre in riunione, davanti al cliente, senza spiegazione pronta.

## Chiusura

Chiudi ogni output con: data di verifica della documentazione ufficiale, stato della revisione privacy, cosa è stato verificato end-to-end e cosa no, scostamento misurato rispetto alla fonte autoritativa. Passa da `delivery-qa`.
