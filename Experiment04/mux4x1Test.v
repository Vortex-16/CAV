// Experiment 04: Multiplexers and Decoders
// Q1: 4x1 Multiplexer Testbench
module testbench_mux4x1;

    reg [3:0] in;
    reg [1:0] sel;
    wire out;

    integer i;

    // Instantiate UUT
    mux4x1 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_mux4x1);

        // Test with inputs = 4'b1010 (in[3]=1, in[2]=0, in[1]=1, in[0]=0)
        in = 4'b1010;

        $display("Time\tInput (in[3:0])\tSelect\tOutput");
        $display("--------------------------------------");

        for (i = 0; i < 4; i = i + 1) begin
            sel = i;
            #100;
            $display("%0d\t%b\t\t%b\t%b", $time, in, sel, out);
        end

        // Additional test case: change input value
        in = 4'b0101; // in[3]=0, in[2]=1, in[1]=0, in[0]=1
        for (i = 0; i < 4; i = i + 1) begin
            sel = i;
            #100;
            $display("%0d\t%b\t\t%b\t%b", $time, in, sel, out);
        end

        $finish;
    end

endmodule
