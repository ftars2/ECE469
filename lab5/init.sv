module init( input logic clk, init, swapxy, input logic [2:0] x, y,
output logic [3:0] r[7:0] 
);
flipR r0(clk,init,de[0],4'b0000,r[0]);
flipR r1(clk,init,de[1],4'b0001,r[1]);
flipR r2(clk,init,de[2],4'b0010,r[2]);
flipR r3(clk,init,de[3],4'b0011,r[3]);
flipR r4(clk,init,de[4],4'b0100,r[4]);
flipR r5(clk,init,de[5],4'b0101,r[5]);
flipR r6(clk,init,de[6],4'b0110,r[6]);
flipR r7(clk,init,de[7],4'b0111,r[7]);
logic [3:0] newy, newx;
logic [3:0] d[7:0],e[7:0];
logic [31:0] de[7:0];
mux_4x8_3 swapx(r[0],r[1],r[2],r[3],r[4],r[5],r[6],r[7],x,newy);
mux_4x8_3 swapy(r[0],r[1],r[2],r[3],r[4],r[5],r[6],r[7],y,newx);
demux_4x8_3 depositx(newx,x,d[0],d[1],d[2],d[3],d[4],d[5],d[6],d[7]);
demux_4x8_3 deposity(newy,y,e[0],e[1],e[2],e[3],e[4],e[5],e[6],e[7]);
assign de[0]=d[0]&e[0];
assign de[1]=d[1]&e[1];
assign de[2]=d[2]&e[2];
assign de[3]=d[3]&e[3];
assign de[4]=d[4]&e[4];
assign de[5]=d[5]&e[5];
assign de[6]=d[6]&e[6];
assign de[7]=d[7]&e[7];
logic [7:0] decodedx,decodedy;
decoder3_8 decx(x,decodedx);
decoder3_8 decy(y,decodedy);
endmodule