---
name: email-lifecycle-retention
description: Usa quando progetti o rivedi email marketing, flussi di lifecycle (welcome, carrello, post-acquisto, riattivazione, win-back), segmentazione comportamentale, deliverability e autenticazione del dominio, o metriche di retention e valore per destinatario.
---

# Email, lifecycle e retention

L'email è il solo canale dove lo studio possiede la lista, non la affitta. Margine alto, costo marginale quasi nullo, nessuna asta. In cambio è l'unico canale che si può distruggere in modo permanente: un dominio bruciato non si ricompra.

Tratta l'email come infrastruttura, non come campagna. L'ordine di lavoro è sempre: deliverability → flussi automatici → segmentazione → campagne broadcast. Chi parte dalle campagne costruisce su sabbia.

## Prima di toccare qualsiasi cosa

1. Chiedi o verifica: ESP in uso, dominio di invio, volume mensile, età della lista, come sono stati raccolti gli indirizzi, consenso registrato (data, fonte, testo accettato).
2. Se la risposta su "come sono stati raccolti" è vaga, fermati e dillo. È la domanda che decide se il lavoro è legittimo.
3. Ricostruisci il revenue attuale diviso per flussi automatici vs campagne manuali. Se i flussi valgono poco, lì c'è il lavoro: sono già pagati dal traffico esistente.
4. Verifica stato di autenticazione del dominio prima di raccomandare qualsiasi aumento di volume.

## Architettura dei flussi

Progetta i flussi in ordine di rapporto valore/sforzo, non in ordine di funnel. Ogni flusso ha un trigger esplicito, una condizione di uscita e una sola decisione che deve far prendere al destinatario.

**Welcome / benvenuto.** Trigger: iscrizione. È il momento di massima attenzione e va speso per: consegnare quello che è stato promesso all'iscrizione, dichiarare cosa arriverà e con che frequenza, qualificare (una domanda sola, che alimenta la segmentazione), e solo dopo vendere. Più email in sequenza battono un'email sola perché la seconda ha un'attenzione ancora alta e un contesto già costruito. La condizione di uscita è l'acquisto: chi compra esce dal welcome ed entra nel post-acquisto.

**Abbandono carrello e abbandono browse.** Trigger: carrello non concluso, oppure prodotto visto senza aggiunta. Sono due flussi diversi con intento diverso: il carrello recupera una decisione quasi presa, il browse crea una decisione. Sul carrello non partire con lo sconto: la prima email rimuove un ostacolo (spedizione, resi, pagamento, disponibilità), lo sconto arriva dopo e insegna al cliente ad abbandonare per ottenerlo. Metti un limite di frequenza: chi abbandona tre volte in una settimana non deve ricevere nove email.

**Post-acquisto.** Trigger: ordine. È il flusso più trascurato e il più redditizio perché agisce sul secondo acquisto, dove il costo di acquisizione è già stato pagato. Contenuto: conferma e attese chiare sulla consegna, uso del prodotto (riduce resi e reclami), richiesta di recensione nel momento giusto rispetto al tempo di consegna, cross-sell coerente con l'acquisto fatto. Sincronizza i tempi con la logistica reale, non con un calendario inventato.

**Riattivazione.** Trigger: calo di engagement (nessun click in N giorni, con N tarato sul ciclo di riacquisto del prodotto, non su una regola generica). Serve a provare a riaccendere prima di smettere di scrivere. Poche email, segnale chiaro.

**Win-back.** Trigger: superamento del ciclo di riacquisto atteso senza acquisto. Diverso dalla riattivazione: qui il contatto può essere ancora attivo sulla posta ma non compra più. Chiedi il perché, o fai un'offerta che valga il rischio di scontare un cliente che sarebbe tornato comunque.

**Sunset.** Trigger: fallimento della riattivazione. Smetti di inviare agli indirizzi morti e rimuovili dai segmenti di invio. È un flusso che fa guadagnare, perché protegge la reputazione di chi legge ancora.

Regola trasversale: un contatto non deve stare in due flussi che competono. Definisci le priorità e le esclusioni prima di attivare, non dopo il primo doppione.

## Segmentazione: comportamento, non demografia

Segmenta su cosa le persone fanno, non su chi sono. Età, genere e città non predicono quasi nulla sull'acquisto; recency, frequenza, valore, categoria vista, canale di iscrizione e reattività alla posta sì.

Assi che portano risultato:
- **Recency di engagement**: ultimo click o ultima apertura con click. Decide chi può ricevere volume e chi va trattato con cautela.
- **Recency e frequenza di acquisto** (RFM): divide chi è nuovo, chi è fedele, chi sta scivolando.
- **Stadio di lifecycle**: mai acquistato / primo acquisto / ricorrente / dormiente. Lo stesso messaggio su stadi diversi è lo spreco più comune.
- **Affinità di categoria o prodotto** dedotta dal comportamento, non dichiarata.
- **Fonte di iscrizione**: una lista da concorso e una da checkout si comportano in modo opposto.

Non costruire segmenti che non cambiano un invio. Se due segmenti ricevono la stessa email, è un segmento.

## Deliverability

Questa parte cambia: **verifica sempre la documentazione ufficiale corrente con WebFetch** (Google Postmaster / linee guida mittenti bulk, Yahoo/AOL sender best practices, Microsoft SNDS, documentazione DMARC del provider DNS, documentazione dell'ESP) prima di dare istruzioni operative. Non riciclare da memoria soglie e requisiti.

Cosa va verificato e messo in opera:
- **SPF, DKIM, DMARC** sul dominio di invio. Allineamento DMARC verificato, non solo record presente. Policy DMARC alzata per gradi (`none` → monitoraggio dei report → `quarantine` → `reject`), mai in un salto solo su un dominio che invia già.
- **Sottodominio dedicato** per il marketing, separato dalla posta transazionale e da quella umana. Un problema sul marketing non deve fermare le fatture.
- **Disiscrizione a un click** nell'header (RFC 8058) oltre al link nel corpo: è un requisito dei grandi provider, non una cortesia.
- **Tasso di reclamo spam** monitorato in Google Postmaster Tools. I provider pubblicano una soglia dichiarata nelle loro linee guida: leggila alla fonte con WebFetch e usa quel numero, non uno ricordato.
- **Warm-up** quando il dominio o l'IP sono nuovi: parti dai segmenti più reattivi, aumenta il volume per gradi, osserva reclami e bounce a ogni scalino e fermati se peggiorano. Il warm-up si fa con i contatti che aprono e cliccano, perché è il comportamento positivo che costruisce la reputazione.
- **Igiene della lista**: rimozione degli hard bounce immediata, sunset degli inattivi, nessun indirizzo role-based di massa.

**Le liste comprate.** Non usarle, e spiega al cliente perché in termini di conseguenze, non di etica: gli indirizzi contengono spam trap, e un hit su una trap porta a blocklist; i reclami arrivano immediati perché nessuno ha chiesto quella posta; i provider valutano la reputazione sul dominio, quindi il danno segue il brand anche cambiando ESP; il consenso non è trasferibile, quindi l'invio è anche illegittimo sotto GDPR. Il costo non è una campagna andata male: è la perdita del canale.

Lo stesso vale per lo scraping, per gli "indirizzi arricchiti" dai tool di lead gen e per l'import di una lista vecchia mai contattata da anni. Una lista dormiente da due anni va trattata come nuova: riconferma su un segmento piccolo, non invio totale.

## Frequenza e disiscrizioni

La frequenza giusta è quella oltre la quale il ricavo incrementale per invio non copre l'erosione della lista. Per deciderlo serve misurare, non intuire: tieni traccia, per livello di frequenza, di ricavo per destinatario e di uscita netta (disiscrizioni + reclami + caduta di engagement).

Punti fermi:
- Le disiscrizioni non sono un male in sé: separano chi non comprerà mai da una lista che devi pagare e proteggere. I reclami spam sì, sono un danno: la differenza è il percorso di uscita, quindi rendi la disiscrizione più facile del reclamo.
- Aumenta la frequenza per segmento, non in blocco. Chi clicca ogni settimana tollera un ritmo che brucia chi è iscritto da ieri.
- Dai un centro preferenze con scelte reali (meno email, solo certi temi) invece del solo bottone binario.
- Se il contenuto regge solo con lo sconto, la frequenza alta diventa erosione di margine: quello è un problema di offerta, non di email.

## Transazionali e contenuto

Le email transazionali (conferma ordine, spedizione, reset password, fattura) hanno l'attenzione più alta di tutto il canale e sono quasi sempre lasciate al default della piattaforma. Rivedile: sono già consentite, già consegnate, già aperte. Aggiungi contenuto utile e un rimando coerente, senza trasformarle in promozioni — una transazionale piena di marketing perde lo status di transazionale e con esso il diritto a essere inviata senza consenso commerciale.

Sul contenuto delle email di marketing, pochi punti fermi:
- Un'email, un'azione. Tre call to action diverse producono zero click.
- Il testo deve funzionare con le immagini bloccate: nessuna informazione essenziale dentro un'immagine, alt text compilato.
- Email leggibile su mobile in verticale, con il punto principale sopra lo scroll.
- Oggetto e preheader lavorano in coppia: il preheader non ripete l'oggetto, lo completa.
- Da (nome mittente) riconoscibile e stabile: cambiarlo spesso aumenta reclami e disiscrizioni.
- Accessibilità: contrasto, dimensione del testo, link descrittivi. Non è negoziabile.
- Dove il consenso o la base giuridica sono in discussione, usa la skill dedicata al consenso nel marketing prima di inviare.

## Quando l'email batte il paid, e quando no

Batte il paid quando: esiste già un bacino di persone che conoscono il brand (traffico, acquirenti, iscritti); il prodotto ha riacquisto o upsell naturale; il ciclo di decisione è lungo e serve presenza ripetuta a costo quasi zero; il margine unitario non regge un CPA d'asta.

Non batte il paid quando: la lista è piccola o fredda e il bisogno è volume adesso; il prodotto è one-shot senza riacquisto né referral; la domanda va creata da zero su un pubblico che non ti conosce. L'email non genera domanda nuova: raccoglie e spreme quella che il paid ha già pagato. Dire a un cliente che l'email sostituisce l'acquisizione è sbagliato; dire che senza email paga due volte lo stesso cliente è corretto.

## Metriche che contano

**Perché l'open rate non è più usabile come metrica di decisione.** Con la Mail Privacy Protection di Apple il client precarica le immagini tramite proxy per conto dell'utente: l'apertura viene registrata anche senza che nessuno abbia letto. Nella direzione opposta, chi blocca le immagini legge senza essere contato. Il risultato è un numero gonfiato in modo non uniforme fra segmenti e non confrontabile nel tempo. Non usarlo per decidere oggetti, segmenti o vincitori di test, e non metterlo in un report come KPI. Un uso residuo resta: un crollo improvviso delle aperture su un segmento è un segnale diagnostico di consegna, non una misura di interesse.

Usa invece, in ordine di valore:
- **Ricavo per destinatario** (per invio e per flusso): la metrica che decide la frequenza e il valore dei flussi.
- **Conversioni attribuite e ordini**, con una finestra di attribuzione dichiarata.
- **Click unici sul link di azione** (non click totali, non CTOR costruito sulle aperture).
- **Consegnato vs inbox placement**: il "consegnato" dell'ESP non dice se sei in posta prioritaria o in spam. Per il posizionamento serve seed testing o un tool di inbox placement.
- **Reclami spam e hard bounce**, come soglie di allarme operativo.
- **Crescita netta della lista** e **percentuale di lista engaged**: una lista che cresce in numeri e muore in reattività sta peggiorando.
- **Tasso di riacquisto, valore nel tempo per coorte di iscrizione, quota di ricavo da clienti esistenti**: qui si misura la retention, non nell'email.

Quando ti serve un benchmark reale per confrontare un cliente col suo settore, non ricordarlo: cercalo con WebSearch su report con metodologia pubblicata (report annuali degli ESP, studi di settore), cita fonte e data, e dichiara che i benchmark variano per settore, modello di lista e definizione della metrica. Senza fonte, dichiara che non c'è benchmark e usa la serie storica del cliente come riferimento.

## Errori che costano

- Lanciare campagne su un dominio senza DMARC allineato: il volume arriva prima della reputazione e la prima finestra si chiude in spam.
- Alzare la policy DMARC a `reject` senza leggere i report aggregati: blocchi i tuoi stessi invii legittimi da sistemi dimenticati (CRM, fatturazione, form del sito).
- Usare il dominio principale per il marketing di massa e perdere anche la posta transazionale quando qualcosa va storto.
- Importare una lista vecchia o acquistata "tanto per provare": l'effetto è permanente e colpisce il brand, non l'ESP.
- Warm-up fatto sui contatti casuali invece che sui più reattivi.
- Ottimizzare oggetti sull'open rate dopo la Mail Privacy Protection: stai scegliendo in base a rumore.
- Dichiarare vincitore un A/B test su una campagna singola con pochi click: vale la sezione `experiment-stats`, non l'intuito.
- Costruire venti segmenti che ricevono la stessa email.
- Sconto in prima email di carrello: addestra il cliente ad abbandonare.
- Flussi attivati e mai più guardati: link rotti, prodotti fuori catalogo, promozioni scadute che continuano a partire. Metti in calendario una revisione periodica dei flussi attivi.
- Nessuna esclusione fra flussi: il cliente che ha appena comprato riceve il recupero carrello.
- Trattare le transazionali come spazio promozionale: perdono lo status di transazionale e con esso il diritto a essere inviate senza consenso commerciale.
- Un'unica lista indifferenziata con un unico calendario: la frequenza che serve ai fedeli brucia i nuovi.
- Nessuna persona responsabile del canone dell'ESP: la lista cresce di contatti morti e il costo con lei.
- Spegnere la riattivazione per paura di perdere iscritti: la lista morta costa in reputazione e in canone, e il canone è il costo minore.
