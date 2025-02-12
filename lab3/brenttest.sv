module testbrentadd();
    logic [15:0] A, B, sum; 
    logic cout;
    // Instantiate the design under test
    XVIbitbrent dut(.A(A), .B(B), .sum(sum), .cout(cout));

    initial begin
        // Debugging: Monitor signal changes
        $monitor("Time=%0t A=%d B=%d Sum=%d cout=%d", $time, A, B, sum,cout);

        // Test cases
    #20; A=0; B=0;
	#10; A=32767; B=64;
	#10; A=128; B=16384;
	#10; A=16; B=4;
	#10; A=32768; B=1;
	#10; A=256; B=32;
	#10; A=1024; B=32767;
	#10; A=8192; B=32767;
	#10; A=2048; B=4096;
    #10; A=65535; B=1;
        // End simulation
    end
endmodule
