// Experiment 06: Code Converters
// Q4: Binary to Excess-3 Converter Design
module bin_to_xs3 (
    input [3:0] bin,
    output [3:0] xs3
);

    // Excess-3 code = Binary code + 3 (0011)
    assign xs3 = bin + 4'b0011;

endmodule
