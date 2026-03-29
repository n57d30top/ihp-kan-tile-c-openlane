#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "usage: $0 <run-root> [corner ...]" >&2
  exit 2
fi

RUN_ROOT="$1"
shift || true

if [[ $# -eq 0 ]]; then
  set -- nom_tt_025C_1v80 min_tt_025C_1v80 max_tt_025C_1v80
fi

GLS_DIR="$RUN_ROOT/gls"
TB="$GLS_DIR/gls_tb.v"
NETLIST="$RUN_ROOT/design/runs/kan_tile_c_v3/final/nl/graph_kan_v1_mini_lut_fixture_kan_tile_c_top.nl.v"
LIB="$GLS_DIR/sky130_fd_sc_hd_subset_functional.v"
REL_RUN_ROOT="${RUN_ROOT#/home/sovryn/SovrynClean/}"

mkdir -p "$GLS_DIR/results"

RESULT_ROWS=()

for corner in "$@"; do
  SDF="$RUN_ROOT/design/runs/kan_tile_c_v3/final/sdf/$corner/graph_kan_v1_mini_lut_fixture_kan_tile_c_top__${corner}.sdf"
  LOG_FILE="$GLS_DIR/results/${corner}.log"
  VVP_FILE="$GLS_DIR/results/${corner}.vvp"

  docker run --rm -v /home/sovryn/SovrynClean:/work -w /work ghcr.io/efabless/openlane2:2.3.10 bash -lc "
set -euo pipefail
RUN_ROOT='/work/$REL_RUN_ROOT'
TB=\"\$RUN_ROOT/gls/gls_tb.v\"
NETLIST=\"\$RUN_ROOT/design/runs/kan_tile_c_v3/final/nl/graph_kan_v1_mini_lut_fixture_kan_tile_c_top.nl.v\"
LIB=\"\$RUN_ROOT/gls/sky130_fd_sc_hd_subset_functional.v\"
SDF=\"\$RUN_ROOT/design/runs/kan_tile_c_v3/final/sdf/$corner/graph_kan_v1_mini_lut_fixture_kan_tile_c_top__${corner}.sdf\"
LOG_FILE=\"\$RUN_ROOT/gls/results/${corner}.log\"
VVP_FILE=\"\$RUN_ROOT/gls/results/${corner}.vvp\"
iverilog -g2012 -gspecify -o \"\$VVP_FILE\" \"\$LIB\" \"\$NETLIST\" \"\$TB\"
vvp \"\$VVP_FILE\" +SDF=\"\$SDF\" +CORNER=\"$corner\" > \"\$LOG_FILE\" 2>&1
"

  if grep -q 'SOVRYN_GLS_RESULT pass=1' "$LOG_FILE"; then
    RESULT_ROWS+=("{\"corner\":\"$corner\",\"pass\":true,\"log\":\"$LOG_FILE\",\"sdf\":\"$SDF\"}")
  else
    RESULT_ROWS+=("{\"corner\":\"$corner\",\"pass\":false,\"log\":\"$LOG_FILE\",\"sdf\":\"$SDF\"}")
  fi
done

{
  printf '{\n  "results": [\n'
  for i in "${!RESULT_ROWS[@]}"; do
    printf '    %s' "${RESULT_ROWS[$i]}"
    if [[ "$i" -lt $((${#RESULT_ROWS[@]} - 1)) ]]; then
      printf ','
    fi
    printf '\n'
  done
  printf '  ]\n}\n'
} > "$GLS_DIR/results/summary.json"

if grep -q '"pass":false' "$GLS_DIR/results/summary.json"; then
  cat "$GLS_DIR/results/summary.json"
  exit 1
fi

cat "$GLS_DIR/results/summary.json"
