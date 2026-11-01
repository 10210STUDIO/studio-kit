---
name: cms-architecture
description: Usa quando progetti il modello di contenuti di un sito o scegli un CMS — definire tipi e campi, blocchi componibili o campi rigidi, headless o tradizionale, multilingua, anteprima e workflow di pubblicazione, e cosa non deve finire nel CMS.
---

# Architettura dei contenuti

## Il punto centrale

Il CMS ha un solo scopo: **il cliente deve poter modificare i contenuti da solo senza rompere il design.** Entrambe le metà contano. Un CMS in cui il cliente non può toccare niente genera una richiesta di assistenza per ogni virgola. Un CMS in cui il cliente può toccare tutto genera un sito che in tre mesi non assomiglia più al progetto approvato.

Il modello di contenuti è quindi una **decisione di design**, non un dettaglio di implementazione. Va presa dal progettista insieme a chi scrive il codice, prima di costruire le pagine, e va presa guardando il sito reale che il cliente avrà fra due anni, non quello che lanci.

Regola operativa: ogni campo che esponi al cliente deve avere una risposta a "cosa succede se qui mette tre volte il testo previsto, o niente, o un'immagine verticale?". Se la risposta è "si rompe", il campo è progettato male — non è colpa del cliente.

## 1. Prima di scegliere il CMS: modella i contenuti

Non partire dalla tecnologia. Parti da questa sequenza:

1. **Inventario dei contenuti reali.** Non quelli ipotetici: prendi le pagine che esistono o che il brief richiede e elenca gli oggetti di informazione (prodotto, servizio, caso studio, persona, sede, articolo, evento, FAQ, testimonianza).
2. **Individua i tipi.** Un tipo è un oggetto che ha una struttura ricorrente e una vita propria. Se qualcosa compare in più punti del sito con la stessa forma, è un tipo, non un pezzo di pagina.
3. **Definisci le relazioni.** Un caso studio ha un cliente, un settore, dei servizi, delle persone. Le relazioni sono riferimenti fra tipi, non testo ripetuto. Il testo ripetuto diverge sempre.
4. **Definisci i campi** per ogni tipo, con tipo di dato, obbligatorietà, limiti, e cosa accade se è vuoto.
5. **Solo adesso** scegli lo strumento.

Principio: **un contenuto, un posto.** Se il nome di un prodotto è scritto in cinque pagine, vive in un tipo e le pagine lo referenziano. Duplicare contenuto è garantire che sarà incoerente.

Principio: **separa contenuto e presentazione.** Nel CMS va "questo è il titolo e questo è il testo", non "questo testo è grande e rosso". L'HTML incollato dal cliente in un campo testo è presentazione nel contenuto: prima o poi rompe il layout o l'accessibilità.

## 2. Headless o tradizionale

Nessuno dei due è migliore. Dipende da chi mantiene, da cosa serve, da quanto dura.

**CMS tradizionale/monolitico** (WordPress e simili, o un CMS integrato nella piattaforma): conviene quando
- il cliente ha già qualcuno interno che lo conosce;
- il sito è principalmente editoriale o di presentazione;
- il budget di manutenzione è basso e serve un ecosistema di plugin e temi;
- l'anteprima deve funzionare senza costruire nulla;
- il cliente vuole poter cambiare fornitore facilmente.

Costi: performance da gestire attivamente, superficie di sicurezza e aggiornamenti continui, plugin che accumulano debito, tendenza a mescolare contenuto e presentazione.

**Headless** (CMS API-first + frontend proprio): conviene quando
- il contenuto serve a più destinazioni (sito, app, kiosk, newsletter, canali terzi);
- il frontend ha requisiti forti di performance, interazione o design;
- esiste già un team di sviluppo che manutiene, e continuerà a esistere;
- il modello di contenuti è complesso e beneficia di tipizzazione seria.

Costi: l'anteprima va costruita e non è gratis, il cliente vede due strumenti separati, la dipendenza dal fornitore di sviluppo è maggiore, i costi di licenza del CMS scalano su utenti/record/chiamate API.

**Criterio decisivo, da chiedere sempre:** chi manutiene questo sito fra dodici mesi, e con quale budget? Se la risposta è "nessuno" o "il nipote del titolare", headless è una scelta sbagliata anche se tecnicamente superiore. Un'architettura che il cliente non può mantenere è un'architettura fallita.

Verifica con WebFetch sulla documentazione ufficiale le capacità e i limiti attuali del CMS che stai valutando (limiti di piano, localizzazione, anteprima, ruoli): cambiano, e i confronti di terze parti invecchiano.

## 3. Blocchi componibili o campi rigidi

Il trade-off centrale: **libertà del cliente contro controllo del risultato.** Non esiste la posizione giusta in assoluto, esiste quella giusta per quel cliente su quella pagina.

**Campi rigidi** (un tipo con campi fissi, layout determinato dallo sviluppo): il risultato è garantito, il cliente non può sbagliare, ogni nuova esigenza di layout richiede sviluppo. Usali per tutto ciò che è ripetitivo e strutturato: prodotti, schede, persone, articoli, sedi, listini. **Qui la libertà non serve a nessuno** e introdurla produce solo incoerenza.

**Blocchi componibili** (il cliente compone la pagina da un catalogo di sezioni): il cliente diventa autonomo sulle pagine di marketing, al prezzo di poter costruire pagine brutte. Usali per landing page, homepage, pagine campagna: contenuti il cui layout cambia per ragioni di business, spesso e senza preavviso.

Come si tiene insieme senza perdere il controllo:
- Un **catalogo chiuso di blocchi**, ognuno progettato e testato, non un costruttore libero di righe e colonne. Il page builder generico è il modo più rapido per perdere il design.
- Ogni blocco ha **varianti predefinite** (allineamento, sfondo da palette, dimensione da scala), non valori liberi. Niente selettore di colore libero, niente font size in pixel, niente margini arbitrari.
- **Vincoli nei campi**: lunghezza massima e minima dei testi, proporzioni d'immagine dichiarate e ritaglio automatico, numero massimo di elementi in una lista, campi obbligatori dove il vuoto rompe.
- **Nomi orientati allo scopo**, non all'aspetto: "elenco di vantaggi" non "tre colonne grigie". Un nome che descrive l'aspetto diventa falso al primo restyling e induce il cliente a usare il blocco per il motivo sbagliato.
- Ogni blocco ha una **descrizione e un'anteprima** nell'interfaccia: quando si usa, quando non si usa.
- Regole di composizione dove servono: quali blocchi possono stare in cima, quali non si possono ripetere, quanti ne stanno in una pagina.
- **Degradazione dignitosa**: un blocco con metà dei campi vuoti deve collassare in modo accettabile, non lasciare un buco.
- Fai meno blocchi di quanti il cliente chiede. Venti blocchi sono un sistema che nessuno sa usare; otto blocchi ben fatti coprono quasi tutto. Ogni blocco è codice da manutenere, da tradurre, da testare e da documentare.

## 4. Localizzazione e multilingua

Decidi **all'inizio** se il sito sarà multilingua, anche se parte in una lingua sola. Aggiungerlo dopo è una migrazione, non un'impostazione.

- Distingui **traduzione** (stesso contenuto in un'altra lingua) da **localizzazione** (contenuto diverso per mercato: listini, disponibilità, riferimenti normativi, casi studio, contatti). Sono bisogni differenti e producono modelli differenti. Chiedi al cliente quale dei due gli serve: spesso dice "traduzione" e intende "localizzazione".
- Definisci quali campi sono traducibili e quali condivisi (uno SKU non si traduce, una misura sì forse).
- Definisci il **comportamento di fallback**: se la traduzione manca, si mostra la lingua base, si nasconde la pagina, o si mostra un avviso? Decidilo, non lasciarlo implicito.
- Il testo nelle **immagini** non è traducibile. Progetta grafiche con testo fuori dall'immagine, o preventiva una versione per lingua.
- Previsione di spazio: i testi cambiano lunghezza fra le lingue in modo significativo. Un layout tarato su un testo italiano può rompersi in tedesco. Testa con il testo reale, non con il testo segnaposto.
- Gestisci URL, `hreflang`, canonical e sitemap per lingua in coordinamento con la skill `seo`. Un multilingua con hreflang sbagliato cannibalizza il proprio traffico.
- Prevedi come arriva la traduzione: file esportati, servizio esterno, traduttore che lavora nel CMS. Ognuna richiede funzionalità diverse, e **va verificata nel piano** del CMS scelto.

## 5. Anteprima e workflow di pubblicazione

- L'**anteprima** non è un lusso: senza anteprima il cliente pubblica in produzione per vedere com'è, e quello *è* il suo workflow. In headless l'anteprima va costruita: mettila in preventivo, non scoprirla a progetto avviato.
- Lo **stato del contenuto** minimo utile: bozza, in revisione, pubblicato, archiviato. Più stati di quanti il cliente usa diventano un ostacolo, e gli stati che nessuno rispetta sono teatro.
- **Programmazione della pubblicazione** e **scadenza**: servono quando esistono campagne o contenuti a termine. Se le promo escono di notte, non costringere nessuno a essere svegli.
- **Ruoli e permessi** proporzionati all'organizzazione reale: chi scrive, chi approva, chi può toccare la struttura. Non dare a tutti il permesso di modificare i tipi di contenuto o i blocchi di sistema.
- **Versioni e ripristino**: devono esistere e il cliente deve sapere come usarle. Il primo contenuto cancellato per errore arriva sempre.
- Non inventare un processo di approvazione che il cliente non ha. Un'azienda di quattro persone non vuole un workflow a tre livelli: lo aggirerà.
- **Insegna il sistema.** Una consegna senza mezz'ora di formazione registrata e una pagina di istruzioni dentro il CMS stesso produce un cliente che non lo usa, e che fra sei mesi chiede un sito nuovo.

## 6. Cosa non va mai nel CMS

- **Segreti**: chiavi API, token, credenziali, webhook firmati. Vanno in variabili d'ambiente o in un gestore di segreti.
- **Testo di interfaccia strutturale** che il cliente non deve cambiare (etichette di sistema, messaggi di errore, microcopy di validazione) a meno che non sia intenzionalmente traducibile: in quel caso vive in file di localizzazione, non in campi di contenuto.
- **HTML, CSS o JavaScript arbitrario incollato in campi di contenuto.** È la via più rapida per rompere layout, performance, accessibilità e sicurezza. Se serve una sezione nuova, si fa un blocco.
- **Logica di business**: prezzi autoritativi, regole di sconto, calcoli, condizioni. Il CMS è contenuto, non motore.
- **Dati personali di clienti finali**: lead, ordini, iscritti. Hanno obblighi di conservazione, cancellazione e sicurezza che un CMS non è progettato per soddisfare. Vedi `gdpr-marketing-consent`.
- **File enormi e archivi**: il CMS non è un drive. Gli asset grandi vanno in uno storage o DAM, con riferimento dal CMS.
- **Script di tracking e tag incollati nelle pagine.** Vanno gestiti nel tag manager, in modo versionabile e verificabile: vedi `gtm-tracking-implementation`.
- **Redirect gestiti a mano in un campo libero** da chi non sa cosa sta facendo. Se i redirect stanno nel CMS, siano un tipo strutturato con validazione.
- **L'unica copia di qualcosa.** Se il contenuto esiste solo nel CMS e non c'è backup esportabile, il cliente è ostaggio del fornitore. Verifica che l'export esista e provalo.

## 7. Cosa consegnare

- Un **documento del modello di contenuti**: tipi, campi, tipi di dato, vincoli, relazioni, cosa è traducibile, cosa è obbligatorio. Serve a chi sviluppa oggi e a chi erediterà il progetto.
- Il **catalogo dei blocchi** con scopo, varianti e quando non usarli.
- Istruzioni per il cliente **dentro il CMS**: testi di aiuto sui campi, non un PDF che nessuno apre.
- La matrice dei **ruoli**.
- La prova che l'export dei contenuti funziona.
- Passa da `delivery-qa`.

## Errori che costano

- **Modellare i contenuti partendo dalle pagine del mockup.** Ottieni tipi che sono "pagina chi siamo" invece di "persona" e "sede": il contenuto non è riutilizzabile e il secondo sito interno va rifatto da zero.
- **Un unico campo di testo ricco per tutta la pagina.** Il cliente ci incolla il Word, con stili e tabelle. Il design non esiste più, l'accessibilità nemmeno, e nessuno può recuperare la struttura senza rifare a mano il contenuto.
- **Page builder libero.** Risparmi sviluppo oggi, perdi il controllo del brand per sempre, e il cliente ti chiede di rifare le pagine che ha costruito lui.
- **Nessun limite sui campi.** Un titolo di tre righe dove ne stava una, un'immagine verticale in uno slot panoramico: il sito sembra rotto, e lo sembra per colpa dello studio.
- **Duplicare contenuto invece di referenziarlo.** Il cliente cambia il numero di telefono in un posto su sei. Il sito mente, e la colpa è dell'architettura.
- **Nomi di blocchi e campi basati sull'aspetto.** Al primo restyling il nome è falso; il cliente usa "banner blu" per cose che non sono né banner né blu.
- **Multilingua aggiunto dopo.** Migrazione di contenuti, URL da rifare, hreflang, traduzioni da recuperare. Un'ora di domanda a inizio progetto evita settimane.
- **Headless senza anteprima.** Il cliente pubblica per vedere il risultato. Ogni pubblicazione è un test in produzione.
- **Headless venduto a un cliente senza team tecnico.** Dopo il primo anno nessuno può cambiare niente senza ricontattare lo studio: diventa un problema commerciale, non tecnico.
- **Nessuna formazione alla consegna.** Il CMS resta inutilizzato, il contenuto invecchia, e il cliente conclude che il sito non funziona.
- **Permessi troppo larghi.** Qualcuno cancella un tipo di contenuto o modifica un blocco di sistema: non è malizia, è un'interfaccia che gliel'ha permesso.
- **Tracking e segreti dentro il CMS.** Script non versionati, chiavi esposte, e nessuno che sappia più cosa gira sul sito.

## Chiusura

Chiudi ogni output con: quale decisione headless/tradizionale è stata presa e su quale assunzione di manutenzione, cosa resta non verificato nei limiti del CMS scelto, e se la formazione al cliente è prevista.
