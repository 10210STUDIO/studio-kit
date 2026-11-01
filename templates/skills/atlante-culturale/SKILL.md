---
name: atlante-culturale
description: Atlante culturale del dipartimento creativo di {{STUDIO}} — arte contemporanea, design, architettura, moda, fotografia, cinema, musica e intrattenimento, ognuno tradotto in istruzioni per i modelli Higgsfield (luce, obiettivo, palette, set, casting, movimento, ritmo). Usala prima di ogni direction, moodboard, brief foto/video o prompt Higgsfield, e quando serve scegliere o giustificare un riferimento visivo. Non sostituisce la discovery del cliente.
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
| Regole su nomi, stili di artisti viventi, diritti, dichiarazione AI | `references/regole.md` |

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

Tag di registro: `lusso`, `editoriale`, `minimal`, `pop`, `sperimentale`, `tech`, `istituzionale`, `street`, `heritage`. Servono a filtrare per cliente, non a giudicare.

## Aggiornamento

La cultura si muove ogni stagione e i modelli conoscono il mondo solo fino alla loro data di addestramento.
- Se il task riguarda «ciò che succede adesso» (sfilate, mostre, uscite, campagne) e la sezione **Novità** del file è più vecchia di 60 giorni, chiedi al lead una ricerca di `insight-research` prima di decidere la direction.
- Le novità portano sempre data e fonte. Una voce entra fra i riferimenti stabili solo se ha retto almeno una stagione.
- Chi usa l'atlante e trova una traduzione Higgsfield che funziona meglio (verificata su una generazione), la segnala nel report: il lead aggiorna la voce.
