# Playbook — studio-ops-controller

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-11-04] Termini di pagamento B2B: cosa dice il D.Lgs. 231/2002 vigente

**Pattern:** nel SOW i termini si scrivono in giorni dal ricevimento della fattura. Senza patto il massimo è 30 giorni (art. 4 c. 2). Fra imprese si può pattuire di più, ma sopra i 60 giorni solo in modo espresso e provato per iscritto, e mai se gravemente iniquo (art. 4 c. 3). Se il creditore è una PMI e il debitore no, sopra i 60 giorni la clausola si presume gravemente iniqua (art. 7 c. 4-bis). Con una PA il massimo è 60 giorni (art. 4 c. 4). La mora decorre dal giorno dopo la scadenza senza bisogno di metterla in mora (art. 4 c. 1). Tasso legale di mora: tasso BCE di rifinanziamento principale più 8 punti (art. 2 lett. e); il tasso del semestre lo pubblica il MEF in Gazzetta (art. 5): si legge lì, non si scrive a memoria. In più spettano 40 euro forfettari per le spese di recupero (art. 6 c. 2). La clausola che esclude la mora è nulla (art. 7 c. 3). Se il contratto prevede una verifica di conformità, il termine parte dalla verifica, e la verifica non può durare più di 30 giorni salvo patto espresso (art. 4 c. 2 lett. d e c. 6): un collaudo lungo nel SOW è una dilazione di pagamento.
**Evidenza:** [P] Normattiva, testo vigente, artt. 2, 4, 5, 6, 7, letti il 2026-11-04 (URN per articolo: `urn:nir:stato:decreto.legislativo:2002-10-09;231~art4`; l'atto intero restituisce solo l'inizio).
**Quando non vale:** con un consumatore (non è transazione commerciale, art. 2); se il contratto è regolato da una legge non italiana, per esempio quando fattura un'entità UK (norma UK non verificata); per contratti conclusi prima del 1/1/2013. Validare sempre col legale.
**Cliente/progetto:** generale

## [2026-11-04] SOW con contenuti generati da AI: tre clausole

**Pattern:** (1) registro del contributo umano per ogni deliverable con parti generate: cosa ha prodotto il modello, cosa hanno scelto, composto o modificato le persone, con file e date; (2) etichetta AI: {{STUDIO}} consegna il contenuto già marcato e l'indicazione scritta dell'etichetta, il cliente si impegna a mantenerla quando pubblica e a non rimuoverla; (3) nessuna esclusiva né proteggibilità garantita sull'output generato.
**Evidenza:** [P] L. 132/2025 art. 25 (in vigore dal 10/10/2025): l'art. 1 L. 633/1941 protegge le opere «dell'ingegno umano», anche con l'ausilio dell'AI, «purché costituenti risultato del lavoro intellettuale dell'autore». USCO, Parte 2 (gennaio 2025): i soli prompt non danno controllo sufficiente (parere USA, non vale in Italia). AI Act art. 50 dal 2/8/2026; il rinvio al 2/12/2026 (Reg. UE 2026/1744, art. 111(4)) vale solo per i fornitori di sistemi già sul mercato e solo per la marcatura dell'art. 50(2). Per chi usa lo strumento e pubblica deepfake (art. 50(4)) nessun rinvio. Fonte: lettura del 2026-11-04 su EUR-Lex/Cellar e Normattiva.
**Quando non vale:** deliverable senza contenuti generati o manipolati. Il contratto sposta il compito pratico dell'etichetta, non l'obbligo di legge: se {{STUDIO}}, che usa lo strumento, sia anche tenuto all'art. 50(4), e cosa è deepfake, lo decide `compliance-rights-officer`. Se pubblica {{STUDIO}} (social gestiti), l'etichetta è nostra. Clausole da validare col legale.
**Cliente/progetto:** generale

## [2026-11-04] Accessibilità (EAA): dentro o fuori dallo SOW, per scritto

**Pattern:** ogni SOW di sito, app o e-commerce dice se la conformità di accessibilità è inclusa, a quale standard (oggi WCAG 2.1 AA / EN 301 549 v3.2.1) e con quale verifica, oppure che è esclusa. Se inclusa, le ore di test entrano nel conto economico. Se il cliente si dichiara microimpresa esente, lo dichiara lui per scritto.
**Evidenza:** [P] D.Lgs. 82/2022: obblighi dal 28/6/2025; microimprese che forniscono servizi esentate (art. 3 c. 3); sanzioni da 5.000 a 40.000 euro (art. 24); il 2030 vale solo per prodotti già in uso e contratti preesistenti (art. 25). Linee guida AgID, determinazione 38/2026 (GU n. 69 del 24/3/2026), su v3.2.1. EN 301 549 v4.1.1 (WCAG 2.2) pubblicata a settembre 2026 ma non ancora riferimento legale (AccessibleEU, 7/9/2026). Fonte: lettura del 2026-11-04.
**Quando non vale:** progetti senza interfaccia digitale per consumatori (identità, stampa). Se un servizio rientra nell'EAA lo decide `compliance-rights-officer`. Prima di promettere conformità a v4.1.1 o WCAG 2.2, controllare se è stata citata in Gazzetta UE dopo il 7/9/2026.
**Cliente/progetto:** generale

## [2026-11-04] Dati personali da cliente UE verso un'entità UK

**Pattern:** se il preventivo prevede che dati personali del cliente UE passino a un'entità nel Regno Unito, il trasferimento è coperto da adeguatezza: non servono clausole contrattuali tipo. Serve comunque l'accordo art. 28 GDPR quando lo studio tratta dati per conto del cliente.
**Evidenza:** [P] Decisione di esecuzione (UE) 2025/2574 del 19/12/2025: «shall expire on 27 December 2031, unless extended». Fonte: lettura del 2026-11-04 su Cellar.
**Quando non vale:** dopo il 27/12/2031 o se la Commissione la modifica; il senso inverso, dal Regno Unito verso l'UE (non verificato); sub-responsabili fuori dal Regno Unito, per esempio negli USA.
**Cliente/progetto:** generale

## Da verificare

(ipotesi non ancora dimostrate)
