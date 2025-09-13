`timescale 1 ns / 1 ps
  
module Linear_Layer_i4xi4_q_start_for_PE_i4xi4_pack_2x2_true_11_false_false_108_U0_ShiftReg
#(parameter
    DATA_WIDTH  = 1,
    ADDR_WIDTH  = 1,
    DEPTH       = 2)
(
    input  wire                  clk,
    input  wire                  we,
    input  wire [ADDR_WIDTH-1:0] addr,
    input  wire [DATA_WIDTH-1:0] din,
    output wire [DATA_WIDTH-1:0] dout
);
    reg [DATA_WIDTH-1:0] SRL_SIG [0:DEPTH-1];
    integer i;
    always @(posedge clk) begin
        if (we) begin
            for (i=0; i<DEPTH-1; i=i+1)
                SRL_SIG[i+1] <= SRL_SIG[i];
            SRL_SIG[0] <= din;
        end
    end
    assign dout = SRL_SIG[addr];
endmodule