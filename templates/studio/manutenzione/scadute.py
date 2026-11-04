#!/usr/bin/env python3
# Elenca le voci di playbook e i benchmark più vecchi di N giorni (default 90), da far riverificare.
# Uso: python3 scadute.py [giorni]      Test: python3 scadute.py --test
import datetime as dt, pathlib, re, sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
VOCE = re.compile(r"^##\s*\[(\d{4}-\d{2}-\d{2})\]\s*(.+)$")

def scadute(testo, oggi, giorni):
    for riga in testo.splitlines():
        m = VOCE.match(riga)
        if m and (oggi - dt.date.fromisoformat(m.group(1))).days > giorni:
            yield m.group(1), m.group(2).strip()

if "--test" in sys.argv:
    t = "## [2026-11-04] Vecchia\n## [2027-02-20] Nuova\n## Senza data"
    assert list(scadute(t, dt.date(2027, 3, 1), 90)) == [("2026-11-04", "Vecchia")]
    sys.exit(print("test ok"))

giorni = int(sys.argv[1]) if len(sys.argv) > 1 else 90
oggi = dt.date.today()
out = [f"- playbook {p.stem}: [{d}] {t}"
       for p in sorted((ROOT / "playbooks").glob("*.md"))
       for d, t in scadute(p.read_text(), oggi, giorni)]
for p in sorted((ROOT / "benchmarks").glob("*.md")):
    m = re.search(r"(\d{4})-(\d{2})\.md$", p.name)
    if m and (oggi - dt.date(int(m.group(1)), int(m.group(2)), 1)).days > giorni:
        out.append(f"- benchmark {p.name}: più vecchio di {giorni} giorni")
print("\n".join(out) or "(nessuna voce scaduta)")
