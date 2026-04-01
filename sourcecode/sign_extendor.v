`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2026 03:42:08 PM
// Design Name: 
// Module Name: sign_extendor
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


module sign_extendor(
    input [3:0] imm,
    output [15:0] extended
    );
    //how i found extending easily in verilog
    assign extended = {{12{imm[3]}}, imm};
endmodule
