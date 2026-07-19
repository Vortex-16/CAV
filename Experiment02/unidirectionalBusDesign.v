// Experiment 02: Tri-State Buffer and Bus
// Q2: 4-bit Unidirectional Bus Design
module unidirectional_bus (
    input [3:0] in0,
    input [3:0] in1,
    input [3:0] in2,
    input [3:0] in3,
    input en0,
    input en1,
    input en2,
    input en3,
    output [3:0] bus_out
);

    // Multi-driver tri-state bus resolution in Verilog:
    // If only one enable is high, that input is placed on the bus.
    // If multiple enables are high, it results in a collision (X in simulation).
    // If no enables are high, the bus remains high impedance (Z).
    assign bus_out = en0 ? in0 : 4'bzzzz;
    assign bus_out = en1 ? in1 : 4'bzzzz;
    assign bus_out = en2 ? in2 : 4'bzzzz;
    assign bus_out = en3 ? in3 : 4'bzzzz;

endmodule
