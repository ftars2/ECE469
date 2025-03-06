module flipR(input logic clk, reset,
input logic [3:0] d, rval,
output logic [3:0] q);
always_ff @(posedge clk, posedge reset)
    if (reset) q<= rval;
    else q<= d;
endmodule