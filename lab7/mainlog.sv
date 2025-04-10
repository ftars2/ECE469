module mainlog(input logic [3:0] look,input logic [3:0] R[7:0],output logic [2:0] min,max,output logic v[7:0]);

lookup looking(look, R, v);
logic en1,en2;
min minny(v, min, en1);
max maxxy(v, max, en2);

endmodule


