# Flow 03 — Publish an Approved Brief

## Maturity
Optional. Implement after the analytical outputs are reliable and governance is agreed.

## Safer pattern

1. Agent creates a draft.
2. Human reviewer checks source timestamps, figures, redaction and actions.
3. Reviewer records approval.
4. Flow distributes to `[YOUR_DISTRIBUTION_LIST]` or approved Teams location.
5. Store minimal audit metadata: document ID, timestamp, reviewer and distribution target.

## Do not
- auto-send safety-critical instructions based solely on generative output;
- include patient-identifiable data;
- send to a broader audience than the source classification permits;
- use a personal mailbox as an undocumented service account.
