// Experiment 05: Decoder, Encoder, Comparator
// Q2: 4-to-2 Priority Encoder Design
module priority_encoder (
    input [3:0] d,
    output reg [1:0] y,
    output reg v
);

    always @(*) begin
        // Default values
        y = 2'b00;
        v = 1'b1;

        if (d[3]) begin
            y = 2'b11;
        end else if (d[2]) begin
            y = 2'b10;
        end else if (d[1]) begin
            y = 2'b01;
        end else if (d[0]) begin
            y = 2'b00;
        end else begin
            y = 2'b00;
            v = 1'b0; // No inputs active
        end
    end

endmodule
