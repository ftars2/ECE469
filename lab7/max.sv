module max( 
    input logic [7:0] v,
    output logic [2:0] a,
    output logic en
);

pe priority(v, a, en);

assign a[2] = a[2] & en;
assign a[1] = a[1] & en;
assign a[0] = a[0] & en;

endmodule