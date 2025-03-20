module mux2_1_1( input logic D0, D1, input logic S,//chooses between input D0 and D1 based on S, and passes chosen value to Y
output logic Y);
logic a, b;
logic s_bar;

assign s_bar = ~S;
assign b = S & D1;
assign a = D0 & s_bar;
assign Y = a | b;
endmodule