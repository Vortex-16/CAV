// Experiment 02: Tri-State Buffer and Bus
// Q1: Tri-State Buffer Design

// 1-bit Tri-State Buffer
module tristate_buffer (
    input a,
    input en,
    output z
);
    assign z = en ? a : 1'bz;
endmodule

// 4-bit Tri-State Buffer (as featured in the testbench example)
module tristate_4bit (
    input en,
    input [3:0] a,
    output [3:0] z
);
    assign z = en ? a : 4'bzzzz;
endmodule
