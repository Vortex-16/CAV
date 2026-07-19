// Experiment 05: Decoder, Encoder, Comparator
// Q3: 4-Bit Magnitude Comparator Design
module magnitude_comparator (
    input [3:0] a,
    input [3:0] b,
    output a_gt_b,
    output a_eq_b,
    output a_lt_b
);

    // Using behavioral descriptions
    assign a_gt_b = (a > b);
    assign a_eq_b = (a == b);
    assign a_lt_b = (a < b);

endmodule
