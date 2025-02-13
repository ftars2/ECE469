module testsub();
    logic [16:0] A, B, dif; 
    logic OF;
    // Instantiate the design under test
    sub17x dut(.A(A), .B(B), .D(dif), .OF(OF));

    initial begin
        // Debugging: Monitor signal changes
        $monitor("Time=%0t A=%d B=%d  dif=%d OF_D=%d", $time, A, B, D, OF);

        // Test cases
    #20; A=0; B=0;
    #10; A=128; B=8;
    #10; A=1; B=65535;
    #10; A=65535; B=-1;
    #10; A=128; B=-129;
    #10; A=-128; B=129;
    #10; A=-65535; B=1;
    #10; A=-1; B=-65535;
    #10; A=-129; B=-128;
        // End simulation
    end
endmodule