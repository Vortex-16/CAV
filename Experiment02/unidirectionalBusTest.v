// Experiment 02: Tri-State Buffer and Bus
// Q2: 4-bit Unidirectional Bus Testbench
module testbench_unidirectional_bus;

    reg [3:0] in0;
    reg [3:0] in1;
    reg [3:0] in2;
    reg [3:0] in3;
    reg en0;
    reg en1;
    reg en2;
    reg en3;
    wire [3:0] bus_out;

    // Instantiate UUT
    unidirectional_bus uut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .en0(en0),
        .en1(en1),
        .en2(en2),
        .en3(en3),
        .bus_out(bus_out)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_unidirectional_bus);

        // Initialize inputs with unique test values
        in0 = 4'b1010; // A (10)
        in1 = 4'b1011; // B (11)
        in2 = 4'b1100; // C (12)
        in3 = 4'b1101; // D (13)

        // Initialize enables
        en0 = 0; en1 = 0; en2 = 0; en3 = 0;

        $display("Time\ten0 en1 en2 en3\tbus_out");
        $display("----------------------------------------");

        // 1. All disabled (expected: Z)
        #100;
        $display("%0d\t%b   %b   %b   %b\t%b", $time, en0, en1, en2, en3, bus_out);

        // 2. Enable in0 (expected: 1010)
        en0 = 1; #100;
        $display("%0d\t%b   %b   %b   %b\t%b", $time, en0, en1, en2, en3, bus_out);
        en0 = 0;

        // 3. Enable in1 (expected: 1011)
        en1 = 1; #100;
        $display("%0d\t%b   %b   %b   %b\t%b", $time, en0, en1, en2, en3, bus_out);
        en1 = 0;

        // 4. Enable in2 (expected: 1100)
        en2 = 1; #100;
        $display("%0d\t%b   %b   %b   %b\t%b", $time, en0, en1, en2, en3, bus_out);
        en2 = 0;

        // 5. Enable in3 (expected: 1101)
        en3 = 1; #100;
        $display("%0d\t%b   %b   %b   %b\t%b", $time, en0, en1, en2, en3, bus_out);
        en3 = 0;

        // 6. Conflict: multiple enables high (expected: xxxx)
        en0 = 1; en1 = 1; #100;
        $display("%0d\t%b   %b   %b   %b\t%b (Conflict)", $time, en0, en1, en2, en3, bus_out);

        $finish;
    end

endmodule
