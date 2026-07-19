module bin_to_bcd (
    input [3:0] bin,
    output reg [7:0] bcd 
);

    always @(*) begin
        if (bin < 4'd10) begin
            bcd[7:4] = 4'd0;
            bcd[3:0] = bin;
        end else begin
            bcd[7:4] = 4'd1;
            bcd[3:0] = bin - 4'd10;
        end
    end

endmodule
