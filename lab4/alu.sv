module alu(input logic [31:0] A, B,
input logic [2:0] F,
output logic [31:0] Y,
output logic zero);
logic [31:0] m1o,and1,or1;
mux2_1_32 m1(B,(~B),F[2],m1o);
assign and1=m1o&A;
assign or1=m10|A;
mux4_1_32 m2(and1,or1,ALU,zeroextend);
endmodule