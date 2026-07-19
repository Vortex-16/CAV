// Experiment 03: Combinational Circuits
// Q3A: K-Map Minimization Testbench
module testbench_kmap_minimization;

    reg a;
    reg b;
    reg c;
    reg d;
    wire f;

    integer i;

    // Instantiate UUT
    kmap_minimization uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .f(f)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_kmap_minimization);

        $display("Time\tA B C D\tF (Output)");
        $display("--------------------------------");

        for (i = 0; i < 16; i = i + 1) begin
            {a, b, c, d} = i;
            #100;
            $display("%0d\t%b %b %b %b\t%b", $time, a, b, c, d, f);
        end

        $finish;
    end

endmodule
