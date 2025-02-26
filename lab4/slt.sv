module slt(input logic [31:0] A, B,input logic [32:0] Diff, output logic [32:0]out);

// A B Diff slt?

logic val[7:0];

// +A +B +Diff->0
// assign val[0]=~A[31]&~B[31]&~Diff[31]; 
// +A +B -Diff->1
assign val[1]=~A[31]&~B[31]&Diff[31];
// +A -B +Diff->0, no of
// assign val[2]=~A[31]&B[31]&~Diff[31];
// +A -B -Diff->1 but overflow, so 0
// assign val[3]=~A[31]&B[31]&Diff[31]&Diff[32];
// -A +B +Diff->0 but overflow, so 1
assign val[4]=A[31]&~B[31]&~Diff[31]&Diff[32];
// -A +B -Diff->1
assign val[5]=A[31]&~B[31]&Diff[31];
//-A -B +Diff->0 A less negative then B
//assign val[6]=A[31]&B[31]&~Diff[31];
// -A -B -Diff->1
assign val[7]=A[31]&B[31]&Diff[31];
assign out= {31'b0,(val[1]|val[4]|val[5]|val[7])};

endmodule