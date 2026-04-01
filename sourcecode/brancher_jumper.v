`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2026 08:31:29 PM
// Design Name: 
// Module Name: brancher_jumper
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


module brancher_jumper(
     input [15:0] pc_value,
    input [15:0] extended_imm,
    input [11:0] jump_address,
    input zero,
    input branch_eq,
    input branch_ne,
    input jump,
    output reg [15:0] next_pc
    );
endmodule
