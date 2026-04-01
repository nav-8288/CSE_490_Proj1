`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2026 08:50:26 PM
// Design Name: 
// Module Name: demo
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


module demo(
      input clk,
    input btnU,
    input btnL,
    input btnR,
    input btnD,
    input btnC,
    output [15:0] led
    );

    reg [15:0] selected_instruction;
    wire [15:0] result_out;
reg last_btn;
initial begin
    last_btn = 1'b0;
end

    wire any_btn;
    wire step;
     assign any_btn = btnU | btnL | btnR | btnD;
    assign step = any_btn & ~last_btn;
    boarddatapath datapath(
        .clock(clk),
        .reset(btnC),
        .run(step),
        .demo_instruction(selected_instruction),
        .result_out(result_out)
    );
    
     
    
    always @(posedge clk) begin
        last_btn <= any_btn;
    end
    
    
    //pick an instruction
    always @(*) begin
    //r1 will be 5, r2 will be 7 to start
        if (btnU == 1'b1)
            selected_instruction = 16'b0000_0001_0010_0000; //add r1 and r2 to r1
        else if (btnL == 1'b1)
            selected_instruction = 16'b0000_0001_0010_0001; //sub r1 and r2 to r1
        else if (btnR == 1'b1)
            selected_instruction = 16'b0000_0001_0010_0011; // and r1 and r2 to r1
        else if (btnD == 1'b1)
            selected_instruction = 16'b0000_0001_0010_0010; // sll r1 and r2 to r1
        else
            selected_instruction = 16'b1111_0000_0000_0000; // nothing 
    end

    assign led = result_out;
endmodule
