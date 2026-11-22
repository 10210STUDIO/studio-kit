---
name: atlante-culturale
description: Atlante culturale del dipartimento creativo di {{STUDIO}} — arte contemporanea, design, architettura, moda, fotografia, cinema, musica e intrattenimento, tipografia, web e digitale, ognuno tradotto in istruzioni per i modelli Higgsfield (luce, obiettivo, palette, set, casting, movimento, ritmo). Usala prima di ogni direction, moodboard, brief foto/video o prompt Higgsfield, e quando serve scegliere o giustificare un riferimento visivo. Non sostituisce la discovery del cliente.
---

# Atlante culturale — {{STUDIO}}

Un modello generativo fa quello che gli descrivi. Se gli scrivi «elegante» o «cinematico», ottieni la media di internet. Se sai che cosa rende una cosa elegante — una luce, una distanza, una materia, un ritmo — e lo descrivi, ottieni quella cosa. Questo atlante serve a passare dal riferimento culturale alla descrizione precisa.

## Come si usa

1. **Parti dal brief e dal `CONTEXT.md` del cliente**, non dall'atlante. L'atlante offre candidati; il gusto del cliente decide.
   - **Livello maison:** l'atlante da solo non basta (prova A/B del 2026-11-01 su un brief fittizio di pelletteria di lusso). Prima serve un concept del `creative-director`, che si capisce in una riga; l'atlante poi traduce quel concept in luce, materia e camera. Senza concept, fermati e chiedilo al lead.
2. **Scegli 2-4 riferimenti** da discipline diverse (es. un fotografo + un architetto + un regista). Un riferimento solo si copia; tre si fondono in qualcosa di nuovo.
   - **Almeno uno deve fare attrito** con il registro ovvio del brief: un tag diverso, una disciplina lontana, un'epoca diversa. Se tutti i riferimenti confermano il registro atteso (es. tutti «lusso silenzioso» per un brief di lusso silenzioso), ottieni la media del genere con un nome colto sopra. *Verificato nella stessa prova (brief fittizio di pelletteria di lusso): quattro riferimenti tutti «quiet luxury» hanno prodotto una foto giudicata più prevedibile di quella fatta senza atlante. Seconda prova, con un riferimento d'attrito (fotografia d'arte per la foto, un videogioco per il film): l'atlante ha vinto entrambe le coppie alla cieca (foto 34 vs 27, film 31 vs 29).*
   - **Controllo della palette di default:** cammello, cuoio cognac, maglia crema, muro chiaro, luce dorata di finestra sono ciò che il generatore fa da solo. Se il tuo prompt li contiene tutti, cambia almeno un asse (colore, luce o materia) prima di generare.
4. **Per ognuno prendi il principio, non la superficie** (campo «Principio»). Se il risultato somiglia al riferimento a colpo d'occhio, è sbagliato (regola 9 di STUDIO.md).
5. **Componi il prompt dai campi «Higgsfield»** dei riferimenti scelti, fusi in una sola descrizione coerente: una luce, una palette, un movimento di camera.
6. **Almeno uno dei riferimenti scelti deve avere il campo Scena pieno.** Gli altri possono dare solo luce o materia. Dal campo Higgsfield prendi luce, ottica e set; palette e casting li riscrivi dal brief, perché anche le voci contengono la media del generatore.
7. **Leggi `references/regole.md` prima di scrivere il prompt.** Sintesi: nomi di artisti, fotografi, registi, maison e brand restano nel moodboard interno e **non entrano mai nel prompt** né nei deliverable; nel prompt va solo la traduzione visiva.
8. **Controlla i cliché** del riferimento (campo «Cliché»): sono le cose che tutti prendono da quel nome e che rendono il lavoro riconoscibile come imitazione.
9. **Nel report** scrivi quali riferimenti hai usato e cosa hai preso da ciascuno (uso interno, mai nel deliverable).
10. **Se il cliente indica un'opera o una pubblicazione precisa,** l'atlante viene dopo. Prima si fa una scheda per ogni pezzo (soggetto, azione, oggetto-storia, sguardo, secondo corpo, registro), poi si usa l'atlante solo per l'attrito.
11. **Un frammento Higgsfield non ancora generato porta «(da provare)».** Chi lo usa e lo verifica lo segnala nel report, con la versione che ha funzionato e le parole che il modello ha ignorato.
12. **Un mondo (drag, club, sport, mestieri) si legge dal mestiere:** strumenti in mano e momento di lavoro in vista, mai il costume. Se la Scena di una voce descrive solo un look, la voce non è pronta.
13. **Maison Margiela** (voci in `moda.md` e `architettura.md`): è la maison più copiata dai generatori, quindi valgono quattro regole in più.
   - **Una voce sola.** Al massimo una voce della maison per moodboard, mai come unico riferimento.
   - **Mai i segni della maison nel prompt:** camice bianco, cartellino a quattro punti, Tabi, impronte su tela, bianco su bianco, maschera di metallo dorato, busto da sarta dipinto. A colpo d'occhio farebbero sembrare il lavoro una copia.
   - **Cambia oggetto e luogo.** Dalla maison si prende il gesto (recuperare, dipingere, coprire), mai l'oggetto che il gesto trasforma né il posto: se quell'oggetto o il luogo della tua Scena compare nel Si vede o nelle Fonti di una voce Margiela, cambialo. Gli attrezzi del mestiere (un cartellino scritto a mano, un foglio, uno specchio) restano liberi. La Scena descrive un tipo di fatto, non un'opera.
   - **Un colore solo, al plurale.** Se il prompt è quasi tutto di un colore (es. bianco), scrivi le sue finiture (opaco, satinato, lucido) e mettilo su un fondo di un altro colore; altrimenti esce la media.

## Dove guardare

| Disciplina | File |
|---|---|
| Arte contemporanea e design (prodotto, grafica, arredo) | `references/arte-design.md` |
| Architettura, interni, luoghi | `references/architettura.md` |
| Moda: maison, designer, stylist, campagne, sfilate | `references/moda.md` |
| Fotografia: moda, ritratto, still life, arte, documentario | `references/fotografia.md` |
| Cinema: registi, direttori della fotografia, colore, montaggio | `references/cinema.md` |
| Musica e intrattenimento: videoclip, copertine, scene, serie, giochi, cultura di internet | `references/musica-intrattenimento.md` |
| Tipografia: disegnatori, fonderie, moda e riviste, digitale, lettering | `references/tipografia.md` |
| Web e digitale: siti tech e crypto, studi di creative development, animazione e interazione | `references/web-digitale.md` |
| Club e underground: techno e house, rave, ballroom, drag e club kid, flyer, spazi della notte, il divieto di fotografare | `references/club-underground.md` |
| Cronaca, notte e paparazzi: flash diretto, tabloid, la folla che fotografa, chi viene colto | `references/cronaca-paparazzi.md` |
| Cinema di genere: colpo, noir, thriller, inseguimento, cattura (la grammatica dei fatti girati) | `references/cinema-genere.md` |
| Teatro, danza e performance: regia del corpo, peso, caduta, presa, contatto fra due persone | `references/teatro-danza.md` |
| Pittura narrativa: la scena dipinta, più corpi legati da un momento, chiaroscuro | `references/pittura-narrativa.md` |
| Racconto in sequenza: fumetto, fotoromanzo, storyboard, sequenze fotografiche, caroselli da 3-6 quadri | `references/racconto-sequenza.md` |
| Eros e arte: fotografia, riviste indipendenti, cinema, performance, illustrazione, moda sul corpo (nudo implicito, mai esplicito; persone adulte) | `references/eros-arte.md` |
| Regole su nomi, stili di artisti viventi, diritti, dichiarazione AI | `references/regole.md` |

**Settori** (per i clienti di un settore): ogni file ha Lessico, Voci, **Tecnica del settore** (come si produce davvero), **Regole del settore** (norme e policy di comunicazione specifiche, checklist e non parere legale), Siti di riferimento navigati, Novità. Nei settori di scrittura il campo Higgsfield diventa **Applicazione** (come si usa per un cliente).

| Settore | File |
|---|---|
| Automotive: case, carrozzieri, motorsport, campagne | `references/automotive.md` |
| Lusso oltre la moda: orologi, gioielli, profumi, hospitality, vini e spirits | `references/lusso.md` |
| Nautica: cantieri, designer navali, regate | `references/nautica.md` |
| Aviazione: compagnie, costruttori, jet privati, aeroporti | `references/aviazione.md` |
| Aerospazio e satelliti: agenzie, aziende, missioni, immagini | `references/spazio.md` |
| Difesa e armi: comunicazione di settore, armi sportive e heritage, regole | `references/difesa-armi.md` |
| Trasporto e mobilità: ferrovia, trasporto pubblico, logistica, micromobilità, crociere | `references/trasporto.md` |
| Musica come settore: etichette, festival, piattaforme, rollout, sync, sonic branding (il lato visivo è in `musica-intrattenimento.md`) | `references/industria-musicale.md` |
| Sport: brand sportivi, club e leghe, grandi eventi, atleti, media sportivi | `references/sport.md` |
| Pubblicità: agenzie, direttori creativi, campagne, premi, efficacia | `references/pubblicita.md` |
| PR e ufficio stampa | `references/pr-ufficio-stampa.md` |
| Copywriting | `references/copywriting.md` |
| Giornalismo ed editoria | `references/giornalismo.md` |

**Manuali tecnici** (il mestiere, non i riferimenti): ogni voce ha Cos'è, Si vede, Quando, Higgsfield (formula di prompt e modello), Errore comune.

| Tecnica | File |
|---|---|
| Cinema: piani, angolazioni, composizione, continuità, movimenti e supporti di camera, montaggio e ritmo | `references/tecnica-cinema-inquadratura.md` |
| Cinema: luce e schemi, sorgenti, camere e sensori, pellicola, formati, obiettivi, filtri, frame rate | `references/tecnica-cinema-luce-ottiche.md` |
| Cinema: effetti speciali pratici, VFX, virtual production, color science, grading e look, VFX con l'AI | `references/tecnica-cinema-vfx-colore.md` |
| Fotografia: esposizione, luce naturale, flash, modificatori, schemi di ritratto, luce per still life | `references/tecnica-fotografia-luce.md` |
| Fotografia: formati e camere, obiettivi, pellicole, tecniche speciali, post-produzione, look nei modelli AI | `references/tecnica-fotografia-camere-ottiche.md` |
| Higgsfield: il metodo del vendor dal canale ufficiale (masterclass, VFX e modelli, ads e business, film originali con i brief di produzione) e dalla CLI (fogli, location, prompt video, bozza e finale, costi, montaggio), confrontato con le nostre prove; dove divergono vale la prova. Letto il 2026-11-21, da rivedere entro il 2027-02-19. Formato diverso dalle altre voci: punti con fonte, non Cos'è/Si vede | `references/tecnica-higgsfield.md` |

Suono e musica (produzione, registrazione, mix e mastering, live, audio per spot e social, loudness, audio AI): skill separata `mestieri-del-suono`.

Persona coerente in più clip AI (character sheet a tre viste, poi scene in Seedance, più 50 blocchi di realismo): `~/.claude/studio/riferimenti-esterni/character-sheet-seedance.md`. È materiale di terzi e resta solo nello studio.
Linguaggio di camera nel prompt video (20 parole chiave di focale, taglio, racconto e movimento, più la lista in cinque parti per ogni inquadratura): `~/.claude/studio/riferimenti-esterni/camera-prompt-keywords.md`. Stessa regola: materiale di terzi, resta nello studio. Ciò che mancava è entrato in `tecnica-cinema-inquadratura.md` e `tecnica-cinema-luce-ottiche.md`; dove la guida e le nostre prove non concordano, vale la prova. La guida viene da prompts.ig, che manda una guida in DM a chi commenta un post; la scheda della fonte e l'elenco delle guide ricevute sono in `~/.claude/studio/riferimenti-esterni/prompts-ig.md`, e ogni nuova guida di questa fonte si aggiunge lì.

Nei manuali tecnici i nomi di prodotti (pellicole, obiettivi, camere) possono entrare nel prompt; i nomi di autori no.

Ogni file ha: un **lessico** della disciplina (i concetti che servono per descrivere), le **voci** (riferimenti), le **novità** recenti con data e fonte.

## Formato di una voce

Le voci stanno sotto `## Voci`, raggruppate in sottosezioni `###`; ogni voce è un titolo `####`.

```
#### Nome (anni attività, paese) — tag di registro
- **Si vede:** luce, colore, composizione, materia, ritmo. Concreto, osservabile.
- **Principio:** l'idea da assorbire, in una riga.
- **Scena:** chi c'è · cosa fa adesso (un verbo) · la prova del prima o del dopo in quadro · dove va lo sguardo.
- **Higgsfield:** frammento di prompt in inglese, senza nomi propri, pronto da fondere: luce (sorgente, direzione, qualità), obiettivo e distanza, palette, materiali, set, casting e styling; per il video movimento di camera e ritmo. Poi «Modello:» consigliato e perché, in italiano.
- **Cliché:** cosa non copiare.
- **Fonti:** [P] primaria, [S] secondaria, con data di lettura.
```

Il campo **Scena** c'è in tutte le voci dei mondi aggiunti il 2026-11-15 (club, cronaca, cinema di genere, teatro e danza, pittura narrativa, racconto in sequenza, eros); nei file più vecchi si aggiunge quando una voce viene ripresa. **Le Scene sono inventate:** descrivono una situazione nuova che porta il principio dell'opera, mai l'opera stessa. Non si ricrea un quadro, una foto o un'inquadratura: se tre o più elementi dell'opera restano al loro posto, cambia punto di vista o togli due prove. Nei racconti in sequenza il frammento Higgsfield ha la forma «Scene: … Frames: 1) … 2) …».

**Nomi dei modelli:** quelli scritti in «Modello:» sono indicativi e invecchiano. Prima di generare controlla il catalogo dal vivo con `higgsfield model list` (al 2026-11-15 c'erano anche Kling 4.0, Wan 3.0 e MiniMax H3, che le voci non citano ancora).

Due file aggiungono un campo: `tipografia.md` ha **Uso nel progetto** (carattere da usare e licenza), `web-digitale.md` ha **Web** (tecnica, librerie, durate, costo in performance e accessibilità) e **Media**: video e screenshot della navigazione in una cartella locale `_riferimenti-web/<sito>/`, fuori dal repository. Si guardano per capire il movimento, non si caricano come riferimento nei generatori (regole.md §1.4).

Tag di registro: `lusso`, `editoriale`, `minimal`, `pop`, `sperimentale`, `tech`, `istituzionale`, `street`, `heritage`. Servono a filtrare per cliente, non a giudicare.

## Aggiornamento

La cultura si muove ogni stagione e i modelli conoscono il mondo solo fino alla loro data di addestramento.
- Se il task riguarda «ciò che succede adesso» (sfilate, mostre, uscite, campagne) e la sezione **Novità** del file è più vecchia di 60 giorni, chiedi al lead una ricerca di `insight-research` prima di decidere la direction.
- **Persone con accuse documentate** di abusi o condotte gravi (decisione di {{TITOLARE}}, 2026-11-08): entrano con la voce completa più una riga «- **Nota:** fatto, anno, fonte. Non citare al cliente né nel deliverable.» Le note sono pubbliche nel kit (decisione di {{TITOLARE}}, 2026-11-08): solo fatti con fonte primaria o due secondarie autorevoli, formule neutre («accusato di», «condannato per», «ha negato»), mai più di quanto dice la fonte.
- Le novità portano sempre data e fonte. Una voce entra fra i riferimenti stabili solo se ha retto almeno una stagione.
- Chi usa l'atlante e trova una traduzione Higgsfield che funziona meglio (verificata su una generazione), la segnala nel report: il lead aggiorna la voce.
