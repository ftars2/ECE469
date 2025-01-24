module bird(
    input logic [15:0] A, B,
    output logic [15:0] sum,c
    );


logic g[15:0],g1[7:0],g2[3:0],g3[1:0],g4;
logic p[15:0],p1[7:0],p2[3:0],p3[1:0],p4;

// logic cin;
assign c[0] = 1'b0;





carry c1(g[0], p[0], c[1]);
carry c2(g1[0], p1[0], c[2]);
carry c3(g[2], p[2], c[3]);
carry c4(g2[0],p2[0],c[4]);
carry c5(g[4],p[4],c[5]);
carry c6(g1[2],p1[2],c[6]);
carry c7(g[6],p[6],c[7]);
carry c8(g3[0],p3[0],c[8]);
carry c9(g[8],p[8],c[9]);
carry c10(g1[4],p1[4],c[9]);
carry c11(g[10],p[10],c[11]);
carry c12(g2[2],p[2],c[12]);
carry c13(g[12],p[12],c[13]);
carry c14(g1[6],p1[6],c[14]);
carry c15(g[14],p[14],c[15]);


assign sum = A ^ B ^ c;

endmodule
