module king(
    input logic [15:0] A, B,
    output logic [15:0] sum, 
    output logic [15:0]sum_cout, dif_cout,
    output logic [15:0] dif,
    output logic of_sum, of_dif, lessthan
    );


sum_bird dut((A), (B), (sum), (sum_cout),of_sum);
dif_bird dut2((A), (B), (dif), (dif_cout),of_dif);

assign lessthan = of_dif ^ dif[15]; 

endmodule