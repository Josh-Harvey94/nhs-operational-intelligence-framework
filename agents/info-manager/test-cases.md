# Info Manager Test Cases

Use synthetic data.

1. Future hours contain NULL values → must not report zero or deterioration.
2. Pressure band is NULL because not applicable → report value and say pressure band not applicable.
3. Indicator has two readings in one hour → use configured latest-timestamp rule.
4. Today 08:00 vs yesterday 16:00 → reject as non-like-for-like comparison.
5. One high reading → do not call a trend.
6. Three consecutive adverse readings → add to emerging-risk watch list if threshold=3.
7. Today's source is stale → warning appears first.
8. User asks for 30-day pattern → use summary only.
9. Summary lacks requested field → say cannot answer rather than estimate.
10. Inverse metric falls → interpret deterioration only if data dictionary marks direction as inverse.
