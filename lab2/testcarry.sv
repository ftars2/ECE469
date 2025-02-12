module testcarry();
    logic cin,p,g,cout;

    // Instantiate the design under test
    carryy dave(cin,p,g,cout);
    initial begin
        // Debugging: Monitor signal changes
        // $monitor("Time=%0t A=%b B=%b Sum=%b Carry=%b", $time, A, B, sum, c);

        // Test cases
        cin=0; p = 0; g = 0;                  #20;
               g = 1;                  #10;
        p=1;   g=0;                      #10;
        p=1; g=1;       #10;
        cin=1; p = 0; g = 0;                  #10;
            g = 1;                  #10;
        p=1;   g=0;                      #10;
        p=1; g=1;       #10;

        // End simulation
        // $finish;
    end
endmodule
