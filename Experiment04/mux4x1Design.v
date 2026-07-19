// Experiment 04: Multiplexers and Decoders
// Q1: 4x1 Multiplexer Design
module mux4x1 (
    input [3:0] in,
    input [1:0] sel,
    output out
);

    // Using input vector selection based on sel
    assign out = in[sel];

endmodule
