# Convenzioni dei template

Tutto ciò che sta in `templates/` è un modello: la skill `crea-studio` lo copia nel `~/.claude/` di chi lo installa e sostituisce i segnaposto.

## Segnaposto (solo questi)

| Segnaposto | Significato | Esempio |
|---|---|---|
| `{{STUDIO}}` | nome dello studio | «Atelier Nord» |
| `{{STUDIO_SLUG}}` | nome breve, minuscolo, senza spazi | `atelier-nord` |
| `{{TITOLARE}}` | chi decide nello studio (nome proprio) | «Giulia» |
| `{{LINGUA}}` | lingua delle risposte | «italiano semplice» |
| `{{DESCRIZIONE}}` | cosa fa lo studio, per chi (solo in `STUDIO.md`) | «Studio di brand per la moda indipendente» |
| `{{ALTRE_ATTIVITA}}` | altre attività del titolare da tenere separate | «nessuna» |
| `{{CANALE_NOTIFICHE}}` | dove arrivano gli alert urgenti | «Telegram» |

## Percorsi

- Cartella dello studio: `~/.claude/studio/` (mai cartelle con il nome di uno studio specifico).
- Contesto di un cliente: `~/.claude/studio/clients/<slug>/CONTEXT.md`.
- Contesto del brand dello studio stesso: `~/.claude/studio/clients/{{STUDIO_SLUG}}/CONTEXT.md`.
- Script e controlli automatici: `~/.claude/studio/hooks/`, `~/.claude/studio/collaudo/`, `~/.claude/studio/manutenzione/`. Gli script usano `$HOME` o `~`, mai percorsi assoluti di una persona; il test `hooks/test_hooks.sh` deve passare dopo la sostituzione dei segnaposto.
- Riferimenti approvati (foto, video): `~/.claude/studio/clients/<slug>/riferimenti/`.
- Asset generati: `~/.claude/studio/clients/<slug>/assets/` o `~/.claude/studio/studio/assets/`.

## Cosa non deve mai comparire

- Nomi di persone reali dello studio d'origine, soci, collaboratori.
- Nomi di clienti, aziende collegate, progetti veri, attività personali.
- Percorsi personali (`/Users/...`, `~/Desktop/...`), hosting, account, ID di workspace, email, crediti residui.
- Date di «decisioni di qualcuno»: una regola è una regola dello studio, non serve la cronaca.
- Storia delle versioni bocciate raccontata con nomi: si tiene il **pattern** («i tagli secchi fra inquadrature generate separatamente si vedono»), non l'episodio.

## Cosa si tiene

- Tutto il mestiere: metodo, regole, routing delle skill, pattern verificati dei playbook, numeri con fonte.
- I riferimenti a skill di terzi (es. `higgsfield`, `impeccable`, `ui-ux-pro-max`) restano: sono dipendenze elencate nel README.
- Lingua: italiano.
