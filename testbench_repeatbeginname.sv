
// Instantiate the DUT and then try to reference signal in CD hierarchically

module testbench_repeatbeginname;
  parameter initA = 1;
  parameter initC = 1;

  logic clk, TestBenchReset, A, E;

  assign clk = 1'b0;

  assign A = 1'b0;
  assign E = 1'b0;

  initial begin
    TestBenchReset = 1;
    TestBenchReset = 0;
  end

  dut #(initA, initC) dut(.clk, .reset(TestBenchReset), .A, .E);

  logic B_tb, D_tb;

    always @(posedge clk)
    if (initA == 1) begin : A_logger
        B_tb = dut.A_blk.A_blk.E; // finds signal E under dut.A_blk.A_blk, but A_blk.A_blk is nonsense as we expect A_blk.A_mod.
        if (initC == 1) begin : C_logger
            D_tb = dut.A_blk.A_blk.A_blk; // This should not detect A_blk, as we are asking dut for A_blk inside A_blk inside A_blk. tells us it found a BEGIN
        end
    end

endmodule
