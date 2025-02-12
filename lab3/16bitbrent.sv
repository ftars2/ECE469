module XVIbitbrent(

	input logic [15:0] A, B,
	output logic [15:0] sum,
	output logic cout
	
);

logic [15:0] G, P, C;
logic [14:0] gij;
logic [10:0] gijblk, pijblk;

gpbit n0(A[0], B[0], G[0], P[0]);
gpbit n1(A[1], B[1], G[1], P[1]);
gpbit n2(A[2], B[2], G[2], P[2]);
gpbit n3(A[3], B[3], G[3], P[3]);
gpbit n4(A[4], B[4], G[4], P[4]);
gpbit n5(A[5], B[5], G[5], P[5]);
gpbit n6(A[6], B[6], G[6], P[6]);
gpbit n7(A[7], B[7], G[7], P[7]);
gpbit n8(A[8], B[8], G[8], P[8]);
gpbit n9(A[9], B[9], G[9], P[9]);
gpbit n10(A[10], B[10], G[10], P[10]);
gpbit n11(A[11], B[11], G[11], P[11]);
gpbit n12(A[12], B[12], G[12], P[12]);
gpbit n13(A[13], B[13], G[13], P[13]);
gpbit n14(A[14], B[14], G[14], P[14]);
gpbit n15(A[15], B[15], G[15], P[15]);

assign C[0] = 0;
assign C[1] = G[0];

gbit c2(G[1], P[1], G[0], gij[0]);
assign C[2] = gij[0];

gbit c3(G[2], P[2], gij[0], gij[1]);
assign C[3] = gij[1];

gpblk g0(G[3], P[3], G[2], P[2], gijblk[0], pijblk[0]);
gbit c4(gijblk[0], pijblk[0], gij[0], gij[2]);
assign C[4] = gij[2];

gbit c5(G[4], P[4], gij[2], gij[3]);
assign C[5] = gij[3];

gpblk g1(G[5], P[5], G[4], P[4], gijblk[1], pijblk[1]);
gbit c6(gijblk[1], pijblk[1], gij[2], gij[4]);
assign C[6] = gij[4];

gbit c7(G[6], P[6], gij[4], gij[5]);
assign C[7] = gij[5];

gpblk g2(G[7], P[7], G[6], P[6], gijblk[2], pijblk[2]);
gpblk g3(gijblk[2], pijblk[2], gijblk[1], pijblk[1], gijblk[3], pijblk[3]);
gbit c8(gijblk[3], pijblk[3], gij[2], gij[6]);
assign C[8] = gij[6];

gbit c9(G[8], P[8], gij[6], gij[7]);
assign C[9] = gij[7];

gpblk g4(G[9], P[9], G[8], P[8], gijblk[4], pijblk[4]);
gbit c10(gijblk[4], pijblk[4], gij[6], gij[8]);
assign C[10] = gij[8];


gbit c11(G[10], P[10], gij[8], gij[9]);
assign C[11] = gij[9];

gpblk g5(G[11], P[11], G[10], P[10], gijblk[5], pijblk[5]);
gpblk g6(gijblk[5], pijblk[5], gijblk[4], pijblk[4], gijblk[6], pijblk[6]);
gbit c12(gijblk[6], pijblk[6], gij[6], gij[10]);
assign C[12] = gij[10];


gbit c13(G[12], P[12], gij[10], gij[11]);
assign C[13] = gij[11];

gpblk g7(G[13], P[13], G[12], P[12], gijblk[7], pijblk[7]);
gbit c14(gijblk[7], pijblk[7], gij[10], gij[12]);
assign C[14] = gij[12];

gbit c15(G[14], P[14], gij[12], gij[13]);
assign C[15] = gij[13];

gblk g8(G[15], P[15], G[14], P[14], gijblk[8], pijblk[8]);
gblk g9(gijblk[8], pijblk[8], gijblk[7], pijblk[7], gijblk[9], pijblk[9]);
gblk g10(gijblk[9], pijblk[9], gijblk[6], pijblk[6], gijblk[10], pijblk[10]);
gbit c16(gijblk[10], pijblk[10], gij[6], gij[14]);
assign cout = gij[14];

assign sum = A ^ B ^ C;

endmodule
