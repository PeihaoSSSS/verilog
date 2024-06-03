`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/30 00:01:30
// Design Name: 
// Module Name: even_freq_divide
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


module even_freq_divide #(parameter N=8)  //分频数
(

    input clk,
    input clr,

    output reg divided_clk_even

    );

    wire clk_1Hz_50duty_ratio;

    freq_1Hz_50duty_ration freq_1Hz_50duty_ration_inst1(
        .clk(clk),
        .clr(clr),
        .clk_1Hz_50duty_ratio(clk_1Hz_50duty_ratio)
    );

    reg [$clog2(N/2):0] count;  //起始值为1，根据N的值自动调整位数

    always @(posedge clk_1Hz_50duty_ratio or negedge clr) begin
        if(clr==0) begin
            count<=1;
            divided_clk_even<=0;
        end
        else begin
            if(count==N/2) begin
                divided_clk_even<=~divided_clk_even;
                count<=1;
            end
            else begin
                count<=count+1;
            end
        end
    end


endmodule
