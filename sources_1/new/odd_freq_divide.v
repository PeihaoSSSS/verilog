`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/31 00:02:01
// Design Name: 
// Module Name: odd_freq_divide
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


module odd_freq_divide #(parameter N=5)
(
    input clk,
    input clr,

    output divided_clk_odd

    );

    wire clk_1Hz_50duty_ratio;

    freq_1Hz_50duty_ration freq_1Hz_50duty_ration_inst2(
        .clk(clk),
        .clr(clr),
        .clk_1Hz_50duty_ratio(clk_1Hz_50duty_ratio)
    );

    reg [$clog2(N):0] count;
    reg divided_clk_odd_pos;
    reg divided_clk_odd_neg;


    always @(posedge clk_1Hz_50duty_ratio or negedge clr) begin  //计数器
        if(clr==0) begin
            count<=1;
        end
        else begin
            if(count==N) begin
                count<=1;
            end
            else begin
                count<=count+1;
            end
        end
    end

    always @(posedge clk_1Hz_50duty_ratio or negedge clr) begin
        if(clr==0) begin
            divided_clk_odd_pos<=0;
        end
        else begin
            if(count==(N-1)/2) begin  //低电平持续两个时钟
                divided_clk_odd_pos<=1;
            end
            else if(count==N) begin  // 高电平持续3个时钟
                divided_clk_odd_pos<=0;
            end
        end
    end

    always @(negedge clk_1Hz_50duty_ratio or negedge clr) begin
        if(clr==0) begin
            divided_clk_odd_neg<=0;
        end
        else begin
            if(count==(N-1)/2) begin  //低电平持续两个时钟
                divided_clk_odd_neg<=1;
            end
            else if(count==N) begin  // 高电平持续3个时钟
                divided_clk_odd_neg<=0;
            end
        end
    end

    assign divided_clk_odd=divided_clk_odd_neg&divided_clk_odd_pos;


endmodule
