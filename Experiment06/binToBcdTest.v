// Experiment 06: Code Converters
// Q1: Binary to BCD Converter Testbench
module testbench_bin_to_bcd;

    reg [3:0] bin;
    wire [7:0] bcd;

    integer i;

    // Instantiate UUT
    bin_to_bcd uut (
        .bin(bin),
        .bcd(bcd)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_bin_to_bcd);

        $display("Time\tBinary\tDecimal\tBCD Tens\tBCD Ones");
        $display("---------------------------------------------------------");

        for (i = 0; i < 16; i = i + 1) begin
            bin = i;
            #100;
            $display("%0d\t%b\t%d\t%b (%d)\t%b (%d)", 
                     $time, bin, bin, bcd[7:4], bcd[7:4], bcd[3:0], bcd[3:0]);
        end

        $finish;
    end

endmodule
