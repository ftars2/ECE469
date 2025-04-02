module mux2_1_32( input logic [31:0] D0, D1, input logic S,//chooses between input D0 and D1 based on S, and passes chosen value to Y
output logic [31:0] Y);
logic [31:0] a, b;
logic [31:0] s, s_bar;
extend1_32 extend(S,s);

assign s_bar = ~s;
assign b = s & D1;
assign a = D0 & s_bar;
assign Y = a | b;
endmodule