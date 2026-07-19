// Experiment 07: Adders and Subtractors
// Q1: Half Adder Testbench
module testbench_half_adder;

    reg a;
    reg b;
    wire sum;
    wire carry;

    integer i;

    // Instantiate UUT
    half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_half_adder);

        $display("Time\tA\tB\tSum\tCarry");
        $display("------------------------------------");

        for (i = 0; i < 4; i = i + 1) begin
            {a, b} = i;
            #100;
            $display("%0d\t%b\t%b\t%b\t%b", $time, a, b, sum, carry);
        end

        $finish;
    end

endmodule
