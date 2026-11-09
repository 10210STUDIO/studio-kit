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
3. **Per ognuno prendi il principio, non la superficie** (campo «Principio»). Se il risultato somiglia al riferimento a colpo d'occhio, è sbagliato (regola 9 di STUDIO.md).
4. **Componi il prompt dai campi «Higgsfield»** dei riferimenti scelti, fusi in una sola descrizione coerente: una luce, una palette, un movimento di camera.
5. **Leggi `references/regole.md` prima di scrivere il prompt.** Sintesi: nomi di artisti, fotografi, registi, maison e brand restano nel moodboard interno e **non entrano mai nel prompt** né nei deliverable; nel prompt va solo la traduzione visiva.
6. **Controlla i cliché** del riferimento (campo «Cliché»): sono le cose che tutti prendono da quel nome e che rendono il lavoro riconoscibile come imitazione.
7. **Nel report** scrivi quali riferimenti hai usato e cosa hai preso da ciascuno (uso interno, mai nel deliverable).

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

Suono e musica (produzione, registrazione, mix e mastering, live, audio per spot e social, loudness, audio AI): skill separata `mestieri-del-suono`.

Persona coerente in più clip AI (character sheet a tre viste, poi scene in Seedance, più 50 blocchi di realismo): `~/.claude/studio/riferimenti-esterni/character-sheet-seedance.md`. È materiale di terzi e resta solo nello studio.

Nei manuali tecnici i nomi di prodotti (pellicole, obiettivi, camere) possono entrare nel prompt; i nomi di autori no.

Ogni file ha: un **lessico** della disciplina (i concetti che servono per descrivere), le **voci** (riferimenti), le **novità** recenti con data e fonte.

## Formato di una voce

Le voci stanno sotto `## Voci`, raggruppate in sottosezioni `###`; ogni voce è un titolo `####`.

```
#### Nome (anni attività, paese) — tag di registro
- **Si vede:** luce, colore, composizione, materia, ritmo. Concreto, osservabile.
- **Principio:** l'idea da assorbire, in una riga.
- **Higgsfield:** frammento di prompt in inglese, senza nomi propri, pronto da fondere: luce (sorgente, direzione, qualità), obiettivo e distanza, palette, materiali, set, casting e styling; per il video movimento di camera e ritmo. Poi «Modello:» consigliato e perché, in italiano.
- **Cliché:** cosa non copiare.
```

Due file aggiungono un campo: `tipografia.md` ha **Uso nel progetto** (carattere da usare e licenza), `web-digitale.md` ha **Web** (tecnica, librerie, durate, costo in performance e accessibilità) e **Media**: video e screenshot della navigazione in una cartella locale `_riferimenti-web/<sito>/`, fuori dal repository. Si guardano per capire il movimento, non si caricano come riferimento nei generatori (regole.md §1.4).

Tag di registro: `lusso`, `editoriale`, `minimal`, `pop`, `sperimentale`, `tech`, `istituzionale`, `street`, `heritage`. Servono a filtrare per cliente, non a giudicare.

## Aggiornamento

La cultura si muove ogni stagione e i modelli conoscono il mondo solo fino alla loro data di addestramento.
- Se il task riguarda «ciò che succede adesso» (sfilate, mostre, uscite, campagne) e la sezione **Novità** del file è più vecchia di 60 giorni, chiedi al lead una ricerca di `insight-research` prima di decidere la direction.
- **Persone con accuse documentate** di abusi o condotte gravi (decisione di {{TITOLARE}}, 2026-11-08): entrano con la voce completa più una riga «- **Nota:** fatto, anno, fonte. Non citare al cliente né nel deliverable.» Le note sono pubbliche nel kit (decisione di {{TITOLARE}}, 2026-11-08): solo fatti con fonte primaria o due secondarie autorevoli, formule neutre («accusato di», «condannato per», «ha negato»), mai più di quanto dice la fonte.
- Le novità portano sempre data e fonte. Una voce entra fra i riferimenti stabili solo se ha retto almeno una stagione.
- Chi usa l'atlante e trova una traduzione Higgsfield che funziona meglio (verificata su una generazione), la segnala nel report: il lead aggiorna la voce.
