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

module alu_tb;

    reg [15:0] operand1;
    reg [15:0] operand2;
    reg [1:0] alu_control;

    wire [15:0] result;
    wire zeroout;

    alu uut(
        .operand1(operand1),
        .operand2(operand2),
        .alu_control(alu_control),
        .result(result),
        .zeroout(zeroout)
    );

    initial begin
        operand1 = 16'd7;
        operand2 = 16'd5;
        alu_control = 2'b00;
        #10;
        $display("ADD result = %d, expected 12", result);

        operand1 = 16'd7;
        operand2 = 16'd5;
        alu_control = 2'b01;
        #10;
        $display("SUB result = %d, expected 2", result);

        operand1 = 16'd7;
        operand2 = 16'd5;
        alu_control = 2'b10;
        #10;
        $display("AND result = %d, expected 5", result);

        operand1 = 16'd7;
        operand2 = 16'd5;
        alu_control = 2'b11;
        #10;
        $display("SLL result = %d, expected 640", result);

        $finish;
    end

endmodule