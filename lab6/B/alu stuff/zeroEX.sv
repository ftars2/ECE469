module zeroEX(input logic [31:0] in, input logic OF, output logic [31:0] out);
logic temp1;
assign temp1=OF^in[31];
assign out={31'b0,temp1};
endmodule