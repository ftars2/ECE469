module gpblk(

	input logic Ghb, Phb, Glb, Plb,
	output logic Gij, Pij);

	assign Gij = Ghb | (Phb & Glb);
	assign Pij = Phb & Plb;

endmodule
