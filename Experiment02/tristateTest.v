// Experiment 02: Tri-State Buffer and Bus
// Q1: Tri-State Buffer Testbench
module testbench_tristate_4bit;

  reg en;
  reg [3:0] a;
  wire [3:0] z;

  integer i, j;

  tristate_4bit uut (
    .en(en),
    .a(a),
    .z(z)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench_tristate_4bit);

    $display("Time\tEnable\tInput A\tOutput Z");
    $display("--------------------------------");

    for (i = 0; i < 2; i = i + 1) begin
      en = i;
      for (j = 0; j < 16; j = j + 1) begin
        a = j;
        #100;
        $display("%0d\t%b\t%b\t%b", $time, en, a, z);
      end
    end

    $finish;
  end

endmodule
