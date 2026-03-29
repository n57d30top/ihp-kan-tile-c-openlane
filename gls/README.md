# GLS

Gate-level simulation assets for the post-route KAN Tile C candidate.

## Contents

- `gls_tb.v`
  SDF-backannotated Verilog testbench for the final post-route netlist
- `run_alpha_gls.sh`
  Alpha-side runner that invokes `iverilog` and `vvp` inside `ghcr.io/efabless/openlane2:2.3.10`
- `sky130_fd_sc_hd_subset_functional.v`
  Design-scoped functional subset library for the exact Sky130 cells exercised by this netlist
- `results/`
  Captured Alpha logs and summaries for the executed GLS corners

## Executed Corner Set

The checked-in results were generated on `2026-03-29` against:

- final netlist: `design/runs/kan_tile_c_v3/final/nl/graph_kan_v1_mini_lut_fixture_kan_tile_c_top.nl.v`
- SDF corners:
  - `nom_tt_025C_1v80`
  - `min_tt_025C_1v80`
  - `max_tt_025C_1v80`

## Practical Invocation on Alpha

From the OpenLane remote workspace root:

```bash
gls/run_alpha_gls.sh \
  /home/sovryn/SovrynClean/outputs/runtime/silicon-openlane-live-materialization/direct-alpha-runs/kan-tile-c-openlane-2026-03-29T13-45-09/remote-workspace \
  nom_tt_025C_1v80 \
  min_tt_025C_1v80 \
  max_tt_025C_1v80
```

## Interpretation

- all three checked corners passed the six directed LUT cases
- this is a post-route functional confidence check
- the logs still include unmatched SDF ModPath warnings because the subset library does not implement full `specify` arc coverage
- authoritative timing sign-off still comes from STA plus the physical reports in `../signoff/`
