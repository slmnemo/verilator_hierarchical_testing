
module AB #(parameter integer initC) (
    input logic clk, reset, B,
    output logic D
);

logic int_AB;

if (initC == 1) begin : C_blk
    CD C_mod(.clk, .reset, .C(B), .D(int_AB));
end else begin : C
    assign D = ~B;
end

assign D = int_AB;

endmodule
