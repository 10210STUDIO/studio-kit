---
name: mmm-incrementality
description: Usa quando la domanda è quanto la pubblicità ha davvero aggiunto: limiti dell'attribuzione di piattaforma, disegno di test di incrementalità (holdout, geo test, spegnimenti), media mix modeling, lettura dei risultati e spiegazione al cliente di un ROAS gonfiato.
---

# Incrementalità e Media Mix Modeling

C'è una sola domanda che conta nella misurazione: **cosa sarebbe accaduto se non avessimo speso?** Tutto il resto è contabilità.

Questa skill si usa quando si deve stimare l'effetto causale della pubblicità, non quando si deve costruire un report (`bi-warehouse`, `dashboard-builder`) o ottimizzare una campagna.

## Perché l'attribuzione di piattaforma non risponde

L'attribuzione risponde a "chi ha toccato l'utente prima dell'acquisto". È una regola di assegnazione del merito fra chi era presente, non una misura dell'effetto. I limiti sono strutturali, non risolvibili con una configurazione migliore:

- **Nessun controfattuale.** L'attribuzione osserva solo chi ha convertito dopo aver visto l'annuncio. Non esiste il gruppo di confronto, quindi non c'è modo di sapere quanti avrebbero comprato comunque.
- **Selezione, non effetto.** Le piattaforme ottimizzano verso le persone con la più alta probabilità di convertire. Più l'ottimizzazione funziona, più la pubblicità raggiunge chi avrebbe comprato comunque, e più il ROAS dichiarato si gonfia. È un bias che cresce con la qualità del targeting.
- **Doppio conteggio.** Ogni piattaforma rivendica la stessa conversione secondo le proprie finestre. La somma delle conversioni dichiarate può superare gli ordini reali.
- **View-through e finestre lunghe.** Un'impression vista e ignorata viene contata come tocco.
- **Dati modellati.** Una parte delle conversioni riportate è stimata da modelli della piattaforma, non osservata.
- **Brand search.** Chi cerca il nome del brand ha già deciso. Attribuire quelle conversioni all'annuncio sul brand misura un intento che esisteva prima.

Conseguenza operativa: il ROAS di piattaforma è un **indicatore di efficienza relativa all'interno della stessa piattaforma e nello stesso periodo**, utile per confrontare due creatività o due pubblici. Non è il ritorno dell'investimento, e non si somma fra canali.

## Test di incrementalità

L'unico modo per ottenere una risposta causale è creare un gruppo che non vede la pubblicità e confrontarlo con uno che la vede. Il principio: se l'assegnazione al trattamento è casuale, le differenze sistematiche fra i gruppi si distribuiscono equamente, e la differenza osservata nell'esito è attribuibile al trattamento.

Definizione corretta: **lift incrementale = esito del gruppo esposto − esito del gruppo di controllo**, sulla stessa base e nello stesso periodo. Il **ROAS incrementale** è il margine (o ricavo) incrementale diviso la spesa incrementale, non il ricavo totale del gruppo esposto diviso la spesa.

### Holdout a livello di utente

Una quota del pubblico raggiungibile viene esclusa dalla consegna degli annunci; il resto li vede. Dove le piattaforme offrono esperimenti di conversion lift nativi, usano questo schema.

Requisiti perché valga:
- **randomizzazione fatta dalla piattaforma**, prima dell'asta. Un holdout costruito su un'audience esclusa manualmente non è randomizzato: le due popolazioni differiscono per come sono state costruite.
- il gruppo di controllo non deve essere raggiunto dallo stesso messaggio per altre vie (retargeting, email, altra campagna attiva). Mappa tutte le esposizioni prima di partire.
- **l'esito si misura su entrambi i gruppi con la stessa fonte**, idealmente il gestionale del cliente, non la piattaforma.
- durata almeno pari al ciclo d'acquisto tipico del prodotto, più il tempo necessario ad accumulare conversioni sufficienti.

Limite: funziona dentro una piattaforma, non risponde su tutto il mix, e sposta il risultato se la piattaforma gestisce controllo e misura allo stesso tempo. Trattalo come utile, non come definitivo.

### Test geografici

Dividi il mercato in aree (regioni, province, città, CAP) e assegna le aree a trattamento o controllo. Misuri l'esito sulle vendite totali di ciascuna area, non sui click: è il grande vantaggio, perché non dipende dal tracciamento.

Requisiti pratici:
- **molte aree, non due.** Confrontare una regione contro un'altra non è un test: è un aneddoto. Serve un numero di aree sufficiente perché le differenze locali si compensino.
- **assegnazione casuale**, possibilmente dopo aver accoppiato le aree per somiglianza storica (abbinamento a coppie e poi sorteggio dentro ogni coppia riduce la varianza).
- **periodo di pre-test** in cui si verifica che le serie storiche dei due gruppi si muovano in parallelo. Se non lo facevano prima, il confronto dopo non è interpretabile.
- **separazione geografica reale**: nessun punto vendita a cavallo fra le aree, nessuna consegna incrociata, nessun media che sfora i confini (TV e radio nazionali rendono il test impossibile).
- **differenza di esposizione grande.** Un test con una differenza di spesa piccola non si distingue dal rumore, qualunque sia la numerosità.
- **tutto il resto costante**: nessuna promozione, nessun lancio, nessuna variazione di prezzo in una sola area durante il test.
- **soglia di decisione e durata fissate prima di guardare i dati.** Guardare ogni giorno e fermarsi al primo risultato favorevole produce falsi positivi sistematici.

Per il dimensionamento e la lettura statistica del test usa `experiment-stats`. Il dato chiave da stabilire prima: con la spesa, la durata e la variabilità storica disponibili, il test è in grado di rilevare un effetto della dimensione che interessa al cliente? Se la risposta è no, non farlo. Un test sottodimensionato non dà "nessun effetto": dà nessuna informazione, e il cliente la leggerà come prova che il canale non funziona.

### Spegnimenti controllati

Si spegne un canale per un periodo e si osserva cosa accade. Semplice e spesso l'unica opzione praticabile, ma è il disegno più debole: non ha un gruppo di controllo, quindi confonde l'effetto con tutto ciò che è cambiato nel frattempo.

Rendilo utilizzabile così:
- alterna i periodi (acceso/spento/acceso/spento) più volte invece di un singolo blocco: distingue l'effetto da una tendenza;
- evita periodi con stagionalità forte, festività, promozioni o eventi di settore;
- metti in conto gli effetti di coda: la domanda generata prima non si spegne con la campagna, e quando riaccendi la risalita non è immediata;
- considera gli effetti di sostituzione: spegnendo un canale, parte della domanda si riversa su un altro. Misura l'esito **totale**, non la performance del canale rimasto.

Se il cliente non può fermare la spesa, non si può fare. Dillo e proponi il geo test.

## Media Mix Modeling

L'MMM stima statisticamente il contributo di ciascun canale a un esito aggregato (vendite per settimana) usando le variazioni storiche di spesa, insieme a fattori non pubblicitari: stagionalità, prezzo, promozioni, distribuzione, meteo dove rilevante, attività dei competitor, andamento macro. Non richiede dati a livello di utente, quindi non soffre delle limitazioni del tracciamento.

Due elementi caratterizzano la modellazione dei media e nessun MMM serio li omette:
- **adstock / effetto ritardato**: l'effetto di una esposizione si distribuisce nel tempo e decade;
- **saturazione / rendimenti decrescenti**: raddoppiare la spesa non raddoppia l'effetto. Senza questa parte, il modello estrapola raccomandazioni di budget assurde.

### Quando è alla portata di uno studio

Condizioni minime perché valga la pena:
- **anni di storia settimanale**, non mesi, per più canali;
- **variazione reale della spesa** nel periodo: se un canale ha speso la stessa cifra ogni settimana per due anni, il modello non può identificarne l'effetto. Nessuna tecnica recupera una variabilità che non esiste nei dati;
- dati non pubblicitari disponibili e affidabili (prezzi, promozioni, stock out). Le promozioni sono la variabile omessa più dannosa: correlano con la spesa e il modello le attribuisce ai media;
- un budget tale che una decisione di riallocazione valga il costo del lavoro;
- almeno un test di incrementalità, da usare per calibrare e validare il modello.

### Quando è teatro statistico

- Pochi mesi di dati, o un solo canale rilevante.
- Spesa quasi costante, o canali che partono e si fermano insieme (non si possono separare effetti perfettamente sovrapposti).
- Più parametri che osservazioni utili, con un modello che si adatta perfettamente allo storico e non prevede niente.
- Risultati presentati come percentuali precise senza intervallo di incertezza.
- Nessun test indipendente a confermare. Un MMM non validato da un esperimento è un'ipotesi elegante.
- Uno strumento comprato che produce un grafico a torta dei contributi: nasconde le assunzioni e nessuno può contestarle.

Scelta pragmatica: un cliente medio ottiene più valore da due geo test ben fatti all'anno che da un MMM costruito su dati insufficienti.

### Strumenti open source (stato al 2026-11-04, GitHub; riverificare oltre i 90 giorni)

| Strumento | Cosa fa | Stato |
|---|---|---|
| Meridian (Google) | MMM in Python, da far girare in casa | attivo: v2.1.0 del 2026-09-24 (PyPI `google-meridian`), commit su main fino al 2026-11-03 |
| Robyn (Meta) | MMM («experimental», dalla Marketing Science di Meta) | fermo: ultima release v3.12.0 del 2024-12-19, ultimo commit su main 2025-06-27, non archiviato |
| GeoLift (Meta) | geo test con controllo sintetico, in R | ultima release v2.6.06 del 2023-05-19, ultimo commit su main 2026-04-01, non archiviato |

Per un MMM nuovo si parte da Meridian; Robyn solo per riprendere un modello già in uso. Prima di installare, rileggi il repository: versioni e requisiti cambiano. Lo strumento non sostituisce le condizioni minime qui sopra.

## Leggere i risultati

- **Un risultato non significativo non è un risultato nullo.** Significa che il test non distingue l'effetto dal rumore. Riporta la stima con il suo intervallo e di' cosa il test poteva e non poteva rilevare.
- **L'intervallo di incertezza è parte del risultato.** Un lift stimato con un intervallo che comprende lo zero non autorizza una decisione di budget.
- **Un singolo test misura un punto, non una curva.** Un effetto trovato a un livello di spesa non si estende a una spesa doppia: la saturazione cambia tutto.
- **Validità esterna.** Il risultato vale per quel prodotto, quel periodo, quella creatività, quel mercato. Non promuoverlo a legge.
- **Non riusare un test vecchio.** Piattaforme, costi e concorrenza cambiano. Ripeti.

### Attribuire alla pubblicità ciò che è di altro

È l'errore più comune e il più costoso. Prima di concludere, chiedi sistematicamente:

- **Stagionalità**: confronta sempre con lo stesso periodo degli anni precedenti, non solo col mese prima. Un aumento in una stagione forte non prova niente.
- **Competitor**: un competitor che esce di scena, alza i prezzi o finisce lo stock sposta la domanda verso il cliente. Verificalo come ipotesi, non come dettaglio.
- **Prezzo e promozioni**: lo sconto è quasi sempre la variabile più potente. Se è cambiato durante il test, il test è compromesso.
- **Distribuzione e disponibilità**: nuovi punti vendita, un marketplace aggiunto, uno stock out.
- **Eventi esterni**: copertura stampa, un contenuto virale, una variazione normativa, il meteo in alcuni settori.
- **Cambi di tracciamento**: una modifica al consenso o al tag produce un salto nei dati che somiglia a un effetto.
- **Regressione verso la media**: un canale misurato dopo un periodo eccezionalmente negativo tende a migliorare da solo.

Non concludere nulla senza aver verificato queste voci con il cliente. La domanda da fare è: "cos'altro è cambiato in azienda in queste settimane?"

## Spiegare al cliente che il suo ROAS è gonfiato

Non attaccare il numero: spiega cosa misura.

1. Parti dal suo dato, senza contestarlo: "la piattaforma dichiara questo, ed è corretto secondo le sue regole".
2. Mostra l'aritmetica semplice: somma delle conversioni dichiarate da tutte le piattaforme contro ordini reali nel gestionale. La differenza si vede da sola e non richiede argomenti.
3. Riformula la domanda: "la piattaforma dice a quanti acquirenti ha mostrato un annuncio. Tu devi sapere quanti acquirenti esistono *perché* hai mostrato l'annuncio."
4. Usa l'esempio del brand search: nessun cliente crede che chi cerca il suo nome sia stato convinto in quel momento.
5. Non chiedere di buttare via il dato di piattaforma: resta lo strumento per decidere dentro la piattaforma. Cambia a cosa serve.
6. Proponi un test concreto, con costo, durata e cosa si deciderà in base al risultato.
7. Dichiara in anticipo l'esito scomodo: è possibile che il test mostri un effetto molto più piccolo del dichiarato, e in quel caso la conclusione non è "spegnere", è ritarare il budget.

Se serve un riferimento esterno sulla distanza tipica fra ROAS dichiarato e incrementale, non inventarlo: cercalo con `WebSearch` su studi con metodologia pubblicata — esperimenti di piattaforma, ricerca accademica, meta-analisi di settore — e riporta fonte e data. Ogni cifra citata senza fonte in questa conversazione distrugge la credibilità dell'intero argomento.

## Errori che costano

- **Holdout costruito a mano** escludendo un'audience: non è randomizzato, il risultato non vale.
- **Geo test su due aree.** Nessuna potenza, conclusione inventata.
- **Nessun periodo di pre-test.** Non si sa se i gruppi erano comparabili.
- **Promozione lanciata durante il test.** Test perso, e nessuno lo nota se non si chiede.
- **Guardare i risultati ogni giorno e fermarsi quando piacciono.** Falso positivo quasi garantito.
- **Non calcolare prima se il test può rilevare l'effetto.** Si spende un mese per non sapere niente.
- **Misurare l'esito con la piattaforma invece che col gestionale.** Si misura lo strumento, non la realtà.
- **Ignorare la sostituzione fra canali.** Si spegne un canale, un altro sembra migliorare, si conclude il contrario del vero.
- **Presentare un lift senza intervallo di incertezza.** Il cliente lo tratterà come esatto per sempre.
- **Estrapolare un risultato a budget molto più alti.** Si ignora la saturazione e si brucia spesa.
- **MMM su dati senza variabilità di spesa.** Numeri precisi e privi di contenuto.
- **MMM senza promozioni e prezzo fra le variabili.** Sovrastima sistematica dei media.
- **Promettere un numero certo.** La misurazione causale produce stime con incertezza: venderla come certezza prepara la rottura della relazione.

Ogni consegna chiude dichiarando l'assunzione non verificata e la dimensione dell'effetto che il disegno adottato non era in grado di rilevare.

## Confine

Qui c'è la misura dell'incrementalità del media: geo test, holdout, MMM. La matematica del campione, della potenza e della significatività sta in `experiment-stats` — usala per dimensionare e per leggere, non rifare il calcolo qui.
