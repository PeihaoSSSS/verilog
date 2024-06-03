`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/30 00:34:25
// Design Name: 
// Module Name: even_freq_divide_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module even_freq_divide_tb();

    reg clk;
    reg clr;
    wire divided_clk;

    even_freq_divide uut(
        .clk(clk),
        .clr(clr),
        .divideed_clk(divided_clk)
    );

    initial begin
        clr<=0;clk<=0;
        #5 clr<=1;
    end

    always #10 clk<=~clk;

endmodule
