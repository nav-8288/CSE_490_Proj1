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
    output reg [15:0] pc,
    input [15:0] next_pc
    
    
    );
    initial pc = 0;
    always @ ( posedge clock) begin //Increase pc at every clock cycle
    if(reset)
        pc <= 0;
     else
        pc <= next_pc; /* If not reset, could be pc + 2, jump to label, or branch to label */ 
        end
    
endmodule
