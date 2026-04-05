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


    reg [15:0] normal_pc;   /*normal_pc is just pc + 2 */
    reg [15:0] jump_to_label
    reg [15:0] branch_to_label

    always @(*) begin
        if (branch_eq == 0) /*if BEQ is chosen and BEQ is == 0 */
            next_pc = branch_to_label; /*the next pc val should branch to label */

        else if (branch_ne != 0) /*Otherwise if BNE is chosen and BNE != 0 */
            next_pc = branch_to_label /*the next pc val should branch to label */

        else if (jump) /*Otherwise if JMP is chosen  */
            next_pc = jump_to_label;
        
        else /*otherwise in all other cases, will be a normal pc + 2 update */
            next_pc = normal_pc;
        





endmodule