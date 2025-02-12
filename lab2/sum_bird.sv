module sum_bird(
    input logic [15:0] A, B,
    output logic [15:0] sum,
    output logic [15:0] c,
    output logic of_sum    
    );


    logic [15:0] g;
     logic [7:0] g1;
     logic [3:0] g2;
     logic [1:0] g3;
    logic [15:0] p;
    logic [7:0] p1;
    logic [3:0] p2;
    logic [1:0] p3;
    logic g4,p4;
all_gp dave(A,B,g,p,g1,p1,g2,p2,g3,p3,g4,p4);
// logic cin;
assign c[0] = 1'b0;





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

assign sum[0] = A[0] ^ B[0] ^ c[0];
assign sum[1] = A[1] ^ B[1] ^ c[1];
assign sum[2] = A[2] ^ B[2] ^ c[2];
assign sum[3] = A[3] ^ B[3] ^ c[3];
assign sum[4] = A[4] ^ B[4] ^ c[4];
assign sum[5] = A[5] ^ B[5] ^ c[5];
assign sum[6] = A[6] ^ B[6] ^ c[6];
assign sum[7] = A[7] ^ B[7] ^ c[7];
assign sum[8] = A[8] ^ B[8] ^ c[8];
assign sum[9] = A[9] ^ B[9] ^ c[9];
assign sum[10] = A[10] ^ B[10] ^ c[10];
assign sum[11] = A[11] ^ B[11] ^ c[11];
assign sum[12] = A[12] ^ B[12] ^ c[12];
assign sum[13] = A[13] ^ B[13] ^ c[13];
assign sum[14] = A[14] ^ B[14] ^ c[14];
assign sum[15] = A[15] ^ B[15] ^ c[15];
logic part1;
logic part2;
assign part1=~(A[15])&~(B[15])&sum[15];
assign part2=(A[15])&(B[15])&~sum[15];
assign of_sum=part1|part2;
endmodule