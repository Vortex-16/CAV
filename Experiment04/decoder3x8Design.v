// Experiment 04: Multiplexers and Decoders
// Q3: 3x8 Decoder Design
module decoder3x8 (
    input [2:0] in,
    input en,
    output reg [7:0] out
);

    always @(*) begin
        if (en) begin
            out = 8'd1 << in;
        end else begin
            out = 8'd0;
        end
    end

endmodule
