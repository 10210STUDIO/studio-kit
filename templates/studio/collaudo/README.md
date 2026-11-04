# Collaudo degli agenti

Cinque brief con clienti fittizi, uno per mestiere. `collaudo.sh` li dà agli agenti in parallelo, poi `delivery-qa` giudica gli elaborati con `rubrica.md` e scrive una riga per brief in `storico.md`.

- Lancio: `bash ~/.claude/studio/collaudo/collaudo.sh <etichetta>` (usa crediti del tuo piano Claude: cinque agenti più il giudice).
- Quando: dopo ogni modifica importante a un agente o a `STUDIO.md`. Confronta le righe nuove dello storico con le precedenti: un totale che scende dice che la modifica ha peggiorato qualcosa.
- Il giudice è un modello e non è imparziale: leggi sempre i due difetti più gravi che indica, non solo il voto.
- I risultati stanno in `risultati/` (creata al primo lancio).
