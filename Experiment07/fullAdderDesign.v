// Experiment 07: Adders and Subtractors
// Q2: Full Adder Design
module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    // Sum = A XOR B XOR Cin
    assign sum = a ^ b ^ cin;

    // Cout = A.B + B.Cin + A.Cin
    assign cout = (a & b) | (b & cin) | (a & cin);

endmodule
