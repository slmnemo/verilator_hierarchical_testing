
// Instantiate the DUT and then try to reference signal in CD hierarchically

module testbench;
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
        B_tb = dut.A_blk.A_mod.int_AB; // This should be able to look into A_mod and find int_AB
        if (initC == 1) begin : C_logger
            D_tb = dut.A_blk.A_mod.C_blk.int_CD; // This should be able to look down hierarchically and find C_blk.
        end
    end

endmodule