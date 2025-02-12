module jester(
	input logic [15:0] A, B,
	output logic [15:0] sum,
	output logic [15:0] dif,
	output logic [15:0] sum_cout, dif_cout,
	output logic of_sum, of_dif, lessthan 
);


king dut(.A(A), .B(B), .sum(sum), .sum_cout(sum_cout), .dif(dif), .dif_cout(dif_cout), .of_sum(of_sum), .of_dif(of_dif), .lessthan(lessthan));

endmodule