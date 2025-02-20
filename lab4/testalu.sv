module testalu();
    logic signed [31:0] A, B;
    logic [2:0] F;
    logic signed [31:0] Y;
    logic zero;
    alu dut(A,B,F,Y,zero);

    initial begin
    #20; A=0; B=0; F=0;
	#10; A=32'sd4; B=32'sd-5; F=3'b110;
	#10; A=32'sd4; B=32'sd-5; F=3'b111;
	#10; A=32'sd4; B=32'sd-5; F=3'b010;
    end
endmodule