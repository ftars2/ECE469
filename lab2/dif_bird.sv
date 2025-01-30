module dif_bird(
    input logic [15:0] A, B,
    output logic [15:0] dif,
    output logic [16:0] c,
    output logic of_dif    
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
all_gp dave(A,~B,g,p,g1,p1,g2,p2,g3,p3,g4,p4);
// logic cin;
assign c[0] = 1'b1;





carry c1(c[0],g[0], p[0], c[1]);
carry c2(c[0],g1[0], p1[0], c[2]);
carry c3(c[2],g[2], p[2], c[3]);
carry c4(c[0],g2[0],p2[0],c[4]);
carry c5(c[4],g[0],p[4],c[5]);
carry c6(c[4],g1[2],p1[2],c[6]);
carry c7(c[6],g[6],p[6],c[7]);
carry c8(c[0],g3[0],p3[0],c[8]);
carry c9(c[8],g[8],p[8],c[9]);
carry c10(c[8],g1[4],p1[4],c[10]);
carry c11(c[10],g[10],p[10],c[11]);
carry c12(c[8],g2[2],p[2],c[12]);
carry c13(c[12],g[12],p[12],c[13]);
carry c14(c[12],g1[6],p1[6],c[14]);
carry c15(c[14],g[14],p[14],c[15]);
carry c16(c[0],g4,p4,c[16]);

logic b;

assign b = ~B;
assign dif = ~(A ^ b ^ c[15:0]);

logic part1;
logic part2;
assign part1=~(A[15])&(B[15])&dif[15];
assign part2=(A[15])&~(B[15])&~dif[15];
assign of_dif=part1|part2;
endmodule
