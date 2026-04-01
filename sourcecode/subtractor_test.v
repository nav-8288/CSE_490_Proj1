module subtractor_test;

reg [15:0] a;
reg [15:0] b;
wire [15:0] out;

subtractor uut(
    .a(a),
    .b(b),
    .out(out)
);

initial begin

a = 16'd10;
b = 16'd3;

#10;

$display("Result = %d", out);

end

endmodule
