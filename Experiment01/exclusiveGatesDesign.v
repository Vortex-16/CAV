// Experiment 01: Basic Gates
// Q3: Exclusive Gates Realization Design
module exclusive_gates (
    input a,
    input b,
    output out_xor,
    output out_xnor
);

    wire a_and_not_b;
    wire not_a_and_b;
    wire a_and_b;
    wire not_a_and_not_b;

    // XOR realization: A ^ B = A.B' + A'.B
    assign a_and_not_b = a & (~b);
    assign not_a_and_b = (~a) & b;
    assign out_xor     = a_and_not_b | not_a_and_b;

    // XNOR realization: A ~^ B = A.B + A'.B'
    assign a_and_b         = a & b;
    assign not_a_and_not_b = (~a) & (~b);
    assign out_xnor        = a_and_b | not_a_and_not_b;

endmodule
