module bitcomparex8(input logic [7:0] a,b, output logic agreat);
    logic var1,var2,var3,var4;
    bitcomparex4 lowdut(a[3:0],b[3:0],var1);
    bitcomparex4 woldut(b[3:0],a[3:0],var2);

    bitcomparex4 highdut(a[7:4],b[7:4],var3);
    bitcomparex4 hgihdut(b[7:4],a[7:4],var4);

    assign agreat= ((~(var3|var4))&var1)|var3;
endmodule