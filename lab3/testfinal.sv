module testfinal();
    logic [16:0] A, B, sum, dif; 
    logic OF_S, OF_D;
    // Instantiate the design under test
    final dut(.A(A), .B(B), .S(sum), .D(dif), .OF_S(OF_S), .OF_D(OF_D));

    initial begin
        // Debugging: Monitor signal changes
        $monitor("Time=%0t A=%b B=%b Sum=%b dif=%b OF_S=%b OF_D=%b", $time, A, B, S, D, OF_S, OF_D);

        // Test cases
    #20; A=17'b00000000000000000; B=17'b00000000000000000;
    //actual test cases
    #10; A=17'b00000000010000000; B=17'b00000000000001000; // A=128 B=8, S=136, D=120
    #10; A=17'b00000000000000001; B=17'b01111111111111111; // A=1 B=65535, S=OF, D=-65534
    #10; A=17'b01111111111111111; B=17'b10000000000000001; // A=65535 B=-1, S=65534, D=OF
    #10; A=17'b00000000010000000; B=17'b10000000010000001; // A=128 B=-129, S=-1, D=257
    #10; A=17'b10000000010000000; B=17'b00000000010000001; // A=-128 B=129, S=1, D=-257
    #10; A=17'b11111111111111111; B=17'b00000000000000001; // A=65535 B=1, S=-65534, D=OF
    #10; A=17'b10000000000000001; B=17'b11111111111111111; // A=-1 B=65535, S=OF, D=65534
    #10; A=17'b10000000010000001; B=17'b10000000010000000; // A=-129 B=-128, S=-257, D=-1
        // End simulation
    end
endmodule


