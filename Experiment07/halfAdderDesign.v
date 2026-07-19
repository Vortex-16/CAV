// Experiment 07: Adders and Subtractors
// Q1: Half Adder Design
module half_adder (
    input a,
    input b,
    output sum,
    output carry
);

    // Sum = A XOR B
    assign sum = a ^ b;

    // Carry = A AND B
    assign carry = a & b;

endmodule
