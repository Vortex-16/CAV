// Experiment 05: Decoder, Encoder, Comparator
// Q1: Function Implementation using Decoder Testbench
module testbench_function_decoder;

    reg a;
    reg b;
    reg cin;
    wire sum;
    wire cout;

    integer i;

    // Instantiate UUT
    function_decoder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_function_decoder);

        $display("Time\tA B Cin\tSum Cout");
        $display("------------------------");

        for (i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i;
            #100;
            $display("%0d\t%b %b %b\t%b   %b", $time, a, b, cin, sum, cout);
        end

        $finish;
    end

endmodule
