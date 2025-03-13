module demux_4x8_3(input  logic [3:0] newval, input  logic [2:0] S, output logic [3:0] D [7:0]
);

always_comb begin
    
    D = '{default: 4'b0};
    unique case (S)
        3'b000: D[0] = newval;
        3'b001: D[1] = newval;
        3'b010: D[2] = newval;
        3'b011: D[3] = newval;
        3'b100: D[4] = newval;
        3'b101: D[5] = newval;
        3'b110: D[6] = newval;
        3'b111: D[7] = newval;
    endcase
end

endmodule