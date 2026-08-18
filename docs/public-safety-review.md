# Public-Safety Review of the Source Agent Designs

The original agent designs were created for a local NHS System Coordination Centre environment. This public framework preserves their reusable reasoning patterns while removing implementation-specific material.

## Generalised or removed

| Source category | Public treatment |
|---|---|
| Organisation/place names | Replaced with organisation-neutral terminology |
| Private SharePoint locations | Removed; replaced with `[YOUR_SHAREPOINT_SITE_URL]` |
| Local document-library names | Replaced with `[YOUR_DOCUMENT_LIBRARY]` |
| Local operational-system naming where implementation-specific | Generalised to `[YOUR_OPERATIONAL_DATA_SOURCE]` or "operational snapshot" |
| Local meeting time/cadence | Replaced with configurable meeting/brief cadence |
| Provider-specific examples | Replaced with synthetic `Provider A/B` examples |
| Internal escalation routes | Not published; local-only configuration |
| Production data | Not included |
| Email/transcript content | Only synthetic examples |
| Environment IDs/tenant values/connections | Placeholders only |

## Reusable behaviours retained

- structured source-selection rules;
- distinct semantics for different kinds of missing/NULL data;
- like-for-like intraday/day-on-day comparison;
- seasonality and signal/noise judgement;
- evidence provenance;
- staleness warnings;
- no interpolation or fabricated figures;
- authoritative quantitative vs narrative-source separation;
- discrepancy surfacing;
- grip-gap identification;
- action ownership/deadline checks;
- concise operational brief structure;
- professional, non-blaming system language;
- provider/commissioner responsibility boundaries;
- no patient-identifiable information in generated outputs.

## Local-only implementation note

Each deployment should maintain a **private** configuration record outside the public repository containing:
- actual source URLs;
- actual environment IDs;
- approved connectors;
- local data dictionary;
- source owners;
- access groups;
- meeting/distribution routes;
- incident/escalation contacts;
- retention rules;
- assurance approvals.

Use `implementation/local-config.example.yml` as a schema only.
