`timescale 1 ns / 1 ps

module __global_fsm_QuantWrapper_Linear_Layer_q_tb_fsm (
    input [63:0] input_mmap_offset,
input [63:0] output_mmap_offset,
input [63:0] quant_weight_mmap_offset,
input [31:0] seq_len,
input [63:0] weight_s_sum_mmap_offset,
    output [63:0] global_fsm_s_input_mmap_offset,
output [63:0] global_fsm_s_output_mmap_offset,
output [63:0] global_fsm_s_quant_weight_mmap_offset,
output [31:0] global_fsm_s_seq_len,
output [63:0] global_fsm_s_weight_s_sum_mmap_offset,
    input is_done_Linear_Layer_i4xi4_q_0,
input is_done_dequant_layer_q_int_fp32_0,
input is_done_input_loader_r1_ln_iembed_fp32_0,
input is_done_output_drainer_q_fp32_0,
input is_done_quant_layer_r1_ln_iembed_fp32_int4_0,
input is_done_weight_loader_wq_0,
input is_done_weight_s_loader_wq_0,
    output global_fsm_ap_start,
    output global_fsm_ap_done,
    input ap_clk,
    input ap_rst_n,
    input ap_start,
    output ap_done,
    output ap_idle,
    output ap_ready
);
    reg [1:0] tapa_state;
    reg [0:0] countdown;
    assign global_fsm_s_input_mmap_offset = input_mmap_offset;
assign global_fsm_s_output_mmap_offset = output_mmap_offset;
assign global_fsm_s_quant_weight_mmap_offset = quant_weight_mmap_offset;
assign global_fsm_s_seq_len = seq_len;
assign global_fsm_s_weight_s_sum_mmap_offset = weight_s_sum_mmap_offset;
    always @(posedge ap_clk) begin
        if(~ap_rst_n) begin
            tapa_state <= 2'b00;
        end else begin
            case(tapa_state)
                2'b00: begin
                    if(global_fsm_ap_start) begin
                        tapa_state <= 2'b01;
                    end
                end
                2'b01: begin
                    if(1'b1 & is_done_Linear_Layer_i4xi4_q_0 & is_done_dequant_layer_q_int_fp32_0 & is_done_input_loader_r1_ln_iembed_fp32_0 & is_done_output_drainer_q_fp32_0 & is_done_quant_layer_r1_ln_iembed_fp32_int4_0 & is_done_weight_loader_wq_0 & is_done_weight_s_loader_wq_0) begin
                        tapa_state <= 2'b10;
                    end
                end
                2'b10: begin
                    tapa_state <= 2'b00;
                    countdown <= 1'd0;
                end
                2'b11: begin
                    if(countdown == 1'd0) begin
                        tapa_state <= 2'b00;
                    end else begin
                        countdown <= (countdown - 1'd1);
                    end
                end
            endcase
        end
    end
    assign ap_idle = (tapa_state == 2'b00);
    wire ap_done__q0 = (tapa_state == 2'b10);
    assign ap_done = ap_done__q0;
    assign ap_ready = ap_done__q0;
    assign global_fsm_ap_start = ap_start;
endmodule