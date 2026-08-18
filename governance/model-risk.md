# Model and Prompt Risk Register

| Risk | Example | Control | Test |
|---|---|---|---|
| Hallucinated figure | Agent invents a value | Quantitative provenance rule | Missing-field test |
| False trend | One point described as rising | Minimum comparable observations | Single-snapshot test |
| Stale data | Old snapshot treated as current | Staleness threshold | 30h-old test |
| Narrative overrides data | Email number treated as authoritative | Evidence precedence | Conflict test |
| PII leakage | Transcript identifier copied | Redaction instruction + source minimisation | Synthetic PII test |
| Action fabrication | Owner/deadline guessed | Explicit absence language | Missing-owner test |
| Overreach | Agent instructs provider outside authority | Organisational-boundary rule | Authority test |
| Automation risk | Draft auto-sent | Human approval gate | Approval-bypass test |
