---
name: experiment-stats
description: Usa quando devi dimensionare, far durare, fermare o interpretare un test: calcolo del campione, significatività e p-value, peeking, confronti multipli, durata minima, test geografici e holdout, lettura di un risultato non conclusivo.
---

# Statistica degli esperimenti

Questa skill serve a non raccontare bugie con i numeri. Vale per A/B test su pagine e flussi, per test creativi sul paid, per test di email e per qualunque confronto fra due condizioni.

Regola di base: la statistica non rende vero un test fatto male. Serve a quantificare quanta incertezza resta dopo un test fatto bene. Se il disegno è sporco (varianti rotte, traffico contaminato, periodo anomalo), nessun calcolo lo salva.

I numeri usati sotto sono **esempi aritmetici per mostrare un meccanismo**, non benchmark. Non riportarli a un cliente come valori attesi.

## Prima di partire: il campione

Calcola la dimensione del campione **prima di lanciare**. Non è burocrazia: è il calcolo che dice se il test è possibile. Se dopo averlo fatto scopri che servono sei mesi, hai risparmiato sei mesi.

Servono quattro input, tutti dichiarati per iscritto:
1. **Tasso di conversione di base** della metrica primaria, misurato nello stesso periodo dell'anno e sullo stesso segmento che entrerà nel test.
2. **Effetto minimo rilevabile (MDE)**: la differenza più piccola che vuoi poter distinguere dal rumore. Dichiara se è relativa (+20% sul tasso) o assoluta (+0,4 punti): confonderle è l'errore più comune. Non scegliere l'MDE in base alla speranza: scegli la differenza minima che cambierebbe una decisione di business.
3. **Livello di significatività α** (convenzionalmente 0,05 a due code).
4. **Potenza 1−β** (convenzionalmente 0,80; 0,90 se il costo di un falso negativo è alto).

Per il confronto di due proporzioni con gruppi di pari dimensione, il campione per variante è:

```
n = (z_{1−α/2} + z_{1−β})² · [ p1(1−p1) + p2(1−p2) ] / (p2 − p1)²
```

Con α = 0,05 a due code e potenza 0,80: z_{1−α/2} ≈ 1,96 e z_{1−β} ≈ 0,84, quindi (1,96 + 0,84)² ≈ 7,85.

Esempio aritmetico (solo per mostrare l'ordine di grandezza): base p1 = 2%, effetto relativo atteso +20% quindi p2 = 2,4%, differenza assoluta 0,004.
`n ≈ 7,85 · [0,02·0,98 + 0,024·0,976] / 0,004² ≈ 7,85 · 0,02303 / 0,000016 ≈ 21.100` per variante, cioè circa 42.000 visitatori in totale, più il traffico eventualmente escluso.

Cosa portarsi via dal calcolo, al di là della formula:
- **Il campione cresce col quadrato dell'inverso dell'MDE.** Dimezzare l'effetto che vuoi rilevare moltiplica il campione per quattro. Per questo i cambiamenti piccoli non sono testabili su traffico piccolo: non è pigrizia, è aritmetica.
- **Conta il numero di conversioni, non di visite.** Un tasso di base più basso richiede molto più traffico a parità di effetto relativo.
- Ogni variante in più divide il traffico e aumenta il numero di confronti: due varianti sono quasi sempre la scelta giusta.

Verifica sempre il numero con uno strumento invece di fidarti di un calcolo a mente: calcolatore di dimensione del campione di una fonte affidabile (Evan Miller, i calcolatori delle piattaforme di testing, `statsmodels.stats.power` in Python, `pwr` in R). Se la metrica non è una proporzione ma un valore continuo (ricavo per utente, valore medio ordine), la formula sopra **non si applica**: serve la deviazione standard della metrica e un test su medie, e il ricavo per utente ha una distribuzione molto asimmetrica che richiede più campione o metodi dedicati (trimming dichiarato, bootstrap, CUPED per ridurre la varianza con dati pre-esperimento). In quel caso fai eseguire il calcolo a uno strumento e dichiara il metodo.

## Significatività: cosa dice e cosa no

Un p-value è la probabilità di osservare una differenza almeno così estrema **se l'ipotesi nulla fosse vera**. Niente altro.

Non significa:
- "C'è il 95% di probabilità che la variante sia migliore". La probabilità è calcolata sui dati dato il nulla, non sull'ipotesi dati i dati.
- "C'è il 95% di probabilità che il risultato si replichi".
- "L'effetto misurato è l'effetto vero". La stima puntuale di un test appena significativo è tipicamente gonfiata: se il test è sotto-dimensionato, i soli risultati che superano la soglia sono quelli dove il rumore ha spinto nella direzione favorevole. Questo è il motivo per cui i lift promessi non si ritrovano a regime.
- "Significativo = rilevante". Con campione enorme diventano significative differenze economicamente irrilevanti.
- "Non significativo = nessuna differenza". Vedi la sezione sui risultati non conclusivi.

Riporta sempre l'**intervallo di confidenza** dell'effetto, non il solo p-value o il solo "vincitore". L'intervallo contiene l'informazione che serve a decidere: qual è il caso peggiore plausibile, e vale ancora la pena di implementare.

## Peeking

Guardare i risultati in corsa e fermare il test quando appare significativo invalida il test. Il motivo: la soglia α = 0,05 garantisce un 5% di falsi positivi **per un singolo controllo a campione raggiunto**. Se controlli ogni giorno e ti fermi al primo superamento della soglia, stai facendo molti test e tenendo solo quello favorevole; la probabilità di un falso positivo cresce con il numero di controlli, e con controlli frequenti supera largamente il 5%. Un test senza effetto reale, guardato abbastanza volte, prima o poi attraversa la soglia per caso.

Il fenomeno si aggrava perché il rumore è massimo all'inizio, quando i numeri sono piccoli: i primi giorni mostrano differenze enormi che non esistono. Chi guarda presto vede sempre un vincitore.

Regole operative:
1. Fissa in anticipo campione e data di fine, e leggi il risultato alla fine.
2. Se devi poter decidere in corsa, usa un metodo progettato per questo: test sequenziale con alpha spending (O'Brien-Fleming, Pocock), always-valid inference / sequential testing, o un approccio bayesiano con regola di stop dichiarata prima. Molte piattaforme li implementano: verifica nella documentazione quale metodo usa lo strumento in uso prima di interpretare i suoi "99% di probabilità di essere vincente", perché la frase significa cose diverse a seconda del motore statistico.
3. Il monitoraggio in corsa è legittimo **solo** per controlli di salute: errori, varianti rotte, split sbilanciato, crolli anomali. Guardare per interrompere un disastro è corretto; guardare per dichiarare una vittoria non lo è.
4. Non prolungare un test oltre la fine prevista sperando che diventi significativo: è peeking al contrario, con lo stesso danno.

## Confronti multipli

Ogni confronto aggiunto è un'altra occasione di falso positivo. Con k confronti indipendenti a α = 0,05, la probabilità di almeno un falso positivo è 1 − (1 − 0,05)^k: con k = 5 vale circa il 23%, con k = 10 circa il 40%.

I confronti si moltiplicano in modi che non si vedono:
- Più varianti contro lo stesso controllo.
- Più metriche lette tutte come se fossero primarie.
- Segmentazione post-hoc: device, sorgente, paese, nuovi vs ritornanti. Qui il numero di confronti esplode, ed è il meccanismo che produce la frase "non ha funzionato, ma su mobile sì".

Cosa fare:
- **Una metrica primaria sola**, dichiarata prima. Tutto il resto è secondario o di guardia, e le letture secondarie si riportano come esplorative, non come conclusioni.
- **Correggi quando confronti più varianti o più metriche primarie**: Bonferroni (α/k: con 5 confronti, soglia 0,01) è conservativo ma semplice e difendibile; Holm o Benjamini-Hochberg sono meno severi. Dichiara quale hai usato.
- **I segmenti si dichiarano prima**, e con un'ipotesi che spieghi perché l'effetto dovrebbe differire in quel segmento. Un segmento trovato dopo è un'ipotesi nuova da testare, non un risultato.
- Nessuna correzione rende valido un test letto in venti modi diversi finché uno ha funzionato.

## Durata minima

Il campione dice quante persone servono; la durata dice in quanto tempo è lecito raccoglierle.

- **Minimo una settimana intera, e sempre in multipli di settimane intere.** Il comportamento d'acquisto varia per giorno della settimana: un test che inizia il martedì e finisce il venerdì campiona un mix di giorni diverso fra le sue fasi e pesa in modo scorretto i segmenti.
- **Copri il ciclo di decisione.** Se fra la prima visita e l'acquisto passano in media due settimane, un test di una settimana conta esposizioni le cui conversioni cadono fuori dalla finestra di misura, sottostimando l'effetto. Misura prima la distribuzione del ritardo fra primo contatto e conversione, poi aggiungi quel ritardo alla durata.
- **Due o tre settimane come intervallo di lavoro usuale**: sotto, c'è contaminazione da giorno della settimana; molto sopra (oltre 4-6 settimane) crescono i rischi di cookie deletion, cambio device, stagionalità, modifiche al sito o al mix di traffico fatte da altri.
- **Non fermare un test a metà di una settimana** anche se il campione è stato raggiunto: completa il ciclo.
- Evita periodi anomali (saldi, Black Friday, festività, picco PR, cambio radicale di budget). Se non puoi evitarli, dichiaralo come limite nella lettura, e non estrapolare il risultato al resto dell'anno.
- Registra ogni cambiamento esterno avvenuto durante il test. Un test valido con un deploy a metà non è un test valido.

## Quando l'A/B non è possibile: geo test e holdout

Servono quando la randomizzazione per utente non è disponibile o non ha senso: misurare l'effetto incrementale di un canale, TV, radio, affissione, grandi campagne di brand, prezzi, cambi che toccano tutti gli utenti, oppure effetti su un sistema dove il trattamento "sborda" (spillover) fra i gruppi.

**Geo test.** Dividi il mercato in aree geografiche, applica il trattamento ad alcune e non ad altre.
- Costruisci i gruppi su aree **simili per andamento storico** della metrica, non per dimensione. Il criterio è la correlazione delle serie temporali nel periodo pre-test.
- Raccogli un periodo pre-test sufficiente a stabilire la relazione fra i gruppi.
- Analizza con difference-in-differences o controllo sintetico; non confrontare i livelli assoluti fra aree. Strumenti: GeoLift, CausalImpact, pacchetti di synthetic control. Fa eseguire il calcolo allo strumento.
- La potenza di un geo test dipende dal numero di aree e dalla loro rumorosità: pochi mercati grandi danno test poco sensibili. Fai la simulazione di potenza prima, con i dati storici.
- Attenzione allo sbordamento: media nazionale, aree confinanti, utenti che si spostano.

**Holdout.** Escludi una quota di utenti o aree dal trattamento (una campagna, un flusso email, il remarketing) e confronta.
- Scegli la quota in base alla potenza necessaria, e dichiara il costo: l'holdout è ricavo rinunciato e va messo nel preventivo come costo della misurazione.
- L'assegnazione deve essere stabile nel tempo e randomizzata, non "chi è rimasto fuori".
- Applica l'holdout il più a monte possibile; se la piattaforma non lo permette, dillo invece di simulare.

**Pre/post senza controllo** non è un esperimento. Si usa solo come descrizione, dichiarando che stagionalità, trend e altri cambiamenti non sono separabili dall'effetto. Non attribuire a un cambiamento un delta pre/post.

**Switchback** (alternare trattamento e controllo su finestre temporali) è utile quando non puoi dividere gli utenti ma il sistema reagisce rapidamente; richiede attenzione agli effetti di trascinamento fra finestre.

## Leggere un risultato non conclusivo

È l'esito più frequente, e non è un fallimento: è un'informazione sui limiti di sensibilità del tuo test.

Cosa fare:
1. **Non dire "nessuna differenza".** Di': "non abbiamo rilevato una differenza; con questo campione potevamo rilevare effetti pari o superiori a X". L'assenza di prova non è prova di assenza.
2. **Riporta l'intervallo di confidenza.** Un intervallo da −2% a +3% dice che un effetto grosso e negativo è escluso: è un'informazione utile per decidere. Un intervallo da −20% a +25% dice che non si sa niente, e che il test era sotto-dimensionato.
3. **Distingui due casi.** Intervallo strettamente intorno allo zero: l'effetto, se c'è, è piccolo → smetti di investire su quella leva e passa a cambiamenti più grossi. Intervallo largo: il test non aveva potenza → il problema è il disegno, non l'ipotesi, e la decisione è se vale la pena rifarlo con più campione o con un cambiamento più forte.
4. **Decidi comunque**, perché il cliente deve agire. Un test piatto giustifica: tenere il controllo (costo zero, rischio zero), oppure implementare la variante se ha altri benefici (manutenzione, coerenza, accessibilità, velocità) dichiarando che l'effetto sulla conversione non è dimostrato.
5. **Registra l'esito nel registro dei test** con ipotesi, evidenza a monte, MDE, campione, intervallo e decisione presa. I test piatti ripetuti su una stessa area sono il segnale più forte che il limite è altrove — nell'offerta, nel traffico, nel prodotto.
6. Non riciclare un test piatto come vittoria guardando un segmento. Vedi confronti multipli.

## Errori che costano

- Lanciare senza calcolare il campione, poi fermare quando "si vede".
- Fermare al primo giorno favorevole: il falso positivo più comune del mestiere.
- Prolungare un test oltre la fine prevista finché diventa significativo.
- Confondere effetto relativo e assoluto nel calcolo dell'MDE: il campione risultante sbaglia di molto.
- Applicare la formula per proporzioni a metriche di ricavo per utente, che richiedono la varianza e sono molto asimmetriche.
- Leggere il p-value come probabilità che la variante sia migliore, e scriverlo in un report al cliente.
- Nessuna metrica primaria dichiarata prima, o cambiata dopo aver visto i dati.
- Caccia al segmento dopo un risultato piatto, presentata come scoperta.
- Test di 4 giorni, o che iniziano e finiscono a metà settimana.
- Non verificare lo split effettivo del traffico e il funzionamento di entrambe le varianti nelle prime ore (SRM, sample ratio mismatch: uno sbilanciamento rispetto allo split previsto è il segnale che qualcosa è rotto, e invalida il test).
- Riportare il lift puntuale di un test appena significativo come risultato atteso a regime, e inserirlo in una proiezione annuale.
- Attribuire a un cambiamento un delta pre/post, senza controllo.
- Geo test con tre mercati e nessuna analisi di potenza preventiva.
- Holdout promesso al cliente e poi "sporcato" perché serviva il fatturato: meglio nessun holdout che uno contaminato e presentato come valido.
- Fidarsi del "probabilità di vincere 97%" di uno strumento senza sapere quale motore statistico lo produce.
