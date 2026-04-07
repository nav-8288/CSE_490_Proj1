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
module brancher_jumper_datapath_tb;
    
    reg clock;
    reg reset;
    reg [15:0] pc_value;
    reg branch_eq;
    reg branch_ne;
    reg [15:0] extended_imm;
    reg zero;
    reg jump;
    reg [11:0] jump_address;
    wire [15:0] next_pc;
    datapath uut(
        .clock(clock),
        .reset(reset)
    );
   // control_unit uut(
   //     .opcode(opcode),
   //     .function_code(function_code),
    //    .reg_write(reg_write),
     //   .alu_src(alu_src),
     //   .mem_read(mem_read),
     //   .mem_write(mem_write),
    //    .mem_to_reg(mem_to_reg),
      //  .branch_eq(branch_eq),
      //  .branch_ne(branch_ne),
     //   .jump(jump),
     //   .alu_control(alu_control)
 //   );
    assign next_pc = uut.next_pc;
  initial begin
    clock = 0;
    reset = 1;
    #10;
    reset = 0;
        /*Testing for when the branch is taken for BEQ*/
        uut.pc_unit.pc = 16'd12; /*val 12 in decimal */
        /* 12 >> 1 = 6, load from memory index 6*/
        uut.instr_mem.memory[6] = 16'b0100_0100_0001_0100; /*BEQ instruction loaded (0100 = opcode for BEQ; 0100 = R4; 0001 = R1, 0100 = Imm val 4 ) */
        uut.reg_file.registers[1] = 16'd12; /* decimal val 12 stored in register r1 for BEQ instruction */
        uut.reg_file.registers[4] = 16'd12; /* decimal val 12 stored in register r4 for BEQ instruction */
        #10;
        $display("BEQ branch was taken, the next_pc is: %d, expected 22", next_pc); /*pc_value + 2 + immediate_val << 1 = 12 + 2 + 8 = 22*/ 
        /*Testing for when the branch is taken for BNE*/
         uut.pc_unit.pc = 16'd12; /*val 12 in decimal */
        /* 12 >> 1 = 6, load from memory index 6*/
        uut.instr_mem.memory[6] = 16'b0101_0010_0001_0100; /*BNE instruction loaded (0101 = opcode for BNE; 0010 = R2; 0001 = R1, 0100 = Imm val 4 ) */
        uut.reg_file.registers[1] = 16'd2; /* decimal val 2 stored in register r1 for BNE instruction */
        uut.reg_file.registers[2] = 16'd20; /* decimal val 20 stored in register r2 for BNE instruction */
        #10;
        $display("BNE branch was taken, the next_pc is: %d, expected 22", next_pc); /*pc_value + 2 + immediate_val << 1 = 12 + 2 + 8 = 22 */
        /*Testing for when the branch is NOT taken for BEQ*/
        uut.pc_unit.pc = 16'd18; /*val 18 in decimal */
      /* 18 >> 1 = 9, load from memory index 9*/
        uut.instr_mem.memory[9] = 16'b0100_0100_0001_1000; /*BEQ instruction loaded (0100 = opcode for BEQ; 0100 = R4; 0001 = R1, 1000 = Imm val 8 ) */
        uut.reg_file.registers[1] = 16'd7; /* decimal val 7 stored in register r1 for BEQ instruction */
        uut.reg_file.registers[4] = 16'd9; /* decimal val 9 stored in register r4 for BEQ instruction */
   
        #10;
        $display("BEQ branch was NOT taken, the next_pc is: %d, expected 20", next_pc);  /*pc_value + 2 + immediate_val << 1 = 18 + 2 + 16 = 36, but since NOT taken, should be pc_val + 2 = 20 */
        /*Testing for when the branch is NOT taken for BNE*/
        uut.pc_unit.pc = 16'd26; /*val 25 in decimal */
        /* 26 >> 1 = 13, load from memory index 13*/
        uut.instr_mem.memory[13] = 16'b0101_0010_0011_0100; /*BNE instruction loaded (0101 = opcode for BNE; 0010 = R2; 0011 = R3, 0100 = Imm val 4 ) */
        uut.reg_file.registers[2] = 16'd2; /* decimal val 2 stored in register r2 for BNE instruction */
        uut.reg_file.registers[3] = 16'd2; /* decimal val 2 stored in register r3 for BNE instruction */
        #10;
        $display("BNE branch was NOT taken, the next_pc is: %d, expected 28", next_pc); /*pc_value + 2 + immediate_val << 1 = 26 + 2 +8 = 36, but since NOT taken, should be pc_val + 2 = 28 */
        /*Testing for the jump */
        uut.pc_unit.pc = 16'd16;    /*val 16 in decimal */
        /*16 >> 1 = 8, load from memory index 8*/
        uut.instr_mem.memory[8] = 16'b0110_0000_0000_0101; /*BNE instruction loaded (0110 = opcode for JMP; The jump address is 5) */
      
        #10;
        $display("JMP was taken, the next_pc is: %d, expected 28", next_pc); /*pc_value + 2 + jump address << 1 = 16 + 2 + 10 = 28*/
        /*Testing for the jmp (NEGATIVE TEST)*/
        uut.pc_unit.pc = 16'd18;    /*val 18 in decimal */
        /*18 >> 1 = 9, load from memory index 9 */
        uut.instr_mem.memory[9] = 16'b0110_1111_1111_1100; /*BNE instruction loaded (0110 = opcode for JMP; The jump address is 0110 1111 1111 1100 (-4 signed address)) */
        #10;
        $display("Negative JMP was taken, the next_pc is: %d, expected 12", next_pc); /*pc_value + 2 - jump address << 1 = 18 + 2 + (-8) = 12; */
        $finish;
    end
endmodule
