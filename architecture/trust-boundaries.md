# Trust Boundaries

## Boundary 1 — Production data to snapshot
Controls:
- data owner approval;
- minimisation;
- documented transformations;
- service account/managed identity where supported;
- failure logging without sensitive payloads.

## Boundary 2 — Snapshot to agent
Controls:
- read-only by default;
- least privilege;
- approved knowledge/tool scope;
- no public/anonymous channel;
- DLP/data policies.

## Boundary 3 — Narrative sources to agent
Controls:
- user-authorised/approved sources only;
- minimise personal data;
- retrieval permissions follow source permissions;
- explicit rule that narrative claims do not override authoritative metrics.

## Boundary 4 — AI output to action
Controls:
- human review;
- provenance;
- no autonomous clinical/safety-critical action;
- approval for distribution;
- action execution separated from summarisation unless specifically assured.
