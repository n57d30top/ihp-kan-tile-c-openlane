# Submission Checkpoint

- date: `2026-03-29`
- scope: `IHP/OpenMPW submission bundle preparation`
- repo branch: `codex/public-release`

## Included Deliverables

- public artifact README updated to evidence-based wording
- GLS package added:
  - `gls/gls_tb.v`
  - `gls/run_alpha_gls.sh`
  - `gls/sky130_fd_sc_hd_subset_functional.v`
  - `gls/results/*.log`
  - `gls/results/summary.json`
  - `gls/results/summary.md`
- IHP PR text added:
  - `IHP_PR_TEMPLATE.md`

## Evidence Snapshot

- physical sign-off:
  - `flow__errors__count = 0`
  - `timing__setup_vio__count = 0`
  - `timing__hold_vio__count = 0`
  - `DRC Passed`
  - `LVS Passed`
  - `Antenna Passed`
- GLS:
  - corners: `nom_tt_025C_1v80`, `min_tt_025C_1v80`, `max_tt_025C_1v80`
  - observed result: all `pass`
  - directed cases per corner: `6`
  - note: each corner log still contains `115` unmatched SDF ModPath warnings due the design-scoped functional subset library

## Artifact Hashes

- GDS:
  - `5FB3E144C8343CEDD27F2D93A809A236E2825CD584FEBAAF21DAE92B382E897C`
- top-level wrapper RTL:
  - `DF199B868E00DCDC61F153F0F0DEEAED7A02907B7BAE846F7C75FD3E5BC7793E`
- Tile C LUT evaluator RTL:
  - `CDF2042B5652B7C87FBFF83AAC5B29F3A7F195C0F076E468C250DCA16F6721B8`

## Accuracy Note

No separate compiler-cache artifact exists in this public bundle repository. The publish-ready state was refreshed instead by:

- regenerating the GLS evidence set from the final Alpha run outputs already captured in this workspace
- normalizing public summaries and paths
- recording the final submission template and evidence checkpoint in-repo
