// Experiment 07: Adders and Subtractors
// Q2: Full Adder Testbench
module testbench_full_adder;

    reg a;
    reg b;
    reg cin;
    wire sum;
    wire cout;

    integer i;

    // Instantiate UUT
    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_full_adder);

        $display("Time\tA\tB\tCin\tSum\tCout");
        $display("--------------------------------------------");

        for (i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i;
            #100;
            $display("%0d\t%b\t%b\t%b\t%b\t%b", $time, a, b, cin, sum, cout);
        end

        $finish;
    end

endmodule
