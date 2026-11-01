---
name: sow-contracts
description: Usa quando si prepara un contratto, un ordine o uno statement of work per servizi creativi, o si rivedono clausole su IP, pagamenti, approvazioni, portfolio, recesso. Produce bozze e checklist da far validare a un legale, non consulenza.
---

**Checklist operativa, non consulenza legale.**

# Contratti e statement of work

**Limite, da ripetere in ogni output prodotto con questa skill:** questa skill genera bozze, checklist e domande per il legale. Non è consulenza legale e non sostituisce un avvocato. Ogni clausola va validata da un professionista abilitato prima della firma, e di nuovo quando la controparte è straniera, pubblica, o impone il proprio modello. Contesto italiano/UE: il diritto applicabile è quello italiano salvo diversa pattuizione, e si intrecciano Codice civile, legge sul diritto d'autore (L. 633/1941), GDPR, e la disciplina sui ritardi di pagamento nelle transazioni commerciali (D.lgs. 231/2002). Non citare articoli, termini o aliquote a memoria: verificali con `WebSearch` su fonti primarie (Normattiva, Gazzetta Ufficiale, EUR-Lex) con data di consultazione, o lascia un segnaposto `[da verificare con il legale]`.

Non inventare importi, percentuali di penale, tassi di interesse di mora o durate standard presentandoli come prassi di settore. Sono scelte negoziali o parametri di legge: le prime le decide lo studio, i secondi si verificano.

## 1. Struttura di un set contrattuale

Separa in tre livelli. Serve a non rinegoziare tutto a ogni progetto.

1. **Condizioni generali di servizio** — stabili, firmate una volta per cliente: IP, pagamenti, responsabilità, riservatezza, recesso, legge applicabile e foro, dati personali.
2. **Statement of work / ordine** — per progetto: perimetro, deliverable, round, tempi, prezzo, milestone di pagamento. Il contenuto arriva da `scoping-change-orders`; il prezzo da `project-margin`.
3. **Change order** — modulo breve che modifica il SOW: cosa cambia nel perimetro, nel prezzo, nelle date. Rimanda alle condizioni generali.

Nel SOW inserisci una **clausola di prevalenza**: in caso di contrasto, prevalgono le condizioni generali tranne dove il SOW deroga espressamente. Senza, ogni allegato diventa un'arma.

## 2. Proprietà intellettuale: il punto in cui si perde più valore

Da definire, voce per voce. Non lasciare "il materiale è del cliente" come unica riga.

- **Momento del trasferimento.** I diritti di utilizzazione economica sull'opera finale si trasferiscono **al pagamento integrale**, non alla consegna. Dichiaralo esplicitamente: è l'unica leva reale quando un cliente usa il lavoro e non paga.
- **Oggetto del trasferimento.** Solo i deliverable finali approvati. Restano allo studio: concept e proposte scartate, file di lavoro e sorgenti, metodologie, template, codice e componenti riutilizzabili, know-how. Se il cliente vuole i sorgenti o l'esclusiva sulle proposte scartate, è una voce di prezzo separata.
- **Ampiezza.** Dichiara ambito territoriale, durata, canali e se il trasferimento è esclusivo. "Tutti i diritti, per sempre, in tutto il mondo, su ogni mezzo" è una cessione totale: va prezzata come tale, non concessa per abitudine.
- **Diritto morale d'autore.** In Italia è inalienabile (art. 22 L. 633/1941, Normattiva, 2026-11-01). Il contratto non può cederlo: può solo regolare l'attribuzione. Non scrivere clausole che lo "trasferiscono" — segnala la questione al legale.
- **Materiali di terzi.** Font, stock, musica, plugin, librerie, modelli: elenca cosa è licenziato, a nome di chi, con quale ambito e per quanto. Le licenze intestate allo studio non passano al cliente automaticamente. Se il cliente eccede l'ambito della licenza, deve essere chiaro per contratto che la responsabilità è sua.
- **Output di AI generativa.** Dichiara se e come è stato usato il generativo e cosa lo studio garantisce. La titolarità e la proteggibilità degli output puramente generati sono materia in evoluzione in UE. In Italia, dal 10/10/2025, la L. 633/1941 protegge le opere dell'ingegno «umano», anche create con l'aiuto dell'AI, purché siano il risultato del lavoro intellettuale dell'autore (art. 1, modificato dall'art. 25 della L. 132/2025; Normattiva, 2026-11-01). Quindi: non garantire esclusività o proteggibilità su materiale generato senza intervento creativo umano sostanziale. Punto da portare al legale, non da risolvere in bozza.

## 3. Pagamento e sospensione del lavoro

- **Anticipo alla firma**, non all'inizio dei lavori. Niente attività prima dell'incasso dell'anticipo.
- **Milestone legate a fasi**, non a date di calendario: se il cliente ritarda l'approvazione, non deve ritardare anche il pagamento. Lega la fattura all'invio del deliverable, non alla sua approvazione, altrimenti il silenzio del cliente diventa una dilazione gratuita.
- **Termini di pagamento** espressi in giorni data fattura, con interessi di mora. I limiti e i riferimenti del D.lgs. 231/2002 sono **da verificare con il legale**: il testo non è stato riletto nella revisione del 2026-11-01. Non scrivere un tasso a memoria.
- **Diritto di sospensione:** superato un ritardo di N giorni, lo studio può sospendere le attività con preavviso scritto, senza responsabilità per lo slittamento, e la ripresa è subordinata al saldo. Collega la sospensione al mancato trasferimento dell'IP: lavoro non pagato resta dello studio.
- **Spese e anticipazioni** (media, produzione, licenze): pagate in anticipo dal cliente o ricaricate; mai anticipate dallo studio senza un tetto scritto.
- **Rincari e indicizzazione nei retainer:** data di revisione annuale del fee già nel contratto. Senza, chiedere un aumento diventa un evento e non un'applicazione.
- **Pagamento in natura, equity, barter, visibilità:** se accettati, vanno valorizzati in euro nel contratto. Altrimenti non sono un ricavo, sono uno sconto.

## 4. Approvazioni e silenzio-assenso

- **Referente unico** con nome e ruolo, e la procedura per sostituirlo. Un cambio di referente non riapre le fasi approvate.
- **Approvazione per iscritto**, con il canale indicato. La mail vale, il messaggio in chat non.
- **Silenzio-assenso:** decorsi N giorni lavorativi dall'invio senza feedback scritto, il deliverable si intende approvato e la fase chiusa. È la clausola che impedisce ai progetti di restare aperti in eterno. Tieni N realistico, altrimenti è inapplicabile nei fatti.
- **Effetto del ritardo del cliente:** le date successive slittano di pari durata, più il tempo necessario a riprendere; non si comprime il lavoro dello studio. Prevedi un diritto di riprogrammare e, oltre una soglia, di fatturare lo stato di avanzamento.
- **Blocco del progetto:** se resta inattivo oltre N giorni per causa del cliente, lo studio può chiudere la fase, fatturare quanto svolto e riaprire come nuovo incarico.

## 5. Portfolio e comunicazione del lavoro

Autorizzazione da ottenere **nel contratto iniziale**, non a progetto finito. Dopo, il referente è cambiato o il legale del cliente dice no per default.

- Diritto dello studio di mostrare il lavoro nel proprio portfolio, sito, social, candidature a premi e presentazioni commerciali, con citazione del nome e dei marchi del cliente ai soli fini descrittivi.
- Finestra di embargo: nulla di pubblico prima della data di lancio o prima di N giorni dalla consegna.
- Dati e risultati: distingui pubblicabile, pubblicabile solo in forma relativa (variazioni percentuali, indici), e riservato. Vedi `case-study-production`.
- Procedura di approvazione del materiale promozionale: invio e silenzio-assenso dopo N giorni lavorativi, invece di un'approvazione esplicita che non arriverà mai.
- Se il cliente nega: negoziare una versione anonimizzata già in contratto ("studio del settore X") è più facile prima che dopo.

## 6. Contenuti forniti dal cliente

Il cliente dichiara e garantisce di avere i diritti su testi, immagini, marchi, dati e materiali che fornisce, e che il loro uso non viola diritti di terzi. Aggiungi:

- **Manleva** a favore dello studio per pretese di terzi derivanti da quei materiali.
- **Nessun obbligo di verifica** in capo allo studio su titolarità dei diritti, veridicità dei claim e conformità normativa dei contenuti forniti; lo studio può segnalare ma non certifica.
- **Claim e conformità:** per settori regolati (sanitario, alimentare, finanziario, integratori, minori, giochi) la responsabilità sostanziale del messaggio resta del cliente, che lo approva prima della pubblicazione. Lo studio non fa validazione regolatoria.
- **Dati personali:** se lo studio tratta dati personali per conto del cliente (liste, CRM, audience, pixel), serve un accordo di nomina a responsabile del trattamento ex art. 28 GDPR, separato dal contratto di servizi. Verifica contenuto e necessità con il legale.
- **Accessi e credenziali:** forniti dal cliente, intestati al cliente, revocabili. Non creare asset pubblicitari o account su intestazione dello studio per conto del cliente: diventano un ostaggio reciproco e un rischio.

## 7. Responsabilità, garanzie, riservatezza, terzi

- **Tetto di responsabilità.** Limita la responsabilità complessiva dello studio a un importo definito e collegato al valore del contratto, ed escludi i danni indiretti (perdita di profitto, di avviamento, di opportunità). Senza tetto, un errore su una campagna può costare un multiplo del progetto. È nullo il patto che esclude o limita in anticipo la responsabilità per dolo o colpa grave, o per la violazione di norme di ordine pubblico (art. 1229 c.c., Normattiva, 2026-11-01). Le altre esclusioni vanno validate dal legale.
- **Cosa lo studio garantisce:** esecuzione a regola d'arte e originalità del proprio apporto creativo. Cosa non garantisce: risultati commerciali, posizionamenti, performance di piattaforme terze, approvazione da parte di autorità o piattaforme. Mettilo per iscritto: una promessa di risultato in una proposta può diventare un obbligo contrattuale.
- **Obbligazione di mezzi, non di risultato.** Se il contratto promette un KPI, lo studio risponde di un esito che non controlla. Se un KPI va in contratto, accompagnalo dalle condizioni di validità (budget minimo, tempi di approvazione, dati accessibili).
- **Riservatezza bilaterale**, con durata, definizione di informazione riservata ed eccezioni (già pubblica, sviluppata autonomamente, obbligo di legge). Se l'NDA del cliente è unilaterale e vieta anche l'uso interno del lavoro, è incompatibile con la clausola portfolio: risolvi il conflitto prima di firmare, non dopo.
- **Freelance e subfornitori.** Lo studio ha diritto di usarne, restando unico responsabile verso il cliente. Fondamentale: lo studio deve acquisire dai freelance i diritti **almeno pari** a quelli che cede al cliente, con contratti a monte coerenti. Un freelance che non ha ceduto i diritti rende impossibile la cessione a valle, e il buco emerge anni dopo.
- **Divieto di assunzione diretta** del personale o dei collaboratori dello studio per una durata definita: la validità e i limiti di queste clausole vanno verificati col legale.
- **Esclusività e non concorrenza.** Se il cliente la chiede (non lavorare per concorrenti), ha un prezzo e un perimetro: elenco nominativo dei concorrenti, durata, mercato. Un'esclusiva generica su un settore blocca una parte del mercato dello studio gratis.

## 8. Recesso e uscita

- **Preavviso scritto** simmetrico, con durata diversa per progetto e per retainer; per i retainer, un preavviso che copra almeno il ciclo di pianificazione.
- **Effetti economici:** il lavoro svolto e le spese impegnate fino alla data sono dovuti; gli anticipi non sono restituibili per la parte corrispondente all'attività eseguita.
- **Recesso per giusta causa dello studio:** mancato pagamento, mancata collaborazione, richiesta di attività illecite o lesive della reputazione.
- **IP in caso di recesso anticipato:** nessun trasferimento sul lavoro non pagato. Dichiaralo, non darlo per implicito.
- **Transizione:** cosa viene consegnato all'uscita (deliverable finali approvati e pagati, trasferimento accessi) e cosa no (sorgenti, file di lavoro), e se l'assistenza alla transizione è a pagamento.
- **Clausole che sopravvivono:** riservatezza, IP, manleve, legge e foro. Elencale esplicitamente.
- **Legge e foro:** legge italiana e foro della sede dello studio. Su clienti esteri o con modelli contrattuali imposti, segnala al legale: foro e arbitrato stranieri rendono l'azione economicamente impraticabile per uno studio piccolo.

## 9. Come operare

1. Chiedi: tipo di cliente (privato/PA/estero), servizio, chi ha fornito il modello contrattuale, durata, se ci sono dati personali e materiali di terzi.
2. Produci la bozza o la revisione **a tre colonne**: clausola presente / rischio per lo studio / modifica proposta.
3. Marca ogni punto incerto come `[da validare con il legale]` e raccogli le domande per il legale in una sezione finale, in modo che la consulenza costi mezz'ora e non tre ore.
4. Quando revisioni un contratto del cliente, cerca prima le assenze: IP al pagamento, portfolio, sospensione, silenzio-assenso. Le assenze costano più delle clausole sbagliate.
5. Chiudi con la riga su cosa non hai verificato e quale rischio porta (STUDIO.md, regola 5).

## 10. Checklist rapida delle clausole

Da usare come griglia di controllo su qualunque contratto, proprio o del cliente. Segna `presente / assente / da negoziare`.

| Clausola | Perché c'è |
|---|---|
| Oggetto e perimetro con rinvio al SOW | Evita che l'oggetto sia interpretato in modo estensivo |
| IP: trasferimento al pagamento integrale | Unica leva reale sul credito |
| IP: esclusioni (sorgenti, scarti, know-how, template) | Protegge il riutilizzabile |
| IP: ambito, durata, territorio, esclusiva | Ciò che non è delimitato è ceduto per intero |
| Licenze di terzi: intestazione e ambito | Evita uso oltre licenza e responsabilità ribaltata |
| Dichiarazione sull'uso di AI generativa | Evita garanzie implicite su proteggibilità |
| Anticipo alla firma e milestone per fase | Flusso di cassa indipendente dal cliente |
| Termini di pagamento, mora, diritto di sospensione | Rende il ritardo costoso e il blocco legittimo |
| Referente unico e approvazione scritta | Fa convergere il progetto |
| Silenzio-assenso e chiusura per inattività | Impedisce progetti aperti a tempo indefinito |
| Effetti del ritardo del cliente sulle date | Evita di comprimere il lavoro dello studio |
| Change order: procedura e prezzo | Rende la variante amministrazione, non trattativa |
| Portfolio, premi, embargo, dati pubblicabili | Rende il lavoro riutilizzabile commercialmente |
| Garanzie del cliente sui materiali + manleva | Sposta il rischio su chi ha scelto i contenuti |
| Accordo art. 28 GDPR se si trattano dati | Requisito documentale |
| Tetto di responsabilità ed esclusione danni indiretti | Limita l'esposizione oltre il margine |
| Obbligazione di mezzi, nessuna garanzia di risultato | Evita di rispondere di ciò che non si controlla |
| Riservatezza bilaterale con eccezioni | Simmetria, e compatibilità col portfolio |
| Subfornitori: diritti acquisiti a monte | Rende possibile la cessione a valle |
| Recesso, preavviso, effetti economici | Uscita ordinata e lavoro svolto pagato |
| Clausole superstiti, legge e foro | Rende azionabile il resto |

## Errori che costano

- **Trasferire l'IP alla consegna e non al pagamento.** Lo studio perde l'unica leva che ha: il lavoro è già legittimamente in uso e il recupero del credito diventa l'unica strada.
- **Cedere tutto senza prezzarlo.** "Tutti i diritti, mondo, per sempre, esclusiva" regalato per abitudine: il cliente ottiene gratis ciò per cui altri pagano un multiplo.
- **Nessuna clausola di silenzio-assenso.** I progetti restano aperti per mesi, le ore continuano, il saldo non arriva e non c'è un momento in cui si può dire che è finito.
- **Milestone legate all'approvazione del cliente.** Il cliente controlla quando ti paga semplicemente non rispondendo.
- **Chiedere l'ok al portfolio a progetto chiuso.** Il referente è cambiato, il legale dice no per default, e il lavoro migliore resta invisibile. Vale doppio sui progetti accettati sotto costo per visibilità.
- **Firmare il modello del cliente senza leggere le clausole di manleva e limitazione di responsabilità.** Un tetto di responsabilità assente o pari al valore del contratto moltiplicato espone lo studio oltre ogni margine possibile.
- **Nessuna manleva sui materiali forniti dal cliente.** Una foto senza diritti o un claim non supportato diventa un problema dello studio, che non li ha scelti.
- **Nessun accordo art. 28 GDPR quando si trattano liste e audience.** Violazione documentale banale e facilmente contestabile.
- **Intestare account pubblicitari o asset del cliente allo studio.** Finisce in contenzioso all'uscita, qualunque cosa dica il contratto.
- **Usare questa skill come sostituto del legale.** Il costo di una revisione legale è trascurabile rispetto a un solo contenzioso o a una cessione di IP sbagliata.
