`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2026 07:44:33 PM
// Design Name: 
// Module Name: instruction_mem
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


module instruction_mem(
    input [15:0] addr,
    output [15:0] instr
    );
     reg [15:0] memory [0:63];

    integer i;

    initial begin
        for (i = 0; i < 64; i = i + 1)
            memory[i] = 16'b0;
    end

    assign instr = memory[addr[15:1]];
    
    
endmodule
