# IHP KAN Tile C OpenLane Candidate

Public artifact repository for a deterministic LUT-based KAN Tile C hardware candidate, including the final GDS, the Verilog sources used for the physical candidate, and the sign-off evidence from a successful OpenLane run on `2026-03-29`.

## Repository Layout

- `gds/`
  Final GDS masterfile for the physical candidate.
- `rtl/`
  Verilog sources used for the successful physical materialization.
- `signoff/`
  Physical verification artifacts and summary metrics.

## Included Artifacts

- `gds/graph_kan_v1_mini_lut_fixture_kan_tile_c_top.gds`
- `rtl/graph_kan_v1_mini_lut_fixture_kan_tile_c_top.v`
- `rtl/sovryn_pan_stem_npu_tile_c_kan_lut_eval_v1.v`
- `signoff/manufacturability.rpt`
- `signoff/metrics.json`
- `signoff/run-summary.json`

## Verified Results

- OpenLane run tag: `kan_tile_c_v3`
- Design name: `graph_kan_v1_mini_lut_fixture_kan_tile_c_top`
- DRC: passed
- LVS: passed
- Antenna: passed
- Setup violations: `0`
- Hold violations: `0`
- Flow errors: `0`

## Provenance

- Date: `2026-03-29`
- Source workspace commit: `0b24b372`
- GDS SHA256: `5FB3E144C8343CEDD27F2D93A809A236E2825CD584FEBAAF21DAE92B382E897C`
- Top-level wrapper SHA256: `DF199B868E00DCDC61F153F0F0DEEAED7A02907B7BAE846F7C75FD3E5BC7793E`
- Tile C LUT module SHA256: `CDF2042B5652B7C87FBFF83AAC5B29F3A7F195C0F076E468C250DCA16F6721B8`

## Notes

- The physical candidate uses an inline LUT initialization inside the Tile C module so synthesis does not depend on `$readmemh` path resolution.
- This repository intentionally ships only the public-facing artifact slice needed for review and submission.
- License status is captured exactly as published at packaging time; no Apache 2.0 relicensing claim is made here.
