module testborrowX16();
 logic unsigned [15:0] A, B, D;
logic Bout;

borrowX16 dut(A,B,Bout,D);
    initial begin
        // Debugging: Monitor signal changes
        $monitor("Time=%0t A=%d B=%d D=%d Bout=%d", $time, A, B, D, Bout);

        // Test cases
           #20; A=16'd0; B=16'd0;
	#10; A=16'd32767; B=16'd64;
	// #10; A=-128; B=16384;
	#10; A=16'd16; B=16'd4;
	// #10; A=-32768; B=-1;
	// #10; A=256; B=-32;
	// #10; A=-1024; B=32767;
	#10; A=16'd8192; B=16'd32767;
	// #10; A=-2048; B=-4096;
        // End simulation
    end
endmodule