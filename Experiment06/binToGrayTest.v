module testbench_bin_to_gray;
    reg [3:0] bin;
    wire [3:0] gray;
    integer i;
    bin_to_gray uut (
        .bin(bin),
        .gray(gray)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_bin_to_gray);
        for (i = 0; i < 16; i = i + 1) begin
            bin = i;
            #100;
        end
        $finish;
    end

endmodule
