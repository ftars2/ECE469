module king(
    input logic [15:0] A, B,
    output logic [15:0] sum, c
    );


bird dut(.A(A), .B(B), .sum(sum), .c(c));

endmodule