module testbench();
    logic [15:0] A, B, sum,dif; 
    logic [15:0]sum_cout, dif_cout;
    logic of_sum, of_dif, lessthan;
    // Instantiate the design under test
    king dut(.A(A), .B(B), .sum(sum), .sum_cout(sum_cout), .dif(dif), .dif_cout(dif_cout), .of_sum(of_sum), .of_dif(of_dif), .lessthan(lessthan));

    initial begin
        // Debugging: Monitor signal changes
        $monitor("Time=%0t A=%d B=%d Sum=%d of_s=%d diff=%d of_d=%d lessthan=%d", $time, A, B, sum,of_sum,dif,of_dif,lessthan);

        // Test cases
       #20; A=0; B=0;
	#10; A=32767; B=-64;
	#10; A=-128; B=16384;
	#10; A=16; B=4;
	#10; A=-32768; B=-1;
	#10; A=256; B=-32;
	#10; A=-1024; B=32767;
	#10; A=8192; B=32767;
	#10; A=-2048; B=-4096;
        // End simulation
    end
endmodule
