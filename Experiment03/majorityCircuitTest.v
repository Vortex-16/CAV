// Experiment 03: Combinational Circuits
// Q1: 3-Input Majority Circuit Testbench
module testbench_majority_circuit;

    reg a;
    reg b;
    reg c;
    wire y;

    integer i;

    // Instantiate UUT
    majority_circuit uut (
        .a(a),
        .b(b),
        .c(c),
        .y(y)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_majority_circuit);

        $display("Time\tA\tB\tC\tY (Majority)");
        $display("--------------------------------------------");

        for (i = 0; i < 8; i = i + 1) begin
            {a, b, c} = i;
            #100;
            $display("%0d\t%b\t%b\t%b\t%b", $time, a, b, c, y);
        end

        $finish;
    end

endmodule
