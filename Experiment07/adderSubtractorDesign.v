module full_adder_sub (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module adder_subtractor_4bit (
    input [3:0] a,
    input [3:0] b,
    input ctrl,
    output [3:0] sum_diff,
    output carry_borrow
);

    wire [3:0] b_xor;
    wire c1, c2, c3;

    assign b_xor = b ^ {4{ctrl}};

    full_adder_sub fa0 (
        .a(a[0]),
        .b(b_xor[0]),
        .cin(ctrl),
        .sum(sum_diff[0]),
        .cout(c1)
    );

    full_adder_sub fa1 (
        .a(a[1]),
        .b(b_xor[1]),
        .cin(c1),
        .sum(sum_diff[1]),
        .cout(c2)
    );

    full_adder_sub fa2 (
        .a(a[2]),
        .b(b_xor[2]),
        .cin(c2),
        .sum(sum_diff[2]),
        .cout(c3)
    );

    full_adder_sub fa3 (
        .a(a[3]),
        .b(b_xor[3]),
        .cin(c3),
        .sum(sum_diff[3]),
        .cout(carry_borrow)
    );

endmodule
