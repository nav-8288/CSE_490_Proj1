`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2026 07:53:51 PM
// Design Name: 
// Module Name: datapath
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


module datapath(
    input clock,
    input reset
    );
    
    // pc call 
    wire [15:0] pc_value;
    wire [15:0] next_pc;
    wire [15:0] instruction;

    PC_Proto pc_unit(
        .clock(clock),
        .reset(reset),
        .pc(pc_value),
        .next_pc(next_pc)
    );
    //grab instruction
    instruction_mem instr_mem(
        .addr(pc_value),
        .instr(instruction)
    );

    // seperate instruction fields into seperate wires
    wire [3:0] opcode;
    wire [3:0] rtrd;
    wire [3:0] rs;
    wire [3:0] imm_or_func;

    assign opcode = instruction[15:12];
    assign rtrd = instruction[11:8];
    assign rs = instruction[7:4];
    assign imm_or_func = instruction[3:0];

    // create the wires for each control signals
    wire reg_write;
    wire alu_src;
    wire mem_read;
    wire mem_write;
    wire mem_to_reg;
    wire branch_eq;
    wire branch_ne;
    wire jump;
    wire [1:0] alu_control;
    //call control unit on these wires
    control_unit control(
        .opcode(opcode),
        .function_code(imm_or_func),
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

    // then go to register file
    wire [15:0] data_read1;
    wire [15:0] data_read2;
    wire [15:0] write_back_data;
//to not override the current instruction
   wire safe_reg_write;
assign safe_reg_write = reg_write & ~reset;

register_file reg_file(
    .clock(clock),
    .reg_write(safe_reg_write),
    .reg_read1(rs),
    .reg_read2(rtrd),
    .write_reg(rtrd),
    .data_write(write_back_data),
    .data_read1(data_read1),
    .data_read2(data_read2)
);

    // sign extend
    wire [15:0] extended_imm;

    sign_extendor sign_ext(
        .imm(imm_or_func),
        .extended(extended_imm)
    );

    // second alu input from the mux
    wire [15:0] alu_operand2;

    mux alu_mux(
        .in0(data_read2),
        .in1(extended_imm),
        .select(alu_src),
        .out(alu_operand2)
    );

    // alu
    wire [15:0] alu_result;
    wire zero;

    alu alu_unit(
    .operand1(data_read1),
    .operand2(alu_operand2),
    .alu_control(alu_control),
    .result(alu_result),
    .zeroout(zero)
);

    brancher_jumper b_jmp(
        .pc_value(pc_value),
        .next_pc(next_pc),
        .branch_eq(branch_eq),
        .branch_ne(branch_ne),
        .extended_imm(extended_imm),
        .zero(zero),
        .jump(jump),
        .jump_address(instruction[11:0])

    );

    data_memory data_mem(
    .clock(clock),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .address(alu_result),
    .write_data(data_read2),
    .read_data(memory_read_data)
);

mux writeback_mux(
    .in0(alu_result),
    .in1(memory_read_data),
    .select(mem_to_reg),
    .out(write_back_data)
);

endmodule
