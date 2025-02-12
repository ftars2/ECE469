module bitcomparex4(input logic [3:0] a,b, output logic agreat);
    logic var1,var2,var3,var4;
    bitcomparex2 lowdut(a[1:0],b[1:0],var1);
    bitcomparex2 woldut(b[1:0],a[1:0],var2);

    bitcomparex2 highdut(a[3:2],b[3:2],var3);
    bitcomparex2 hgihdut(b[3:2],a[3:2],var4);

    assign agreat= ((~(var3|var4))&var1)|var3;
endmodule