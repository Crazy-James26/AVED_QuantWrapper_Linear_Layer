`timescale 1 ns / 1 ps

// 
module Linear_Layer_i4xi4_q_mac_muladd_24s_4ns_38s_38_4_1(
// 
    clk,
    reset,
    ce,
// 
    din0,
    din1,
    din2,
    dout);
parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter din2_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
// 
input clk;
input reset;
input ce;
// 
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
input[din2_WIDTH - 1:0] din2;
output[dout_WIDTH - 1:0] dout;
Linear_Layer_i4xi4_q_mac_muladd_24s_4ns_38s_38_4_1_DSP48_0 Linear_Layer_i4xi4_q_mac_muladd_24s_4ns_38s_38_4_1_DSP48_0_U(
// 
    .clk( clk ),
    .rst( reset ),
    .ce( ce ),
// 
    .in0( din0 ),
    .in1( din1 ),
    .in2( din2 ),
    .dout( dout ));
endmodule