`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2026 12:10:47 PM
// Design Name: 
// Module Name: sign_extendor_tb
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


module sign_extendor_tb;

    reg [3:0] imm;
    wire [15:0] extended;

    sign_extendor uut(
        .imm(imm),
        .extended(extended)
    );

    initial begin
        imm = 4'b0010;
        #10;
        $display("imm = %b, extended = %b, expected = 0000000000000010", imm, extended);

        imm = 4'b0111;
        #10;
        $display("imm = %b, extended = %b, expected = 0000000000000111", imm, extended);

        imm = 4'b1111;
        #10;
        $display("imm = %b, extended = %b, expected = 1111111111111111", imm, extended);

        imm = 4'b1000;
        #10;
        $display("imm = %b, extended = %b, expected = 1111111111111000", imm, extended);

        $finish;
    end

endmodule
