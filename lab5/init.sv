module init( input logic clk, init, swapxy, input logic [2:0] x, y,
output logic [3:0] r[7:0] 
);
flipR r0(clk,init,4'b0,4'b1111,r[0]);
flipR r0(clk,init,4'b0,4'b1111,r[1]);
flipR r2(clk,init,4'b0,4'b1111,r[2]);
flipR r3(clk,init,4'b0,4'b1111,r[3]);
flipR r4(clk,init,4'b0,4'b1111,r[4]);
flipR r5(clk,init,4'b0,4'b1111,r[5]);
flipR r6(clk,init,4'b0,4'b1111,r[6]);
flipR r7(clk,init,4'b0,4'b1111,r[7]);
endmodule