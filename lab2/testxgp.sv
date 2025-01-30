module tests();
    logic a, b, g, p;

    // Instantiate the design under test
    xgp dave(a,b,g,p);
    initial begin
        // Debugging: Monitor signal changes
        // $monitor("Time=%0t A=%b B=%b Sum=%b Carry=%b", $time, A, B, sum, c);

        // Test cases
        a = 0; b = 0;                  #20;
               b = 1;                  #10;
        a=1;   b=0;                      #10;
        a=1; b=1;       #10;
        // End simulation
        // $finish;
    end
endmodule
