module final(input logic A [16:0], B, output logic [16]S,D, output logic Sc,Dc);
logic agreat,bgreat,equal;
bitcomparex16 bitc(A[15:0],B[15:0],agreat,bgreat,equal);
logic add1,addcarry;
assign add1= (~(A[16]|B[16])|(A[16]|B[16]));//if 1/both num pos or both neg, add normally, else sub needed
logic [15:0], ts1;//temp sum
XVIbitbrent brent(A[15:0],B[15:0],ts1,addcarry);//if add1 is 1, sum= ts1, Sc=sum carry
assign tsub=bgreat ? pmetD : tempD;
endmodule