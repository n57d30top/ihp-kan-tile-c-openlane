# KAN Tile C OpenLane Artifact Bundle

This repository publishes the evidence-backed artifact bundle for the Sovryn `KAN v1` Tile C candidate:

- top-level GDS for the generated KAN Tile C wrapper
- readable RTL for the wrapper and Tile C LUT evaluator
- sign-off reports from the successful OpenLane run on `node-alpha`
- post-route gate-level simulation (GLS) assets and logs

## What This Repo Contains

- `gds/`
  Final layout artifact for `graph_kan_v1_mini_lut_fixture_kan_tile_c_top`
- `rtl/`
  Top-level wrapper RTL plus `sovryn_pan_stem_npu_tile_c_kan_lut_eval_v1.v`
- `signoff/`
  OpenLane run summary, manufacturability report, and final metrics
- `gls/`
  SDF-backannotated GLS testbench, Alpha runner script, design-scoped Sky130 functional subset library, and corner logs

## Verified Physical Status

The published sign-off artifacts come from the OpenLane run materialized on `node-alpha` on `2026-03-29`.

Observed sign-off status from `signoff/metrics.json` and `signoff/manufacturability.rpt`:

- `flow__errors__count = 0`
- `timing__setup_vio__count = 0`
- `timing__hold_vio__count = 0`
- `DRC Passed`
- `LVS Passed`
- `Antenna Passed`

These reports are the primary physical sign-off evidence for this artifact bundle.

## Post-Route GLS

This repo also includes a practical gate-level simulation flow that was executed on `node-alpha` with `iverilog` inside the OpenLane container:

- corners run: `nom_tt_025C_1v80`, `min_tt_025C_1v80`, `max_tt_025C_1v80`
- directed cases per corner: `6`
- observed result: all three corners passed

Important limitation:

- the GLS flow uses a design-scoped functional subset library in `gls/sky130_fd_sc_hd_subset_functional.v`
- because that subset does not model full Sky130 `specify` timing arc coverage, the logs still contain unmatched SDF ModPath warnings
- this GLS is therefore best treated as a strong post-route functional check, not as a replacement for STA-based timing sign-off

The authoritative timing evidence remains the OpenLane/OpenSTA metrics in `signoff/`.

## Reference Evidence

- `signoff/run-summary.json`
- `signoff/manufacturability.rpt`
- `signoff/metrics.json`
- `gls/results/summary.json`
- `gls/results/summary.md`

## License

This repository is released under the license in [LICENSE.md](LICENSE.md).
