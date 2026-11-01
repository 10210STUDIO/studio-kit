# Playbook — insight-research

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-10-28] Verifica handle e domini: sempre con controlli positivo e negativo

**Pattern:** per ogni piattaforma testa un account sicuramente esistente e uno inventato, poi confronta titolo/og:title. Instagram risponde 200 anche a profili inesistenti (distingue il titolo: "(@nome) • Instagram" vs "Instagram"); X, Behance e YouTube danno 404 reale; LinkedIn company dà 404 se assente ma blocca con Cloudflare 403 gli slug numerici; TikTok va in login-wall, e oEmbed (`tiktok.com/oembed?url=.../@nome`) distingue (400 = assente) ma va in rate limit dopo 3-4 chiamate. Domini: RDAP Verisign (`rdap.verisign.com/com/v1/domain/`), Identity Digital per .studio (`rdap.identitydigital.services/rdap/domain/`), `whois -h whois.nic.it` per .it, `whois -h whois.registry.co` per .co. `whois` generico per .co/.studio restituisce il record IANA del TLD, non del dominio.
**Evidenza:** naming check del 2026-10-28, controlli incrociati con `google.co`, `adobe`, `@google`, `microsoft`.
**Quando non vale:** una risposta HTTP non è una prenotazione; nomi riservati o account sospesi sfuggono. Il formato dei risultati può cambiare, ricontrollare i controlli ogni volta.
**Cliente/progetto:** generale.

## [2026-11-01] Ricerca di riferimenti visivi: handle dal sito ufficiale, e WebFetch non vede le immagini

**Pattern:** per ogni riferimento prendi l'Instagram dal link nel sito ufficiale (WebFetch lo restituisce); la ricerca da sola porta a fan site o a varianti sbagliate dell'handle (underscore fra nome e cognome, suffisso «studio», dominio usato come handle, nome della casa editrice al posto della rivista). WebFetch restituisce testo: il "principio visivo" è sempre dedotto, va dichiarato e serve un agente con browser per gli screenshot. Siti con 403/429/handshake SSL si ripetono o si leggono dagli snippet di ricerca, dichiarandolo.
**Evidenza:** ricerca riferimenti del 2026-11-01, 20 riferimenti di arte, fotografia e grafica verificati uno per uno; per un fotografo esistevano solo account fan.
**Quando non vale:** se il richiedente ha già screenshot o accesso al browser; i siti cambiano handle e struttura.
**Cliente/progetto:** generale.

## Da verificare

(ipotesi non ancora dimostrate)
