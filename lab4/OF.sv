module OF(input logic [2:0] C, input logic [31:0] A,B,output logic O);
logic mo2,mo1,mo3, addof, subof;
mux2_1_1 m1(mo2,0'b1,(C[0]&C[1]&C[2]),O);//if SLT, OF=1, else more muxing
mux2_1_1 m2(0'b1,mo3(C[1]),mo2);//if doing add or sub operation (c[1]=1) calculate of,  else of=0
mux2_1_1 m3(subof,addof,mo3);//c[0]=0-> sub, else add oF calc

endmodule