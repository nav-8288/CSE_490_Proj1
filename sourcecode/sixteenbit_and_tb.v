`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2026 03:50:33 PM
// Design Name: 
// Module Name: sixteenbit_and_tb
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


module sixteenbit_and_tb;
reg  [15:0] a;
    reg  [15:0] b;
    wire [15:0] out;

   
    sixteenbit_and uut (
        .a(a),
        .b(b),
        .out(out)
    );

    initial begin
        $display("time\t a\t\t b\t\t out");
        $display("------------------------------------------------");

        a = 16'h0000; b = 16'h0000; #10;
        $display("%0t\t %h\t %h\t %h", $time, a, b, out);

        a = 16'hFFFF; b = 16'hFFFF; #10;
        $display("%0t\t %h\t %h\t %h", $time, a, b, out);

        a = 16'hAAAA; b = 16'h5555; #10;
        $display("%0t\t %h\t %h\t %h", $time, a, b, out);

        a = 16'hF0F0; b = 16'h0FF0; #10;
        $display("%0t\t %h\t %h\t %h", $time, a, b, out);

        a = 16'h1234; b = 16'h00FF; #10;
        $display("%0t\t %h\t %h\t %h", $time, a, b, out);
        $display("------------------------------------------------");
        $finish;
    end


    
endmodule
