# studio-kit

**Uno studio creativo e marketing dentro Claude Code.** 24 agenti, ognuno con un mestiere. Un direttore riceve il brief e assegna il lavoro, due cancelli possono bloccare un progetto, e ogni agente ha una memoria che cresce a ogni lavoro. Tu porti il brief e prendi le decisioni.

*A full creative and marketing studio inside Claude Code: 24 specialised agents, studio rules, per-agent playbooks, 35 craft skills and a cultural atlas to direct image and video models. Content is in Italian. English summary at the bottom.*

---

## In breve

| Cosa | Dettaglio |
|---|---|
| **24 agenti** | Direzione, brand, design, foto e film AI, copy, media, CRM, CRO, PR, dati, web, sicurezza, vendite, operazioni, qualità e conformità. |
| **Regole dello studio** | Un file, `STUDIO.md`, letto da ogni agente prima di ogni lavoro: numeri sempre con fonte, brief prima dell'esecuzione, chi produce non giudica, due cancelli con potere di veto. |
| **Playbook** | La memoria di ogni agente: cosa funziona, con la prova e il limite. Si aggiornano a fine lavoro. |
| **35 skill di mestiere** | Metodo e checklist per posizionamento, naming, identità, tipografia, stampa, script video, campagne a pagamento, test, tracking, GDPR, diritti, contratti, margine e altro. |
| **Atlante culturale** | 437 riferimenti di arte, design, architettura, moda, fotografia, cinema e musica, tradotti in istruzioni per i modelli di immagine e video. |
| **Una cartella per progetto** | Crei la cartella di un cliente e la apri con Claude: si prepara da sola, con il team e il solo contesto di quel cliente, e `studio-lead` a dirigere. |
| **`/studio-kit:crea-studio`** | Una skill che fa otto domande e installa tutto nel tuo `~/.claude/`, con il nome del tuo studio. |

---

## Novità 0.3

- **Una cartella per progetto.** All'installazione scegli dove tieni i progetti. Ogni cartella che crei lì dentro e apri con Claude (dal Terminale o dall'app Desktop, sezione Code) si prepara da sola: il team collegato, un `CLAUDE.md` che carica solo il contesto di quel cliente (`studio/clients/<sigla>/CONTEXT.md`, creato vuoto se il cliente è nuovo) e, dalla sessione dopo, `studio-lead` come direttore che chiama gli specialisti. Niente richieste di permesso per leggere e aggiornare playbook e contesti. Se la cartella non la vuoi diretta, togli il suo `.claude/settings.json`.
- **Aggiornamenti continui.** Le regole e le voci nuove dei playbook arrivano al kit man mano, riscritte senza nomi né dati: aggiornare con `/studio-kit:crea-studio` ti propone solo le novità.

**Aggiornare da 0.2:** `/plugin marketplace update studio-kit`, poi `/studio-kit:crea-studio` e chiedi di aggiornare; ti chiede la cartella dei progetti.

## Novità 0.2.0

- **Gli agenti sono stati rivisti tutti e 24.** Ognuno ha confini più chiari (cosa fa e cosa passa a un altro), usa le skill giuste e non lancia altri agenti da solo: se gli serve un collega, lo scrive nel resoconto e decide il lead.
- **Regole nuove in `STUDIO.md`.** Ogni fonte è segnata come primaria o secondaria; il lavoro si rilegge anche contro le proprie regole; il resoconto al lead è di massimo 300 parole, con il lavoro vero su file; ogni dato personale ha una base giuridica scritta prima dell'uso; chi firma i contratti si chiede ogni volta al titolare.
- **Un cancello sul deploy (casi comuni).** Se `web-engineer` prova a mettere online un sito (rsync, scp o i comandi di Vercel, Netlify, Firebase, Wrangler), un controllo lo ferma (riconosce i casi più comuni, non tutti: un alias SSH o uno script non li vede) finché `delivery-qa` non ha dato l'ok e il lead non ha scritto il file `.qa-approvato` nel progetto (vale 24 ore). `delivery-qa`, inoltre, può scrivere solo nel proprio playbook. Stanno in `studio/hooks/`; prova con `bash ~/.claude/studio/hooks/test_hooks.sh`.
- **Etichetta AI.** Immagini, video e testi generati con AI passano da `compliance-rights-officer` prima di uscire (AI Act, art. 50).
- **Playbook pieni.** Tutti i 24 partono con voci verificate, datate e con fonte: stato di norme, piattaforme e strumenti al 4 novembre 2026. Ogni voce dice fino a quando vale; sopra i 90 giorni si riverifica.
- **Tre benchmark** in `studio/benchmarks/`: costi media in Italia, incrementalità del media, margini delle agenzie. Hanno data, fonte e perimetro; non sono soglie per i tuoi clienti.
- **Collaudo degli agenti** (`studio/collaudo/`). Cinque brief fittizi, un giudice (`delivery-qa`), una rubrica e uno storico dei voti: lo lanci dopo aver cambiato un agente per vedere se è migliorato o peggiorato.
- **Manutenzione settimanale** (`studio/manutenzione/`). Uno script scarica le fonti ufficiali di `fonti.md`, le fa leggere a un modello senza strumenti (il testo del web entra come dato, mai come istruzione) e scrive nei playbook solo le voci la cui citazione compare davvero nella pagina. Il resto finisce nel report da guardare a mano. Schema ripreso dai controlli di [harvey](https://github.com/ethanplusai/harvey). Parte a mano; il README della cartella spiega come farlo partire da solo.
- **Skill corrette** su accessibilità, GDPR, contratti, test A/B, Meta Ads, creator e altre, con le fonti riverificate.

**Aggiornare da 0.1.0:** lancia `/studio-kit:crea-studio` e chiedi di aggiornare. I tuoi playbook non vengono toccati: la skill ti propone solo di aggiungere in fondo le voci nuove.

---

## Come lavora il team

**Un lead, molti specialisti.** Le richieste vanno a `studio-lead`. Il lead non disegna, non scrive copy e non compra media. Fa tre cose:

1. **Trasforma la richiesta in un brief di cinque righe:** risultato atteso, per chi, entro quando, come si misura, cosa è fuori scope. Poi scrive in una riga il problema vero. Se è diverso da quello chiesto, te lo dice prima di far partire il lavoro: «ci serve un sito nuovo» può essere un problema di conversione, di tracking rotto o di un'offerta che non regge.
2. **Divide il lavoro in pacchetti e li raggruppa in ondate.** Ogni pacchetto ha un solo agente responsabile e un risultato verificabile. Tutto ciò che non dipende da altro parte in parallelo. Prima di avviare ti mostra la tabella: ondata, agente, pacchetto, input, output atteso.
3. **Mette insieme i risultati.** Cerca le contraddizioni fra gli agenti e, dove non sono d'accordo, decide sulle prove. Ne esce un documento unico, che si regge su un'idea.

**Chi produce non giudica.** Nessun agente approva il proprio lavoro. Se a un agente serve un altro mestiere, si ferma e lo chiede al lead invece di improvvisare.

**Due cancelli con potere di veto.** Il lead non li può scavalcare.

| Quando | Chi | Cosa controlla |
|---|---|---|
| Prima di accettare un lavoro | `studio-ops-controller` | Se il progetto regge a margine, secondo il listino che hai compilato tu. Se perde soldi, dice no. |
| Prima di ogni consegna, sempre | `delivery-qa` | Brief, fatti e fonti, voce del cliente, accessibilità, tracking, link morti e segnaposto dimenticati. Risponde `APPROVATO`, `BLOCCATO` o `RIFAI EVIDENZA`. Non corregge: elenca, in ordine di gravità. |
| Con `delivery-qa`, quando serve | `compliance-rights-officer` | Dati personali, claim pubblicitari, asset di terzi (font, musica, foto, volti), dichiarazione dell'uso di AI. |
| Prima di `delivery-qa`, se va online codice | `security-engineer` | Siti, form, integrazioni, pagamenti. Senza il suo verdetto il deliverable resta bloccato. |

**Ogni agente legge prima di lavorare,** in quest'ordine: le regole dello studio, il proprio playbook, il `CONTEXT.md` del cliente (chi è, cosa deve ottenere, gusto, cose vietate, cosa è già stato approvato o bocciato). Il feedback di ogni giro si aggiunge al contesto, non lo sostituisce: la terza versione tiene conto anche di cosa il cliente ha detto alla prima.

**I playbook crescono con il lavoro.** A fine lavoro l'agente aggiunge al suo playbook solo ciò che la volta dopo gli farebbe fare qualcosa di diverso. Ogni voce ha la stessa forma:

```
## [AAAA-MM-GG] Titolo del pattern
**Pattern:** cosa funziona.
**Evidenza:** cosa l'ha dimostrato, con la fonte o il risultato misurato.
**Quando non vale:** il limite.
**Cliente/progetto:** slug, o generale.
```

Un lavoro andato male vale più di dieci riusciti, e va scritto con il limite. Una voce smentita si cancella. Sopra le 150 righe il playbook si pota. Se un argomento cambia in fretta (piattaforme, prezzi, policy) e la voce ha più di 90 giorni, l'agente la riverifica sul web, su fonti primarie, prima di usarla.

All'installazione tutti i 24 playbook partono con dei pattern: circa 210 voci datate in tutto, con fonte e limite.

---

## Un esempio, dal brief alla consegna

*Esempio illustrativo: mostra quali agenti intervengono e in che ordine, non un risultato misurato.*

Una torrefazione lancia un abbonamento mensile al caffè. Chiede una landing e un video verticale di 15 secondi.

| Passo | Chi | Cosa succede |
|---|---|---|
| 1 | `studio-lead` | Scrive il brief: abbonati in sei settimane, misurati dal checkout. Il problema vero: chi compra già una volta al mese deve trovare un motivo per abbonarsi. |
| 2 | `studio-ops-controller` | Confronta stima e listino. Il progetto regge. Se il listino fosse vuoto, chiederebbe le tariffe invece di inventarle. |
| 3, in parallelo | `insight-research`, `creative-director` | La ricerca sui concorrenti e su come i clienti parlano del caffè. Il concept in una frase, due o tre territori visivi distanti fra loro. |
| 4, in parallelo | `copy-content-lead`, `ui-designer`, `ai-film-director` | Il copy nella voce del cliente. La landing in codice. Il film: prima le bozze a basso costo, poi la versione finale, controllando i crediti prima di ogni generazione. |
| 5 | `web-engineer`, `measurement-attribution-analyst` | La pagina va online. Il percorso fino all'abbonamento si misura, verificato dall'inizio alla fine. |
| 6, in parallelo | `security-engineer`, `compliance-rights-officer` | Il form e il pagamento. Il claim «tostato da meno di sette giorni» deve essere dimostrabile, il consenso alla newsletter regolare, il video dichiarato come AI. |
| 7 | `delivery-qa` | Verdetto. Se è `BLOCCATO`, il pacchetto torna a chi l'ha fatto con il punto preciso da correggere. |
| 8 | ogni agente | Aggiorna il proprio playbook con ciò che vale la pena ricordare. |

Tu intervieni dove serve una decisione: il brief, il territorio creativo, una spesa di crediti sopra la soglia, la consegna.

---

## I 24 agenti

| Area | Agente | Cosa fa |
|---|---|---|
| Direzione | `studio-lead` | Riceve il brief, decide chi lavora, lancia gli agenti in parallelo, mette insieme i risultati. Non fa il lavoro di mestiere. |
| | `creative-director` | Concept, territori visivi, direzione artistica. Giudica se un lavoro è all'altezza. Dirige, non esegue. |
| Brand e design | `brand-identity-designer` | Naming, architettura di marca, marchi e logotipi, sistemi tipografici, palette, brand book. |
| | `ui-designer` | Dalla direction a interfacce reali: landing, design system, componenti, slide, email, da immagini di riferimento a codice. |
| | `production-art-director` | Porta un'idea approvata all'esecuzione materiale: shooting, illustrazione, stampa, packaging, 3D. |
| Immagine e video | `ai-photo-director` | Foto di campagna generate con AI che devono sembrare scattate su un set vero: casting, styling, luce, serie coerenti. |
| | `ai-film-director` | Film generati con AI che devono sembrare girati da una troupe: piano sequenza, camera che segue, mondo vivo intorno, gesto finale. |
| | `motion-video` | Video, animazione, montaggio, motion per interfacce, 3D leggero. Varianti a volume per i test creativi. |
| Parole | `copy-content-lead` | Copy di vendita, landing, articoli, newsletter, social, email, SEO on-page. Scrive nella voce del cliente. |
| | `pr-earned-media-lead` | Stampa, comunicati, pitch ai giornalisti, thought leadership, premi, crisi reputazionali. |
| Media e performance | `media-planner` | Dove e quanto spendere: mix di canali, budget, forecast, funnel, audience, piano dei test. Decide, non esegue. |
| | `paid-ops-engineer` | Costruisce, lancia e mantiene le campagne: struttura, naming, bidding, budget, feed prodotto, parametri di tracking. |
| | `creative-performance-strategist` | Angoli e hook pubblicitari, creatività a volume, test creativi, iterazione da ciò che funziona. |
| | `influencer-creator-lead` | Selezione dei creator, accordi, brief, UGC, whitelisting, misura dell'effetto reale delle collaborazioni. |
| Clienti e conversione | `crm-lifecycle-lead` | Email e flussi automatici, retention, segmentazione, nurturing, SMS e push, stack martech. |
| | `cro-experimentation-lead` | Conversione di siti e landing, test A/B e geografici, dimensione del campione, lettura dei risultati. Dice quando un test non vale la pena. |
| Dati e ricerca | `measurement-attribution-analyst` | GA4, controllo del tracking, conversioni, ROAS, MER e incrementalità, data warehouse, report. Stabilisce se i numeri sono veri. |
| | `insight-research` | Ricerca di settore, analisi della concorrenza, benchmark, dimensione del mercato, due diligence su un prospect, quadro normativo. |
| Tecnica | `web-engineer` | Mette online siti e landing: build, integrazioni, performance, bug, deploy, CMS, e-commerce. |
| | `security-engineer` | Audit di sicurezza di siti, app, API, e-commerce, wallet e blockchain. Controllo prima della pubblicazione. Elenca cosa correggere, non tocca il codice del cliente. |
| Business | `senior-sales-agent` | Nuovi clienti (ricerca, qualifica, proposta, prezzo, chiusura) e clienti acquisiti (onboarding, rinnovo, upsell, rischio di abbandono). |
| | `studio-ops-controller` | Margine di progetto, stime, scope, change order, contratti, capacità del team, freelance, case study. **Cancello** prima di accettare un lavoro. |
| Cancelli | `delivery-qa` | **Cancello obbligatorio** prima di ogni consegna. Controlla contro il brief e lo standard dello studio. |
| | `compliance-rights-officer` | GDPR e consenso, licenze di immagini, musica e font, claim e disclosure, accessibilità, dichiarazione dell'uso di AI. Blocca ciò che espone lo studio o il cliente. |

16 agenti usano il modello Opus, 8 Sonnet. Lo cambi nel file di ogni agente.

---

## Le 35 skill di mestiere

Gli agenti le usano da soli, secondo la tabella che ognuno ha nel proprio file. Ogni skill dice quando usarla, cosa controllare e quali errori sono ricorrenti.

| Area | Skill | Copre |
|---|---|---|
| Strategia e offerta | `positioning-method`, `gtm-strategy`, `offer-pricing-packaging`, `qualitative-interviews` | Come si posiziona il cliente e contro chi, come va sul mercato, prezzi e pacchetti, interviste ai clienti del cliente. |
| Brand e design | `naming`, `brand-architecture`, `visual-identity-marks`, `typography-craft`, `photo-illustration-direction`, `print-packaging-production` | Nomi e screening, marchi multipli, costruzione del marchio, tipografia, direzione di foto e illustrazione, file per la stampa e il packaging. |
| Contenuti e reputazione | `video-scriptwriting`, `pr-earned-media`, `influencer-creator`, `case-study-production` | Script per durata e contesto, ufficio stampa, collaborazioni con creator, case study con l'autorizzazione del cliente. |
| Media a pagamento | `meta-ads-ops`, `tiktok-linkedin-ads-ops`, `retail-media-amazon`, `programmatic-ctv-dooh` | Struttura e diagnosi delle campagne, eventi lato server, marketplace, programmatic, TV connessa e affissione digitale. |
| Misura e test | `gtm-tracking-implementation`, `experiment-stats`, `cro-experimentation`, `mmm-incrementality`, `bi-warehouse`, `martech-stack` | Tracking con tag manager, statistica dei test, ottimizzazione della conversione, quanto la pubblicità ha aggiunto davvero, BI, scelta degli strumenti. |
| Web, e-commerce, CRM | `cms-architecture`, `shopify-ecommerce`, `email-lifecycle-retention` | Modello dei contenuti e scelta del CMS, architettura Shopify, flussi email e deliverability. |
| Regole e diritti | `gdpr-marketing-consent`, `ad-claims-disclosure`, `rights-licensing-clearance`, `accessibility-compliance` | Consenso e cookie, claim dimostrabili e disclosure, licenze e diritti sugli asset (anche AI), accessibilità e obblighi UE. |
| Gestione dello studio | `project-margin`, `scoping-change-orders`, `sow-contracts`, `freelance-network` | Margine e decisione di accettare un lavoro, scope e richieste extra, contratti da far validare a un legale, rete di freelance. |

---

## L'atlante culturale

**Perché serve.** Un modello di immagini o video fa quello che gli descrivi. Se scrivi «elegante» o «cinematico», ottieni la media di internet. Se descrivi cosa rende elegante una cosa (una luce, una distanza, un materiale, un ritmo), ottieni quella cosa. L'atlante fa questo passaggio: dal riferimento culturale alla descrizione precisa.

**Cosa contiene.** 437 voci in sei file: arte e design, architettura, moda, fotografia, cinema, musica e intrattenimento. Ogni voce ha:

- **Si vede:** luce, colore, composizione, materia, ritmo;
- **Principio:** l'idea da prendere, in una riga;
- **Higgsfield:** un frammento di prompt in inglese, senza nomi propri, pronto da unire agli altri, con il modello consigliato;
- **Cliché:** cosa non copiare.

Ogni file ha anche il lessico della disciplina e una sezione di novità con data e fonte.

**Le regole d'uso.** Si scelgono 2-4 riferimenti da discipline diverse, e almeno uno deve fare attrito con il registro ovvio del brief. Si evita la palette che il modello produce da solo (cammello, cognac, crema, luce dorata). I nomi di artisti, fotografi e marchi restano in un file interno: non entrano mai nel prompt né nel lavoro consegnato. Un file di regole spiega il perché: diritti, stile di artisti viventi, termini dei fornitori, dichiarazione dell'uso di AI.

**Il test.** In una prova interna (un brief fittizio, un solo giudice AI che non sapeva quale versione usasse l'atlante):

- **Prima versione** (riferimenti tutti nello stesso registro): l'atlante perde, perché conferma la media del genere.
- **Con la regola dell'«attrito»** (almeno un riferimento lontano dal registro ovvio): la versione con l'atlante prende più punti su foto (34 contro 27 su 50) e film (31 contro 29).

Non è una misura statistica: è un segnale da una sola prova. E nessuno dei risultati era da campagna di una maison: l'atlante dà cultura ai prompt, il concept resta compito del direttore creativo. Per questo, nei lavori di livello maison, la regola è: prima il concept del `creative-director`, poi l'atlante.

---

## Cosa resta tuo

Il kit porta il metodo. Il resto lo decidi tu, ed è tutto in file di testo nel tuo `~/.claude/`, che puoi modificare.

| | Dove | Chi lo scrive |
|---|---|---|
| **Il tuo brand e il tuo gusto** | `studio/clients/<tuo-studio>/CONTEXT.md` | Tu, all'installazione o dopo: registro, riferimenti, colori, cose vietate. |
| **I tuoi clienti** | `studio/clients/<cliente>/` | Uno per cartella. Nessun agente cita un cliente nel lavoro di un altro. |
| **Il listino** | `studio/benchmarks/listino.md` | Tu. Gli agenti non inventano prezzi: se un campo è vuoto, lo chiedono. |
| **Le regole** | `studio/STUDIO.md` | Tu. Cambiano solo per tua decisione, come le soglie di spesa in crediti (di default: 50 per generazione, 200 per lavoro). |
| **I playbook** | `studio/playbooks/` | Gli agenti, dal tuo lavoro. Negli aggiornamenti del kit non vengono mai sovrascritti. |
| **Le fonti da sorvegliare** | `studio/manutenzione/fonti.md` | Tu: parti dall'elenco del kit e tieni solo quelle che toccano i tuoi clienti. |
| **Le decisioni** | | Tu. Quando due agenti non sono d'accordo e mancano le prove, decidi tu. |

Se hai altre attività o aziende, all'installazione le indichi come separate: nessun agente porta dati da una all'altra.

---

## Installazione

```
/plugin marketplace add 10210STUDIO/studio-kit
/plugin install studio-kit@studio-kit
```

Poi, in Claude Code:

```
/studio-kit:crea-studio
```

Oppure scrivi semplicemente «crea il mio studio»: la skill parte da sola.

La skill fa otto domande, una alla volta: nome dello studio, chi decide, cosa fa lo studio, lingua delle risposte, altre attività da tenere separate, canale per gli alert, gusto dello studio, cartella dei progetti. Poi copia agenti, skill, regole, playbook, benchmark, controlli automatici, collaudo e manutenzione nel tuo `~/.claude/`, con i tuoi dati al posto dei segnaposto. Se un file esiste già, chiede se saltarlo, sovrascriverlo (dopo averne fatto una copia `.bak`) o annullare. Non sovrascrive niente senza chiedere.

Riavvia Claude Code. Poi crea la cartella del primo cliente dentro la cartella dei progetti e aprila con Claude, oppure dai il primo lavoro a `studio-lead`. Prima di chiedere un preventivo, compila `~/.claude/studio/benchmarks/listino.md`.

**Aggiornare.** Lancia `/studio-kit:crea-studio` e chiedi di aggiornare l'installazione: ti mostra le differenze file per file, aggiorna solo quelli che approvi e ti propone i pattern nuovi del kit senza toccare i tuoi playbook.

---

## Requisiti e dipendenze

- **Claude Code**, con accesso ai modelli Opus e Sonnet.
- **Italiano.** Tutti i contenuti del kit sono in italiano. La lingua delle risposte la scegli all'installazione.

Gli agenti funzionano anche senza le dipendenze qui sotto, ma rendono di più con:

**Generazione di immagini e video (consigliata per i creativi)**
- [Higgsfield](https://higgsfield.ai) CLI (`npm i -g @higgsfield/cli`, account a pagamento) e skill ufficiali: `npx skills add higgsfield-ai/skills -g -a claude-code`
- Skill di prompt per Higgsfield: [OSideMedia/higgsfield-ai-prompt-skill](https://github.com/OSideMedia/higgsfield-ai-prompt-skill)

**Plugin Claude Code citati dagli agenti**
- Ufficiali Anthropic (`claude-plugins-official`): `superpowers`, `playwright`, `code-review`, `context7`, `telegram` (solo se usi Telegram per gli alert)
- [impeccable](https://github.com/pbakaus/impeccable): pipeline di design frontend
- [ui-ux-pro-max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill): design system, brand, slide, banner
- [mattpocock/skills](https://github.com/mattpocock/skills): review, debug, prototipi
- [understand-anything](https://github.com/Egonex-AI/Understand-Anything): capire codebase e file Figma
- [ponytail](https://github.com/dietrichgebert/ponytail): codice minimo
- [ECC](https://github.com/affaan-m/ECC): scrittura, ricerca, contenuti social, SEO, sicurezza (`security-review`, il metodo di base di `security-engineer` se non hai una skill `security-audit`; `growth-log`, usata dal protocollo dei playbook), video editing

**Altre skill opzionali** citate nelle tabelle di routing (installale se ti servono; fonti da verificare): skill Google per Ads, Analytics, BigQuery e Data Manager; `archify`, `image-to-code-skill`, `imagegen-frontend-web`, `imagegen-frontend-mobile`, `img2threejs`, `motion-patterns`, `remotion-video-creation`, `brand-discovery`, `competitive-platform-analysis`, `competitive-report-structure`.

**Skill di terzi che gli agenti nominano «se installata»** (non incluse nel kit; controlla tu fonte e licenza prima di installarle): `seo`, `lead-intelligence`, `research-ops`, `watch` (guardare un video: fotogrammi e trascrizione), `audio-understand` (com'è una musica o un suono), `hyperframes` con `hyperframes-cli`, `hyperframes-registry` e `remotion-to-hyperframes` (video da HTML, [heygen-com/hyperframes](https://github.com/heygen-com/hyperframes), Apache-2.0: fissa la CLI a una versione, spegni la telemetria e non usare i comandi cloud), `security-audit`. Senza di loro gli agenti usano gli strumenti di base.

**MCP opzionale:** Splice (campioni musicali) per `motion-video`: gli strumenti `mcp__claude_ai_Splice__*` funzionano solo con quel connettore.

`/studio-kit:crea-studio` controlla quali dipendenze mancano e ti propone i comandi. Non installa niente senza un sì.

---

## Per chi è, per chi non è

**È per te se**
- sei uno studio piccolo o un freelance che fa lavoro creativo e marketing per clienti;
- vuoi un metodo che si ripete uguale su ogni progetto: brief, assegnazione, controllo, consegna;
- vuoi produrre foto e video con l'AI e ti serve una direzione, non solo dei prompt;
- usi già Claude Code, o sei disposto a imparare.

**Non è per te se**
- cerchi un tasto che fa uscire una campagna finita: il kit ha bisogno di qualcuno che dia il brief e decida;
- ti serve un gestionale: il kit non traccia ore, non fattura, non tiene il calendario;
- ti serve un parere legale: le skill su contratti, privacy e diritti sono checklist;
- non lavori in italiano.

---

## Come è fatto

```
.claude-plugin/        manifest del plugin e del marketplace
skills/crea-studio/    la skill che installa e personalizza
templates/
  agents/              24 agenti (con segnaposto {{STUDIO}}, {{TITOLARE}}…)
  skills/              35 skill di mestiere + atlante culturale
  studio/              STUDIO.md, playbook, benchmark, listino, CONTEXT di esempio
    hooks/             i due controlli automatici (deploy e playbook) e il loro test
    collaudo/          brief fittizi, rubrica e script per collaudare gli agenti
    manutenzione/      script settimanale, elenco delle fonti, voci scadute
```

Convenzioni per chi contribuisce: [CONTRIBUTING.md](CONTRIBUTING.md).

---

## Avvertenze

Le skill su contratti, GDPR, claim pubblicitari, diritti e AI Act sono checklist operative, **non consulenza legale**: le norme citate vanno verificate sulle fonti ufficiali e, per i casi reali, con un legale.

Gli agenti possono sbagliare. I cancelli riducono il rischio, non lo eliminano: quello che esce verso un cliente lo rileggi tu.

Nessuna affiliazione con Anthropic, Higgsfield o gli autori dei plugin elencati.

## Licenza

MIT. © 2026 All Black Studio Ltd. Testo completo in [LICENSE](LICENSE).

I nomi di artisti, fotografi, registi, designer e marchi citati nell'atlante sono riferimenti culturali: nessuna affiliazione. Le skill di terzi elencate sopra hanno le proprie licenze e non sono incluse.

---

## English summary

`studio-kit` turns Claude Code into a creative and marketing studio. A lead agent turns each request into a five-line brief, splits it into work packages and dispatches 24 specialists in parallel: creative direction, brand, UI, AI photo and film direction, motion, copy, PR, media planning and buying, creative testing, creators, CRM, CRO, measurement, research, web, security, sales and operations. Whoever produces never judges their own work. Two gates can veto: margin before a project is accepted, quality and compliance before anything is delivered. Every agent reads the studio rules, its own playbook and the client's context before working, and adds verified patterns to its playbook afterwards. The kit also includes 35 craft skills and a 437-entry cultural atlas that translates art, design, architecture, fashion, photography, film and music references into prompt fragments for image and video models. All content is in Italian. Install the plugin, run `/studio-kit:crea-studio`, answer eight questions, and the kit is copied and personalised into your `~/.claude/`. Choose a projects folder: every folder you create there and open with Claude sets itself up as a client project, with the team, only that client's context, and the lead agent directing. Your brand, clients, taste, rate card and playbooks stay yours.
