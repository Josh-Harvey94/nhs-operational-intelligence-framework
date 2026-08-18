# Clinical Safety Triage

The framework is intended for operational intelligence, but local implementations can become safety-relevant depending on how outputs are used.

Ask:

1. Could an incorrect/missing output contribute to patient harm?
2. Is the agent used to prioritise or direct care?
3. Does it provide clinical decision support?
4. Does it trigger operational action affecting clinical capacity/pathways?
5. Could users over-trust it as a live system?
6. Is it integrated into a safety-critical workflow?

If any answer is yes or uncertain, involve the organisation's Clinical Safety Officer early.

Assess the applicability of:
- DCB0129 for development/manufacture of health IT;
- DCB0160 for deployment/use by a health or care organisation;
- DTAC and other local/national assurance requirements as applicable.

Controls commonly relevant:
- defined intended use;
- hazard log;
- provenance/staleness warnings;
- human review;
- safe failure;
- rollback;
- user training;
- monitoring of incorrect/missed outputs;
- change control for prompts/data mappings.
