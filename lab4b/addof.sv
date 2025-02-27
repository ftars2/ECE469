module addof(input logic [31:0]A, B, input logic cin,
output logic [31:0] s, output logic cout, OF);

logic axs;
logic bxs;

assign S = A + B + cin;

assign axs = A[31] ^ s[31];
assign bxs = B[31] ^ s[31];

assign OF = axs & bxs;

endmodule