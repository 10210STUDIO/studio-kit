---
name: cro-experimentation
description: Usa quando devi migliorare un tasso di conversione con metodo: trovare cosa testare dai dati, scrivere ipotesi falsificabili, fare friction audit del percorso, scegliere fra test e cambiamento diretto, distinguere ottimizzazione di pagina da ottimizzazione dell'offerta.
---

# CRO ed esperimenti

La CRO non è una lista di best practice applicate a una pagina. È un processo che trasforma evidenza in ipotesi, ipotesi in cambiamento e cambiamento in apprendimento. Lo studio sa comprare traffico e costruire pagine: il buco è il metodo per sapere **cosa** cambiare e **se** il cambiamento ha funzionato.

Due principi reggono tutto il resto:
1. Non testi idee, testi ipotesi derivate da evidenza. Un'idea senza evidenza a monte è una scommessa, e le scommesse si gestiscono col rischio, non col rigore.
2. Il traffico è una risorsa finita. Ogni test consuma traffico che un altro test non avrà. Per questo la priorità conta più della creatività.

Per la parte numerica — dimensione del campione, durata, lettura del risultato — usa `experiment-stats`. Questa skill decide *cosa* testare; quella decide *se hai imparato qualcosa*.

## Gerarchia delle evidenze

Cerca cosa testare in questo ordine. Non salire di livello prima di aver esaurito quello sotto, perché le euristiche sono l'ultima risorsa, non la prima.

**1. Dati quantitativi.** Dicono *dove* si perde, mai *perché*.
- Funnel per step con tasso di passaggio e volume assoluto perso a ogni step. Ordina per persone perse, non per percentuale: un 60% di abbandono su 200 visite vale meno di un 15% su 20.000.
- Segmentazione dello stesso funnel per device, sorgente/campagna, nuovo vs ritornante, area geografica, pagina di ingresso. Il problema è quasi sempre concentrato in un segmento e invisibile nella media.
- Errori e performance: step con errori di validazione o di pagamento, tempi di caricamento, Core Web Vitals sui template che convertono.
- Ricerca interna del sito: le query a zero risultati sono una lista di cose che le persone volevano e non hanno trovato.

**2. Registrazioni di sessione e heatmap.** Dicono *cosa succede* a livello di comportamento. Non guardarle a caso: filtra sulle sessioni che contengono l'evento problematico individuato al punto 1 (abbandono su quello step, rage click, errore di form, sessione lunga senza conversione). Venti sessioni filtrate bene valgono più di duecento viste di fila. Guarda anche l'uso effettivo dei form (campi riscritti, abbandoni per campo).

**3. Ricerca sugli utenti.** Dice *perché*, e nient'altro lo dice.
- Interviste a chi ha comprato di recente: cosa ti ha fatto dubitare, cosa hai confrontato, cosa cercavi e non trovavi.
- Interviste o sondaggi a chi non ha comprato, e al supporto o alle vendite: le obiezioni ricorrenti sono già raccolte lì, gratis. Leggi i ticket e le chat prima di progettare un sondaggio nuovo.
- Microsondaggi on-site su intento e ostacolo, su una domanda sola.
- Test di usabilità con compito assegnato su 5 persone del target: scopre i blocchi funzionali, non le preferenze.
- Recensioni dei concorrenti e proprie: vocabolario e criteri di scelta reali.

**4. Euristiche e principi.** Chiarezza del valore, rilevanza rispetto alla promessa dell'annuncio, frizione, ansia e rischio percepito, distrazione, urgenza legittima. Servono per generare ipotesi quando le evidenze sopra sono sottili, e per fare una prima scrematura rapida. Non spacciarle per evidenza.

Scrivi sempre, per ogni ipotesi, da quale livello viene. Un backlog dove tutto viene dal livello 4 è un backlog di opinioni.

## Ipotesi falsificabile

Forma obbligatoria:

> Poiché [evidenza, con fonte e livello], se [cambiamento specifico] allora [metrica primaria] [direzione e ordine di grandezza atteso] per [segmento/pagina], perché [meccanismo causale].

Requisiti:
- **Evidenza citata**, non intuizione.
- **Un meccanismo**: perché questo cambiamento dovrebbe muovere quella metrica. Senza meccanismo, qualunque esito è inspiegabile e quindi inutilizzabile.
- **Metrica primaria unica**, dichiarata prima, più vicina possibile al ricavo ma misurabile nel tempo del test.
- **Metriche di guardia** dichiarate prima: cose che il test non deve peggiorare (valore medio ordine, resi, carico sul supporto, tasso di rimborso, lead qualificati e non solo lead).
- **Condizione di falsificazione**: cosa osserveresti se l'ipotesi fosse sbagliata, e cosa farai in quel caso.

Non ammettere ipotesi del tipo "proviamo a cambiare X e vediamo". Se non sai cosa impareresti da un esito negativo, non c'è niente da imparare nemmeno da quello positivo.

## Priorità del backlog

Dai a ogni ipotesi tre valutazioni esplicite e discutibili: impatto atteso (volume di traffico toccato × forza attesa del cambiamento), fiducia (dal livello di evidenza), costo (sviluppo, design, rischio tecnico). I framework a punteggio tipo ICE o PIE servono a rendere il ragionamento visibile e confrontabile, non a produrre un numero oggettivo: non trattarli come matematica.

Vincolo che precede tutto: **impatto × volume**. Non ottimizzare pagine che non hanno traffico. Su una pagina a basso volume non testi: decidi in base all'evidenza qualitativa e implementi.

## Cosa si può testare e cosa no

**Testabile in A/B con pulizia:** layout e struttura di una pagina ad alto traffico, copy e gerarchia del messaggio, numero e ordine dei campi di un form, flusso di checkout, posizionamento e contenuto degli elementi di riprova e rassicurazione, struttura di pagina listing/filtri, presenza e forma di un passaggio aggiuntivo.

**Difficile o impossibile in A/B, da misurare in altro modo:**
- Prezzo e sconti: discriminazione fra utenti, problemi legali e di fiducia, effetti di lungo periodo sul margine e sulla percezione. Testa per periodo, per mercato o su coorti, e con il consenso del cliente.
- Branding, naming, posizionamento: l'effetto è lento e cumulativo, l'A/B misura una finestra breve.
- Cambiamenti che toccano il cliente ricorrente: contaminazione fra varianti su più sessioni e device.
- Qualunque cosa il cui effetto si manifesti dopo la vendita (retention, resi, LTV): puoi lanciarla, ma la lettura arriva mesi dopo e l'A/B va tenuto in piedi fino allora.
- Pagine a basso traffico: matematicamente fuori portata.
- Modifiche che richiedono mascheramento al motore di ricerca o cloaking: non farle.

Per i casi non testabili in A/B usa test geografici, holdout, confronti pre/post con controllo e switchback. Vedi `experiment-stats`.

## Perché i test di uno studio piccolo non raggiungono la significatività

La sensibilità di un test dipende dal numero di conversioni osservate, non dalle visite. Con poche conversioni al mese, l'effetto minimo rilevabile resta grande: dimezzare quell'effetto minimo richiede circa quattro volte il campione. Un cambiamento piccolo su un volume piccolo è invisibile per costruzione — e questo si sa **prima** di lanciare, con un calcolo di dimensione del campione. Farlo è il primo atto, non l'ultimo.

Conseguenze operative, da applicare senza discutere:

1. **Calcola la dimensione del campione prima.** Se il test richiede più tempo di quanto il cliente possa aspettare, non lanciarlo come A/B.
2. **Testa cambiamenti grossi.** Pagina riprogettata contro pagina attuale, offerta diversa, flusso diverso, messaggio radicalmente diverso. Il colore del bottone, se anche funzionasse, produce un effetto troppo piccolo da rilevare con quel traffico: testarlo è spendere settimane per imparare zero.
3. **Sposta la metrica a monte quando serve sensibilità**, accettando il compromesso: un proxy più frequente (aggiunta al carrello, inizio checkout) dà potenza statistica ma può muoversi in direzione opposta al ricavo. Dichiara il proxy come proxy e conferma su una metrica di business prima di dire a un cliente che ha guadagnato.
4. **Concentra il traffico**: due varianti, non cinque. Ogni variante in più divide il campione e moltiplica i confronti.
5. **Quando il test non è possibile, cambia strumento**: friction audit e correzione di difetti evidenti (errori, rotture mobile, form inutilmente lunghi, promessa dell'annuncio non mantenuta dalla pagina) si implementano senza test. Non serve un A/B per riparare un bottone che non funziona su iOS.
6. **Accumula apprendimento qualitativo**: su volumi bassi il vantaggio competitivo è capire i clienti, non misurare incrementi.
7. **Quando implementi senza test, dillo per iscritto**: "cambiamento implementato per diagnosi, effetto non misurato in isolamento". Mai attribuire al cambiamento un lift calcolato su un pre/post senza controllo.

## Friction audit del percorso di conversione

Percorri il percorso reale — dall'annuncio o dalla SERP fino alla conferma — su mobile, con rete lenta, come utente nuovo, e in un secondo passaggio come utente ritornante. Registra ogni punto dove serve uno sforzo, una decisione o un atto di fiducia. Per ciascuno annota la categoria:

- **Continuità**: la pagina mantiene la promessa della fonte? Il messaggio dell'annuncio compare sopra la piega?
- **Comprensione**: cosa è, per chi, cosa ottengo, quanto costa, cosa accade dopo il click. Se una di queste manca sopra la piega, è un difetto.
- **Fiducia e rischio**: resi, garanzia, spedizione, chi siete, prova reale e verificabile, trasparenza su costi e tempi.
- **Sforzo meccanico**: campi, step, obblighi di registrazione, scelte non necessarie, input che il sistema potrebbe dedurre.
- **Difetti tecnici**: errori di validazione poco chiari, elementi che si sovrappongono, tastiera sbagliata su mobile, lentezza, scelta del metodo di pagamento.
- **Distrazione**: uscite dal percorso in un punto dove l'unica azione utile è procedere.
- **Accessibilità**: contrasto, dimensione dei target, navigazione da tastiera, etichette dei campi. Non è un extra e non si taglia.

Chiudi l'audit con una lista ordinata e una separazione netta fra **difetti** (si correggono subito, senza test) e **ipotesi** (entrano nel backlog). Confondere i due produce test inutili su cose rotte.

## Pagina contro offerta

La maggior parte dei soffitti di conversione non è sulla pagina. Prima di ottimizzare la pagina verifica se il limite è nell'offerta: cosa si riceve, a che prezzo, con quale rischio per chi compra, con quale ragione per agire ora, contro quali alternative, incluso il non fare niente.

Segnali che il problema è l'offerta e non la pagina: i test di pagina continuano a risultare piatti; le obiezioni nelle interviste sono sul prezzo, sul rischio o sulla rilevanza, non sulla chiarezza; la pagina è già chiara e priva di frizione; il traffico è qualificato e abbondante e converte male comunque; i concorrenti con pagine peggiori convertono meglio.

Leve sull'offerta: composizione (cosa includi), prezzo e forma di pagamento, trasferimento del rischio (garanzia, prova, reso, risultato garantito), termini (durata, impegno), bonus pertinenti, chiarezza del target. Hanno effetti grossi e quindi misurabili anche su volumi che un test di layout non potrebbe reggere. Una leva di offerta richiede sempre l'autorizzazione del cliente e una verifica di margine: un lift ottenuto regalando margine non è un risultato.

## Registro dei test

Tieni un registro unico per cliente, in `clients/<slug>/`, con una riga per test: data di inizio e fine, pagina o flusso, ipotesi completa, livello di evidenza a monte, metrica primaria e metriche di guardia, MDE e campione previsti, risultato con intervallo di confidenza, decisione presa, cosa si è imparato sul cliente (non sulla pagina).

Serve a tre cose: non ritestare quello che è già stato testato, accumulare conoscenza sul pubblico del cliente che nessun concorrente ha, e difendere le decisioni quando cambia l'interlocutore. Registra i perdenti e gli inconcludenti con lo stesso rigore dei vincenti; sono la parte più informativa.

Prima di ogni lancio, QA della variante: entrambe le versioni su mobile e desktop, sui browser principali, con e senza blocker, a carrello vuoto e pieno, in stato logged-in e anonimo. Verifica che l'evento della metrica primaria scatti in entrambe. Un'ora di QA evita un mese di test invalido. Dopo il lancio, controllo SRM obbligatorio dopo 24 ore e a fine test (vedi `experiment-stats`): con lo split sbilanciato il test non si legge.

## Errori che costano

- Testare la lista delle best practice invece dell'evidenza del cliente.
- Dichiarare un vincitore guardando il cruscotto ogni giorno e fermando al primo momento favorevole. Vedi `experiment-stats`, sezione peeking.
- Nessuna dimensione del campione calcolata prima: il test finisce quando qualcuno si annoia.
- Metriche primarie decise dopo aver visto i dati, o cambiate a metà.
- Ottimizzare un micro-evento (click, scroll, aggiunta al carrello) e riportarlo al cliente come ricavo.
- Testare su pagine senza traffico, bruciando settimane per un risultato matematicamente impossibile.
- Cinque varianti su un traffico che ne regge due.
- QA della variante assente: la variante rotta su un browser produce un "perdente" che è un bug.
- Ignorare le metriche di guardia: più lead e meno lead qualificati è una perdita travestita da vittoria.
- Non registrare i test perduti e inconcludenti: metà dell'apprendimento sta lì, e senza registro lo studio ritesta le stesse cose.
- Lasciare lo strumento di test attivo con flicker visibile o script che rallentano: l'infrastruttura di misura che peggiora l'esperienza.
- Attribuire a un cambiamento un miglioramento pre/post coinciso con un cambio di budget, di stagione o di mix di traffico.
- Ottimizzare la pagina quando il problema è l'offerta, per sei mesi.
