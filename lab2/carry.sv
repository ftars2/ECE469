module carry(
    input logic cin, p, g,
    output logic cout
);
assign cout= (cin&p)|g;

endmodule
