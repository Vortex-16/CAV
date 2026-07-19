// Experiment 01: Basic Gates
// Q1: Basic Logic Gates Testbench
module testbench_basic_gates;

    reg a;
    reg b;
    wire out_and;
    wire out_or;
    wire out_not_a;
    wire out_nand;
    wire out_nor;
    wire out_xor;
    wire out_xnor;

    integer i;

    // Instantiate Unit Under Test
    basic_gates uut (
        .a(a),
        .b(b),
        .out_and(out_and),
        .out_or(out_or),
        .out_not_a(out_not_a),
        .out_nand(out_nand),
        .out_nor(out_nor),
        .out_xor(out_xor),
        .out_xnor(out_xnor)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_basic_gates);

        // Print header for console output
        $display("Time\tA\tB\tAND\tOR\tNOT_A\tNAND\tNOR\tXOR\tXNOR");
        $display("----------------------------------------------------------------------");

        // Loop through all 4 input combinations
        for (i = 0; i < 4; i = i + 1) begin
            {a, b} = i;
            #100;
            $display("%0d\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", 
                     $time, a, b, out_and, out_or, out_not_a, out_nand, out_nor, out_xor, out_xnor);
        end

        $finish;
    end

endmodule
