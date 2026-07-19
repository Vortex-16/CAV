// Experiment 03: Combinational Circuits
// Q3B: Custom 3-bit prime detector Testbench
module testbench_prime_detector;

    reg a;
    reg b;
    reg c;
    wire p;

    integer i;

    // Instantiate UUT
    prime_detector uut (
        .a(a),
        .b(b),
        .c(c),
        .p(p)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_prime_detector);

        $display("Time\tDecimal\tA B C\tPrime Output (P)");
        $display("----------------------------------------");

        for (i = 0; i < 8; i = i + 1) begin
            {a, b, c} = i;
            #100;
            $display("%0d\t%d\t%b %b %b\t%b", $time, i, a, b, c, p);
        end

        $finish;
    end

endmodule
