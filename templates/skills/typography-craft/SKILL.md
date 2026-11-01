---
name: typography-craft
description: Usala per il mestiere tipografico oltre l'accoppiamento di font: scelta per anatomia, scala e rapporti, interlinea in funzione della misura di riga, crenatura e spaziatura ottica nei titoli, gerarchia su più assi, cifre tabellari e mediovali, tipografia italiana corretta, licenze dei font.
---

# Typography Craft

La tipografia si giudica sulla lettura, non sul campionario. Il lavoro non è scegliere due font che stanno bene insieme: è impostare rapporti fra misura di riga, interlinea, pesi e spazi che tengano su tutti i testi reali del cliente, compresi quelli lunghi, quelli scritti male e quelli pieni di numeri. Per i token e l'implementazione in codice usa le skill di design system: qui sta il mestiere a monte.

## Scegliere per anatomia, non per impressione

Guarda i tratti che decidono il comportamento del testo, non l'aria che il carattere ha nella parola di esempio.

- **Altezza dell'occhio medio rispetto alle maiuscole e alle ascendenti.** Occhio grande: più presenza alle piccole dimensioni e in condizioni difficili, ma parole più compatte e meno distinguibili per silhouette nei testi lunghi. Occhio piccolo: più eleganza e disegno delle ascendenti leggibile, ma serve più corpo per la stessa leggibilità. Il corpo nominale è una misura inutile per confrontare due caratteri: confronta l'occhio medio stampato affiancato.
- **Larghezza e passo (set width).** Decide quanti caratteri entrano in una riga, quindi la misura e quindi l'interlinea. Un carattere stretto cambia tutto l'impianto.
- **Ampiezza delle controforme.** Controforme aperte resistono alla riduzione, al negativo, alla stampa su materiali assorbenti e agli schermi a bassa densità. Controforme chiuse si saldano.
- **Contrasto fra pieni e sottili.** Contrasto alto: regge male piccolo, in negativo e su supporti ruvidi; dà voce ai titoli grandi. Contrasto basso: affidabile in tutte le condizioni, meno carattere nei titoli.
- **Terminali e modulazione dell'asse.** Determinano tono e epoca, e quanto il carattere invecchia.
- **Distinzione fra forme confondibili.** I, l, 1, maiuscola di i, uno; zero e O; a e o; r e n accostate. Critico in codici, password, targhe, matricole, listini. Qui si decide se un carattere è usabile per dati.
- **Dotazione.** Pesi disponibili, corsivo vero (disegnato, non inclinato per calcolo), maiuscoletto vero, set di cifre, segni valutari, lettere accentate complete per le lingue del progetto, caratteri alternativi. Un carattere con due pesi non costruisce una gerarchia.
- **Resa alle dimensioni reali.** Prova sul supporto vero, nel corpo vero. Un carattere scelto a schermo grande e usato a corpo piccolo su carta è una scelta non verificata.

Mescolare caratteri: la coppia funziona se c'è differenza evidente nella struttura e parentela nelle proporzioni (occhio medio e larghezza vicini). Due caratteri simili ma non uguali sembrano un errore. Una famiglia ampia con molti pesi e larghezze spesso risolve tutto meglio di una coppia: valutalo prima di cercarne due.

## Scala e rapporti

Una scala serve a rendere le decisioni ripetibili e a limitare l'arbitrio. Costruiscila con pochi gradi, e usali tutti: una scala di dodici gradi dove ne usi tre è un documento inutile.

Punti di partenza, non regole: una scala costruita su un rapporto costante produce incrementi riconoscibili, e rapporti piccoli vanno meglio nei testi densi, rapporti ampi nei progetti editoriali e nelle pagine con poche informazioni. Lo scostamento dipende da: lunghezza media dei testi reali, numero di livelli di gerarchia che il contenuto richiede davvero, distanza di lettura, ampiezza dei supporti, e dal fatto che su schermo e su carta le stesse proporzioni non si leggono uguali.

Due accortezze che si dimenticano sempre. Primo: i gradi vanno arrotondati a valori sensati per il supporto, non lasciati con i decimali che esce dalla formula. Secondo: la scala va verificata agli estremi — il titolo più lungo che il cliente scriverà e la nota legale più piccola — non sui tre livelli centrali.

Non derivare interlinea e spazi verticali dalla stessa progressione dei corpi: seguono logiche diverse.

## Interlinea e misura di riga

Sono una cosa sola: non si decide l'una senza l'altra. La relazione è semplice e vale sempre: **più lunga la riga, più interlinea serve**, perché l'occhio deve ritrovare l'inizio della riga successiva.

Punti di partenza consolidati, da trattare come tali:

- **Misura di riga.** Per testo continuo la tradizione tipografica indica circa 45-75 caratteri spazi inclusi, con l'intorno dei 65 come zona comoda; nelle colonne strette e nelle didascalie si scende, e si accetta anche molto meno quando il testo è di poche righe. Il numero dipende dal carattere (il passo cambia tutto), dal corpo, dalla lingua (l'italiano ha parole più lunghe dell'inglese, con effetti su giustificazione e sillabazione) e dalla densità del contenuto.
- **Interlinea.** Per testo continuo si parte da un valore moderatamente superiore al corpo e si aumenta al crescere della misura. Scostamenti: alza l'interlinea con occhio medio grande, con righe lunghe, con testi tecnici densi, su fondo scuro, su carta patinata brillante; abbassala nei titoli a più righe, dove un'interlinea da testo corrente sfilaccia il blocco, e con occhio medio piccolo.
- **Titoli grandi.** L'interlinea relativa va ridotta: più grande è il corpo, più lo spazio fra le righe appare eccessivo. Ma non tanto da far toccare ascendenti e discendenti, e in italiano attenzione alle maiuscole accentate che occupano spazio sopra.
- **Testo su più colonne.** Mantieni il registro: le righe delle colonne affiancate devono allinearsi, altrimenti la pagina trema.

Verifica sempre su un testo vero del cliente, nella lingua del progetto, con la lunghezza che avrà davvero. Il testo segnaposto mente: ha parole di lunghezza media e nessun caso difficile.

Giustificazione: in italiano il testo giustificato richiede sillabazione attiva e impostata sulla lingua corretta, altrimenti produce fiumi di bianco e spaziature mostruose. Senza controllo sulla sillabazione, allinea a sinistra. Controlla a mano le righe vedove e orfane, le righe finali troppo corte, le parole spezzate su più righe consecutive e le preposizioni isolate a fine riga.

## Crenatura e spaziatura ottica

Distingui due operazioni. La **spaziatura generale** (tracking) agisce su tutto il blocco; la **crenatura** (kerning) corregge singole coppie.

Regole operative:

- **Più grande il corpo, meno spaziatura serve.** I caratteri sono disegnati per una spaziatura ottimale a corpi da testo. Nei titoli molto grandi la spaziatura va stretta; nei corpi molto piccoli, in negativo e nelle scritte su fondi scuri va allargata.
- **Crena solo quello che si vede.** Nei corpi da testo non crenare a mano: perdi tempo e peggiori la texture. Nei titoli grandi, nei logotipi e nei numeri in evidenza la crenatura a mano è obbligatoria, perché lì ogni difetto è visibile.
- **Bilancia le aree di bianco, non le distanze.** Lo spazio fra due lettere si giudica sull'area di bianco che generano. Le coppie problematiche sono quelle con forme incompatibili: maiuscole con diagonali accanto a tonde o verticali, lettere con tratti sporgenti in alto o in basso, una tonda accanto a una verticale, qualsiasi cosa accanto a una punteggiatura.
- **Lavora a coppie e in sequenza.** Guarda tre lettere per volta scorrendo la parola: regoli la coppia centrale rispetto alle vicine.
- **Capovolgi o sfoca.** Togliere la leggibilità rende visibile il ritmo del bianco. È il metodo più rapido per trovare la coppia sbagliata.
- **Maiuscole e maiuscoletto chiedono più spaziatura.** Le parole in tutto maiuscolo vanno aperte. Usa il maiuscoletto vero del carattere, mai le maiuscole scalate: i pesi non tornano.
- **Segni e punteggiatura hanno spaziature proprie.** Virgolette aperte all'inizio di una riga, punti, trattini e parentesi creano buchi che vanno recuperati, anche sforando oltre il margine (allineamento ottico del margine) quando lo strumento lo permette.

## Gerarchia su più assi

La gerarchia costruita solo sulla dimensione produce pagine che urlano e livelli indistinguibili appena i titoli si allungano. Gli assi disponibili:

- **Peso.** Separa senza occupare spazio. Lo stacco deve essere evidente: pesi adiacenti nella stessa famiglia non distinguono niente.
- **Scala.** Il più ovvio e il più abusato. Ogni grado in più è spazio in meno.
- **Colore e contrasto.** Abbassare il contrasto di un elemento secondario crea gerarchia senza toccare né corpo né peso. Mantieni leggibilità verificata, e non affidare al solo colore informazioni essenziali.
- **Spazio.** Il più efficace e il primo che si taglia per far stare tutto. Lo spazio va distribuito in modo asimmetrico: più spazio sopra un titolo che sotto, così il titolo appartiene al testo che introduce. La prossimità è l'unico segnale che il lettore legge senza accorgersene.
- **Stile e forma.** Corsivo, maiuscoletto, maiuscolo, larghezza diversa della stessa famiglia.
- **Posizione e allineamento.** Rientri, sbalzi nel margine, allineamenti diversi.
- **Carattere.** Cambiare famiglia è l'asse più forte e il più costoso: usalo per distinguere ruoli strutturali (titolazione contro testo, dati contro prosa), non per variare.

Criteri: **due assi per livello sono quasi sempre sufficienti** e tre iniziano a essere decorazione. Conta i livelli che il contenuto richiede davvero — spesso sono meno di quelli che il cliente chiede — e verifica la gerarchia sfocando la pagina: l'ordine di lettura deve restare leggibile quando le parole non lo sono più.

## Tipografia dei numeri

Punto che distingue un lavoro fatto da chi conosce il mestiere. Scegli consapevolmente, non lasciare il default.

- **Cifre tabellari** (tutte della stessa larghezza): obbligatorie in tabelle, listini, bilanci, prospetti, qualsiasi colonna di numeri, e in ogni numero che cambia dinamicamente (contatori, timer, prezzi aggiornati) perché evitano lo sfarfallio del testo che si riallinea.
- **Cifre proporzionali** (ognuna con la propria larghezza): per i numeri dentro il testo corrente, dove la spaziatura uniforme produce buchi intorno all'uno.
- **Cifre allineate** (alte come le maiuscole): nei contesti di dati, nei titoli, nelle interfacce.
- **Cifre mediovali o non allineate** (con ascendenti e discendenti, altezza vicina all'occhio medio): nel testo corrente e nelle date dentro la prosa, dove le cifre allineate fanno l'effetto di un blocco di maiuscole in mezzo alla frase.

Combinazioni utili: tabellari e allineate nelle tabelle; proporzionali e mediovali nel testo. Verifica che il carattere scelto abbia i set necessari: molti ne hanno uno solo, e lo scopri a progetto avviato. Controlla anche frazioni, apici, esponenti, segni valutari e il segno di divisione: se mancano, qualcuno li improvviserà con caratteri sbagliati.

Convenzioni italiane per i numeri: la virgola è il separatore decimale e il punto (o lo spazio fine) il separatore delle migliaia. Non invertirli copiando impostazioni inglesi, perché cambia il significato di una cifra. Nelle date e negli intervalli usa la lineetta corretta (vedi sotto).

## Tipografia italiana corretta

Quasi tutti sbagliano questi segni. Correggili sistematicamente, nei testi che scrivi e in quelli che ricevi dal cliente.

- **Virgolette.** Le doppie dritte `"` e le singole dritte `'` sono segni di pollici e piedi, non virgolette. In italiano usa i caporali `«»` per il discorso diretto e le citazioni nella tradizione editoriale, e le virgolette alte curve `“ ”` nell'uso corrente, soprattutto digitale. Scegli una convenzione per progetto e scrivila. Le singole curve `‘ ’` per le citazioni interne.
- **Apostrofo.** L'apostrofo tipografico è quello curvo `’`, identico alla virgoletta singola di chiusura. Mai la dritta. Vale per `dell’`, `l’`, `un’`.
- **Accenti sulle maiuscole.** Obbligatori: `È`, non `E'`. L'apostrofo al posto dell'accento su maiuscola è un errore, non una variante. Verifica che il carattere abbia le maiuscole accentate (`À È É Ì Ò Ù`) prima di adottarlo: alcuni caratteri stranieri ne sono sprovvisti o le disegnano male, e sopra le maiuscole accentate serve spazio in verticale.
- **Trattini e lineette.** Tre segni distinti, tre usi. Il trattino breve `-` unisce parole composte e spezza a fine riga. La lineetta media `–` indica intervalli (anni, pagine, orari) e si usa senza spazi. La lineetta lunga `—` apre gli incisi; in italiano l'uso editoriale prevalente è con spazi intorno, oppure si usa la media spaziata. Fissa la convenzione per progetto. Il segno meno è un carattere a sé, e nei numeri non va sostituito col trattino.
- **Puntini di sospensione.** Usa il segno unico `…`, non tre punti separati che si spezzano a fine riga.
- **Spaziatura della punteggiatura.** In italiano nessuno spazio prima di virgola, punto, punto e virgola, due punti, punto interrogativo ed esclamativo; uno spazio dopo. Nessuno spazio dentro le parentesi e dentro le virgolette. Lo spazio prima della punteggiatura è una convenzione francese: non importarla.
- **Spazio unificatore.** Usa lo spazio insecabile fra numero e unità di misura, fra numero e valuta quando la precede, nelle sigle e nelle date, e per impedire che un numero resti separato dalla sua unità a capo.
- **Niente doppi spazi e niente tabulazioni per rientrare.** Ripuliscili sempre nei testi forniti dal cliente.
- **Simboli corretti.** Usa il segno di moltiplicazione `×` e non la lettera x, le vere frazioni quando ci sono, il segno di grado corretto, l'apostrofo tipografico anche nelle abbreviazioni di anni.
- **Maiuscole e abbreviazioni.** In italiano l'uso delle maiuscole è più parco che in inglese: non capitalizzare tutte le parole di un titolo per imitazione. I titoli in tutto maiuscolo rallentano la lettura: usali corti.

## Licenze dei font come vincolo di progetto

La licenza è un vincolo di progetto, da verificare **prima** di scegliere il carattere, non alla consegna. Se la scopri dopo, rifai il lavoro o espone il cliente.

Cosa controllare nella licenza specifica, caso per caso, sul testo della licenza e non su quello che "si fa di solito":

- Quali usi copre: stampa, web, applicazione, ePub, video e trasmissione, uso dentro un prodotto venduto, uso in un marchio registrato. Sono permessi tipicamente separati e si pagano separatamente.
- Su quali basi è misurata: numero di postazioni, volumi di stampa, visite o visualizzazioni del sito, numero di installazioni dell'app, numero di titoli pubblicati.
- Se è perpetua o a canone, e cosa succede al materiale pubblicato se il canone cessa.
- Se consente la modifica dei contorni, la conversione in curve, la generazione di sottoinsiemi per il web, l'incorporamento nei PDF e con quale livello di permesso.
- Se consente il trasferimento dei file a terzi: agenzia, stampatore, sviluppatore, cliente. Nella maggior parte dei casi non lo consente, e serve una licenza intestata a chi lavora i file.
- Se consente l'uso del carattere nel logotipo e il deposito del marchio che lo contiene: alcune fonderie lo escludono o lo subordinano a una licenza dedicata.
- Per i caratteri a licenza aperta: quali obblighi impone (attribuzione, mantenimento della licenza sulle versioni derivate, limiti al cambio di nome).

Regole operative per lo studio. Chi licenzia è il cliente, intestata a lui, per gli usi che gli servono: lo studio non deve "prestare" i propri font. Documenta nel brand book quali caratteri sono licenziati, per quali usi, da chi e con quale scadenza. Non inviare i file dei font a fornitori e sviluppatori senza verificare: converti in curve dove possibile, altrimenti fai licenziare loro. Nei lavori con budget stretto metti sul tavolo l'alternativa a licenza aperta all'inizio, non quando il cliente si è già innamorato di un carattere che non può permettersi.

Limite da dichiarare: lo studio legge le licenze e segnala il rischio. L'interpretazione di una licenza contestata, l'uso di un carattere dentro un marchio da registrare e qualunque contenzioso sono materia di un legale. Per il quadro generale di diritti e liberatorie vedi `rights-licensing-clearance`.

## Errori che costano

- Scegliere il carattere su una parola di esempio grande e scoprire a corpo piccolo che le controforme si chiudono.
- Confrontare caratteri per corpo nominale invece che per occhio medio affiancato.
- Decidere l'interlinea senza aver fissato la misura di riga: sono la stessa decisione.
- Impostare la tipografia su testo segnaposto e non sul testo reale del cliente, che è più lungo, più brutto e pieno di casi difficili.
- Giustificare in italiano senza sillabazione attiva sulla lingua corretta.
- Adottare un carattere senza maiuscole accentate e trovarsi `E'` su un'insegna.
- Apostrofi e virgolette dritte in un deliverable consegnato. Si vedono, e dicono tutto sul livello dello studio.
- Usare il trattino breve per gli intervalli e per il segno meno.
- Lasciare le cifre proporzionali in una tabella di prezzi, o le tabellari dentro il testo corrente.
- Non verificare che il carattere abbia i set di cifre necessari prima di impostare un progetto pieno di dati.
- Costruire la gerarchia solo sulla dimensione, e ritrovarsi senza spazio quando i titoli reali sono tre volte più lunghi.
- Simulare maiuscoletto e corsivo scalando o inclinando per calcolo invece di usare i tagli disegnati.
- Crenare a mano i testi correnti (tempo buttato) e non crenare i titoli grandi e i logotipi (errore visibile a tutti).
- Scegliere il carattere prima di leggere la licenza, e scoprire a progetto chiuso che l'uso nell'app o nel logotipo non è coperto.
- Mandare i file del font allo stampatore o allo sviluppatore senza averne il diritto.
- Separatore decimale e delle migliaia in formato inglese su numeri italiani: cambia il significato della cifra.
