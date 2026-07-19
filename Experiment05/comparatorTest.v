// Experiment 05: Decoder, Encoder, Comparator
// Q3: 4-Bit Magnitude Comparator Testbench
module testbench_magnitude_comparator;

    reg [3:0] a;
    reg [3:0] b;
    wire a_gt_b;
    wire a_eq_b;
    wire a_lt_b;

    // Task for clean test case presentation
    task test_compare(input [3:0] test_a, input [3:0] test_b);
        begin
            a = test_a;
            b = test_b;
            #100;
            $display("%0d\t%d (%b)\t%d (%b)\t%b\t%b\t%b", 
                     $time, a, a, b, b, a_gt_b, a_eq_b, a_lt_b);
        end
    endtask

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_magnitude_comparator);

        $display("Time\tInput A\t\tInput B\t\tA>B\tA=B\tA<B");
        $display("------------------------------------------------------------------");

        // Test Case 1: Both zero (Equal)
        test_compare(4'd0, 4'd0);

        // Test Case 2: A equal to B (non-zero)
        test_compare(4'd7, 4'd7);

        // Test Case 3: A equal to B (max value)
        test_compare(4'd15, 4'd15);

        // Test Case 4: A > B (LSB difference)
        test_compare(4'd5, 4'd4);

        // Test Case 5: A > B (MSB difference)
        test_compare(4'd8, 4'd1);

        // Test Case 6: A > B (general)
        test_compare(4'd12, 4'd3);

        // Test Case 7: A < B (LSB difference)
        test_compare(4'd4, 4'd5);

        // Test Case 8: A < B (MSB difference)
        test_compare(4'd1, 4'd8);

        // Test Case 9: A < B (general)
        test_compare(4'd3, 4'd12);

        $finish;
    end

endmodule
