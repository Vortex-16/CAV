// Experiment 06: Code Converters
// Q5: Excess-3 to Binary Converter Testbench
module testbench_xs3_to_bin;

    reg [3:0] xs3;
    wire [3:0] bin;

    integer i;

    // Instantiate UUT
    xs3_to_bin uut (
        .xs3(xs3),
        .bin(bin)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_xs3_to_bin);

        $display("Time\tExcess-3\tDecimal\tBinary Output");
        $display("----------------------------------------------");

        // Sweep from 3 to 12 (representing decimals 0 to 9) and others
        for (i = 0; i < 16; i = i + 1) begin
            xs3 = i;
            #100;
            $display("%0d\t%b (%d)\t\t%d\t%b", $time, xs3, xs3, $signed(bin), bin);
        end

        $finish;
    end

endmodule
