# Playbook — media-planner

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-11-04] ROAS di piattaforma: la direzione dell'errore cambia, non si presume

**Pattern:** non applicare un fattore di correzione fisso al ROAS di piattaforma. O si misura sul cliente con un test di incrementalità, o entra nel forecast come scenario con intervallo.
**Evidenza:** [P] Haus, "The Meta Report", 640 test Meta dal 2024 (haus.io, 2025-07-28, verificato 2026-11-04): la finestra 7 giorni click sottostimava l'incrementalità del 15% in media, Advantage+ sovrastimava di 12 punti rispetto al manuale. In cima alla pagina Haus segnala una rianalisi di luglio 2026 che ribalta parte dei risultati del 2025. [P] Haus, 2026-07-16 (letto 2026-11-04): Incremental Attribution di Meta contro attribuzione standard, media geometrica 0,80x (lug 2024-giu 2025, vinceva lo standard) e 1,26x (lug 2025-giu 2026, vince IA); solo DTC 1,38x, omnicanale 1,02x ("essentially at parity"). Haus: "with a modest number of tests we treat the direction of the signal as more reliable than any single decimal". Lo stesso studio ha cambiato segno in un anno.
**Quando non vale:** i numeri non sono trasferibili. Inserzionisti con spesa media Meta di 14 milioni di dollari l'anno, in gran parte USA e DTC; il campione 2026 è piccolo e sbilanciato verso i DTC. Usali come prova che la direzione cambia, mai come fattore di correzione per un cliente italiano.
**Cliente/progetto:** generale

## [2026-11-04] Google Search: AI Max cambia il tetto e il tipo di campagna

**Pattern:** il tetto di Search si stima in due livelli: le keyword, e le query in più dell'espansione (AI Max, Performance Max), che si misurano solo con un esperimento. Prima di mettere DSA, broad match a livello di campagna o asset creati in automatico in un piano, controlla se l'account li ha già migrati.
**Evidenza:** [P] blog.google, "dsa-upgrade-to-ai-max-2026" (2026-04-15, aggiornato 2026-06-11, verificato 2026-11-04): AI Max esce dalla beta; dal settembre 2026 le campagne con automatically created assets e broad match a livello di campagna passano ad AI Max in automatico; le DSA passano da febbraio 2027. Il "+7% di conversioni o valore a CPA/ROAS simile" è un dato di Google, senza verifica esterna.
**Quando non vale:** la fonte dice cosa è pianificato, non se l'upgrade è già avvenuto nell'account del cliente. Il +7% non entra in un forecast se non come scenario alto dichiarato come dato del fornitore.
**Cliente/progetto:** generale

## [2026-11-04] Google Display va dentro Demand Gen

**Pattern:** nel piano il Display di Google si pensa come parte di Demand Gen, non come campagna a sé.
**Evidenza:** [P] blog.google, "google-display-ads-demand-gen" (2026-05-26, verificato 2026-11-04): "Google Display Ads has a new home in Demand Gen", con strumento di migrazione e passaggio "expected to complete by 2027". Dentro Demand Gen si può ancora servire solo sulla Display Network.
**Quando non vale:** non è verificato che le nuove campagne Display standalone non si possano più creare (Help 17051545 non letto). Fino al 2027 un account può avere ancora Display standalone attive.
**Cliente/progetto:** generale

## [2026-11-04] Meta: cosa vuol dire Advantage+ oggi, e le legacy ASC/AAC

**Pattern:** una campagna Meta è Advantage+ solo se budget di campagna, audience e placement sono tutti e tre Advantage+. Un piano non si appoggia a ASC/AAC legacy: vanno migrate, e la migrazione riavvia l'apprendimento (da mettere nei tempi del piano).
**Evidenza:** [P] Meta for Developers, "Advantage campaigns" (pagina senza data, verificata 2026-11-04): tre leve tutte ENABLED; da v24.0 non si creano ASC con AUTOMATED_SHOPPING_ADS, da v26.0 le legacy ASC/AAC non si modificano.
**Quando non vale:** la data di rilascio di v24.0 (ottobre 2025) e la regola "più di 50 ad per ad set non si migra" vengono solo da fonti secondarie.
**Cliente/progetto:** generale

## [2026-11-04] Meta: soglia di apprendimento per dimensionare le celle

**Pattern:** una cella Meta (ad set) regge se il budget porta circa 50 risultati nella settimana dopo l'ultima modifica significativa. Sotto, la cella resta in apprendimento e il test non si legge.
**Evidenza:** [P] Meta Business Help, "About the learning phase" (pagina 112167992830700, verificata 2026-11-04): "about 50 results in the week after the ad set's last significant edit". Per le Shops ads: almeno 17 acquisti sul sito e 5 su Meta.
**Quando non vale:** "budget minimo = costo per risultato × 50" è una regola di terzi, non di Meta: usala solo come stima dichiarata. La soglia vale per ad set, non per campagna.
**Cliente/progetto:** generale

## [2026-11-04] Storico Meta e LinkedIn: le definizioni sono cambiate nel 2026

**Pattern:** prima di usare lo storico del cliente per un forecast, controlla se la finestra o la definizione della metrica è cambiata nel periodo. Se sì, non confrontare prima e dopo, o separa i periodi.
**Evidenza:** [P] Meta for Developers (2025-10-16): dal 2026-01-12 l'Insights API non restituisce più 7d_view e 28d_view. [P] Meta for Business, "click-attribution" (2026-03-03): da marzo 2026 il click-through conta solo i clic sul link; salva e condividi passano a "engage-through"; la soglia di visione video scende da 10 a 5 secondi. [P] LinkedIn Marketing API, recent changes 202609: finestra di attribuzione a 180 giorni in aggiunta a quella a 365 (il massimo resta 365), anche per lead qualificati, MQL e SQL. Tutto verificato 2026-11-04.
**Quando non vale:** il passaggio Meta di marzo 2026 non è partito per tutti nello stesso giorno: la data esatta di rottura va letta nell'account.
**Cliente/progetto:** generale

## [2026-11-04] UE: consenso e annunci meno personalizzati nel forecast

**Pattern:** nei forecast UE la quota di utenti senza consenso e, su Meta, quella con annunci meno personalizzati è una variabile di scenario. Non esiste una quota pubblica: si parte dal tasso di consenso del cliente, o si dichiara un intervallo.
**Evidenza:** [P] Commissione europea, DMA (2025-12-08, letto 2026-11-04): Meta offre agli utenti UE la scelta fra dati completi con annunci personalizzati e "less personal data for an experience with more limited personalised advertising", da gennaio 2026; la Commissione raccoglierà dati su impatto e adozione. [P] Google Tag Platform, Consent Mode (verificato 2026-11-04): in Basic i tag non inviano nulla prima della scelta e la modellazione usa un modello generale; in Advanced, con consenso negato, si inviano misure senza cookie e il modello è specifico dell'inserzionista. Per il forecast: Basic o Advanced cambia quante conversioni vede la piattaforma.
**Quando non vale:** non dice di quanto calano le performance: quel dato oggi non è pubblico. Le soglie di modellazione si leggono nella Diagnostica dell'account, non si scrivono a memoria.
**Cliente/progetto:** generale

## Da verificare

(ipotesi non ancora dimostrate)
