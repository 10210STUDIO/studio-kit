---
name: project-margin
description: Usa quando serve capire se un progetto, un retainer o un cliente guadagna: conto economico di progetto, costo pieno risorsa, stimato vs consuntivo, margine dopo le revisioni, decidere se accettare o rifiutare un lavoro.
---

# Marginalità di progetto

Uno studio bravo muore perché non sa quale lavoro lo paga. Il fatturato non è il segnale: il margine per ora erogata lo è. Questa skill costruisce il conto economico di un progetto e lo usa per decidere.

**Limite da dichiarare sempre nell'output:** i calcoli di costo del lavoro (contributi, TFR, ritenute, inquadramenti, trattamento di partite IVA e collaboratori) dipendono da CCNL, forma contrattuale e regime fiscale. Questa skill produce un modello economico gestionale, non un calcolo paghe né consulenza fiscale. Far validare le aliquote reali al consulente del lavoro o al commercialista. Contesto italiano/UE.

## Regola sui numeri

Non inventare tariffe, margini tipici, moltiplicatori o percentuali di settore. Se nell'output serve una cifra per mostrare come funziona un calcolo, etichettala `esempio aritmetico, non benchmark`. Quando il task richiede un dato reale (tariffa di mercato per un ruolo, margine atteso di un'agenzia, costo orario medio) cercalo con `WebSearch` su fonti primarie — associazioni di settore, report con metodologia pubblicata, dati ISTAT/Eurostat — e cita fonte e data. Meglio dichiarare "non lo so, serve un dato" che produrre un numero verosimile.

## 1. Costruire il conto economico di progetto

Un progetto ha questa struttura. Niente di più.

```
Ricavo contrattualizzato                           A
- Costo diretto persone (ore × costo pieno orario) B
- Costo diretto fornitori e licenze                C
- Costo diretto AI/compute                         D
= Margine di contribuzione                         A-B-C-D
  Margine % = (A-B-C-D) / A
```

Non allocare overhead (affitto, software generale, amministrazione) dentro il singolo progetto in prima battuta. Prima misura il margine di contribuzione, che è confrontabile fra progetti. L'overhead si copre a livello di studio: somma dei margini di contribuzione dell'anno > costi di struttura. Un progetto va giudicato su quanto contribuisce per ora di persona impegnata, perché la risorsa scarsa in uno studio è il tempo delle persone brave, non il fatturato.

**Metrica di confronto unica:** margine di contribuzione / ore erogate. Chiamala *contribuzione oraria*. È l'unico numero che permette di mettere in fila un branding, un retainer social e una produzione video.

## 2. Costo pieno di una risorsa, non lo stipendio

Il costo orario da usare in B non è lo stipendio diviso le ore. Costruiscilo così:

1. **Costo annuo lordo azienda** della persona: retribuzione + contributi + TFR + eventuali premi. Per un collaboratore con partita IVA: compenso annuo concordato. Chiedi il dato, non stimarlo.
2. **Ore erogabili annue**, non ore lavorate. Parti dalle ore di contratto, togli ferie, festività, malattia media, formazione, riunioni interne, lavoro commerciale e amministrativo. Quello che resta è il tempo vendibile.
3. Costo pieno orario = (1) / (2).

Il punto che quasi tutti sbagliano: usare le ore lavorate al denominatore. Fa sembrare la persona più economica di quanto sia e sistematicamente sovrastima il margine. Se il cliente paga solo il tempo vendibile, quel tempo deve reggere anche il peso del tempo non vendibile.

Chiedi all'utente il tasso di erogabilità reale (percentuale di ore vendute su ore disponibili). Se non lo sa, è la prima cosa da misurare: due settimane di consuntivo onesto bastano per avere l'ordine di grandezza.

**Tariffa vs costo.** La tariffa esposta al cliente è un prezzo, cioè una funzione del valore percepito e del mercato. Il costo pieno è un vincolo. Non derivare il prezzo dal costo con un moltiplicatore: usa il costo come soglia sotto cui non si scende, e il valore per il cliente per decidere quanto sopra stare.

## 3. Il costo di Claude/AI come costo diretto

Tratta il tempo di Claude e degli altri modelli come **costo diretto di progetto, riga D**, non come software di struttura. Motivi: scala con il volume di lavoro del progetto, è attribuibile, e se non lo attribuisci perdi il segnale più importante — se l'AI stia aumentando il margine o solo la velocità.

Come fare:

- Registra per progetto la spesa API/abbonamenti pro-quota e il costo delle ore umane di supervisione e correzione. La supervisione è la voce che nasconde i costi: output generato in due minuti e rifatto in due ore non è un risparmio.
- Misura `contribuzione oraria` prima e dopo l'introduzione dell'AI su task comparabili. Se le ore scendono ma il prezzo scende di più perché il cliente ha capito che "lo fa l'AI", il margine peggiora. È un rischio commerciale, non tecnico: decidi in anticipo se e come comunicare l'uso dell'AI.
- Quando l'AI accorcia il lavoro, decidi esplicitamente dove va il guadagno: margine, prezzo più basso per vincere la gara, o più qualità a parità di prezzo. Se non decidi, viene mangiato da revisioni aggiuntive.
- Non vendere a tempo ciò che l'AI ha reso veloce. Il billing a ore punisce chi migliora. Spostati su prezzo a deliverable o a risultato.

## 4. Stimato vs consuntivo

Senza consuntivo, il margine è un'opinione. Processo minimo:

1. A preventivo, stima le ore **per fase e per ruolo**, non in totale. Il totale non dice dove sbagli.
2. Durante il progetto, registra le ore reali con la stessa granularità. Una riga per persona/fase/giorno. Se il tracking è pesante, nessuno lo fa: una stima a fine giornata per fase è meglio di un timer perfetto abbandonato alla terza settimana.
3. A chiusura calcola lo scostamento per fase e la contribuzione oraria.
4. Scrivi a playbook la **percentuale di scostamento per tipo di progetto**. Dopo pochi progetti dello stesso tipo hai il tuo correttivo di stima, che vale più di qualunque benchmark esterno perché misura il tuo studio e i tuoi clienti.

Tieni traccia separata delle ore **oltre scope** (vedi `scoping-change-orders`): sono il margine perso che il cliente potrebbe aver pagato.

## 5. Progetti che sembrano buoni e non lo sono

Analizzali in questo ordine, sono i quattro modi tipici di perdere soldi senza accorgersene.

**Retainer sottoprezzato.** Il retainer è venduto su un monte ore o su un set di deliverable e poi erode: il cliente chiede di più, nessuno rinegozia, il fee resta fermo per anni mentre i costi salgono. Segnali: ore erogate che crescono mese su mese a fee costante; nessuna data di revisione del fee nel contratto; impossibilità di dire quali deliverable sono inclusi. Azione: ricostruisci il consuntivo degli ultimi 3-6 mesi, calcola la contribuzione oraria reale, e porta al cliente una rinegoziazione basata sul perimetro, non sul prezzo ("ecco cosa stiamo facendo in più; scegli se includerlo al nuovo fee o togliere").

**Cliente a revisioni infinite.** Il progetto ha un buon prezzo e un buon margine a preventivo, distrutto dai round non previsti. Causa quasi sempre strutturale, non caratteriale: nessun decisore unico, approvazioni per comitato, feedback raccolto senza filtro. Azione: conta i round reali per cliente e mettili accanto al margine. Poi scope e governance delle approvazioni, non pazienza.

**Progetto vetrina.** Accettato sotto costo per il portfolio o per il nome. Valido solo se tre condizioni sono tutte vere e verificabili prima di firmare: autorizzazione scritta alla pubblicazione del lavoro (vedi `sow-contracts` e `case-study-production`), accesso ai numeri di risultato, e un tetto di ore oltre il quale si ferma. Se mancano, è lavoro gratis con una storia.

**Cliente grande con costo di servizio nascosto.** Fee alto, margine apparente alto, ma procurement, portali fornitori, report mensili, riunioni di allineamento, pagamenti a 90 giorni. Conta quelle ore in B e il costo finanziario del ritardo di incasso. Spesso il cliente piccolo e sveglio contribuisce di più per ora.

## 6. Esempio aritmetico del calcolo

Numeri inventati per mostrare il meccanismo. Nessuna cifra qui è un benchmark: non citarle a un cliente.

```
Progetto, prezzo a corpo                            20.000
Ore stimate a preventivo                               200
Ore consuntivo                                         260   (+30%)
Costo pieno orario medio del team (esempio)             45
Costo persone                       260 × 45 =      11.700
Fornitori e licenze                                  2.000
AI/compute + supervisione                              800
Margine di contribuzione                             5.500   (27,5%)
Contribuzione oraria              5.500 / 260 =       21,2
```

Lettura: a preventivo la contribuzione oraria era 5.500+2.700 su 200 ore, cioè oltre 40. Lo scostamento del 30% sulle ore ha dimezzato la contribuzione oraria senza cambiare né prezzo né percentuale apparente in modo drammatico. È per questo che si guarda la contribuzione oraria e non il margine percentuale. Rifai lo stesso calcolo con i costi veri dello studio prima di usarlo per decidere.

## 7. Dal progetto al cliente e allo studio

Il progetto non è l'unità finale. Aggrega sempre a due livelli superiori, perché le decisioni commerciali si prendono lì:

- **Cliente:** somma dei margini di contribuzione di tutti i suoi progetti dell'anno, più il costo di servizio non fatturato (riunioni, gestione, rifacimenti assorbiti, recupero crediti). Molti clienti che sembrano importanti per fatturato sono a contribuzione negativa.
- **Studio:** somma dei margini di contribuzione dell'anno contro i costi di struttura. La differenza è l'utile gestionale, e il rapporto fra i due dice quanta capacità venduta serve solo a tenere aperte le luci.
- **Concentrazione:** quota del margine (non del fatturato) proveniente dal primo cliente. Un cliente che porta la maggior parte del margine è un rischio di sopravvivenza, non un successo commerciale.

Da qui deriva la soglia minima interna di contribuzione oraria: il livello sotto il quale lo studio, al tasso di erogabilità reale, non copre la struttura. Calcolala, non prenderla da un articolo.

## 8. Decidere se rifiutare un lavoro

Prima della proposta, rispondi a queste. Un "no" chiaro su una qualsiasi è ragione sufficiente per rifiutare o per riprezzare.

- La contribuzione oraria stimata, nello **scenario pessimistico** di ore (usa il tuo correttivo di scostamento storico), resta sopra la soglia dello studio?
- Chi approva è una persona sola e identificabile?
- Il risultato atteso dal cliente è misurabile e sotto il nostro controllo? Se il successo dipende da fattori che non governiamo, il rischio è nostro e il merito suo.
- Il lavoro occupa le persone che servirebbero a un lavoro migliore nello stesso periodo? Il costo opportunità è un costo reale.
- Il cliente ha pagato in tempo in passato, o ha referenze di pagamento?

Quando rifiuti, rifiuta con una tariffa: "a queste condizioni il prezzo è X" è più utile di un no e lascia la porta aperta. Non scendere di prezzo senza togliere perimetro — un prezzo ridotto a scope invariato insegna al cliente che il primo numero era gonfiato.

## 9. Output da produrre

Quando operi su un progetto, consegna:

1. Tabella conto economico (A, B, C, D, margine, contribuzione oraria) con fonte di ogni input e marcatura `[stimato]` o `[consuntivo]`.
2. Scostamento stimato/consuntivo per fase.
3. Le tre leve concrete che muoverebbero più margine su questo progetto, ordinate per fattibilità.
4. Riga di chiusura su cosa non hai verificato e quale rischio porta (regola 5 di STUDIO.md).

## Errori che costano

- **Dividere lo stipendio per le ore lavorate invece che erogabili.** Sovrastima il margine in modo sistematico e su ogni progetto: lo studio crede di guadagnare e a fine anno non ha cassa.
- **Guardare il margine percentuale e non la contribuzione oraria.** Un progetto al 40% che blocca il team un mese può valere meno di uno al 25% chiuso in una settimana.
- **Non tracciare le ore oltre scope.** Diventano invisibili, quindi non rinegoziabili, quindi strutturali: il prossimo preventivo le ripeterà senza prezzarle.
- **Allocare overhead sul singolo progetto troppo presto.** Rende i confronti arbitrari e fa litigare sulla ripartizione invece di sui costi.
- **Riprezzare un retainer sul prezzo invece che sul perimetro.** Una richiesta di aumento senza elenco del lavoro aggiunto suona come avidità; con l'elenco è una constatazione.
- **Accettare un progetto vetrina senza autorizzazione scritta alla pubblicazione.** Nella maggioranza dei casi il permesso non arriva mai e resta solo lo sconto.
- **Chiudere un progetto senza consuntivo.** Si perde l'unico dato che avrebbe migliorato la stima successiva: lo studio sbaglia lo stesso preventivo per anni.
- **Usare benchmark di margine letti online come soglia interna.** Settori, mix di servizi e strutture di costo non sono comparabili. La soglia si deriva dai propri costi di struttura e dal proprio tasso di erogabilità.
