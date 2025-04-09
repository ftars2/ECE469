module flop(input logic [3:0] newd, pre, input logic Vx, re, clk, output logic old);
    DFFR #(4) a(clk,re,Vx,newd,pre,old);

endmodule

module DFFR #(parameter WIDTH=4)   
            (input logic clk, reset,enable,
input logic [WIDTH-1:0] d, rval,
output logic [WIDTH-1:0] q);
always_ff @(posedge clk or posedge reset)
    if (reset) q<= rval;
    else if (enable) q<= d;
endmodule

module flip(input logic Cv, clk, reset, output logic Ov);
DFFR #(1) b(clk,reset,1'b1,Cv,1'b0,Ov);

endmodule