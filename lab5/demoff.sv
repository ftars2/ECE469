module demoff();
logic [3:0] d, rval, q;
logic clk, reset, enable;
flipR rar(clk,reset,enable,d,rval,q);
initial begin
    #20; reset=0; rval=6;q=0; d=0;
    #10; clk=0;q=0;  
    #10; reset=1;
    #10; reset=0;
    #10 enable=1; d=3;
    #10 clk=1;

end

endmodule