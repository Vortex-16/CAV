// Experiment 03: Combinational Circuits
// Q1: 3-Input Majority Circuit Design
module majority_circuit (
    input a,
    input b,
    input c,
    output y
);

    // Y = A.B + B.C + A.C
    assign y = (a & b) | (b & c) | (a & c);

endmodule
