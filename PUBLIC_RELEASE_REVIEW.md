# Public Release Review

Generated: 2026-08-18

## Automated scan result

Exit code: `0`

```text
No configured patterns detected.
Manual review and platform secret scanning are still required.
Spreadsheet runtime warmup failed during python startup
Traceback (most recent call last):
  File "/tmp/tmp.L2TH2Y5coc/artifact_tool_v2-2.8.22/artifact_tool/patches/warm_spreadsheet_runtime_on_startup.py", line 26, in warm_spreadsheet_runtime_on_startup
  File "/tmp/tmp.L2TH2Y5coc/artifact_tool_v2-2.8.22/artifact_tool/spreadsheet_warmup.py", line 785, in warm_spreadsheet_runtime
  File "/tmp/tmp.L2TH2Y5coc/artifact_tool_v2-2.8.22/artifact_tool/spreadsheet_warmup.py", line 720, in _warm_feature_flows
  File "/tmp/tmp.L2TH2Y5coc/artifact_tool_v2-2.8.22/artifact_tool/spreadsheet_warmup.py", line 704, in _warm_collaboration_flows
  File "/tmp/tmp.L2TH2Y5coc/artifact_tool_v2-2.8.22/artifact_tool/generated/interface/models.py", line 32317, in hydrate_crdt_from_proto
  File "/tmp/tmp.L2TH2Y5coc/artifact_tool_v2-2.8.22/artifact_tool/rpc/remote.py", line 749, in __call__
  File "/tmp/tmp.L2TH2Y5coc/artifact_tool_v2-2.8.22/artifact_tool/rpc/client.py", line 150, in call
artifact_tool.rpc.client.RemoteError: hydrateCrdtFromProto requires an empty collaborative document.
```

The scanner is intentionally conservative. Findings must be manually reviewed.
This repository was generated using placeholders and wholly synthetic examples; no production NHS data or private deployment configuration is intentionally included.

## Required human checks before publication

- inspect every URL and email address;
- inspect Git history;
- inspect screenshots and metadata;
- inspect any Power Platform export added later;
- confirm sample data is synthetic;
- confirm organisation approval to publish;
- confirm licence/copyright position for contributions;
- perform security/IG review appropriate to the hosting organisation.
