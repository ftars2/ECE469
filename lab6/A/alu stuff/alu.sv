module alu(input logic signed [31:0] a, b,
input logic [2:0] f,
output logic signed [31:0] y,
output logic zero,OF);
logic [31:0] BB,and1,or1;
logic [31:0] zeroextend;
logic [31:0] adds;
mux2_1_32 m1(b,(~b),f[2],BB);
assign and1=BB&a;
assign or1=BB|a;
addof aaa(a,BB,f[2],adds,OF);
// assign adds=BB+a+f[2];
// slt setl(a,b,adds,zeroextend);
zeroEX z1(adds,OF,zeroextend);

mux4_1_32 m2(and1,or1,adds,zeroextend,f[1:0],y);

assign zero= ~(y[31] | y[30] | y[29] | y[28] | y[27] | y[26] | y[25] | y[24] | 
y[23] | y[22] | y[21] | y[20] | y[19] | y[18] | y[17] | y[16] | 
y[15] | y[14] | y[13] | y[12] | y[11] | y[10] | y[9]  | y[8]  | 
y[7]  | y[6]  | y[5]  | y[4]  | y[3]  | y[2]  | y[1]  | y[0]);

endmodule