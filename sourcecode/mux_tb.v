`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2026 01:23:58 PM
// Design Name: 
// Module Name: mux_tb
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

module mux_tb;

    /*two 16 bit values */
    reg [15:0] in0;
    reg [15:0] in1;

    reg select; /*1-bit select signal*/

    wire [15:0] out;
   

    mux uut(
        .in0(in0),
        .in1(in1),
        .select(select),
        .out(out)
    );

    initial begin
        in0 = 16'd3; /*val 1 is 3 decimal */
        in1 = 16'd12; /*val 2 is 12 decimal */
        select = 1'b1; /*Select bit is 1 */
        #10;
        $display("MUX result = %d, expected 12", out); /*since select is a 1, output should be a 12 (val 2 chosen) */

        in0 = 16'd7; /*val 1 is 7 decimal */
        in1 = 16'd5; /*val 2 is 5 decimal */
        select = 1'b0;
        #10;
        $display("MUX result = %d, expected 7", out); /*since select is a 0, output should be a 7 (val 1 chosen) */

        $finish;
    end

endmodule
