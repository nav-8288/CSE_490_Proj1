`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2026 03:13:13 PM
// Design Name: 
// Module Name: 16bit_and
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


module sixteenbit_and(
    input [15:0] a,
    input [15:0] b,
    output [15:0] out
    );
    and(out[0],  a[0],  b[0]);
and(out[1],  a[1],  b[1]);
and(out[2],  a[2],  b[2]);
and(out[3],  a[3],  b[3]);
and(out[4],  a[4],  b[4]);
and(out[5],  a[5],  b[5]);
and(out[6],  a[6],  b[6]);
and(out[7],  a[7],  b[7]);
and(out[8],  a[8],  b[8]);
and(out[9],  a[9],  b[9]);
and(out[10], a[10], b[10]);
and(out[11], a[11], b[11]);
and(out[12], a[12], b[12]);
and(out[13], a[13], b[13]);
and(out[14], a[14], b[14]);
and(out[15], a[15], b[15]);
    
endmodule
