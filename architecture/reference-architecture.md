# Reference Architecture

## Five-stage processing model

### 1. Extract
Approved operational source systems are queried or exported using a controlled process.

### 2. Normalise
Deterministic logic creates predictable data products:
- live/current-day raw snapshot;
- previous/dated daily snapshots;
- long-horizon daily summary;
- optional indicator dictionary and quality metadata.

### 3. Interpret
The Info Manager Agent applies the data contract to identify:
- current position;
- intraday movement;
- like-for-like change;
- historical context;
- emerging risk;
- signal versus ordinary variation.

### 4. Assure
The System Grip Agent combines the quantitative position with approved narrative evidence to identify:
- risks;
- actions;
- owners/deadlines;
- unresolved issues;
- source discrepancies;
- grip gaps.

### 5. Present
Outputs are shaped for human operational use:
- Start-of-Play brief;
- handover;
- meeting preparation;
- action/assurance log;
- executive brief.

## Components

1. **Source systems** — local operational systems, analytics platforms or approved feeds.
2. **Extraction layer** — SQL/API/export mechanism.
3. **Normalisation layer** — deterministic transformation and quality logic.
4. **Controlled data store** — SharePoint, Dataverse, SQL or another approved location.
5. **Info Manager Agent** — read-only interpretation of structured data.
6. **Narrative evidence sources** — approved Microsoft 365 or document sources.
7. **System Grip Agent** — assurance/action synthesis.
8. **Presentation layer** — approved human-readable output.
9. **Human decision layer** — accountable operational staff.
10. **Distribution/automation** — optional, gated after review.

## Trust boundaries

- Source systems → extraction
- Extraction → normalisation
- Normalisation → controlled operational store
- Operational store → agent knowledge/tool boundary
- Narrative sources → agent retrieval boundary
- Agent output → presentation layer
- Presentation layer → human operational decision
- Human-approved output → distribution/escalation

## Preferred maturity path

**M0:** synthetic prototype  
**M1:** read-only historical/snapshot data  
**M2:** current operational snapshots with human review  
**M3:** narrative retrieval and action tracking  
**M4:** governed presentation/distribution  
**M5:** limited tool/action execution with explicit approvals, only where justified

Do not skip directly to autonomous actions.
