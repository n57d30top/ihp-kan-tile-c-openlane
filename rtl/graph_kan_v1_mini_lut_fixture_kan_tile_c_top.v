module graph_kan_v1_mini_lut_fixture_kan_tile_c_top(
  input wire clk,
  input wire rst_n,
  input wire advance_tick,
  input wire input_valid,
  input wire signed [15:0] input_value,
  output wire output_valid,
  output wire signed [15:0] output_value
);
  sovryn_pan_stem_npu_tile_c_kan_lut_eval_v1 #(
    .DOMAIN_MIN(-1024),
    .DOMAIN_MAX(1024),
    .SAMPLE_COUNT(9),
    .LUT_INIT_FILE("graph-kan-v1-mini-lut-fixture-node-kan-activation.mem")
  ) kan_tile_c_inst (
    .clk(clk),
    .rst_n(rst_n),
    .advance_tick(advance_tick),
    .input_valid(input_valid),
    .input_value(input_value),
    .output_valid(output_valid),
    .output_value(output_value)
  );
endmodule
