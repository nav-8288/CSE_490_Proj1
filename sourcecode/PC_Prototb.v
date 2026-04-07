`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2026 12:55:10 PM
// Design Name: 
// Module Name: PC_Prototb
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


module PC_Prototb;

    reg clock;
    reg reset;
    wire [15:0] pc;
    wire [15:0] next_pc;

    assign next_pc = pc + 16'd2;

    
    PC_Proto uut (
        .clock(clock),
        .reset(reset),
        .pc(pc),
        .next_pc(next_pc)
    );

  
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    
    initial begin
        $display("Time\tclock\treset\tnext_pc\tpc");
        $monitor("%0t\t%b\t%b\t%h\t%h", $time, clock, reset, next_pc, pc);

        reset = 1;   
        #12;         
        reset = 0;

        #50;         

        reset = 1;  
        #10;
        reset = 0;

        #30;
        $finish;
    end

endmodule

