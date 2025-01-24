module xxgp(
	input logic [1:0] gin,pin,
	output logic g,p
	);
logic i;

assign i = gin[0] & pin[1]; 
assign g = i | gin[1];
assign p = pin[0] & pin[1];

endmodule

