module demotb();
logic clk, init, swapxy;
logic [2:0] x, y;
logic [3:0] r[7:0]; 
init dave(clk,init,swapxy,x,y,r);
initial begin
    #20; clk=0;
    #10 init=1'b1;

end

endmodule