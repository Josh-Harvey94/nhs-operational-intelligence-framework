# Security Policy

## Public repository rule

Assume everything committed here can be read, copied and indexed publicly.

### Never commit

- patient-identifiable or patient-level data;
- NHS numbers, dates of birth, addresses or unredacted free text containing patient details;
- live operational data or pressure positions;
- private SharePoint/Teams/OneDrive URLs;
- internal email addresses or distribution lists;
- tenant IDs, environment IDs, app/client IDs where non-public;
- client secrets, API keys, tokens, certificates or passwords;
- SQL connection strings or database credentials;
- private server/database names;
- production flow exports containing sensitive metadata;
- unredacted meeting transcripts, chats or emails;
- sensitive escalation routes, on-call contact trees or resilience vulnerabilities;
- screenshots showing confidential information, usernames, tenant details or browser history;
- logs containing tokens, request headers or personal data;
- local configuration files.

Use placeholders such as:
`[YOUR_SHAREPOINT_SITE_URL]`, `[YOUR_SQL_SERVER]`, `[YOUR_DATABASE]`,
`[YOUR_DOCUMENT_LIBRARY]`, `[YOUR_DISTRIBUTION_LIST]`,
`[YOUR_ORGANISATION_NAME]`, `[YOUR_OPERATIONAL_DATA_SOURCE]`.

## Before publishing a fork

1. Run `python tools/pre_publish_check.py .`.
2. Search git history, not only the working tree.
3. Inspect screenshots manually and remove metadata.
4. Review solution/flow exports before committing.
5. Confirm sample data is synthetic.
6. Enable repository secret scanning/push protection where available.
7. Use a two-person public-release review for NHS/public-sector deployments.

## If sensitive information is committed

Treat it as disclosed. Removing the latest file is not enough because Git history may retain it.

- Revoke/rotate affected credentials immediately.
- Follow local cyber-security and information-governance incident processes.
- Remove the sensitive content from Git history using an approved method.
- Assess whether notification/escalation is required.
- Do not post the sensitive value in a public GitHub issue.

## Vulnerability reporting

If this repository is hosted by an organisation, replace this section with that organisation's approved private vulnerability-reporting route before public release.

Until then, do not submit secrets or sensitive NHS information through a public issue.
