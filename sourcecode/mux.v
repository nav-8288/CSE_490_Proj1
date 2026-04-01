`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2026 08:30:00 PM
// Design Name: 
// Module Name: mux
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


module mux(
    input [15:0] in0,
    input [15:0] in1,
    input select,
    output reg  [15:0] out
    );
    
    //pretty basic mux implementatio
    always @(*) begin
        if (select == 1'b1)
            out = in1;
        else
            out = in0;
    end

    
    
endmodule
