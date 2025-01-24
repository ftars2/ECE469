module testallgp();
    logic [15:0] a, b;
    logic [15:0] g;
     logic [7:0] g1;
     logic [3:0] g2;
     logic [1:0] g3;
    logic [15:0] p;
    logic [7:0] p1;
    logic [3:0] p2;
    logic [1:0] p3;
    logic g4,p4;

    // Instantiate the design under test
    all_gp dut (a,b,g,p,g1,p1,g2,p2,g3,p3,g4,p4);

    initial begin
        
        // Test cases
        a = 16'b0; b = 16'b0; #20;
        a = 'h0001;                          #10;
        b = 'hFFFF;                          #10;
        a='hFFFF; #10;
        // End simulation
    end
endmodule
