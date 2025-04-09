module newd(input logic [3:0] oldd, newd, input logic Vx, output logic [3:0]actd);
    mux2 #(4) a(oldd,newd,Vx,actd);
endmodule