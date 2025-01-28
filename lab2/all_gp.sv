module all_gp(
    input logic [15:0] A, B,
    output logic [15:0] g,p,
    output logic[7:0] g1,p1,
    output logic [3:0] g2,p2,
    output logic [1:0] g3,p3,
    output logic g4,p4
);
logic [1:0] bus0, bus1, bus2, bus3, bus4, bus5, bus6, bus7;
logic [1:0] bus8, bus9, bus10, bus11, bus12, bus13, bus14, bus15;
logic [1:0] buss0, buss1, buss2, buss3, buss4, buss5, buss6, buss7;
logic [1:0] busss0, busss1, busss2, busss3;
logic [1:0] bussss0, bussss1;
xgp gp0(A[0], B[0], g[0], p[0]);
xgp gp1(A[1], B[1], g[1], p[1]);
xgp gp2(A[2], B[2], g[2], p[2]);
xgp gp3(A[3], B[3], g[3], p[3]);
xgp gp4(A[4], B[4], g[4], p[4]);
xgp gp5(A[5], B[5], g[5], p[5]);
xgp gp6(A[6], B[6], g[6], p[6]);
xgp gp7(A[7], B[7], g[7], p[7]);
xgp gp8(A[8], B[8], g[8], p[8]);
xgp gp9(A[9], B[9], g[9], p[9]);
xgp gp10(A[10], B[10], g[10], p[10]);
xgp gp11(A[11], B[11], g[11], p[11]);
xgp gp12(A[12], B[12], g[12], p[12]);
xgp gp13(A[13], B[13], g[13], p[13]);
xgp gp14(A[14], B[14], g[14], p[14]);
xgp gp15(A[15], B[15], g[15], p[15]);

assign bus0 = {g[1], g[0]};
assign bus1 = {g[3], g[2]};
assign bus2 = {g[5], g[4]};
assign bus3 = {g[7], g[6]};
assign bus4 = {g[9], g[8]};
assign bus5 = {g[11], g[10]};
assign bus6 = {g[13], g[12]};
assign bus7 = {g[15], g[14]};
assign bus8 = {p[1], p[0]};
assign bus9 = {p[3], p[2]};
assign bus10 = {p[5], p[4]};
assign bus11 = {p[7], p[6]};
assign bus12 = {p[9], p[8]};
assign bus13 = {p[11], p[10]};
assign bus14 = {p[13], p[12]};
assign bus15 = {p[15], p[14]};

xxgp gpp0(bus0, bus8, g1[0], p1[0]);
xxgp gpp1(bus1, bus9, g1[1], p1[1]);
xxgp gpp2(bus2, bus10, g1[2], p1[2]);
xxgp gpp3(bus3, bus11, g1[3], p1[3]);
xxgp gpp4(bus4, bus12, g1[4], p1[4]);
xxgp gpp5(bus5, bus13, g1[5], p1[5]);
xxgp gpp6(bus6, bus14, g1[6], p1[6]);
xxgp gpp7(bus7, bus15, g1[7], p1[7]);


assign buss0 = {g1[1], g1[0]};
assign buss1 = {g1[3], g1[2]};
assign buss2 = {g1[5], g1[4]};
assign buss3 = {g1[7], g1[6]};
assign buss4 = {p1[1], p1[0]};
assign buss5 = {p1[3], p1[2]};
assign buss6 = {p1[5], p1[4]};
assign buss7 = {p1[7], p1[6]};

xxgp gppp0(buss0, buss4, g2[0], p2[0]);
xxgp gppp1(buss1, buss5, g2[1], p2[1]);
xxgp gppp2(buss2, buss6, g2[2], p2[2]);
xxgp gppp3(buss3, buss7, g2[3], p2[3]);


assign busss0 = {g2[1], g2[0]};
assign busss1 = {g2[3], g2[2]};
assign busss2 = {p2[1], p2[0]};
assign busss3 = {p2[3], p2[2]};

xxgp gpppp0(busss0, busss2, g3[0], p3[0]);
xxgp gpppp1(busss1, busss3, g3[1], p3[1]);


assign bussss0 = {g3[1], g3[0]};
assign bussss1 = {p3[1], p3[0]};

xxgp gppppp0(bussss0, bussss1, g4, p4);

endmodule
