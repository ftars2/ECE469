module max( 
    input logic v[7:0],
    output logic [2:0] a,
    output logic en
);

pe pri(v, a, en);

assign a[2] = a[2] & en;
assign a[1] = a[1] & en;
assign a[0] = a[0] & en;

endmodule