`timescale 1ns/1ps

module gls_tb;
  reg clk = 1'b0;
  reg rst_n = 1'b0;
  reg advance_tick = 1'b0;
  reg input_valid = 1'b0;
  reg signed [15:0] input_value = 16'sd0;
  wire output_valid;
  wire signed [15:0] output_value;

  reg [8*256-1:0] sdf_file;
  reg [8*64-1:0] corner_name;
  integer case_count;
  integer error_count;

  graph_kan_v1_mini_lut_fixture_kan_tile_c_top dut (
    .clk(clk),
    .rst_n(rst_n),
    .advance_tick(advance_tick),
    .input_valid(input_valid),
    .input_value(input_value),
    .output_valid(output_valid),
    .output_value(output_value)
  );

  always #5 clk = ~clk;

  task automatic run_case;
    input integer case_id;
    input signed [15:0] stimulus;
    input signed [15:0] expected;
    begin
      @(negedge clk);
      input_valid = 1'b1;
      advance_tick = 1'b1;
      input_value = stimulus;

      @(posedge clk);
      #1;

      if (output_valid !== 1'b1) begin
        $display("SOVRYN_GLS_CASE_FAIL case=%0d reason=output_valid stimulus=%0d expected=%0d observed_valid=%b observed_value=%0d", case_id, stimulus, expected, output_valid, $signed(output_value));
        error_count = error_count + 1;
      end else if ($signed(output_value) !== expected) begin
        $display("SOVRYN_GLS_CASE_FAIL case=%0d reason=value_mismatch stimulus=%0d expected=%0d observed=%0d", case_id, stimulus, expected, $signed(output_value));
        error_count = error_count + 1;
      end else begin
        $display("SOVRYN_GLS_CASE_PASS case=%0d stimulus=%0d observed=%0d", case_id, stimulus, $signed(output_value));
      end

      case_count = case_count + 1;

      @(negedge clk);
      input_valid = 1'b0;
      advance_tick = 1'b0;
      input_value = 16'sd0;

      @(posedge clk);
      #1;
      if (output_valid !== 1'b0) begin
        $display("SOVRYN_GLS_CASE_FAIL case=%0d reason=output_valid_not_cleared observed_valid=%b observed_value=%0d", case_id, output_valid, $signed(output_value));
        error_count = error_count + 1;
      end
    end
  endtask

  initial begin
    sdf_file = "UNSET";
    corner_name = "unknown";
    case_count = 0;
    error_count = 0;

    if (!$value$plusargs("SDF=%s", sdf_file)) begin
      $display("SOVRYN_GLS_FATAL missing +SDF=<path>");
      $finish_and_return(1);
    end

    if (!$value$plusargs("CORNER=%s", corner_name)) begin
      corner_name = "unspecified";
    end

    $display("SOVRYN_GLS_INFO annotating_sdf=%0s corner=%0s", sdf_file, corner_name);
    $sdf_annotate(sdf_file, dut);

    repeat (3) @(posedge clk);
    #1;
    rst_n = 1'b1;

    run_case(0, -16'sd1024, -16'sd2048);
    run_case(1, -16'sd768, -16'sd1408);
    run_case(2, -16'sd256, -16'sd384);
    run_case(3, 16'sd0, 16'sd0);
    run_case(4, 16'sd512, 16'sd1024);
    run_case(5, 16'sd2048, 16'sd2048);

    if (error_count == 0) begin
      $display("SOVRYN_GLS_RESULT pass=1 cases=%0d corner=%0s", case_count, corner_name);
      $finish_and_return(0);
    end

    $display("SOVRYN_GLS_RESULT pass=0 cases=%0d errors=%0d corner=%0s", case_count, error_count, corner_name);
    $finish_and_return(1);
  end
endmodule
