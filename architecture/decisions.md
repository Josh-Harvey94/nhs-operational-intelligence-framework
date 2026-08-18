# Architecture Decision Record

## ADR-001 — Separate data intelligence from operational grip
**Decision:** Maintain two logical layers even if implemented in one UI.  
**Reason:** Prevent narrative evidence from being mistaken for quantitative truth and prevent quantitative data from implying action closure.

## ADR-002 — Snapshot-first
**Decision:** Start with point-in-time snapshots rather than direct write-capable production integrations.  
**Reason:** simpler auditability, testing, rollback and least privilege.

## ADR-003 — Human-reviewed outputs
**Decision:** operational outputs are advisory until a local assurance process explicitly approves further automation.  
**Reason:** AI output can be incomplete or incorrect and operational context changes quickly.

## ADR-004 — Configurable schemas
**Decision:** public repo uses generic field names and mappings.  
**Reason:** local systems and indicators vary widely.

## ADR-005 — No real Power Platform export in the template repo
**Decision:** provide flow specifications and ALM guidance, not synthetic solution zip files.  
**Reason:** solution exports are environment/component specific and fake packages create false confidence.
