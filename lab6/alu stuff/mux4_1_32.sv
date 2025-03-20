module mux4_1_32( input logic [31:0] D0, D1,D2,D3, input logic [1:0] S,//chooses between input D0 and D1 based on S, and passes chosen value to Y
output logic [31:0] Y);
logic [31:0] m1,m2;
mux2_1_32 p1(D0,D1,S[0],m1);
mux2_1_32 p2(D2,D3,S[0],m2);
mux2_1_32 p3(m1,m2,S[1],Y);
endmodule