`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2026 01:20:25 PM
// Design Name: 
// Module Name: instruction_memory_tb
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


module instruction_memory_tb;

    reg [15:0] address;
    wire [15:0] instruction;

    instruction_mem uut(
        .addr(address),
        .instr(instruction)
    );

    initial begin
        uut.memory[0] = 16'b0000_0001_0010_0000;
        uut.memory[1] = 16'b0000_0001_0010_0001;
        uut.memory[2] = 16'b0000_0001_0010_0011;
        uut.memory[3] = 16'b0011_0001_0010_0011;

        address = 16'd0;
        #10;
        $display("address = %d, instruction = %b", address, instruction);

        address = 16'd2;
        #10;
        $display("address = %d, instruction = %b", address, instruction);

        address = 16'd4;
        #10;
        $display("address = %d, instruction = %b", address, instruction);

        address = 16'd6;
        #10;
        $display("address = %d, instruction = %b", address, instruction);

        $finish;
    end

endmodule
