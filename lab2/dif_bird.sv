module dif_bird(
    input  logic signed [15:0] A, B,
    output  logic signed [15:0] dif,
    output  logic signed[15:0] c,
    output logic of_dif    
    );


logic signed [15:0] b;
assign b[0] = ~(B[0]);
assign b[1] = ~(B[1]);
assign b[2] = ~(B[2]);
assign b[3] = ~(B[3]);
assign b[4] = ~(B[4]);
assign b[5] = ~(B[5]);
assign b[6] = ~(B[6]);
assign b[7] = ~(B[7]);
assign b[8] = ~(B[8]);
assign b[9] = ~(B[9]);
assign b[10] = ~(B[10]);
assign b[11] = ~(B[11]);
assign b[12] = ~(B[12]);
assign b[13] = ~(B[13]);
assign b[14] = ~(B[14]);
assign b[15] = ~(B[15]);
    logic [15:0] g;
    logic [7:0] g1;
    logic [3:0] g2;
    logic [1:0] g3;
    logic [15:0] p;
    logic [7:0] p1;
    logic [3:0] p2;
    logic [1:0] p3;
    logic g4,p4;
all_gp dave(A,b,g,p,g1,p1,g2,p2,g3,p3,g4,p4);
// logic cin;
assign c[0] = 1'b1;





carryy c1(c[0],g[0], p[0], c[1]);
carryy c2(c[0],g1[0], p1[0], c[2]);
carryy c3(c[2],g[2], p[2], c[3]);
carryy c4(c[0],g2[0],p2[0],c[4]);
carryy c5(c[4],g[0],p[4],c[5]);
carryy c6(c[4],g1[2],p1[2],c[6]);
carryy c7(c[6],g[6],p[6],c[7]);
carryy c8(c[0],g3[0],p3[0],c[8]);
carryy c9(c[8],g[8],p[8],c[9]);
carryy c10(c[8],g1[4],p1[4],c[10]);
carryy c11(c[10],g[10],p[10],c[11]);
carryy c12(c[8],g2[2],p[2],c[12]);
carryy c13(c[12],g[12],p[12],c[13]);
carryy c14(c[12],g1[6],p1[6],c[14]);
carryy c15(c[14],g[14],p[14],c[15]);
// carryy c16(c[0],g4,p4,c[16]);

assign dif[0] = ~(A[0] ^ B[0] ^ c[0]);
assign dif[1] = ~(A[1] ^ B[1] ^ c[1]);
assign dif[2] = ~(A[2] ^ B[2] ^ c[2]);
assign dif[3] = ~(A[3] ^ B[3] ^ c[3]);
assign dif[4] = ~(A[4] ^ B[4] ^ c[4]);
assign dif[5] = ~(A[5] ^ B[5] ^ c[5]);
assign dif[6] = ~(A[6] ^ B[6] ^ c[6]);
assign dif[7] = ~(A[7] ^ B[7] ^ c[7]);
assign dif[8] = ~(A[8] ^ B[8] ^ c[8]);
assign dif[9] = ~(A[9] ^ B[9] ^ c[9]);
assign dif[10] = ~(A[10] ^ B[10] ^ c[10]);
assign dif[11] = ~(A[11] ^ B[11] ^ c[11]);
assign dif[12] = ~(A[12] ^ B[12] ^ c[12]);
assign dif[13] = ~(A[13] ^ B[13] ^ c[13]);
assign dif[14] = ~(A[14] ^ B[14] ^ c[14]);
assign dif[15] = ~(A[15] ^ B[15] ^ c[15]);

logic part1;
logic part2;
assign part1=~(A[15])&(B[15])&dif[15];
assign part2=(A[15])&~(B[15])&~dif[15];
assign of_dif=part1|part2;
endmodule
