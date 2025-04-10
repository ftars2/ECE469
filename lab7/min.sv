module min( 
    input logic v[7:0],
    output logic [2:0] a,
    output logic en
);

logic notv[7:0];

assign notv= {v[0],v[1],v[2],v[3],v[4],v[5],v[6],v[7]};
logic [2:0] nota;
pe pri(notv, nota, en);

// assign nota[2] = ~a[2];
// assign nota[1] = ~a[1];
// assign nota[0] = ~a[0];

assign a[2] = ~nota[2] & en;
assign a[1] = ~nota[1] & en;
assign a[0] = ~nota[0] & en;

endmodule