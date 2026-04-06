`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2026 01:23:58 PM
// Design Name: 
// Module Name: register_file_tb
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


module register_file_tb;

    reg clock;
    reg reg_write;
    reg [3:0] reg_read1;
    reg [3:0] reg_read2;
    reg [3:0] write_reg;
    reg [15:0] data_write;

    wire [15:0] data_read1;
    wire [15:0] data_read2;

    register_file uut(
        .clock(clock),
        .reg_write(reg_write),
        .reg_read1(reg_read1),
        .reg_read2(reg_read2),
        .write_reg(write_reg),
        .data_write(data_write),
        .data_read1(data_read1),
        .data_read2(data_read2)
    );

    always #5 clock = ~clock;

    initial begin
        clock = 0;
        reg_write = 0;
        reg_read1 = 0;
        reg_read2 = 0;
        write_reg = 0;
        data_write = 0;
        
        write_reg = 4'd3;
        data_write = 16'd25;
        reg_write = 1;
        #10;

        write_reg = 4'd7;
        data_write = 16'd100;
        #10;

        reg_write = 0;
        reg_read1 = 4'd3;
        reg_read2 = 4'd7;
        #5;

        $display("R3 = %d, expected 25", data_read1);
        $display("R7 = %d, expected 100", data_read2);

        reg_read1 = 4'd1;
        reg_read2 = 4'd2;
        #5;
        //should be 0
        $display("R1 = %d", data_read1);
        $display("R2 = %d", data_read2);

        $finish;
    end

endmodule