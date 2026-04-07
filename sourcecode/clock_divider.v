`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2026 03:51:47 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
    input clk,
    output reg slow_clk
    );

    reg [25:0] count;

    initial begin
        count = 0;
        slow_clk = 0;
    end
   //make clock ticks slower so the board doesn't go crazy
    always @(posedge clk) begin
        count <= count + 1;

        if (count == 26'd50000000) begin
            slow_clk <= ~slow_clk;
            count <= 0;
        end
    end

endmodule
