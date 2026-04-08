`timescale 1ns/1ps

module load_store_tb;

reg clock;
reg reset;

datapath DUT (
    .clock(clock),
    .reset(reset)
);

always #5 clock = ~clock;

initial begin
    clock = 0;
    //reset = 1;
    //#20;
    reset = 1;


    DUT.reg_file.registers[1] = 16'd10;
    DUT.reg_file.registers[2] = 16'd1234;

 // force pc back to 0
            reset = 1;
            @(posedge clock);   // reset happens here
            @(negedge clock);   // release reset away from posedge
            reset = 0;

    DUT.instr_mem.memory[0] =
        {4'b0010, 4'd2, 4'd1, 4'd0};

    DUT.instr_mem.memory[1] =
        {4'b0001, 4'd3, 4'd1, 4'd0};


     @(posedge clock);  //executes sw
     #1;
      
      
        @(posedge clock);  //executes lw
    #1;
    $display("memory[10] = %h", DUT.data_mem.memory[10]);
        $display("memory[11] = %h", DUT.data_mem.memory[11]);
 $display("R3 = %d", DUT.reg_file.registers[3]);
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