`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/31 00:29:34
// Design Name: 
// Module Name: odd_freq_divide_tb
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


module odd_freq_divide_tb();

    reg clk;
    reg clr;
    wire divided_clk_odd;

    odd_freq_divide uut(
        .clk(clk),
        .clr(clr),
        .divided_clk_odd(divided_clk_odd)
    );

    initial begin
        clr<=0;clk<=0;
        #5 clr<=1;
    end

    always #10 clk<=~clk;

endmodule
