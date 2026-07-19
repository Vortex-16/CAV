// Experiment 06: Code Converters
// Q3: Gray to Binary Converter Design
module gray_to_bin (
    input [3:0] gray,
    output [3:0] bin
);

    // Gray to Binary conversion:
    // B[3] = G[3]
    // B[2] = B[3] ^ G[2]
    // B[1] = B[2] ^ G[1]
    // B[0] = B[1] ^ G[0]
    assign bin[3] = gray[3];
    assign bin[2] = bin[3] ^ gray[2];
    assign bin[1] = bin[2] ^ gray[1];
    assign bin[0] = bin[1] ^ gray[0];

endmodule
