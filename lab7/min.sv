module min( 
    input logic [7:0] v,
    output logic [2:0] a,
    output logic en
);

pe priority(v, a, en);

logic [2:0] nota;

assign nota[2] = ~a[2];
assign nota[1] = ~a[1];
assign nota[0] = ~a[0];

assign a[2] = nota[2] & en;
assign a[1] = nota[1] & en;
assign a[0] = nota[0] & en;

endmodule