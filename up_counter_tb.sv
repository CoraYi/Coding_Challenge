`timescale 1ns / 1ps

module up_counter_tb();
parameter N = 4;
logic clk;
logic rst_n;
logic load;
logic enable;
logic s;
logic [N-1:0] in;
logic [N-1:0] out;

up_down_counter #(N) counter(.*);

// clock signal with T = 10
initial begin
    clk = 1'b1;
    forever begin
      #5; 
      clk = ~clk;      
    end
end

// reset and enable signals
initial begin
    rst_n = 1'b1;
    load = 1'b0;
    enable = 1'b0;
    #10;
    rst_n = 1'b0;
    #5;
    rst_n = 1'b1;
    #5;
    enable = 1'b1;
end

// Input data and select signal
initial begin
    s = 1'b0;
    repeat(5) begin
        in = $random;
        load = 1'b1;
        #5;
        load = 1'b0;
        #45;
    end
    s = 1'b1;
    repeat(5) begin
        in = $random;
        load = 1'b1;
        #5;
        load = 1'b0;
        #45;
    end
    $finish;
end

endmodule
