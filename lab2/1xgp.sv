module xgp(
	input logic a,b,
	output logic g,p
	);

assign g = a & b;
assign p = a | b;

endmodule
	