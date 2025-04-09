module mainlog(input logic [3:0] look,input logic [3:0]R[7:0],output logic [2:0] min,max,output logic v[7:0], output logic en);

lookup looking(look, R, v);

min minny(v, min, en);
max maxxy(v, max, en);

endmodule


