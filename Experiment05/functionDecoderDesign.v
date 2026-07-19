// Experiment 05: Decoder, Encoder, Comparator
// Q1: Function Implementation using Decoder Design
//
// We will implement a Full Adder using a 3x8 Decoder and OR gates.
// Inputs: a, b, cin
// Outputs: sum, cout
//
// Equations:
// sum  = Sum m(1, 2, 4, 7)
// cout = Sum m(3, 5, 6, 7)

// Submodule: 3x8 Decoder
module decoder3x8_sub (
    input [2:0] in,
    output reg [7:0] out
);
    always @(*) begin
        out = 8'd1 << in;
    end
endmodule

// Main module: Function implementation using decoder
module function_decoder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    wire [7:0] d; // Decoder outputs d[0] to d[7]
    wire [2:0] decoder_in = {a, b, cin};

    // Instantiate the 3x8 decoder
    decoder3x8_sub dec (
        .in(decoder_in),
        .out(d)
    );

    // Sum = d[1] + d[2] + d[4] + d[7]
    assign sum = d[1] | d[2] | d[4] | d[7];

    // Cout = d[3] + d[5] + d[6] + d[7]
    assign cout = d[3] | d[5] | d[6] | d[7];

endmodule
