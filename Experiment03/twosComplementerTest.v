// Experiment 03: Combinational Circuits
// Q2: 4-Bit Two's Complementer Testbench
module testbench_twos_complementer;

    reg [3:0] in;
    wire [3:0] out;

    integer i;

    // Instantiate UUT
    twos_complementer uut (
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_twos_complementer);

        $display("Time\tInput (Bin)\tInput (Dec)\tOutput (Bin)\tOutput (Dec)");
        $display("--------------------------------------------------------------------------");

        for (i = 0; i < 16; i = i + 1) begin
            in = i;
            #100;
            // Display decimal as signed integer (%d will show negative values if we cast to signed)
            $display("%0d\t%b\t\t%d\t\t%b\t\t%d", 
                     $time, in, $signed(in), out, $signed(out));
        end

        $finish;
    end

endmodule
