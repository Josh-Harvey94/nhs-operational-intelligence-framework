#!/usr/bin/env python3
"""
Lightweight public-release scanner.
It is intentionally conservative and does not replace secret scanning,
manual review or information-governance checks.
"""
from pathlib import Path
import re
import sys

root = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()

skip_dirs = {".git", "__pycache__", ".venv", "venv"}
allowed_domains = {
    "learn.microsoft.com",
    "transform.england.nhs.uk",
    "www.england.nhs.uk",
    "ico.org.uk",
    "www.gov.uk",
    "www.apache.org",
}
placeholder_tokens = {
    "[YOUR_SHAREPOINT_SITE_URL]",
    "[YOUR_SQL_SERVER]",
    "[YOUR_DATABASE]",
    "[YOUR_DOCUMENT_LIBRARY]",
    "[YOUR_DISTRIBUTION_LIST]",
    "[YOUR_ORGANISATION_NAME]",
    "[YOUR_OPERATIONAL_DATA_SOURCE]",
}

patterns = {
    "email address": re.compile(r"\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b", re.I),
    "possible secret assignment": re.compile(
        r"(?i)\b(password|passwd|client_secret|api[_-]?key|access[_-]?token)\b\s*[:=]\s*[\"']?[^ \n\"']{6,}"
    ),
    "possible SQL connection string": re.compile(
        r"(?i)\b(Server|Data Source)\s*=\s*[^;\n]+;.*\b(Database|Initial Catalog|User Id|UID|Password|PWD)\s*=",
        re.S
    ),
    "GUID / tenant-like identifier": re.compile(
        r"\b[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}\b"
    ),
}

url_re = re.compile(r"https?://([A-Za-z0-9.-]+)(?::\d+)?(?:/[^\s)\]>'\"]*)?")

findings = []

for path in root.rglob("*"):
    if not path.is_file() or any(p in skip_dirs for p in path.parts):
        continue
    if path.suffix.lower() in {".png", ".jpg", ".jpeg", ".gif", ".pdf", ".zip", ".docx", ".pptx", ".xlsx"}:
        continue
    try:
        text = path.read_text(encoding="utf-8")
    except Exception:
        continue

    rel = path.relative_to(root)

    for label, pattern in patterns.items():
        for m in pattern.finditer(text):
            value = m.group(0)
            if any(ph in value for ph in placeholder_tokens):
                continue
            # Allow documentation examples that literally name variable keys without values.
            findings.append((str(rel), label, value[:120].replace("\n", " ")))

    for m in url_re.finditer(text):
        host = m.group(1).lower()
        if host not in allowed_domains:
            findings.append((str(rel), "non-allowlisted URL", m.group(0)[:160]))

# De-duplicate
seen = set()
unique = []
for f in findings:
    if f not in seen:
        seen.add(f)
        unique.append(f)

if unique:
    print("Potential public-release findings:")
    for rel, label, value in unique:
        print(f"- {rel}: {label}: {value}")
    print("\nReview manually. Do not assume a clean scan means content is safe.")
    sys.exit(1)

print("No configured patterns detected.")
print("Manual review and platform secret scanning are still required.")
