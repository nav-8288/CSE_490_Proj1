`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2026 03:27:28 PM
// Design Name: 
// Module Name: register_file
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


module register_file(
     input clock,
    input reg_write,
    input [3:0] reg_read1,
    input [3:0] reg_read2,
    input [3:0] write_reg,
    input [15:0] data_write,
    output [15:0] data_read1,
    output [15:0] data_read2
    );
    
    reg [15:0] registers [0:15];
    integer i;

    initial begin
    //instantiate memory for each register to be all 0's
        for (i = 0; i < 16; i = i + 1)
            registers[i] = 16'd0;
            
            //temporary for testing
            registers[1] = 16'd5;
            registers[2] = 16'd7;
        end
        //assign data from registers
    assign data_read1 = registers[reg_read1];
    assign data_read2 = registers[reg_read2];
    //reg write
    always @(posedge clock) begin
        if (reg_write == 1)
            registers[write_reg] <= data_write;
    end
endmodule
