// Experiment 03: Combinational Circuits
// Q2: 4-Bit Two's Complementer Design
module twos_complementer (
    input [3:0] in,
    output [3:0] out
);

    // Two's complement = One's complement + 1
    assign out = ~in + 4'b0001;

endmodule
