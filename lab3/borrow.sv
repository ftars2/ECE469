module borrow(input logic Bin, A,B, output logic Bout, D);
    logic temp1,temp2,temp3;
    assign temp1=A^B;
    assign D=temp1^Bin;
    assign temp2=~A&B;
    assign temp3=~temp1&Bin;
    assign Bout=temp3|temp2;
endmodule