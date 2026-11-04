---
name: accessibility-compliance
description: Usa quando progetti, sviluppi o verifichi un sito, app, email o documento per un cliente, e quando devi dire al cliente cosa può dichiarare sull'accessibilità. Copre contrasto, focus, tastiera, screen reader, motion, zoom, test reali e obblighi UE. Non è parere legale.
---

**Checklist operativa, non consulenza legale.**

# Accessibilità — mestiere e obbligo

**Questa skill non è consulenza legale.** Produce checklist operative di progettazione e verifica, e segnala i rischi: l'applicabilità degli obblighi al singolo cliente, le scadenze e il contenuto di qualunque dichiarazione pubblica vanno validati da un legale. Non dire a un cliente "sei a norma": lo studio attesta cosa ha testato e con quale metodo, non la conformità in senso giuridico.

Secondo principio: **l'accessibilità non è una fase di collaudo.** Se entra dopo il design, costa dieci volte e resta parziale. Entra nel wireframe, nei token di colore e nella definizione di "fatto".

## L'obbligo normativo — verifica prima di parlarne

Esiste un quadro europeo che impone requisiti di accessibilità, articolato su due filoni: le regole per i **siti e le app del settore pubblico** e l'**European Accessibility Act**, che estende obblighi a determinati prodotti e servizi offerti ai consumatori (fra cui commercio elettronico, servizi bancari, trasporti, e-book, servizi di comunicazione). In Italia esiste una normativa nazionale di recepimento e un'autorità competente per la vigilanza, oltre a un perimetro di soggetti privati tenuti agli obblighi, storicamente legato anche a soglie dimensionali.

**Non assumere nulla di tutto questo come dato.** Prima di dare indicazioni a un cliente:

1. Verifica **se il cliente ricade nell'ambito di applicazione**: natura del soggetto (pubblico/privato), tipo di servizio offerto, presenza di esenzioni per microimprese, soglie dimensionali, mercati in cui opera.
2. Verifica le **scadenze e i periodi transitori correnti**, inclusi i regimi per i servizi già in esercizio.
3. Verifica lo **standard tecnico di riferimento** richiamato dalla norma e il suo livello (la norma europea armonizzata che recepisce le WCAG, e la versione/livello pretesi).
4. Verifica gli **obblighi documentali**: dichiarazione di accessibilità, meccanismo di feedback, eventuali obiettivi di accessibilità, e chi li pubblica.

Usa `WebSearch`/`WebFetch` su: **EUR-Lex** per direttive e regolamenti, **Normattiva** per il recepimento italiano, il sito di **AgID** per le linee guida e i modelli italiani, **ETSI/CEN** per la norma armonizzata, **W3C/WAI** per WCAG, tecniche e documenti di supporto. Cita URL e data. Se non trovi conferma, scrivi "ambito e scadenze da verificare con legale": **non produrre numeri di articolo, date di entrata in vigore o importi di sanzione a memoria.**

## Il mestiere — checklist di progettazione

### Colore e contrasto

- [ ] Testo: al livello AA serve un contrasto di almeno 4,5:1, e di 3:1 per il testo grande (WCAG 2.2, criterio 1.4.3; [W3C Recommendation del 12/12/2024](https://www.w3.org/TR/WCAG22/), letta il 2026-11-01). Quale versione e livello WCAG pretenda la norma per il singolo cliente resta da verificare.
- [ ] **Componenti e stati non testuali**: bordi di input, icone informative, indicatori di stato, tracce dei grafici richiedono almeno 3:1 contro i colori adiacenti (WCAG 2.2, criterio 1.4.11, AA). È la svista più comune nei design system.
- [ ] Il colore **non è mai l'unico veicolo** dell'informazione: errore di form, stato attivo, serie di un grafico hanno anche testo, icona o pattern.
- [ ] Testo su immagine o video: overlay o contenitore che garantisca il contrasto nel caso peggiore, non nella foto di presentazione.
- [ ] Dark mode e temi alternativi verificati separatamente: un token invertito spesso perde contrasto.
- [ ] Placeholder non usato come etichetta.

### Struttura e gerarchia

- [ ] Un solo `h1`, gerarchia dei titoli coerente e senza salti, usata per la struttura e non per la dimensione.
- [ ] HTML semantico prima di ARIA: `button`, `a`, `nav`, `main`, `table`, `label`, `fieldset`. ARIA serve a colmare, non a sostituire. Una `div` con `role="button"` è lavoro in più e un bug in attesa.
- [ ] Landmark presenti, `lang` dichiarato sul documento e sui passaggi in altra lingua (WCAG 2.2, criterio 3.1.2, AA).
- [ ] `title` di pagina univoco e informativo; aggiornato anche nelle SPA al cambio di route.
- [ ] Liste e tabelle marcate come tali; tabelle con intestazioni associate; nessuna tabella usata per il layout.
- [ ] Testi alternativi: descrittivi per le immagini informative, vuoti (`alt=""`) per quelle decorative, trascrizione per le immagini di testo. Niente "immagine di".

### Focus e tastiera

- [ ] **Tutto raggiungibile e azionabile da tastiera**: naviga l'intera interfaccia con Tab, Shift+Tab, Invio, Spazio, frecce, Esc. È il test più rapido e quello che scova più difetti.
- [ ] Indicatore di focus **sempre visibile**, con contrasto sufficiente contro lo sfondo adiacente. Mai `outline: none` senza sostituto. Questo è il singolo difetto più frequente nei siti consegnati dagli studi.
- [ ] Ordine di tabulazione coerente con l'ordine visivo. Niente `tabindex` positivi.
- [ ] **Focus trap controllata** in modal e drawer: focus che entra al primo elemento utile, non esce dal dialog, Esc chiude, focus che torna all'elemento che ha aperto.
- [ ] Nessuna trappola involontaria: widget di terze parti, iframe, editor, mappe, player, cookie banner. I banner di consenso sono una fonte classica di blocco.
- [ ] **Skip link** al contenuto principale, visibile quando riceve il focus.
- [ ] Menu a tendina e dropdown funzionanti con le frecce; niente apertura solo su hover.
- [ ] Nessuna funzione che richieda un gesto complesso o un trascinamento senza alternativa a click singolo.

### Target, spazio e input

- [ ] Target di puntamento di almeno **24×24 px CSS** (WCAG 2.2, criterio 2.5.8 Target Size (Minimum), livello AA; [Understanding del W3C](https://www.w3.org/WAI/WCAG22/Understanding/target-size-minimum.html), letto il 2026-11-04). Eccezioni: spaziatura (un cerchio di 24 px centrato su ogni target più piccolo non tocca altri target né i cerchi degli altri target piccoli), controllo equivalente sulla stessa pagina, target dentro una frase, dimensione decisa dal browser e non modificata, presentazione essenziale o imposta per legge. Attenzione alle icone social in footer e alle paginazioni.
- [ ] Etichette persistenti e associate al campo (`label for` / `aria-labelledby`); campi obbligatori segnalati in testo.
- [ ] Autocomplete corretto sui campi personali; nessun blocco dell'incolla sui campi password o codice.
- [ ] **Errori**: identificati in testo, descritti in modo utile ("la data deve essere nel formato GG/MM/AAAA"), annunciati agli screen reader via live region, con focus portato sul primo errore.
- [ ] Nessun timeout non prorogabile su un processo che richiede lettura o compilazione.
- [ ] CAPTCHA con alternativa accessibile; preferisci metodi che non richiedono una prova sensoriale.

### Movimento e media

- [ ] `prefers-reduced-motion` rispettato: niente parallax, autoplay di animazioni, transizioni ampie o effetti di scroll per chi lo ha attivato. Non disabilitare tutto: riduci a dissolvenze brevi.
- [ ] Nessun contenuto che lampeggia in modo da costituire rischio per fotosensibilità. La soglia è di non più di tre lampeggi in un secondo (WCAG 2.2, criterio 2.3.1, livello A). Nel dubbio elimina il lampeggio.
- [ ] Autoplay di audio o video: evitato; se presente, controlli di pausa raggiungibili e muto di default.
- [ ] **Sottotitoli** su ogni video parlato, redatti o almeno corretti a mano: i sottotitoli automatici non bastano. **Trascrizione** per l'audio. **Audiodescrizione** dove l'informazione è solo visiva.
- [ ] Carousel e contenuti in movimento: pausa, controlli espliciti, nessun cambio automatico senza stop.

### Zoom, reflow, testo

- [ ] Zoom del browser fino al 200% senza perdita di contenuto o funzione; verifica anche il reflow a larghezza ridotta equivalente, senza doppio scroll.
- [ ] **Nessun blocco dello zoom su mobile**: `user-scalable=no` o `maximum-scale=1` sono un difetto da rimuovere sempre.
- [ ] Unità relative per i testi, così che la preferenza di dimensione del sistema abbia effetto.
- [ ] Interfaccia che regge l'aumento di spaziatura di testo, interlinea e spaziatura fra parole senza tagliare contenuto.
- [ ] Testo in orientamento sia verticale sia orizzontale, senza forzature.
- [ ] Niente testo dentro immagini per contenuti informativi.

### Screen reader e componenti dinamici

- [ ] Nome, ruolo e valore corretti per ogni componente interattivo; stato (`aria-expanded`, `aria-selected`, `aria-current`) aggiornato davvero, non solo in classe CSS.
- [ ] Link con testo autoportante: "scopri di più" ripetuto dodici volte è inutile in una lista di link.
- [ ] Contenuto che cambia senza ricaricare: annuncio via live region con la giusta urgenza; evita `aria-live="assertive"` per cose non urgenti.
- [ ] Testo nascosto visivamente ma disponibile agli assistivi dove serve; `aria-hidden` mai su contenuto focalizzabile.
- [ ] SPA: cambio di route annunciato, focus gestito, titolo aggiornato.
- [ ] Icone-pulsante con nome accessibile.

### Oltre il sito

- [ ] **Email**: struttura semantica, testo alternativo, contrasto, versione testo, nessuna informazione solo nelle immagini.
- [ ] **PDF e documenti**: tag di struttura, ordine di lettura, testi alternativi, tabelle marcate, lingua. Un PDF scansionato non è accessibile. Se il contenuto è importante, pubblicalo in HTML.
- [ ] **Social**: testi alternativi nelle immagini, sottotitoli nei video, CamelCase negli hashtag, moderazione nell'uso di emoji ed effetti tipografici decorativi illeggibili dagli screen reader.
- [ ] **Terze parti**: chat, prenotazioni, checkout, player, cookie banner, widget di recensioni. Qui si rompe la conformità del cliente e il fornitore non è sotto il nostro controllo: chiedigli la documentazione di accessibilità e metti per iscritto cosa resta fuori dal nostro perimetro.
- [ ] Attenzione agli **overlay di accessibilità** venduti come soluzione automatica: non rendono conforme un sito inaccessibile e sono oggetto di critica diffusa fra gli utenti di tecnologie assistive. Non proporli come rimedio.

## Come si verifica davvero

Gli strumenti automatici intercettano **una frazione** dei criteri — indicativamente una minoranza dei problemi reali, e quasi nulla di ciò che riguarda significato, ordine, chiarezza e coerenza. Un report automatico senza errori non è una verifica.

Protocollo minimo, in quest'ordine:

1. **Scansione automatica** di un campione rappresentativo di pagine e stati (axe, Lighthouse, WAVE, Pa11y, validatore HTML). Usa gli stati reali: form con errori, modal aperte, menu espanso, carrello pieno.
2. **Percorso solo tastiera** su ogni flusso critico, dall'inizio alla conversione. Nessun mouse.
3. **Zoom 200% e reflow**, più aumento della spaziatura del testo.
4. **Screen reader** su almeno due combinazioni reali: VoiceOver su macOS/iOS e NVDA su Windows sono il minimo. Leggi un flusso completo, non una pagina.
5. **Contrasto misurato** sui token, inclusi stati hover/focus/disabled e dark mode.
6. **Reduced motion attivo** e verifica dei comportamenti.
7. **Revisione manuale di contenuto**: alt text, testi dei link, messaggi d'errore, gerarchia dei titoli, chiarezza del linguaggio.
8. **Test con persone con disabilità** dove il progetto lo giustifica: è l'unica verifica che trova i problemi di esperienza, non solo di conformità. Proponila nei progetti con obbligo normativo o alto volume.
9. **Regressione**: gli errori rientrano. Inserisci un controllo automatico nella pipeline e un passaggio tastiera nella definizione di "fatto", altrimenti il sito torna inaccessibile al terzo rilascio.

Documenta ogni verifica con: pagine e stati testati, strumenti e versioni, ambienti (browser/OS/screen reader), data, esiti, difetti aperti con gravità.

## Cosa si può dichiarare a un cliente

Puoi dire, se è vero:

- cosa è stato **testato**, con quale metodo, su quali pagine e stati, in quale data;
- rispetto a **quale standard e livello** è stata condotta la verifica, e con quale esito per criterio;
- quali difetti sono **aperti**, con gravità e piano di rientro;
- quali parti sono **fuori dal nostro controllo** (terze parti, contenuti caricati dal cliente, integrazioni).

Non puoi dire:

- "il sito è conforme" o "a norma" come affermazione giuridica, soprattutto se l'ambito di applicazione non è stato verificato da un legale;
- "100% accessibile" o "WCAG compliant" senza specificare versione, livello, perimetro e data;
- che la conformità **resta** nel tempo: dipende dai contenuti che il cliente pubblicherà. L'accessibilità si mantiene, e va messa a contratto o esclusa esplicitamente.

Se il cliente deve pubblicare una **dichiarazione di accessibilità**, il contenuto, il modello e la responsabilità sono suoi: lo studio fornisce i dati tecnici dei test. Verifica il modello richiesto dall'autorità competente e fai validare il testo.

## Errori che costano

1. **`outline: none`** per estetica, senza indicatore di focus sostitutivo. Rende il sito inusabile da tastiera e si trova in dieci secondi.
2. **Zoom bloccato su mobile** nel meta viewport, copiato da un boilerplate.
3. **Report automatico "0 errori"** venduto come verifica di conformità. È il modo più diretto per esporre lo studio.
4. **Design approvato con palette a basso contrasto**, scoperta in sviluppo: si rifanno brand e UI insieme.
5. **Contrasto curato solo sul testo**, dimenticando bordi di input, icone e grafici.
6. **Modal senza gestione del focus**: l'utente tabula dietro l'overlay e non trova mai la chiusura.
7. **Cookie banner inaccessibile**: prima barriera del sito, e di solito di un fornitore.
8. **Sottotitoli automatici non revisionati** su un video istituzionale.
9. **PDF scansionato** come documento ufficiale.
10. **Overlay di accessibilità** proposto come soluzione: non risolve e danneggia la credibilità dello studio.
11. **Promettere la conformità in offerta** senza avere verificato l'ambito di applicazione né previsto il budget per i test manuali.
12. **Nessun controllo in pipeline**: il sito è accessibile il giorno del lancio e non lo è un mese dopo.

## Quando fermarsi e chiamare un legale

- Il cliente chiede di **dichiarare pubblicamente la conformità** o di pubblicare una dichiarazione di accessibilità.
- Serve stabilire **se il cliente è soggetto all'obbligo** e **entro quando**: è una qualificazione giuridica, non una valutazione tecnica.
- Il contratto include **garanzie, manleve o penali** legate all'accessibilità.
- Arriva un **reclamo di un utente, una segnalazione o una richiesta dell'autorità di vigilanza**.
- Il cliente intende invocare un'**esenzione** (onere sproporzionato, microimpresa): va argomentata e documentata, non dichiarata.
- Il progetto è una **gara o un affidamento pubblico** con requisiti di accessibilità.

## Output atteso

Chiudi con: **difetti per gravità con la correzione e il costo stimato**, **cosa hai testato e con quale metodo** (strumenti, ambienti, data), **cosa non hai testato e quale rischio porta**, **cosa serve dal legale** su ambito, scadenze e dichiarazione. Se il cliente si aspetta una dichiarazione di conformità, mettilo in prima riga.
