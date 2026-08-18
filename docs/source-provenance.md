# Source Provenance and Evidence Precedence

## Evidence classes

### Quantitative authority
The approved operational snapshot/data product is authoritative for quantitative operational figures within its stated timestamp and scope.

### Narrative evidence
Approved email, collaboration messages, meeting notes, transcripts and documents may evidence:
- what someone reported;
- what was agreed;
- risks described;
- actions/owners/deadlines;
- expected future position.

Narrative evidence should not silently become the authoritative quantitative position.

## When sources disagree

Report:
1. what the quantitative source says and its timestamp;
2. what the narrative source says and its timestamp/source type;
3. the discrepancy;
4. the clarification required.

Do not silently choose the more convenient source.

## Staleness

Configure a local staleness threshold. If the latest authoritative snapshot exceeds it, put the warning before the analysis.

## Fact vs interpretation

Use explicit language patterns:

- **Quantitative fact:** "Per the operational snapshot dated [DATE/TIME]..."
- **Narrative fact:** "The meeting note records..." / "The email states..."
- **Interpretation:** "This may indicate..." / "This appears unresolved..."
- **Absence:** "No owner/deadline was identified in the available evidence."

The agent must not convert absence into an invented fact.
