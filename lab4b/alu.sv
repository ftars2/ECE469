module alu(input logic signed [31:0] A, B,
input logic [2:0] F,
output logic signed [31:0] Y,
output logic zero,OF);
logic [31:0] BB,and1,or1;
logic [31:0] zeroextend;
logic [31:0] adds;
mux2_1_32 m1(B,(~B),F[2],BB);
assign and1=BB&A;
assign or1=BB|A;
assign adds=BB+A+F[2];
// slt setl(A,B,adds,zeroextend);
zeroEX z1(in,OF,zeroextend);

mux4_1_32 m2(and1,or1,adds,zeroextend,F[1:0],Y);
// mux2_1_1 m3(aof,zeroextend[32],F[1],OF);
assign zero= ~(Y[31] | Y[30] | Y[29] | Y[28] | Y[27] | Y[26] | Y[25] | Y[24] | 
Y[23] | Y[22] | Y[21] | Y[20] | Y[19] | Y[18] | Y[17] | Y[16] | 
Y[15] | Y[14] | Y[13] | Y[12] | Y[11] | Y[10] | Y[9]  | Y[8]  | 
Y[7]  | Y[6]  | Y[5]  | Y[4]  | Y[3]  | Y[2]  | Y[1]  | Y[0]);

endmodule