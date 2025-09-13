`timescale 1 ns / 1 ps
module __rs___rs_ff_pipeline_0_aux #(
    parameter DATA_WIDTH    = 32,
    parameter HEAD_LEVEL    = 0,
    parameter BODY_LEVEL    = 0,
    parameter TAIL_LEVEL    = 0,
    parameter __HEAD_REGION = "",
    parameter __TAIL_REGION = ""
) (
    output wire RS_FF_PP_HEAD_clk,
    output wire RS_FF_PP_TAIL_clk,
    input wire  clk
);
  wire [DATA_WIDTH-1:0] body_dout_0;
  assign RS_FF_PP_HEAD_clk = clk;
  assign RS_FF_PP_TAIL_clk = clk;
endmodule