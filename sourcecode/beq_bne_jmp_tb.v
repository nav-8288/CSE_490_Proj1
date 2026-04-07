`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2026 01:23:58 PM
// Design Name: 
// Module Name: beq_bne_tb.v
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

module beq_bne_jmp_tb;

    
    reg [15:0] pc_value;
    reg branch_eq;
    reg branch_ne;
    reg [15:0] extended_imm;
    reg zero;
    reg jump;
    reg [11:0] jump_address;
    
    wire [15:0] next_pc;
    

brancher_jumper uut(
     .pc_value(pc_value),
     .next_pc(next_pc),
     .branch_eq(branch_eq),
     .branch_ne(branch_ne),
     .extended_imm(extended_imm),
     .zero(zero),
     .jump(jump),
     .jump_address(jump_address)

    );

    initial begin

        /*Testing for when the branch is taken for BEQ*/
        pc_value = 16'd12; /*val 12 in decimal */
        branch_eq = 1'b1; /*val 1 in decimal, 1 indicates BEQ instruction being examined */
        branch_ne = 1'b0; /*val 0 in decimal, 0 indicates BNE instruction NOT being examined */
        extended_imm = 16'd4;  /*the immediate value is 4 in decimal */ /*immediate_val << 1 = 8 */
        zero = 1'b1; /*the zero val being decimal 1 indicates the BEQ should be taken  */
        jump = 1'b0; /*jump val is 0 since its NOT being examined */
        jump_address = 12'b0; /*the jump address is 0 since NOT being examined (bits 11-0 ended in all 0's) */
        #10;
        $display("BEQ branch was taken, the next_pc is: %d, expected 22", next_pc); /*pc_value + 2 + immediate_val << 1 = 12 + 2 + 8 = 22*/ 


        /*Testing for when the branch is taken for BNE*/
        pc_value = 16'd6; /*val 6 in decimal */
        branch_eq = 1'b0; /*val 0 in decimal, 0 indicates BEQ instruction NOT being examined */
        branch_ne = 1'b1; /*val 1 in decimal, 1 indicates BNE instruction  being examined */
        extended_imm = 16'd2;  /*the immediate value is 2 in decimal */ /*immediate_val << 1 = 4*/
        zero = 1'b0; /*the zero val being decimal 0 indicates the BNE should  be taken  */
        jump = 1'b0; /*jump val is 0 since its NOT being examined */
        jump_address = 12'b0; /*the jump address is 0 since NOT being examined (bits 11-0 ended in all 0's) */
        #10;
        $display("BNE branch was taken, the next_pc is: %d, expected 12", next_pc); /*pc_value + 2 + immediate_val << 1 = 6 + 2 + 4 = 12 */

        /*Testing for when the branch is NOT taken for BEQ*/
        pc_value = 16'd18; /*val 18 in decimal */
        branch_eq = 1'b1; /*val 1 in decimal, 1 indicates BEQ instruction being examined */
        branch_ne = 1'b0; /*val 0 in decimal, 0 indicates BNE instruction NOT being examined */
        extended_imm = 16'd8;  /*the immediate value is 8 in decimal */ /*immediate_val << 1 = 16 */
        zero = 1'b0; /*the zero val being decimal 0 indicates the BEQ should NOT be taken  */
        jump = 1'b0; /*jump val is 0 since its NOT being examined */
        jump_address = 12'b0; /*the jump address is 0 since NOT being examined (bits 11-0 ended in all 0's) */
        #10;
        $display("BEQ branch was NOT taken, the next_pc is: %d, expected 20", next_pc);  /*pc_value + 2 + immediate_val << 1 = 18 + 2 + 16 = 36, but since NOT taken, should be pc_val + 2 = 20 */


        /*Testing for when the branch is NOT taken for BNE*/
        pc_value = 16'd2; /*val 2 in decimal */
        branch_eq = 1'b0; /*val 0 in decimal, 0 indicates BEQ instruction NOT being examined */
        branch_ne = 1'b1; /*val 1 in decimal, 1 indicates BNE instruction  being examined */
        extended_imm = 16'd1;  /*the immediate value is 1 in decimal */ /*immediate_val << 1 = 2 */
        zero = 1'b1; /*the zero val being decimal 0 indicates the BNE should NOT be taken  */
        jump = 1'b0; /*jump val is 0 since its NOT being examined */
        jump_address = 12'b0; /*the jump address is 0 since NOT being examined (bits 11-0 ended in all 0's) */
        #10;
        $display("BNE branch was NOT taken, the next_pc is: %d, expected 4", next_pc); /*pc_value + 2 + immediate_val << 1 = 2 + 2 +2 = 6, but since NOT taken, should be pc_val + 2 = 4 */


        /*Testing for the jump */
        pc_value = 16'd8; /*val 8 in decimal */
        branch_eq = 1'b0; /*val 0 in decimal, 0 indicates BEQ instruction NOT being examined */
        branch_ne = 1'b0; /*val 0 in decimal, 0 indicates BNE instruction NOT  being examined */
        extended_imm = 16'd0;  /*the immediate value is 0 in decimal; NOT used by jump instruction*/ 
        zero = 1'b0; /*the zero val being decimal 0 indicates the BNE or BEQ should NOT be taken; also NOT used for jump  */
        jump = 1'b1; /*jump val is 1 since it IS being examined */
        jump_address = 12'd8; /*the jump address is value 8 in decimal ; it IS being examined*/
        #10;
        $display("JMP was taken, the next_pc is: %d, expected 26", next_pc); /*pc_value + 2 + jump address << 1 = 8 + 2 + 16 = 26*/


        /*Testing for the jmp (NEGATIVE TEST)*/
        pc_value = 16'd3; /*val 3 in decimal */
        branch_eq = 1'b0; /*val 0 in decimal, 0 indicates BEQ instruction NOT being examined */
        branch_ne = 1'b0; /*val 0 in decimal, 0 indicates BNE instruction NOT  being examined */
        extended_imm = 16'd0;  /*the immediate value is 0 in decimal; NOT used by jump instruction*/ 
        zero = 1'b0; /*the zero val being decimal 0 indicates the BNE or BEQ should NOT be taken; also NOT used for jump  */
        jump = 1'b1; /*jump val is 1 since it IS being examined */
        jump_address = 12'b111111111100; /*the jump address is value -4 in decimal but represented as 12 bit signed val; it IS being examined*/
        #10;
        $display("JMP was taken, the next_pc is: %d, expected -3", next_pc); /*pc_value + 2 + jump address << 1 = 3 + 2 + (-8) = -3; jump address << 1 = 4 << 1 = 8 */


        $finish;
    end

endmodule
