module gbit(
	input logic Gik, Pik, Gkj,
	output logic Gij);

	assign Gij = Gik | (Pik & Gkj);
endmodule

