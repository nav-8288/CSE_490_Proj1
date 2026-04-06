`timescale 1ns/1ps

module datapath_tb;

reg clock;
reg reset;

datapath DUT (
    .clock(clock),
    .reset(reset)
);

always #5 clock = ~clock;

initial begin
    clock = 0;
    reset = 1;
    #20;
    reset = 0;


    DUT.reg_file.registers[1] = 16'd10;
    DUT.reg_file.registers[2] = 16'd1234;


    DUT.instr_mem.memory[0] =
        {4'b1011, 4'd2, 4'd1, 4'd0};

    DUT.instr_mem.memory[1] =
        {4'b1010, 4'd3, 4'd1, 4'd0};

    #200;

    if ({DUT.data_mem.memory[10],
         DUT.data_mem.memory[11]} == 16'd1234)
        $display("STORE PASSED");
    else
        $display("STORE FAILED");

    if (DUT.reg_file.registers[3] == 16'd1234)
        $display("LOAD PASSED");
    else
      $display("LOAD FAILED");

    $display("TEST COMPLETE");
    $finish;
end

endmodule
