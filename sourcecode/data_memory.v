`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2026 08:28:50 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input clock,
    input mem_read,
    input mem_write,
    input [15:0] address,
    input [15:0] write_data,
    output reg [15:0] read_data
    );
reg [7:0] memory [0:255];

//store word
always @(posedge clock) begin
    if (mem_write) begin
        memory[address]     <= write_data[15:8]; // MSB
        memory[address + 1] <= write_data[7:0];  // LSB
    end
end

//load word
always @(*) begin
    if (mem_read)
        read_data = {memory[address], memory[address+1]};
    else
        read_data = 16'b0;
end

  

endmodule
