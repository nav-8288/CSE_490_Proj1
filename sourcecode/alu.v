`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2026 03:36:06 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input      [15:0] operand1,
    input      [15:0] operand2,
    input      [1:0]  alu_control,
    output reg [15:0] result,
    output zeroout
    );
    
    always @(*) begin
        if (alu_control == 2'b00)
            result = operand1 + operand2; //add
        else if (alu_control == 2'b01)
            result = operand1 - operand2; //sub
        else if (alu_control == 2'b10)
            result = operand1 & operand2; //ander
        else if (alu_control == 2'b11) 
            result = operand2 << operand1; //sll
        else
            result = 16'b0; //else zeroout it
          end
          assign zeroout = (result == 16'b0);
          
endmodule
