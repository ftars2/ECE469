module gpbit(

	input logic Ai, Bi,
	output logic Gii, Pii);

	assign Gii = Ai & Bi;
	assign Pii = Ai | Bi;

endmodule