module alu(input logic signed [31:0] A, B,
input logic [2:0] F,
output logic signed [31:0] Y,
output logic zero);
logic [31:0] BB,and1,or1,zeroextend,adds;
mux2_1_32 m1(B,(~B),F[2],BB);
assign and1=BB&A;
assign or1=BB|A;
assign adds=BB+A+F[2];
logic [30:0] zeros=31'b0;
assign zeroextend={zeros,adds[31]};
mux4_1_32 m2(and1,or1,adds,zeroextend,F[1:0]);
endmodule