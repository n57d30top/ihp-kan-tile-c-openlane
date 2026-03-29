# GLS Result Summary

- date: `2026-03-29`
- host: `node-alpha`
- container: `ghcr.io/efabless/openlane2:2.3.10`
- netlist: `design/runs/kan_tile_c_v3/final/nl/graph_kan_v1_mini_lut_fixture_kan_tile_c_top.nl.v`
- directed cases per corner: `6`

## Corner Results

- `nom_tt_025C_1v80`: `pass`
- `min_tt_025C_1v80`: `pass`
- `max_tt_025C_1v80`: `pass`

## Important Limitation

- each corner log still contains `115` unmatched SDF ModPath warnings
- this comes from the design-scoped functional subset library not implementing full Sky130 `specify` arc coverage
- because of that, the GLS results are best read as post-route functional confirmation
- the authoritative physical timing sign-off remains:
  - `timing__setup_vio__count = 0`
  - `timing__hold_vio__count = 0`
  - `DRC Passed`
  - `LVS Passed`
  - `Antenna Passed`
