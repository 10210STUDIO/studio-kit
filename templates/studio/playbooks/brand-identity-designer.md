# Playbook — brand-identity-designer

Memoria professionale. Pattern verificati, non cronache.
Protocollo in ../STUDIO.md. Potare sopra le 150 righe.

## Pattern consolidati

- **Glifi con contropunzoni: costruirli per sottrazione booleana** (contorno esterno meno aperture), non per unione di anelli coincidenti. L'unione lascia spigoli e punte dove i contorni si toccano. (verificato su un glifo di un marchio, 2026-10)
- **Favicon sotto i 48 px: griglie pixel disegnate a 16/24/32**, non il vettore scalato. Aste più spesse, barra almeno 2 px. Il 48 e l'apple-touch vengono dal master. Un assert nel build verifica le misure dentro il .ico. (2026-10)
- **Read comprime le immagini.** Prima di giudicare sfaccettature o curve rotte, ritaglia e ingrandisci la zona con PIL. Spesso il difetto è solo compressione. (2026-10)
- **Brand book 16:9 leggibile da esterni: HTML generato da script e render Playwright**, con un controllo automatico prima dei PNG/PDF: testo sotto i 22 px, etichette maiuscole sotto i 14 px, elementi oltre i margini della pagina. I mockup (post, homepage, deck) si disegnano a misura reale e si scalano con CSS `zoom` dentro un contenitore `.mock`: il loro contenuto è escluso dal controllo dei corpi, il contenitore no. (2026-10)
- **Mockup bianchi su pagina bianca: sempre un filetto attorno**, altrimenti si leggono come parte della pagina e il logotipo sembra ripetuto. (2026-10)
- **Segnaposto foto con id e misura in px nel riquadro**, più un dizionario id → file e un elenco generato (`foto_segnaposto.md`). Così le foto si sostituiscono senza toccare l'impaginazione. Confronta le proporzioni dei riquadri con la shot list prima dello shooting. (2026-10)
- **Usi scorretti: i marcatori "No" sono neri, mai rossi**, e le regole che vietano una figura (per esempio una parola con una lettera evidenziata) si scrivono senza disegnarle. Disegnarle diffonde proprio la figura vietata. (2026-10)
- **Foto AI nei mockup: etichetta "Esempio di stile · immagine AI" su ogni mockup, a corpo di lettura**, mai solo una dichiarazione generale in piccolo. Un mockup con foto AI non porta righe "Case / Objective / Result": anche vuote, fanno leggere la foto come un caso reale. (QA, 2026-10)
- **Etichette dati: niente monospaziato maiuscolo spaziato.** Il cliente lo legge come "font da AI". Le etichette si fanno con il carattere principale: larghezza normale, peso un gradino sopra il testo, maiuscolo +6%, cifre tabellari. Prima di ricalibrare il corpo, misura cap height e larghezza con fontTools: in un caso il grotesk principale e il mono avevano cap height quasi uguale (0,686 contro 0,698 em), quindi il corpo restava a 14 px. Cambiava solo la larghezza (−22% sulla stessa riga). (2026-11)

## Da verificare

(ipotesi non ancora dimostrate)
