# Contributing

Thank you for helping improve the NHS Operational Intelligence Framework.

## Before opening a pull request

1. Do not include live NHS operational data, personal/confidential data or non-public infrastructure details.
2. Run `python tools/pre_publish_check.py .`.
3. Replace environment-specific values with placeholders.
4. Add or update synthetic test examples where behaviour changes.
5. Explain the operational problem, the proposed change and any safety implications.
6. Update `CHANGELOG.md` for material changes.

## Contribution principles

Contributions should improve reuse across organisations rather than encode one local operating model. Prefer:
- configuration over hard-coded names;
- explicit data contracts over implied schema;
- source provenance over unsupported narrative;
- safe failure over invented values;
- human review over autonomous operational action.

## Prompt changes

For changes to agent instructions, include:
- the failure mode being addressed;
- at least one synthetic test prompt;
- expected behaviour;
- any new source/permission requirement;
- any IG, clinical-safety or operational-risk consideration.

## Security issues

Do not open a public issue for a vulnerability, leaked secret or accidental disclosure. Follow `SECURITY.md`.
