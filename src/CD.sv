
module CD (
    input logic clk, reset, C,
    output logic D
);

logic int_CD;

always_ff @(posedge clk) begin
    if (reset)
        int_CD <= 0;
    else
        int_CD <= ~C;
end

assign D = ~int_CD;

endmodule
