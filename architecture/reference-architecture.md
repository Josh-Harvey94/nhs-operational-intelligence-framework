# Reference Architecture

## Components

1. **Source systems** — local operational systems, analytics platforms or approved feeds.
2. **Snapshot preparation** — scheduled data extraction/transformation.
3. **Controlled data store** — SharePoint, Dataverse, SQL or another approved location.
4. **Info Manager Agent** — read-only analysis of structured data.
5. **Narrative evidence sources** — approved Microsoft 365 or document sources.
6. **System Grip Agent** — assurance/action synthesis.
7. **Human decision layer** — accountable operational staff.
8. **Distribution/automation** — optional, gated after review.

## Trust boundaries

- External/source systems → ingestion
- Ingestion → controlled operational store
- Operational store → agent knowledge/tool boundary
- Narrative sources → agent retrieval boundary
- Agent output → human operational decision
- Human-approved output → distribution/escalation

## Preferred maturity path

**M0:** synthetic prototype  
**M1:** read-only historical/snapshot data  
**M2:** current operational snapshots with human review  
**M3:** narrative retrieval and action tracking  
**M4:** governed distribution  
**M5:** limited tool/action execution with explicit approvals, only where justified

Do not skip directly to autonomous actions.
