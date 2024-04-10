
module dut #(parameter integer initA=0, parameter integer initC=0) (
    input logic clk, reset, A,
    output logic E
);

if (initA == 1) begin : A_blk
    AB #(initC) A_mod(.clk, .reset, .B(A), .D(E));
end else begin : A_blk
    assign E = clk | reset;
end

endmodule
