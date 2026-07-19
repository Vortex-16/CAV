// Experiment 06: Code Converters
// Q4: Binary to Excess-3 Converter Testbench
module testbench_bin_to_xs3;

    reg [3:0] bin;
    wire [3:0] xs3;

    integer i;

    // Instantiate UUT
    bin_to_xs3 uut (
        .bin(bin),
        .xs3(xs3)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_bin_to_xs3);

        $display("Time\tBinary\tDecimal\tExcess-3");
        $display("----------------------------------------");

        // Sweep from 0 to 9 (standard BCD range) and beyond
        for (i = 0; i < 16; i = i + 1) begin
            bin = i;
            #100;
            $display("%0d\t%b\t%d\t%b (%d)", $time, bin, bin, xs3, xs3);
        end

        $finish;
    end

endmodule
