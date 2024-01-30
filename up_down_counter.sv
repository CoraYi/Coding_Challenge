`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2024/01/30
// Module Name: 4-bit up/down counter
// Submitted by: Yuqi Yi
// Email: yuqiyi0406@outlook.com
// Description:
// Write a SystemVerilog module for a 4-bit synchronous up/down counter with enable, 
// asynchronous reset, and synchronous load, and a testbench to verify your counter. 
//////////////////////////////////////////////////////////////////////////////////

module up_down_counter #(parameter N = 4)(
input logic clk,
input logic rst_n,
input logic enable,
input logic load,
input logic s,
input logic [N-1:0] in,
output logic [N-1:0] out
    );

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin // asynchronous reset
        out <= 'b0;
    end else if (enable) begin // enable
        if (load) begin // synchronous load
        out <= in;
        end else begin
            out <= s ? out + 1 : out - 1; // select up or down counting
        end
    end
end

endmodule
