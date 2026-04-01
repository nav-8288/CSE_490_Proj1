/*Create the wrapping module*/
module testbench(); /*NO I/O */
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars (0, testbench);
    end

    wire [15:0] S; /*S will be the 16-bit signal vectors */
    wire Cout, V; /*Signals Cout, as well as overflow (V) */

    reg [15:0] A, B; /*reg A and B declared */
    reg SUB;  

    /*Now, need to instantiate the test bench as well as the module */
    testAdder test (A, B, SUB, S, Cout, V);

    sixteen_bit_add_or_sub adder (SUB, A, B, Cout, V, S);

endmodule // testbench


module testAdder(A, B, SUB, S, Cout, V);

input [15:0] S; /*Inputs and outputs get flipped  */
input Cout, V;  /*testbench outputs are inputs to module under testing */

output reg [15:0] A, B;
output reg SUB;

    initial begin
        $monitor($time, "A=%d, B=%d, SUB=%b, S=%d, Cout=%b, V=%b", A, B, SUB, S, Cout, V);
        /*These tests prove the circuit adds properly */

        /*ADDITION TEST 1*/
    #20 A=54300; B=453; SUB=0; /* 54300 + 453 EXPECTED: S = 54753, Cout = 0, V = 0 */

    /*ADDITION TEST 2*/
    #20 A=7002; B=4599; SUB=0;  /* 7002 + 4599 EXPECTED: S = 11601, Cout = 0, V = 0 */

     /*ADDITION TEST 3*/
    #20 A=9999; B=1245; SUB=0; /* 9999 + 1245 EXPECTED: S = 11244, Cout = 0, V = 0 */

    /*ADDITION TEST 4*/
    #20 A=49344; B=2455; SUB=0; /* 49344 + 2455 EXPECTED: S = 51799, Cout = 0, V = 0 */

    /*ADDITION TEST 5*/
    #20 A=4345; B=1232; SUB=0; /* 4345 + 1232 EXPECTED: S = 5577, Cout = 0, V = 0 */

    /*These tests prove the circuit subtracts properly */

     /*SUBTRACTION TEST 1*/
    #20 A=10000; B=9550; SUB=1;  /* 10000 - 9550 EXPECTED: S = 450, Cout = 1, V = 0 */

    /*SUBTRACTION TEST 2*/
    #20 A=9654; B=6789; SUB=1; /* 9654 - 6789 EXPECTED: S = 2865, Cout = 1, V = 0 */

     /*SUBTRACTION TEST 3*/
    #20 A=11111; B=1111; SUB=1; /* 11111 - 1111 EXPECTED: S = 10000, Cout = 1, V = 0 */

    /*SUBTRACTION TEST 4*/
    #20 A=25000; B=15000; SUB=1; /* 25000 - 15000 EXPECTED: S = 10000, Cout = 1, V = 0 */

    /*SUBTRACTION TEST 5*/
    #20 A=5000; B=3000; SUB=1; /* 5000 - 3000 EXPECTED: S = 2000, Cout = 1, V = 0 */



    /*These tests prove the circuit flags signed overflow (V) */

     /* overflow TEST 1*/
    #20 A=32767; B=1; SUB=0; /* 32767 + 1 EXPECTED: S = 32768, Cout = 0, V = 1 */

    /*overflow TEST 2*/
    #20 A=30000; B=10000; SUB=0; /* 30000 + 10000 EXPECTED: S = 40000, Cout = 0, V = 1 */

     /*overflow TEST 3*/
    #20 A=-32768; B=1; SUB=1; /* -32768 - 1 EXPECTED: S = 32767, Cout = 1, V = 1 */

    /*overflow TEST 4*/
    #20 A=-25000; B=-10000; SUB=0; /* -25000 + -10000 EXPECTED: S = 30536, Cout = 1, V = 1 */

    /*overflow TEST 5*/
    #20 A= 32000; B=1000; SUB=0; /* 32000 + 1000 EXPECTED: S = 33000, Cout = 0, V = 1 */




    /*These tests prove the circuit  DOES NOT GENERATE OVERFLOW WHEN OVERFLOW DOES NOT OCCUR */

     /*no_overflow TEST 1*/
    #20 A=15000; B=15000; SUB=0; /* 15000 + 15000 EXPECTED: S = 30000, Cout = 0, V = 0 */

    /*no_overflow TEST 2*/
    #20 A=5000; B=2500; SUB=1; /* 5000 - 2500 EXPECTED: S = 2500, Cout = 1, V = 0 */

     /*no_overflow TEST 3*/
    #20 A=-2500; B=-10000; SUB=1; /* -2500 - -10000 EXPECTED: S = 7500, Cout = 1, V = 0 */

    /*no_overflow TEST 4*/
    #20 A=5004; B=234; SUB=0; /* 5004 + 234 EXPECTED: S = 5238, Cout = 0, V = 0 */

    /*no_overflow TEST 5*/
    #20 A=2455; B=4325; SUB=0; /* 2455 + 4325 EXPECTED: S = 6780, Cout = 0, V = 0 */
    #20 $finish;
    end 

endmodule
