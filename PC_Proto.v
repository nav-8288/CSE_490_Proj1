`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2026 12:46:50 PM
// Design Name: 
// Module Name: PC_Proto
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


module PC_Proto(
    input clock,
    input reset,
    output reg [15:0] pc
    
    );
    initial pc = 0;
    always @ ( posedge clock) begin //Increase pc at every clock cycle
    if(reset)
        pc <= 0;
     else
        pc <= pc + 2; //Will use homemade adder for this at some point
        end
    
endmodule
