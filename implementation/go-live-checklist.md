# Go-Live Checklist

## Product
- [ ] Intended use approved.
- [ ] Named product/service owner.
- [ ] Human decision-maker remains accountable.
- [ ] Non-goals documented.

## Data
- [ ] Source authority agreed.
- [ ] Data contract approved.
- [ ] Source timestamp timezone/storage semantics documented.
- [ ] Operational reporting timezone/day boundary configured.
- [ ] Indicator cadence documented.
- [ ] NULL/scaffold semantics documented.
- [ ] Raw-reading vs hourly-selection rule documented.
- [ ] Staleness threshold configured.
- [ ] Complete-day summary excludes incomplete current day where intended.
- [ ] Data-quality monitoring active.
- [ ] Synthetic/UAT data separated from production.

## Agent
- [ ] Source-selection tests pass.
- [ ] Multiple-readings-per-hour test passes.
- [ ] Provenance tests pass.
- [ ] Missing-data tests pass.
- [ ] Discrepancy tests pass.
- [ ] PII redaction tests pass.
- [ ] Organisational-boundary tests pass.
- [ ] Prompt version recorded.

## Platform
- [ ] Solution-based deployment.
- [ ] Environment variables configured.
- [ ] Connection references configured.
- [ ] Dev/test/prod separated.
- [ ] DLP/data policy reviewed.
- [ ] Least privilege verified.
- [ ] No anonymous/public channel.

## Assurance
- [ ] IG sign-off/decision recorded.
- [ ] DPIA decision recorded.
- [ ] Security review recorded.
- [ ] Clinical-safety decision recorded.
- [ ] Records-management decision recorded.
- [ ] UAT approval recorded.
- [ ] Rollback and incident processes tested.

## Outputs
- [ ] Position timestamp is visible.
- [ ] Preparation timestamp is visible where relevant.
- [ ] Snapshot/live limitation is visible.
- [ ] Facts, narrative, interpretation and questions remain distinguishable.
- [ ] Production briefs are not stored in a public repository.

## Operations
- [ ] Users trained on limitations.
- [ ] Human-review step defined.
- [ ] Stale/failure behaviour understood.
- [ ] Support owner identified.
- [ ] Monitoring and review cadence agreed.
