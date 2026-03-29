`timescale 1ns/1ps

module sky130_fd_sc_hd__a21o_1(output wire X, input wire A1, A2, B1);
  assign X = (A1 & A2) | B1;
endmodule

module sky130_fd_sc_hd__a22o_1(output wire X, input wire A1, A2, B1, B2);
  assign X = (A1 & A2) | (B1 & B2);
endmodule

module sky130_fd_sc_hd__a31oi_4(output wire Y, input wire A1, A2, A3, B1);
  assign Y = ~((A1 & A2 & A3) | B1);
endmodule

module sky130_fd_sc_hd__a32o_1(output wire X, input wire A1, A2, A3, B1, B2);
  assign X = (A1 & A2 & A3) | (B1 & B2);
endmodule

module sky130_fd_sc_hd__and2_1(output wire X, input wire A, B);
  assign X = A & B;
endmodule

module sky130_fd_sc_hd__and2b_1(output wire X, input wire A_N, B);
  assign X = (~A_N) & B;
endmodule

module sky130_fd_sc_hd__and3b_1(output wire X, input wire A_N, B, C);
  assign X = (~A_N) & B & C;
endmodule

module sky130_fd_sc_hd__and4_1(output wire X, input wire A, B, C, D);
  assign X = A & B & C & D;
endmodule

module sky130_fd_sc_hd__buf_1(output wire X, input wire A);
  assign X = A;
endmodule

module sky130_fd_sc_hd__buf_2(output wire X, input wire A);
  assign X = A;
endmodule

module sky130_fd_sc_hd__clkbuf_1(output wire X, input wire A);
  assign X = A;
endmodule

module sky130_fd_sc_hd__clkbuf_2(output wire X, input wire A);
  assign X = A;
endmodule

module sky130_fd_sc_hd__clkbuf_4(output wire X, input wire A);
  assign X = A;
endmodule

module sky130_fd_sc_hd__clkbuf_16(output wire X, input wire A);
  assign X = A;
endmodule

module sky130_fd_sc_hd__conb_1(output wire HI, LO);
  assign HI = 1'b1;
  assign LO = 1'b0;
endmodule

module sky130_fd_sc_hd__dfrtp_1(output reg Q, input wire CLK, D, RESET_B);
  always @(posedge CLK or negedge RESET_B) begin
    if (!RESET_B) begin
      Q <= 1'b0;
    end else begin
      Q <= D;
    end
  end
endmodule

module sky130_fd_sc_hd__diode_2(input wire DIODE);
endmodule

module sky130_fd_sc_hd__inv_2(output wire Y, input wire A);
  assign Y = ~A;
endmodule

module sky130_fd_sc_hd__mux2_1(output wire X, input wire A0, A1, S);
  assign X = S ? A1 : A0;
endmodule

module sky130_fd_sc_hd__nand2_1(output wire Y, input wire A, B);
  assign Y = ~(A & B);
endmodule

module sky130_fd_sc_hd__nand2_2(output wire Y, input wire A, B);
  assign Y = ~(A & B);
endmodule

module sky130_fd_sc_hd__nor2_1(output wire Y, input wire A, B);
  assign Y = ~(A | B);
endmodule

module sky130_fd_sc_hd__nor3_1(output wire Y, input wire A, B, C);
  assign Y = ~(A | B | C);
endmodule

module sky130_fd_sc_hd__nor3_2(output wire Y, input wire A, B, C);
  assign Y = ~(A | B | C);
endmodule

module sky130_fd_sc_hd__o211a_1(output wire X, input wire A1, A2, B1, C1);
  assign X = (A1 | A2) & B1 & C1;
endmodule

module sky130_fd_sc_hd__o21a_1(output wire X, input wire A1, A2, B1);
  assign X = (A1 | A2) & B1;
endmodule

module sky130_fd_sc_hd__o2bb2a_1(output wire X, input wire A1_N, A2_N, B1, B2);
  assign X = ((~A1_N) & B1) | ((~A2_N) & B1) | ((~A1_N) & B2) | ((~A2_N) & B2);
endmodule

module sky130_fd_sc_hd__or2_1(output wire X, input wire A, B);
  assign X = A | B;
endmodule

module sky130_fd_sc_hd__or3_1(output wire X, input wire A, B, C);
  assign X = A | B | C;
endmodule

module sky130_fd_sc_hd__or4_1(output wire X, input wire A, B, C, D);
  assign X = A | B | C | D;
endmodule

module sky130_ef_sc_hd__decap_12();
endmodule

module sky130_fd_sc_hd__decap_3();
endmodule

module sky130_fd_sc_hd__decap_4();
endmodule

module sky130_fd_sc_hd__decap_6();
endmodule

module sky130_fd_sc_hd__decap_8();
endmodule

module sky130_fd_sc_hd__fill_1();
endmodule

module sky130_fd_sc_hd__fill_2();
endmodule

module sky130_fd_sc_hd__tapvpwrvgnd_1();
endmodule
