module testbird();
    logic [15:0] A, B, sum; 
    logic [16:0] c;
    logic of

    // Instantiate the design under test
    bird dut (
        .A(A),
        .B(B),
        .sum(sum),
        .c(c),
        .of(of_sum)
    );

    initial begin
        // Debugging: Monitor signal changes
        $monitor("Time=%0t A=%b B=%b Sum=%b Carry=%b", $time, A, B, sum, c);

        // Test cases
        A = 16'b0000000000000000; B = 16'b0000000000000000; #10;
        #10;
        A = 16'b0000000000000001;                          #10;
        B = 16'b1111111111111111;                          #10;
        A = 16'b1111111111111111; #10;
        // End simulation
    end
endmodule
