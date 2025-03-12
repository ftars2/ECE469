module demux_4x8_3(input logic [3:0] newval, input logic [2:0] S, output logic [3:0] D0,D1,D2,D3,D4,D5,D6,D7);

always_comb begin
    D0 = 4'b0;
    D1 = 4'b0;
    D2 = 4'b0;
    D3 = 4'b0;
    D4 = 4'b0;
    D5 = 4'b0;
    D6 = 4'b0;
    D7 = 4'b0;
    
case (S)
    3'b000: D0 = newval;
    3'b001: D1 = newval;
    3'b010: D2 = newval;
    3'b011: D3 = newval;
    3'b100: D4 = newval;
    3'b101: D5 = newval;
    3'b110: D6 = newval;
    3'b111: D7 = newval;
    // default: {D0,D1,D2,D3,D4,D5,D6,D7}=32'b0;
endcase
end
endmodule