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

    wire beq_branch;                
    wire bne_branch;

    assign beq_branch = branch_eq & zero;   /*beq_branch holds result of the beq control signal ANDED with is_zero value */
    assign bne_branch = branch_ne & !zero;   /*bne_branch holds the result of the bne control signal ANDED with inverted is_zero value */
    


    always @(*) begin
        if (beq_branch) begin /*Looking at is_zero value going into BEQ AND GATE; if the ALU subtracted val is equal to zero, jump to label  */
            next_pc = (extended_imm << 1) + (pc_value + 2)  ; /*the next pc val should branch to label; The immediate value is shifted left 1 bit and added to the prog counter */
        end

        else if (bne_branch) begin /*Looking at inverted is_zero value going into BNE AND GATE; If the result of the subbed val from ALU is not equivalent to zero (!= Zero) */
            next_pc =( extended_imm << 1) + (pc_value + 2)  ; /*the next pc val should branch to label; The immediate value is shifted left 1 bit and added to the prog counter */
        end  

        else if (jump) begin    /*otherwise if jumping to a label in memory*/
            if(jump_address[11]) /*If the sign bit is one (bit 11 = sign bit for 12-bit val), the offset is negative */
                next_pc = (pc_value + 2) - ((~jump_address + 1) << 1); /*If the number is signed, use 2's complement to get offset val and move backward from next instruction  */
            else
                next_pc = (jump_address << 1) + (pc_value + 2); /*Otherwise the integer is shifted left 1 bit and then added with the prog counter and the code continues executing from that address */
        end

        else begin /*otherwise in all other cases, will be a normal pc + 2 update */
            next_pc = pc_value + 2;
        end
    end




endmodule
