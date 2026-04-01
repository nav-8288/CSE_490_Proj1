
/* Module describes a 1 bit full adder circuit */
module fulladder(A, B, Cin, S, Cout);
    output S, Cout;
    input A, B, Cin;

    wire notA, notB, notCin;
    wire G, H, I, W, X, Y, Z;

    /*Code for inverting inputs A, B, and Cin */
    not(notA, A); /*Inverted val of A */
    not(notB, B); /*Inverted val of B*/
    not(notCin, Cin); /*Inverted val of Cin*/

    /*Code for the sum part of full adder */
    and g1(W, notA, notB, Cin); /*W is the wire that holds result of notA, notB, and Cin ANDED together */
    and g2(X, B, notA, notCin); /*X is the wire that holds result of B, notA, and notCin ANDED together */
    and g3(Y, notCin, notB, A); /*Y is the wire that holds result of notCin, notB, and A ANDED together */
    and g4(Z, A, B, Cin);       /*Z is the wire that holds result of A, B, and Cin ANDED together  */
    or g5(S, W, X, Y, Z);       /*S is the output that holds the result of W, X, Y, and Z OR'D together  */

    /*Code for the COUT part of full adder   */

    and g6(G, A, B); /*G is the wire that holds the result of A and B ANDED together  */
    and g7(H, B, Cin); /*H is the wire that holds the result of B and Cin ANDED together*/
    and g8(I, Cin, A); /*I is the wire that holds the result of Cin and A ANDED together */
    or g9(Cout, G, H, I ); /*Cout is the output that holds the result of G, H, and I OR'D together  */

endmodule // fulladder


module mux (i_zero, S, i_one, Y);
    output Y;
    input i_zero, i_one, S;

    wire W, X, not_S;

    not(not_S, S); /*Inverted val of S*/

    and g1(W, i_zero, not_S); /*W is the wire that holds the result of i_zero and not_S ANDED together */
    and g2(X, S, i_one); /*X is the wire that holds the result of s and i_one ANDED together*/
    or g3(Y, W, X); /*Y is the output of W and X OR'D together */

endmodule //mux



/*Below is the 16 bit adder/subtractor, I inverted all the 16 B inputs for the mux and then put that result into the 16 full adders  */
module sixteen_bit_add_or_sub(SUB, A, B, Cout, V, S);

    input [15:0] A, B;
    input       SUB;
    output       Cout;
    output       V;
    output [15:0] S;
    wire [15:0]   notB;
    wire [15:0]   Y_from_mux;
    wire [15:0]   C;

    /*Invert all 16 B inputs */

    not notb0(notB[0], B[0]);
    not notb1(notB[1], B[1]);
    not notb2(notB[2], B[2]);
    not notb3(notB[3], B[3]);
    not notb4(notB[4], B[4]);
    not notb5(notB[5], B[5]);
    not notb6(notB[6], B[6]);
    not notb7(notB[7], B[7]);
    not notb8(notB[8], B[8]);
    not notb9(notB[9], B[9]);
    not notb10(notB[10], B[10]);
    not notb11(notB[11], B[11]);
    not notb12(notB[12], B[12]);
    not notb13(notB[13], B[13]);
    not notb14(notB[14], B[14]);
    not notb15(notB[15], B[15]);

    /*i_zero, S, i_one, Y */
    /*Use mux code to work with B and notB as well as Y_from_mux 16 times  */

    mux mux_0 (B[0], SUB, notB[0], Y_from_mux[0]);
    mux mux_1 (B[1], SUB, notB[1], Y_from_mux[1]);
    mux mux_2 (B[2], SUB, notB[2], Y_from_mux[2]);
    mux mux_3 (B[3], SUB, notB[3], Y_from_mux[3]);
    mux mux_4 (B[4], SUB, notB[4], Y_from_mux[4]);
    mux mux_5 (B[5], SUB, notB[5], Y_from_mux[5]);
    mux mux_6 (B[6], SUB, notB[6], Y_from_mux[6]);
    mux mux_7 (B[7], SUB, notB[7], Y_from_mux[7]);
    mux mux_8 (B[8], SUB, notB[8], Y_from_mux[8]);
    mux mux_9 (B[9], SUB, notB[9], Y_from_mux[9]);
    mux mux_10 (B[10], SUB, notB[10], Y_from_mux[10]);
    mux mux_11 (B[11], SUB, notB[11], Y_from_mux[11]);
    mux mux_12 (B[12], SUB, notB[12], Y_from_mux[12]);
    mux mux_13 (B[13], SUB, notB[13], Y_from_mux[13]);
    mux mux_14 (B[14], SUB, notB[14], Y_from_mux[14]);
    mux mux_15 (B[15], SUB, notB[15], Y_from_mux[15]);

    /*Take result from mux and plug into all 16 full adders  */
    fulladder f0(A[0], Y_from_mux[0], SUB, S[0], C[0]);
    fulladder f1(A[1], Y_from_mux[1], C[0], S[1], C[1]);
    fulladder f2(A[2], Y_from_mux[2], C[1], S[2], C[2]);
    fulladder f3(A[3], Y_from_mux[3], C[2], S[3], C[3]);
    fulladder f4(A[4], Y_from_mux[4], C[3], S[4], C[4]);
    fulladder f5(A[5], Y_from_mux[5], C[4], S[5], C[5]);
    fulladder f6(A[6], Y_from_mux[6], C[5], S[6], C[6]);
    fulladder f7(A[7], Y_from_mux[7], C[6], S[7], C[7]);
    fulladder f8(A[8], Y_from_mux[8], C[7], S[8], C[8]);
    fulladder f9(A[9], Y_from_mux[9], C[8], S[9], C[9]);
    fulladder f10(A[10], Y_from_mux[10], C[9], S[10], C[10]);
    fulladder f11(A[11], Y_from_mux[11], C[10], S[11], C[11]);
    fulladder f12(A[12], Y_from_mux[12], C[11], S[12], C[12]);
    fulladder f13(A[13], Y_from_mux[13], C[12], S[13], C[13]);
    fulladder f14(A[14], Y_from_mux[14], C[13], S[14], C[14]);
    fulladder f15(A[15], Y_from_mux[15], C[14], S[15], C[15]);

    /* this is where the overflow (V) logic will go*/

    assign Cout = C[15];

    xor overflow(V, C[15], C[14]);

endmodule //16-bit add or sub
