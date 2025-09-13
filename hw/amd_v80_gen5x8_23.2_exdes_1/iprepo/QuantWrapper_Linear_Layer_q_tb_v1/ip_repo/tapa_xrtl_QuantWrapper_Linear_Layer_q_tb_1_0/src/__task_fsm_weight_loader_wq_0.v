`timescale 1 ns / 1 ps

module __task_fsm_weight_loader_wq_0 (
    input ap_clk,
    input ap_rst_n,
    // scalars to task
    output [63:0] task_s_quant_weight_mmap_offset,
output [31:0] task_s_seq_len,
    // scalars from global fsm
    input [63:0] global_fsm_s_quant_weight_mmap_offset,
input [31:0] global_fsm_s_seq_len,
    // communicate with task
    output task_ap_start,
    input task_ap_ready,
    input task_ap_done,
    input task_ap_idle,
    // communicate with global fsm
    input global_fsm_ap_start,
    input global_fsm_ap_done,
    output to_global_fsm_is_done
);
    reg [1:0] task_state;
    wire task_ap_start_global;
    wire task_ap_done_global;
    // connect scalars
    assign task_s_quant_weight_mmap_offset = global_fsm_s_quant_weight_mmap_offset;
assign task_s_seq_len = global_fsm_s_seq_len;
    assign task_ap_start_global = global_fsm_ap_start;
    assign to_global_fsm_is_done = (task_state == 2'b10);
    assign task_ap_done_global = global_fsm_ap_done;
    always @(posedge ap_clk) begin
        if(~ap_rst_n) begin
            task_state <= 2'b00;
        end else begin
            if(task_state == 2'b00) begin
                if(task_ap_start_global) begin
                    task_state <= 2'b01;
                end
            end
            if(task_state == 2'b01) begin
                if(task_ap_ready) begin
                    if(task_ap_done) begin
                        task_state <= 2'b10;
                    end else begin
                        task_state <= 2'b11;
                    end
                end
            end
            if(task_state == 2'b11) begin
                if(task_ap_done) begin
                    task_state <= 2'b10;
                end
            end
            if(task_state == 2'b10) begin
                if(task_ap_done_global) begin
                    task_state <= 2'b00;
                end
            end
        end
    end
    assign task_ap_start = (task_state == 2'b01);
endmodule