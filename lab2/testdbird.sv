module testdbird();
    logic signed [15:0] A, B, sum; 
    logic [15:0] c;
    logic of;

    // Instantiate the design under test
    dif_bird dut (
        .A(A),
        .B(B),
        .dif(sum),
        .c(c),
        .of_dif(of)
    );

    initial begin
        // Debugging: Monitor signal changes
        $monitor("Time=%0t A=%d B=%d dif=%d Carry=%d of=%d", $time, A, B, sum, c,of);

        // Test cases
           #20; A=0; B=0;
#10; A=0; B=2;
#10; A=0; B=3;
#10; A=0; B=4;
#10; A=0; B=5;
#10; A=0; B=6;
#10; A=0; B=7;
#10; A=0; B=8;
#10; A=0; B=9;
#10; A=0; B=10;
#10; A=0; B=11;
#10; A=0; B=12;
#10; A=0; B=13;
#10; A=0; B=14;
#10; A=0; B=15;
#10; A=0; B=16;
#10; A=1; B=0;
#10; A=1; B=1;
#10; A=1; B=2;
#10; A=1; B=3;
#10; A=1; B=4;
#10; A=1; B=5;
#10; A=1; B=6;
#10; A=1; B=7;
#10; A=1; B=8;
#10; A=1; B=9;
#10; A=1; B=10;
#10; A=1; B=11;
#10; A=1; B=12;
#10; A=1; B=13;
#10; A=1; B=14;
#10; A=1; B=15;
#10; A=1; B=16;
#10; A=2; B=0;
#10; A=2; B=1;
#10; A=2; B=2;

	#10; A=-32768; B=-1;
	#10; A=256; B=-32;
	#10; A=-1024; B=32767;
	#10; A=8192; B=32767;
	#10; A=-2048; B=-4096;
        // End simulation
    end
endmodule
