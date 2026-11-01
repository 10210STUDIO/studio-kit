# Playbook — security-engineer

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

## [2026-10-31] PHP: FILTER_VALIDATE_EMAIL non protegge le intestazioni della mail

**Pattern:** quando un indirizzo del visitatore finisce in un header di `mail()` (Reply-To, From, Cc), `filter_var(..., FILTER_VALIDATE_EMAIL)` non basta. Il "quoted-pair" (`"\` + qualsiasi carattere ASCII, a capo compreso) passa, e il controllo `php_mail_detect_multiple_crlf` lascia passare un `\n` singolo. Chiedere sempre un rifiuto esplicito: `preg_match('/[^\x21-\x7E]|["\\\\]/', $email)`. Segnale: un commento nel codice che dice «filter_var rifiuta a capo».
**Evidenza:** regex `regexp1` di php-src PHP-8.3 (`ext/filter/logical_filters.c`) eseguita in Perl: accetta `"\<LF>Bcc:x@e.test,a"@example.com`. Il porting di `mail.c:374` non rifiuta l'header. Così l'iniezione arriva al server di posta senza toccare il sito vivo. Trovato sul form di contatto PHP di un sito statico.
**Quando non vale:** header costruiti come array (PHP ≥7.2 valida i valori), PHPMailer/Symfony Mailer con API per indirizzi. L'invio della copia `Bcc` dipende da `sendmail -t` sul server: da dichiarare needs_validation.
**Cliente/progetto:** generale.

## [2026-10-31] Sito statico: la superficie è lo script lato server, e npm audit va letto avviso per avviso

**Pattern:** su un sito generato in anticipo (Astro, Next export, Hugo), dedicare il tempo all'unico script che gira sul server (form PHP, funzione serverless). Gli avvisi critici del framework vanno letti uno per uno: XSS e bypass sono quasi sempre solo per il rendering a richiesta (SSR), e la RCE delle immagini riguarda la build con input non fidato. Prima di tutto, confrontare l'hash di 2–3 pagine vive con `dist/` per sapere che si sta controllando proprio la build pubblicata.
**Evidenza:** un sito Astro: npm audit con 1 critico e 1 alto su astro 6.4.8, nessuno raggiungibile in produzione. Il rilievo vero era nel form PHP. Gli hash delle pagine live e di `dist/` coincidevano.
**Quando non vale:** se ci sono rotte SSR o un adapter (`output: 'server'/'hybrid'`), oppure se la build elabora file caricati da terzi o da un CMS aperto.
**Cliente/progetto:** generale.

## Da verificare

(ipotesi non ancora dimostrate)
