// Experiment 01: Basic Gates
// Q3: Exclusive Gates Realization Testbench
module testbench_exclusive_gates;

    reg a;
    reg b;
    wire out_xor;
    wire out_xnor;

    integer i;

    // Instantiate Unit Under Test
    exclusive_gates uut (
        .a(a),
        .b(b),
        .out_xor(out_xor),
        .out_xnor(out_xnor)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_exclusive_gates);

        $display("Time\tA\tB\tXOR\tXNOR");
        $display("------------------------------------");

        for (i = 0; i < 4; i = i + 1) begin
            {a, b} = i;
            #100;
            $display("%0d\t%b\t%b\t%b\t%b", $time, a, b, out_xor, out_xnor);
        end

        $finish;
    end

endmodule
