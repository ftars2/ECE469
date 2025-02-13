module mux2_1( input logic[16] D0,D1, input logic S, output logic [16] Y);
assign Y=S ? D1 : D0;
endmodule