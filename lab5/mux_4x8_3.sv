module mux_4x8_3(input logic [3:0] D0,D1,D2,D3,D4,D5,D6,D7, input logic [2:0] S, output logic [3:0] newval);

always_comb
case (S)
    3'b000: newval = D0;
    3'b001: newval = D1;
    3'b010: newval = D2;
    3'b011: newval = D3;
    3'b100: newval = D4;
    3'b101: newval = D5;
    3'b110: newval = D6;
    3'b111: newval = D7;
endcase
endmodule