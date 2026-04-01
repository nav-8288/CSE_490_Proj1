`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2026 07:48:10 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input [3:0] opcode,
    input [3:0] function_code,
    output reg reg_write,
    output reg alu_src,
    output reg mem_read,
    output reg mem_write,
    output reg mem_to_reg,
    output reg branch_eq,
    output reg branch_ne,
    output reg jump,
    output reg [1:0] alu_control
    );

    always @(*) begin
        
        reg_write = 0;
        alu_src = 0;
        mem_read = 0;
        mem_write = 0;
        mem_to_reg = 0;
        branch_eq = 0;
        branch_ne = 0;
        jump = 0;
        alu_control = 2'b00;

        // r type instructions
        if (opcode == 4'b0000) begin
            reg_write = 1;

            if (function_code == 4'b0000)
                alu_control = 2'b00; // add
            else if (function_code == 4'b0001)
                alu_control = 2'b01; // sub
            else if (function_code == 4'b0011)
                alu_control = 2'b10; // and
            else if (function_code == 4'b0010)
                alu_control = 2'b11; // sll
        end
        // if its load word
        else if (opcode == 4'b0001) begin
            reg_write = 1;
            alu_src = 1;
            mem_read = 1;
            mem_to_reg = 1;
        end
        //if its store word
        else if (opcode == 4'b0010) begin
            alu_src = 1;
            mem_write = 1;
        end
        //addi code
        else if (opcode == 4'b0011) begin
            reg_write = 1;
            alu_src = 1;
        end
        //beq code
        else if (opcode == 4'b0100) begin
            branch_eq = 1;
            alu_control = 2'b01;
        end
        //bne code
        else if (opcode == 4'b0101) begin
            branch_ne = 1;
            alu_control = 2'b01;
        end
        //jump code
        else if (opcode == 4'b0110) begin
            jump = 1;
        end
    end

endmodule
