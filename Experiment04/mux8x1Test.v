// Experiment 04: Multiplexers and Decoders
// Q2: 8x1 Multiplexer using 4x1 MUX Testbench
module testbench_mux8x1;

    reg [7:0] in;
    reg [2:0] sel;
    wire out;

    integer i;

    // Instantiate UUT
    mux8x1 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_mux8x1);

        // Test with inputs = 8'b10100110
        // in[7]=1, in[6]=0, in[5]=1, in[4]=0, in[3]=0, in[2]=1, in[1]=1, in[0]=0
        in = 8'b10100110;

        $display("Time\tInput (in[7:0])\tSelect\tOutput");
        $display("--------------------------------------");

        for (i = 0; i < 8; i = i + 1) begin
            sel = i;
            #100;
            $display("%0d\t%b\t\t%b\t%b", $time, in, sel, out);
        end

        $finish;
    end

endmodule
