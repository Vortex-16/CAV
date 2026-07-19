// Experiment 04: Multiplexers and Decoders
// Q3: 3x8 Decoder Testbench
module testbench_decoder3x8;

    reg [2:0] in;
    reg en;
    wire [7:0] out;

    integer i;

    // Instantiate UUT
    decoder3x8 uut (
        .in(in),
        .en(en),
        .out(out)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_decoder3x8);

        $display("Time\tEnable\tInput\tOutput (out[7:0])");
        $display("--------------------------------------------");

        // Test with Enable = 0
        en = 0;
        in = 3'b000;
        #100;
        $display("%0d\t%b\t%b\t%b", $time, en, in, out);

        // Test with Enable = 1, sweep all 8 inputs
        en = 1;
        for (i = 0; i < 8; i = i + 1) begin
            in = i;
            #100;
            $display("%0d\t%b\t%b\t%b", $time, en, in, out);
        end

        $finish;
    end

endmodule
