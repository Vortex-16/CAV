// Experiment 05: Decoder, Encoder, Comparator
// Q2: 4-to-2 Priority Encoder Testbench
module testbench_priority_encoder;

    reg [3:0] d;
    wire [1:0] y;
    wire v;

    integer i;

    // Instantiate UUT
    priority_encoder uut (
        .d(d),
        .y(y),
        .v(v)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_priority_encoder);

        $display("Time\tInput d[3:0]\tOutput y[1:0]\tValid (v)");
        $display("-------------------------------------------------");

        for (i = 0; i < 16; i = i + 1) begin
            d = i;
            #100;
            $display("%0d\t%b\t\t%b\t\t%b", $time, d, y, v);
        end

        $finish;
    end

endmodule
