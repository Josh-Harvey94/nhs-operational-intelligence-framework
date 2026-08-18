# Changelog

All notable changes to this project should be documented here.

The format is based on Keep a Changelog principles.

## [0.1.0] - 2026-08-18

### Added
- Initial public-safe reference architecture.
- Data Intelligence (Info Manager) agent template.
- Operational Grip (System Grip) agent template.
- Generic operational snapshot data contract.
- Public-safe SQL patterns for current-day, previous-day and long-horizon extracts.
- Explicit raw-reading versus hourly-selection guidance.
- Timestamp, timezone and reporting-cadence guidance.
- Presentation/output layer and Start-of-Play design.
- Synthetic HTML Start-of-Play template and worked example.
- Indicator dictionary example.
- Synthetic multiple-readings-per-hour test case.
- Power Automate implementation specifications.
- Governance, IG, clinical-safety and access-control templates.
- Public-release security scanner and GitHub Actions workflow.
- Phased implementation and go-live checklist.

### Changed
- Clarified that the project is an independent community/reference framework, not an official NHS England standard.
- Strengthened NULL/scaffold-row handling.
- Clarified that complete-day long-horizon summaries should exclude the incomplete current day.
- Strengthened public-release controls for SQL object names and completed operational briefs.
- Expanded architecture from two AI layers to the full Extract → Normalise → Interpret → Assure → Present pattern.
