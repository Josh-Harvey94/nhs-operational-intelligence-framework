# Access Control and DLP

## Principles

- authenticated access only;
- least privilege;
- no anonymous/public agent channel for operational data;
- separate maker/admin/user roles;
- source-system permissions remain authoritative;
- dedicated service connections where locally approved;
- environment separation;
- DLP/data policies reviewed before production;
- connector inventory maintained.

## Access matrix template

| Role | Structured snapshots | Narrative sources | Edit agent | Run flows | Approve distribution |
|---|---|---|---|---|---|
| Operational user | Read | Approved scope | No | No | Optional |
| Agent maker | Test/synthetic | Test | Yes | Dev only | No |
| Platform admin | Admin as needed | No routine access | Admin | Admin | No |
| Operational approver | Read | Approved scope | No | No | Yes |

Adapt locally.
