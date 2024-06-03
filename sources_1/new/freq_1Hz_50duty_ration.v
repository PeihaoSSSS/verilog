`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/29 22:36:36
// Design Name: 
// Module Name: freq_divide
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


module freq_1Hz_50duty_ration #(parameter count_jump=25'd24_999_999)
(
    input clk,  //自带晶振50MHz
    input clr,
    output reg clk_1Hz_50duty_ratio

    );

    reg [24:0] count_1Hz;

    always @(posedge clk or negedge clr) begin
        if(clr==0) begin
            count_1Hz<=0;
            clk_1Hz_50duty_ratio<=0;
        end
        else begin
            if(count_1Hz==count_jump) begin
                count_1Hz<=0;
                clk_1Hz_50duty_ratio<=~clk_1Hz_50duty_ratio;
            end
            else begin
                count_1Hz<=count_1Hz+1;
            end
        end
    end


endmodule
