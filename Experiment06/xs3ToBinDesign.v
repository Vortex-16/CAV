// Experiment 06: Code Converters
// Q5: Excess-3 to Binary Converter Design
module xs3_to_bin (
    input [3:0] xs3,
    output [3:0] bin
);

    // Binary code = Excess-3 code - 3 (0011)
    assign bin = xs3 - 4'b0011;

endmodule
