// Experiment 01: Basic Gates
// Q2: Universal Gates Implementation Testbench
module testbench_universal_gates;

    reg a;
    reg b;
    
    // Outputs from NAND-only realization
    wire nand_not_a;
    wire nand_and;
    wire nand_or;
    wire nand_xor;
    wire nand_xnor;

    // Outputs from NOR-only realization
    wire nor_not_a;
    wire nor_or;
    wire nor_and;
    wire nor_xor;
    wire nor_xnor;

    integer i;

    // Instantiate NAND-only realization
    universal_nand uut_nand (
        .a(a),
        .b(b),
        .out_not_a(nand_not_a),
        .out_and(nand_and),
        .out_or(nand_or),
        .out_xor(nand_xor),
        .out_xnor(nand_xnor)
    );

    // Instantiate NOR-only realization
    universal_nor uut_nor (
        .a(a),
        .b(b),
        .out_not_a(nor_not_a),
        .out_or(nor_or),
        .out_and(nor_and),
        .out_xor(nor_xor),
        .out_xnor(nor_xnor)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_universal_gates);

        $display("Time\tA\tB\tNAND_NOT\tNOR_NOT\tNAND_AND\tNOR_AND\tNAND_OR\tNOR_OR\tNAND_XOR\tNOR_XOR\tNAND_XNOR\tNOR_XNOR");
        $display("-------------------------------------------------------------------------------------------------------------------------");

        for (i = 0; i < 4; i = i + 1) begin
            {a, b} = i;
            #100;
            $display("%0d\t%b\t%b\t%b\t\t%b\t%b\t\t%b\t%b\t%b\t%b\t\t%b\t%b\t\t%b", 
                     $time, a, b, nand_not_a, nor_not_a, nand_and, nor_and, nand_or, nor_or, nand_xor, nor_xor, nand_xnor, nor_xnor);
        end

        $finish;
    end

endmodule
