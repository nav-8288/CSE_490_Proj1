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
    input btnC,
    input [15:0] sw,
    output reg [15:0] led
    );

    wire slow_clk;
    

  
    reg last_run;
    wire run_pulse;

    initial begin
        last_run = 1'b0;
    end

    clock_divider divider(
        .clk(clk),
        .slow_clk(slow_clk)
    );

    assign run_pulse = sw[15] & ~last_run;

    always @(posedge slow_clk) begin
        last_run <= sw[15];
    end

      wire [15:0] result_out;
    wire [15:0] pc_out;
    wire [15:0] instruction_out;
reg [15:0] selected_instruction;

    boarddatapath datapath(
        .clock(slow_clk),
        .reset(btnC),
        .run(run_pulse),
        .demo_instruction(selected_instruction),
        .result_out(result_out),
        .pc_out(pc_out),
        .instruction_out(instruction_out)
    );

    always @(*) begin
        if (sw[3:0] == 4'b0000)
            selected_instruction = 16'b0000_0001_0010_0000; // add
        else if (sw[3:0] == 4'b0001)
            selected_instruction = 16'b0000_0001_0010_0001; // sub
        else if (sw[3:0] == 4'b0010)
            selected_instruction = 16'b0000_0001_0010_0010; // sll
        else if (sw[3:0] == 4'b0011)
            selected_instruction = 16'b0000_0001_0010_0011; // and
        else if (sw[3:0] == 4'b0100)
            selected_instruction = 16'b0001_0001_0010_0010; // lw
        else if (sw[3:0] == 4'b0101)
            selected_instruction = 16'b0010_0001_0010_0010; // sw
        else if (sw[3:0] == 4'b0110)
            selected_instruction = 16'b0011_0001_0010_0011; // addi
        else
            selected_instruction = 16'b1111_0000_0000_0000; // nop
    end

    always @(*) begin
        if (sw[15] == 1'b0)
            led = 16'b0;
        else if (sw[5:4] == 2'b00)
            led = result_out;
        else if (sw[5:4] == 2'b01)
            led = pc_out;
        else if (sw[5:4] == 2'b10)
            led = instruction_out;
        else
            led = result_out;
    end

endmodule