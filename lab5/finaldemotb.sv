module finaldemotb();
logic clk, init, swapxy;
logic [2:0] x, y;
logic [3:0] r[7:0]; 
init dave(clk,init,swapxy,x,y,r);
initial begin
    #20; clk=0;
    #10; init=1'b1;        
    #10; init=1'b0;
    #10; x=3'b111; y=0;
    #10; swapxy=1'b1;
    #10; clk=1;
    #10; clk=0;
end

endmodule