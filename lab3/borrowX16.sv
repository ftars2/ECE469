module borrowX16(input logic [15:0] A,B,output logic Bout, output logic [15:0] D);
    logic [15:0] bout;
    borrow bor1(1'b0,A[0],B[0],bout[0],D[0]);
    borrow bor2(bout[0],A[1],B[1],bout[1],D[1]);
    borrow bor3(bout[1],A[2],B[2],bout[2],D[2]);  
    borrow bor4(bout[2],A[3],B[3],bout[3],D[3]);  
    borrow bor5(bout[3],A[4],B[4],bout[4],D[4]);  
    borrow bor6(bout[4],A[5],B[5],bout[5],D[5]);  
    borrow bor7(bout[5],A[6],B[6],bout[6],D[6]);  
    borrow bor8(bout[6],A[7],B[7],bout[7],D[7]);  
    borrow bor9(bout[7],A[8],B[8],bout[8],D[8]);  
    borrow bor10(bout[8],A[9],B[9],bout[9],D[9]);  
    borrow bor11(bout[9],A[10],B[10],bout[10],D[10]);  
    borrow bor12(bout[10],A[11],B[11],bout[11],D[11]);  
    borrow bor13(bout[11],A[12],B[12],bout[12],D[12]);  
    borrow bor14(bout[12],A[13],B[13],bout[13],D[13]);  
    borrow bor15(bout[13],A[14],B[14],bout[14],D[14]);  
    borrow bor16(bout[14],A[15],B[15],Bout,D[15]);     
endmodule