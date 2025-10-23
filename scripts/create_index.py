#!/usr/bin/env python3
# Creates _site/index.html with meta data from all .ly-Dateien

from pathlib import Path
import re
import html

RE_HEADER = re.compile(r'\\header\s*{(.*?)}', re.DOTALL)
RE_KEY = re.compile(r'(\w+)\s*=\s*(?:"([^"]*)"|##f)', re.MULTILINE)
RE_VERSION = re.compile(r'\\version\s*"([^"]+)"')

RELEVANT_KEYS = ("title", "subtitle", "composer", "poet", "dedication", "tagline")

def parse_file(p: Path):
    text = p.read_text(encoding="utf-8", errors="ignore")
    data = {"file": str(p.relative_to(ROOT)), "path": str(p)}
    m = RE_HEADER.search(text)
    if m:
        block = m.group(1)
        for k, v in RE_KEY.findall(block):
            if k in RELEVANT_KEYS:
                data[k] = v
    # fallback: try to find title/composer anywhere
    if "title" not in data:
        m2 = re.search(r'title\s*=\s*"([^"]+)"', text)
        if m2:
            data["title"] = m2.group(1)
    if "composer" not in data:
        m2 = re.search(r'composer\s*=\s*"([^"]+)"', text)
        if m2:
            data["composer"] = m2.group(1)
    mver = RE_VERSION.search(text)
    if mver:
        data["version"] = mver.group(1)
    data["pdf"] = str(pdf_name_for(p).relative_to(ROOT))
    return data

def pdf_name_for(ly_path: Path) -> Path:
    """
    Returns path for created PDF file.
    Example: songs/foo.ly -> songs/foo.pdf
    """
    return ly_path.with_suffix('.pdf')

def rows_from_repo(root: Path):
    items = []
    for p in sorted(root.rglob("*.ly")):
        # skip hidden dirs if any
        if any(part.startswith(".") for part in p.parts):
            # allow files under .github if desired; keep them too
            pass
        items.append(parse_file(p))
    return items

def make_html(rows):
    head = """<!doctype html>
<html lang="de">
<head>
<meta charset="utf-8">
<title>Musikkompositionen von Jan Martin Reckel</title>
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css"
>
</head>
<body class="container">
<header>
<h1>Index of all Music Compositions</h1>
</header>
<main>
<p>This index lists all music compositions and contributions from Jan Martin Reckel with meta data extracted from the source files. It is automatically generated from the <a href="https://github.com/reckel-jm/music-compositions">Github repository</a>.</p>
<table>
<thead><tr><th>Title</th><th>Subtitle</th><th>Composer / Poet</th><th>Dedication</th><th>Version</th><th>File</th><th>PDF</th></tr></thead><tbody>
"""
    body = ""
    for r in rows:
        title = html.escape(r.get("title",""))
        subtitle = html.escape(r.get("subtitle",""))
        composer = html.escape(r.get("composer","") or r.get("poet",""))
        dedication = html.escape(r.get("dedication",""))
        version = html.escape(r.get("version",""))
        filepath = html.escape(r["file"])
        pdfpath = html.escape(r.get("pdf",""))
        pdf_link = f'<a href="{pdfpath}">{Path(pdfpath).name}</a>' if pdfpath else ""
        body += f"<tr><td>{title}</td><td>{subtitle}</td><td>{composer}</td><td>{dedication}</td><td>{version}</td><td><a href=\"{filepath}\">{filepath}</a></td><td>{pdf_link}</td></tr>\n"
    foot = """
</tbody></table></main>
<footer>
<h3>Licensing</h3>
<p>Unless explicitely noted otherwise inside the Lilypond/PDF documents, all compositions are licensed under the <a href="https://creativecommons.org/publicdomain/zero/1.0/ ">CC0 1.0 Universal</a> license which basically publishes all publications as public domain. If the license is not applicable in your region or legal context, you could also use the <a href="https://opensource.org/license/mit">MIT license</a>.</p>
</footer>
</body></html>\n
"""
    return head + body + foot

if __name__ == "__main__":
    ROOT = Path(__file__).resolve().parents[1]
    OUT_DIR = ROOT / "_site"
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    rows = rows_from_repo(ROOT)
    html_text = make_html(rows)
    out = OUT_DIR / "index.html"
    out.write_text(html_text, encoding="utf-8")
    print(f"Wrote {out}")