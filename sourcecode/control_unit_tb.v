`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2026 01:23:58 PM
// Design Name: 
// Module Name: register_file_tb
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

module control_unit_tb;

    reg [3:0] opcode;
    reg [3:0] function_code;

    wire reg_write;
    wire alu_src;
    wire mem_read;
    wire mem_write;
    wire mem_to_reg;
    wire branch_eq;
    wire branch_ne;
    wire jump;
    wire [1:0] alu_control;

    control_unit uut(
        .opcode(opcode),
        .function_code(function_code),
        .reg_write(reg_write),
        .alu_src(alu_src),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .mem_to_reg(mem_to_reg),
        .branch_eq(branch_eq),
        .branch_ne(branch_ne),
        .jump(jump),
        .alu_control(alu_control)
    );

    initial begin
        opcode = 4'b0000; function_code = 4'b0000; #10;
        $display("ADD  reg_write=%b alu_src=%b alu_control=%b", reg_write, alu_src, alu_control);

        opcode = 4'b0000; function_code = 4'b0001; #10;
        $display("SUB  reg_write=%b alu_src=%b alu_control=%b", reg_write, alu_src, alu_control);

        opcode = 4'b0000; function_code = 4'b0011; #10;
        $display("AND  reg_write=%b alu_src=%b alu_control=%b", reg_write, alu_src, alu_control);

        opcode = 4'b0000; function_code = 4'b0010; #10;
        $display("SLL  reg_write=%b alu_src=%b alu_control=%b", reg_write, alu_src, alu_control);

        opcode = 4'b0001; function_code = 4'b0000; #10;
        $display("LW   reg_write=%b mem_read=%b mem_to_reg=%b alu_src=%b", reg_write, mem_read, mem_to_reg, alu_src);

        opcode = 4'b0010; function_code = 4'b0000; #10;
        $display("SW   mem_write=%b alu_src=%b", mem_write, alu_src);

        opcode = 4'b0011; function_code = 4'b0000; #10;
        $display("ADDI reg_write=%b alu_src=%b alu_control=%b", reg_write, alu_src, alu_control);

        opcode = 4'b0100; function_code = 4'b0000; #10;
        $display("BEQ  branch_eq=%b alu_control=%b", branch_eq, alu_control);

        opcode = 4'b0101; function_code = 4'b0000; #10;
        $display("BNE  branch_ne=%b alu_control=%b", branch_ne, alu_control);

        opcode = 4'b0110; function_code = 4'b0000; #10;
        $display("JMP  jump=%b", jump);

        $finish;
    end

endmodule