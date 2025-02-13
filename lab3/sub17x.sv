module sub17x(input logic [16:0] A, B, output logic [16:0] D, output logic OF);
logic agreat,bgreat,equal;
bitcomparex16 bitc(A[15:0],B[15:0],agreat,bgreat,equal);
logic [15:0] tempD, pmetD, tsub, tadd, finD;//if doing proper subtraction, tsub is difference
logic Bout, tuoB, tBout,addcarry,fincarry;//if doing proper sub, tBout is bout
borrowX16 bor(A[15:0],B[15:0],Bout,tempD);
borrowX16 rob(B[15:0],A[15:0],tuoB,pmetD);
assign tsub=bgreat ? pmetD : tempD;
assign tBout=bgreat ? tuoB : Bout;
XVIbitbrent brent(A[15:0],B[15:0],tadd,addcarry);
assign finD=(A[16]^B[16]) ? tadd : tsub;
assign OF=(A[16]^B[16]) ? addcarry : tBout;
assign D[15:0]=equal&(~(A[16]^B[16])) ? 16'b0 : finD;

assign D[16]= (~(D[0] & D[1] &D[2] & D[3] & D[4] & D[5] & D[6] & D[7] & D[8] & D[9] & D[10] & D[15]& D[14]& D[13]& D[12]& D[11])&equal&(A[16]^B[16]))|(agreat&A[16])|(bgreat&(~B[16]));

endmodule