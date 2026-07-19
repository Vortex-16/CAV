// Experiment 06: Code Converters
// Q3: Gray to Binary Converter Testbench
module testbench_gray_to_bin;

    reg [3:0] gray;
    wire [3:0] bin;

    integer i;

    // Instantiate UUT
    gray_to_bin uut (
        .gray(gray),
        .bin(bin)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_gray_to_bin);

        $display("Time\tGray\tBinary");
        $display("----------------------------");

        for (i = 0; i < 16; i = i + 1) begin
            gray = i;
            #100;
            $display("%0d\t%b\t%b", $time, gray, bin);
        end

        $finish;
    end

endmodule
