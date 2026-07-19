// Experiment 04: Multiplexers and Decoders
// Q2: 8x1 Multiplexer using 4x1 MUX Design

// Submodule: 4x1 MUX
module mux4x1_sub (
    input [3:0] in,
    input [1:0] sel,
    output out
);
    assign out = in[sel];
endmodule

// Main module: 8x1 MUX
module mux8x1 (
    input [7:0] in,
    input [2:0] sel,
    output out
);

    wire m0_out;
    wire m1_out;

    // Instantiate two 4x1 multiplexers
    // First MUX handles lower inputs in[3:0]
    mux4x1_sub mux_low (
        .in(in[3:0]),
        .sel(sel[1:0]),
        .out(m0_out)
    );

    // Second MUX handles upper inputs in[7:4]
    mux4x1_sub mux_high (
        .in(in[7:4]),
        .sel(sel[1:0]),
        .out(m1_out)
    );

    // 2x1 MUX selection stage using sel[2]
    assign out = sel[2] ? m1_out : m0_out;

endmodule
