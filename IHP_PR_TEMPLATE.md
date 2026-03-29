# IHP OpenMPW Submission: KAN Tile C LUT Macro for Edge Inference

## Summary

This pull request submits a compact, hardware-synthesized KAN-inspired inference macro that replaces arithmetic-heavy nonlinear evaluation with a deterministic 1D piecewise-linear LUT path mapped into a dedicated Tile C special-function block.

The design goal is straightforward: reduce edge-inference complexity by moving a learned nonlinear response into a physically realizable lookup structure, rather than re-evaluating the function through a conventional ALU-centered datapath. In practical terms, this submission packages a small digital macro with readable RTL, post-route physical evidence, and post-route gate-level simulation logs.

To the best of our knowledge, this submission represents a rare open, hardware-synthesized implementation of a KAN-style LUT-evaluation block intended for edge inference, with the entire evidence chain published: RTL, GDS, OpenLane sign-off artifacts, and SDF-backannotated GLS logs.

## What Is Being Submitted

- top-level layout artifact:
  - `gds/graph_kan_v1_mini_lut_fixture_kan_tile_c_top.gds`
- top-level wrapper RTL:
  - `rtl/graph_kan_v1_mini_lut_fixture_kan_tile_c_top.v`
- Tile C LUT evaluator RTL:
  - `rtl/sovryn_pan_stem_npu_tile_c_kan_lut_eval_v1.v`
- physical verification package:
  - `signoff/manufacturability.rpt`
  - `signoff/run-summary.json`
  - `signoff/metrics.json`
- post-route gate-level simulation package:
  - `gls/gls_tb.v`
  - `gls/run_alpha_gls.sh`
  - `gls/results/*.log`
  - `gls/results/summary.json`

## Technical Positioning

This macro is not a generic matrix engine. It is a tightly scoped nonlinear evaluation block built around:

- deterministic 1D LUT evaluation
- piecewise-linear discretization of a KAN-style response function
- compact control and datapath logic
- explicit physical sign-off evidence

The key architectural claim is not that this is a large accelerator, but that it demonstrates a physically clean route from a learned nonlinear function to a compact hardware lookup primitive suitable for edge-oriented inference flows.

## Verification Evidence

### Physical Sign-Off

The submitted layout completed the OpenLane physical flow with the following observed outcomes:

- `flow__errors__count = 0`
- `timing__setup_vio__count = 0`
- `timing__hold_vio__count = 0`
- `DRC Passed`
- `LVS Passed`
- `Antenna Passed`

Representative evidence files:

- `signoff/metrics.json`
- `signoff/manufacturability.rpt`
- `signoff/run-summary.json`

### Post-Route GLS with SDF Back-Annotation

In addition to STA and physical rule checks, the final post-route netlist was exercised with SDF-backannotated gate-level simulation using `iverilog` inside the OpenLane container.

Executed GLS corners:

- `nom_tt_025C_1v80`
- `min_tt_025C_1v80`
- `max_tt_025C_1v80`

Observed GLS outcome:

- all three corners passed
- six directed cases per corner passed
- summary recorded in `gls/results/summary.json`

This is useful as post-route functional confirmation that the routed netlist still produces the expected LUT outputs across nominal, minimum, and maximum timing corners.

### Important Accuracy Note

The GLS logs still contain unmatched SDF ModPath warnings because the checked-in functional simulation library is a design-scoped subset rather than the full Sky130 timing-model library with complete `specify` arc coverage.

Accordingly:

- the GLS logs should be read as strong post-route functional evidence
- the primary timing sign-off remains the OpenLane/OpenSTA report set
- the authoritative pass criteria for physical cleanliness are still the zero setup/hold violation counts and the passing DRC/LVS/Antenna reports

## Why This Submission Is Interesting for MPW Review

- It is small, reviewable, and technically explicit.
- The macro has readable RTL and a published GDS, rather than being presented as a black-box claim.
- The submission includes both physical closure evidence and post-route simulation evidence.
- The design demonstrates a practical route for mapping a learned nonlinear inference primitive into a deterministic hardware lookup structure.

## Prior-Art / IP Reference

The following hashes were computed from the exact artifacts included in this repository:

- GDS SHA-256:
  - `5FB3E144C8343CEDD27F2D93A809A236E2825CD584FEBAAF21DAE92B382E897C`
- top-level wrapper RTL SHA-256:
  - `DF199B868E00DCDC61F153F0F0DEEAED7A02907B7BAE846F7C75FD3E5BC7793E`
- Tile C LUT evaluator RTL SHA-256:
  - `CDF2042B5652B7C87FBFF83AAC5B29F3A7F195C0F076E468C250DCA16F6721B8`

Applicant-provided blockchain prior-art reference:

- Base transaction:
  - `0x9ef8af41caf92bd23423cc9de301b74efaa5855440e28e6d30f5f390d7d607d7`

This transaction reference is included here as an applicant-supplied legal/IP reference alongside the artifact hashes above.

## Requested Review

We are submitting this macro for MPW evaluation as a compact, physically verified edge-inference building block with transparent implementation artifacts.

Reviewers can inspect:

- the RTL directly
- the final GDS directly
- the OpenLane sign-off evidence directly
- the post-route GLS corner logs directly

If useful for evaluation, we can also provide a tighter technical note focused solely on:

- LUT discretization contract
- macro I/O behavior
- directed GLS vectors
- artifact hash provenance
