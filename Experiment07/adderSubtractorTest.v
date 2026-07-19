module testbench_adder_subtractor;

    reg [3:0] a;
    reg [3:0] b;
    reg ctrl;
    wire [3:0] sum_diff;
    wire carry_borrow;

    task run_test(input [3:0] test_a, input [3:0] test_b, input test_ctrl);
        begin
            a = test_a;
            b = test_b;
            ctrl = test_ctrl;
            #100;
            $display("%0d\t%b\t%d (%b)\t%d (%b)\t%d (%b)\t\t%b", 
                     $time, ctrl, a, a, b, b, $signed(sum_diff), sum_diff, carry_borrow);
        end
    endtask

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench_adder_subtractor);

        $display("Time\tCtrl\tInput A\t\tInput B\t\tResult (Signed)\tCout/Borrow");
        $display("----------------------------------------------------------------------------------");

        $display("--- ADDITION MODE (Ctrl = 0) ---");
        run_test(4'd5,  4'd3,  1'b0); // 5 + 3 = 8
        run_test(4'd12, 4'd2,  1'b0); // 12 + 2 = 14
        run_test(4'd10, 4'd10, 1'b0); // 10 + 10 = 20 (sum = 4, carry = 1)
        run_test(4'd0,  4'd0,  1'b0); // 0 + 0 = 0

        $display("--- SUBTRACTION MODE (Ctrl = 1) ---");
        run_test(4'd5,  4'd3,  1'b1); // 5 - 3 = 2
        run_test(4'd12, 4'd4,  1'b1); // 12 - 4 = 8
        run_test(4'd3,  4'd5,  1'b1); // 3 - 5 = -2 (represented as 1110)
        run_test(4'd0,  4'd5,  1'b1); // 0 - 5 = -5 (represented as 1011)

        $finish;
    end

endmodule
