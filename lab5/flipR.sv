module flipR(input logic clk, reset,enable,
input logic [3:0] d, rval,
output logic [3:0] q);
always_ff @(posedge clk or posedge reset)
    if (reset) q<= rval;
    else if (enable) q<= d;
endmodule