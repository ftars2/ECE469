module xxgp(
	input logic [1:0] gin,pin,
	output logic g,p
	);

assign g = (gin[0] & pin[1]) | gin[1];
assign p = pin[0] & pin[1];

endmodule

