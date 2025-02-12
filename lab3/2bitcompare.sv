module bitcomparex2(input logic [1:0] a, b, output logic Agreat);
logic and1, xnor1, and2;
assign and1=a[1]&~b[1];
assign xnor1=~(a[1]^b[1]);
assign and2=xnor1&(~b[0])&a[0];
assign Agreat=and2|and1;
endmodule