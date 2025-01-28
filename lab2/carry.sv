module carry(
    input logic cin, g, p,
    output logic cout
);
assign cout= (cin&p)|g;

endmodule
//