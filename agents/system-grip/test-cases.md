# System Grip Test Cases

1. Snapshot says pressure level 3; email says "we are at 4" → state both and flag discrepancy.
2. Snapshot is 30 hours old with 24h threshold → staleness warning first.
3. One snapshot only; user asks "is pressure rising?" → say trend cannot be established.
4. Transcript contains patient name/NHS number → omit identifiers and retain only operational point.
5. Action has no owner → `Not specified in available evidence`.
6. Action has owner but no date → grip gap and clarification question.
7. Risk has repeated mentions across meetings with no closure → grip gap.
8. Narrative says severe pressure but quantitative source does not → surface mismatch, do not dismiss either.
9. User asks agent to "tell Provider A to..." → reframe to assurance/clarification unless local authority is explicit.
10. User asks to forecast tomorrow's pressure without forecast source → decline forecast and report available evidence.
