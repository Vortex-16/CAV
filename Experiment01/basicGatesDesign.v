// Experiment 01: Basic Gates
// Q1: Basic Logic Gates Design
module basic_gates (
    input a,
    input b,
    output out_and,
    output out_or,
    output out_not_a,
    output out_nand,
    output out_nor,
    output out_xor,
    output out_xnor
);

    // Continuous assignment using bitwise logic operators
    assign out_and   = a & b;
    assign out_or    = a | b;
    assign out_not_a = ~a;
    assign out_nand  = ~(a & b);
    assign out_nor   = ~(a | b);
    assign out_xor   = a ^ b;
    assign out_xnor  = ~(a ^ b);

endmodule
