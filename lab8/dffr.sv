module DFFR #(parameter WIDTH=4)   
            (input logic clk, reset,enable,
input logic [WIDTH-1:0] d, rval,
output logic [WIDTH-1:0] q);
always_ff @(posedge clk or posedge reset)
    if (reset) q<= rval;
    else if (enable) q<= d;
endmodule