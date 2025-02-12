module bitcomparex16(input logic [15:0] a,b, output logic agreat, bgreat, equal);
    logic var1,var2,var3,var4;
    bitcomparex8 lowdut(a[7:0],b[7:0],var1);
    bitcomparex8 woldut(b[7:0],a[7:0],var2);

    bitcomparex8 highdut(a[15:8],b[15:8],var3);
    bitcomparex8 hgihdut(b[15:8],a[15:8],var4);

    assign agreat= ((~(var3|var4))&var1)|var3;
    assign bgreat= (~(var4^var3)&var2)|var4;
    logic [15:0] xord;
    assign xord= ~(a^b);
    assign equal= xord[0]&xord[1]&xord[2]&xord[3]&xord[4]&xord[5]&xord[6]&xord[7]&xord[8]&xord[9]&xord[10]&xord[11]&xord[12]&xord[13]&xord[14]&xord[15];
endmodule