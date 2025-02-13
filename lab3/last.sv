module last(input logic [16:0] A, B, output logic [16:0]S,D, output logic OF_S,OF_D);
logic agreat,bgreat,equal;
bitcomparex16 bitcomp(A[15:0],B[15:0],agreat,bgreat,equal);
logic add1,addcarry;
assign add1= ~(A[16]^B[16]);//if 1/both num pos or both neg, add normally, else sub needed
logic [15:0] ts1; 
logic [16:0] td1, td2, td3, Sum;//temp sum
logic OF1, OF2, OF3;

XVIbitbrent brent(A[15:0],B[15:0],ts1,addcarry);//if add1 is 1, sum= ts1, OF_S=sum carry
logic tempers;
assign tempers=(A[15]^B[15])&((agreat&A[15])|(bgreat&B[15]));
assign Sum[16]=tempers;
assign Sum[15:0]=ts1;
sub17x sub12(A,B,td1,OF1);
sub17x sub123(B,A,td2,OF2);
assign td3=agreat ? td1 : td2;
assign OF3=agreat ? OF1 : OF2;
assign S=add1 ? Sum : td3;
assign OF_S=add1 ? addcarry : OF3;
sub17x suber(A,B,D,OF_D);
endmodule