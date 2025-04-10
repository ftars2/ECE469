module lookup(
    input logic [3:0] D_look,input logic [3:0] r[7:0],
    output logic  v[7:0]
);

logic [3:0] tempr[7:0];


assign tempr[0] = D_look ~^ r[0];
assign tempr[1] = D_look ~^ r[1];
assign tempr[2] = D_look ~^ r[2];
assign tempr[3] = D_look ~^ r[3];
assign tempr[4] = D_look ~^ r[4];
assign tempr[5] = D_look ~^ r[5];
assign tempr[6] = D_look ~^ r[6];
assign tempr[7] = D_look ~^ r[7];

ftouno uno(tempr[0], v[0]);
ftouno dos(tempr[1], v[1]);
ftouno tres(tempr[2], v[2]);
ftouno cuatro(tempr[3], v[3]);
ftouno cinco(tempr[4], v[4]);
ftouno seis(tempr[5], v[5]);
ftouno siete(tempr[6], v[6]);
ftouno ocho(tempr[7], v[7]);

endmodule