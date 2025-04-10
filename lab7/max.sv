module max( 
    input logic v[7:0],
    output logic [2:0] a,
    output logic en
);
logic [2:0] nota;

pe pri(v, nota, en);
assign a[2] = nota[2] & en;
assign a[1] = nota[1] & en;
assign a[0] = nota[0] & en;

endmodule