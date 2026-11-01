---
name: print-packaging-production
description: Usa quando un progetto finisce su carta o su un packaging — brochure, etichette, astucci, affissione, espositori. Copre spazi colore, quadricromia e spot, abbondanza, sovrastampa, risoluzione, dieline, prove colore, substrati, codici a barre e cosa chiedere allo stampatore.
---

# Produzione per stampa e packaging

Il principio che governa tutto: **un file di stampa sbagliato non si scopre a schermo, si scopre quando sono già state stampate diecimila copie.** Il digitale perdona, la stampa no. Non esiste la patch, esiste la ristampa, e la paga qualcuno. Per questo in stampa il controllo avviene *prima*, non dopo.

Corollario operativo: ogni volta che stai per assumere un parametro, **chiedilo allo stampatore**. Le convenzioni in questa skill sono punti di partenza ragionevoli, non specifiche. Lo stampatore ha sempre l'ultima parola perché conosce la sua macchina, la sua carta e il suo profilo colore. Se non hai ancora uno stampatore, dichiaralo come assunzione nel deliverable.

## 1. Schermo contro stampa: perché il colore cambia

Lo schermo emette luce e lavora in RGB additivo. La stampa riflette luce e lavora in CMYK sottrattivo. Il gamut RGB è più ampio: esistono colori che vedi e che non puoi stampare. Non è un difetto del file, è fisica.

Operativamente:
- Progetta in CMYK quando la destinazione è stampa offset o digitale a toner/inkjet di produzione. Convertire RGB in CMYK all'ultimo minuto produce sorprese, soprattutto su blu saturi, verdi acidi, arancioni fluo.
- La conversione non è una formula unica: dipende dal **profilo ICC** di destinazione, che dipende da macchina e carta. Chiedi allo stampatore quale profilo usare. Profili diffusi come FOGRA/GRACoL esistono in varianti per carta patinata e non patinata: non sono interscambiabili.
- Il **nero** non è uno. Nero testo (solo K) per corpi piccoli, nero ricco (con aggiunta di ciano/magenta/giallo) per grandi campiture. Il nero ricco su testo piccolo produce aloni al minimo fuori registro. Chiedi la ricetta di nero ricco allo stampatore, non inventarla.
- La **copertura totale di inchiostro** ha un limite oltre il quale la carta non asciuga e si imbratta. Il limite dipende da carta e macchina: chiedilo.
- Se il cliente vuole "lo stesso colore del sito", spiega che non è ottenibile e proponi invece coerenza percettiva: un colore di marca definito in Pantone con i suoi equivalenti CMYK e RGB già deciso e documentato, non ricavato a occhio da chi impagina.

## 2. Quadricromia e colori spot

- **Quadricromia (CMYK)**: quattro lastre, qualunque immagine. È lo standard.
- **Spot (Pantone e simili)**: un inchiostro premiscelato, una lastra in più. Si usa per tre motivi: fedeltà di un colore di marca, colori fuori gamut CMYK, finiture non riproducibili in quadricromia (metallizzati, fluo, bianco su substrato trasparente).
- Ogni spot aggiunge costo (lastra, lavaggio, setup) e tempo. Su tirature piccole può raddoppiare il preventivo. Su tirature grandi si ammortizza.
- Nel packaging lo spot è spesso obbligatorio: su flexo e su substrati non bianchi il colore di marca in quadricromia non tiene.
- Il **bianco** è un inchiostro quando il substrato non è bianco (plastica trasparente, kraft, carta colorata, metallo). Va disegnato come lastra separata. Dimenticarlo è un classico.
- Mappa i canali con nomi puliti e coerenti nel file: lo stampatore separa per nome. Uno spot chiamato in due modi diversi in due pagine diventa due lastre.

## 3. Sovrastampa (overprint) e trapping

- Due inchiostri adiacenti non sono mai in registro perfetto: la macchina ha tolleranza meccanica. Senza accorgimenti compare una linea bianca sul confine.
- **Trapping**: sovrapposizione minima dei due elementi al confine. In quadricromia lo gestisce di norma il RIP dello stampatore. Non applicarlo a mano se non te lo chiedono: raddoppiarlo peggiora.
- **Sovrastampa** significa stampare un inchiostro sopra l'altro invece di bucarlo. Il testo nero piccolo va tipicamente in sovrastampa per evitare il fuori registro. Il bianco in sovrastampa **non esiste**: se lo lasci impostato, l'elemento sparisce in stampa. È uno degli errori più costosi e più banali.
- Verniciature, vernici UV selettive, stampa a caldo, rilievo e fustelle vivono su **lastre tecniche separate**, in spot, in sovrastampa, con nome concordato con lo stampatore. Non sono grafica: sono istruzioni per macchine.

## 4. Abbondanza e margini di sicurezza

- Il taglio ha tolleranza. Qualunque elemento che deve arrivare al bordo va esteso oltre il formato finito: è l'**abbondanza** (bleed).
- Punto di partenza convenzionale: 3 mm per stampati commerciali, spesso 5 mm o più su packaging e su fustelle complesse. **Da confermare con lo stampatore**: dipende da macchina da taglio, fustella e substrato.
- Specularmente, serve un **margine di sicurezza** interno: nessun testo o elemento critico a filo del taglio. Una tolleranza di taglio di pochi millimetri decapita un numero di telefono.
- Nel packaging ci sono anche le **zone morte**: aree che cadono su piega, incollatura o sotto una linguetta. Lì non va contenuto. Le ricavi dalla dieline, non a intuito.

## 5. Risoluzione effettiva e scala

- Non conta la risoluzione del file, conta la **risoluzione alla dimensione finale di stampa**. Un'immagine a 300 ppi scalata al 400% è a 75 ppi.
- Convenzione di partenza: ~300 ppi alla scala finale per stampati visti da vicino; l'affissione e i grandi formati si stampano a risoluzioni molto più basse perché la distanza di osservazione cresce. Il valore giusto lo dà lo stampatore in base a tecnologia e distanza.
- Grafica vettoriale per loghi, testi e tracciati: non ha risoluzione, non degrada, si scala.
- Controlla la risoluzione **a file finito**, non a file iniziale: un ridimensionamento in impaginazione cambia il risultato senza avvisare.
- Font: incorporati o convertiti in tracciati. Se li converti, perdi la possibilità di correggere un refuso: fallo come ultimo passo e conserva la versione editabile.

## 6. Dieline: tracciati di taglio e piega

- La **dieline** è il disegno tecnico dell'oggetto piatto: linee di taglio, linee di piega/cordonatura, zone di incollatura, eventuali finestre e perforazioni, con convenzione grafica per distinguerle.
- **Chiedi la dieline allo stampatore o al fustellatore prima di disegnare.** Non disegnarla tu se esiste. Non ridisegnarla "più pulita": è una specifica meccanica.
- Il packaging ha spessore. Lo spessore del materiale consuma millimetri sulle pieghe e sugli incastri, e la dieline ne tiene conto. Un file corretto in piano può non chiudersi nell'oggetto.
- Tieni la dieline su un layer separato, non stampabile, bloccato. Non deve finire negli inchiostri.
- Prima di consegnare chiedi (o costruisci) un **mock-up fisico**: la dieline stampata, tagliata e piegata a mano. Scopre in dieci minuti errori che la ristampa non recupera: testo che finisce sul fondo, continuità di immagine rotta su una piega, retro capovolto.
- Verifica il **senso di lettura** delle facce quando l'oggetto è chiuso: facce ruotate di 180° sono un errore ricorrente.

## 7. Prove colore

- La **prova a monitor** (soft proof) serve solo con monitor calibrato e profilo di destinazione simulato. Altrimenti è un'opinione.
- La **prova contrattuale** (hard proof) è stampata con profilo certificato e firmata: è il riferimento su cui lo stampatore si impegna. Chiedila per ogni lavoro in cui il colore conta, e fai firmare al cliente.
- La prova su **substrato reale** è l'unica che dice la verità su kraft, materiali non patinati, plastiche, metallizzati. Su questi, una prova su carta patinata è fuorviante.
- La prova serve anche a verificare testi e contenuto: fai rileggere i dati critici (indirizzi, prezzi, codici, claim legali) da qualcuno che non ha impaginato. Chi ha impaginato non vede più i propri refusi.

## 8. Il processo vincola il design

Il design si adatta al processo, non viceversa. Deciso il processo, sai cosa puoi fare:

- **Offset**: alta qualità, costo di setup alto, conveniente dalle tirature medie in su. Tollera bene la quadricromia fine.
- **Digitale**: setup quasi nullo, costo per copia più alto, ottimo per tirature basse, dati variabili e versioni. Gamut e resa degli spot sono diversi dall'offset.
- **Flexo** (etichette, imballaggio flessibile): spot dominanti, retini e dettagli fini più limitati, linee sottili e testi piccoli rischiosi. Il design va ingrossato.
- **Serigrafia**: coprenza altissima su substrati difficili, dettaglio basso, un colore per passaggio.
- **Grande formato**: distanza di osservazione alta, risoluzione bassa accettabile, ma attenzione a giunzioni di teli e occhielli che cadono sulla grafica.

Chiedi il processo **prima** di proporre una direzione creativa. Un degradé delicato su flexo o un testo 6pt in bianco su quadricromia è una proposta che si disfa in produzione.

## 9. Substrati e finiture: cosa costano

- Grammatura e tipo di carta cambiano resa del colore, rigidità, opacità (vedi l'attraversamento della stampa sul retro) e costo. Le carte non patinate assorbono: i colori risultano più spenti e i dettagli meno nitidi.
- Le carte riciclate e kraft spostano il colore in modo non neutro. Vanno provate, non simulate.
- Finiture che aggiungono costo e tempo: plastificazione (lucida, opaca, soft touch), vernice UV selettiva, stampa a caldo, rilievo a secco, fustella sagomata, cordonature extra, finestre, applicazioni. Ciascuna è un passaggio di macchina in più.
- Ogni finitura ha controindicazioni: la plastificazione opaca segna le unghiate sui fondi scuri; il soft touch si sporca; la stampa a caldo su rilievo sottile non tiene; una vernice selettiva fuori registro si vede.
- Fai sempre quantificare le finiture **in preventivo, in alternativa**: "con e senza". Il cliente decide con il numero davanti, non dopo.

## 10. Codici a barre ed etichettatura

- I codici a barre (EAN/UPC, QR, Data Matrix) hanno requisiti di dimensione minima, zona di rispetto bianca intorno, contrasto fra barre e fondo e orientamento rispetto al senso di stampa. **Prendi le specifiche dall'ente emittente e dallo stampatore**, non ridurre il codice per esigenze di layout.
- Il codice va fornito dal cliente o generato dal suo numero ufficiale. Non inventare il contenuto di un codice a barre, mai.
- Barre su fondi scuri o colorati, o in colori diversi dal nero, possono non essere leggibili dagli scanner. Verifica, e in dubbio nero su bianco.
- Testa fisicamente il codice sulla prova stampata, con uno scanner reale.
- L'etichettatura obbligatoria (ingredienti, allergeni, origine, avvertenze, marcature, smaltimento, dati del responsabile) è **responsabilità legale del cliente**: chiedi i testi approvati per iscritto, non riscriverli, non tradurli di tua iniziativa, non riformattarli in modo che riducano leggibilità. Dichiara nel deliverable che il contenuto normativo non è stato validato dallo studio.

## 11. Cosa chiedere allo stampatore prima di disegnare

Fai questa chiamata **prima** della creatività, non dopo:

1. Processo di stampa e macchina.
2. Formato finito e dieline in file, o conferma del formato.
3. Profilo ICC di destinazione e limite di copertura di inchiostro.
4. Numero di colori disponibili, e se spot/bianco/vernici sono previsti.
5. Abbondanza richiesta e margini di sicurezza.
6. Risoluzione richiesta alla scala finale.
7. Substrato, grammatura, finiture previste.
8. Formato di consegna, convenzione dei nomi delle lastre tecniche, segni di taglio e registro.
9. Tipo di prova colore fornita, e quando.
10. Tiratura, scadenza, e **la data oltre la quale non si corregge più nulla**.

## 12. Cosa consegnare

- PDF di stampa secondo lo standard che lo stampatore indica (le varianti PDF/X non sono equivalenti: chiedi quale).
- Font incorporati, immagini alla risoluzione richiesta, abbondanza presente su tutti i lati, segni di taglio se richiesti.
- Lastre tecniche separate e nominate come concordato; nessun spot residuo non previsto; nessun overprint involontario, in particolare su bianco.
- Dieline su layer non stampabile, e versione separata del solo tracciato se richiesta.
- Un PDF di visione a bassa risoluzione per l'approvazione del cliente, distinto dal file di stampa.
- Una **scheda di consegna**: formato finito, abbondanza, profilo colore, elenco inchiostri incluse le lastre tecniche, substrato e finiture, tiratura, riferimento della prova approvata e da chi.
- Passa da `delivery-qa` prima che qualunque cosa esca dallo studio.

## Errori che costano

Questa è la sezione più importante della skill.

- **Bianco in sovrastampa.** L'elemento sparisce. Si scopre a tiratura stampata. Controlla la sovrastampa su ogni oggetto bianco, sempre.
- **Abbondanza assente o insufficiente.** Filetti bianchi sul bordo su tutta la tiratura. Costo: ristampa intera.
- **Testo a filo taglio.** Dati tagliati a metà. Il cliente lo nota per primo, su materiale già consegnato.
- **RGB consegnato come se fosse CMYK.** La conversione la fa il RIP con un profilo qualsiasi: colori di marca sbagliati, e la responsabilità è di chi ha consegnato.
- **Immagine scalata oltre la sua risoluzione.** Sembra accettabile a schermo al 50%, è sgranata in mano.
- **Spot dimenticato o nominato in modo incoerente.** Una lastra in più non prevista, o un colore di marca che diventa quadricromia: preventivo saltato o colore sbagliato.
- **Dieline ridisegnata o ignorata.** La scatola non si chiude, l'etichetta non entra nel macchinario di applicazione. Costo: nuova fustella, che non è economica, più i tempi.
- **Nessun mock-up fisico.** Facce ruotate, immagine rotta sulla piega, testo sul fondo invisibile a scaffale. Dieci minuti di lavoro saltati che costano una tiratura.
- **Nero ricco sul testo piccolo.** Testo sfocato e con aloni su tutto lo stampato.
- **Approvazione colore su monitor non calibrato.** Il cliente contesta un colore che la macchina ha riprodotto correttamente: nessuno ha un riferimento firmato, la discussione la perde lo studio.
- **Codice a barre ridotto, colorato o senza zona di rispetto.** Non passa alla cassa. La GDO respinge il lotto: il costo non è la stampa, è il mancato ingresso a scaffale.
- **Testi normativi riscritti o riformattati per estetica.** Esposizione legale del cliente, con lo studio nel mezzo.
- **Modifiche accettate dopo l'approvazione in macchina.** Qualunque cosa cambi dopo il via in stampa è una ristampa. Blocca la data e mettila per iscritto.
- **Consegnare l'ultima versione sbagliata.** Nomina i file con versione e data, archivia le vecchie fuori dalla cartella di consegna, e consegna un solo file.

## Da dichiarare in chiusura

Chiudi ogni output di stampa con: quali parametri sono assunzioni in attesa di conferma dello stampatore, se esiste un mock-up fisico e una prova colore firmata, e chi ha validato i contenuti normativi.
