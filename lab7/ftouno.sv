module ftouno(input logic [3:0] four,
output logic one);

assign one = &four;

endmodule
