module testborrow();
logic  A, B, D;
logic Bout;
logic Bin;
borrow dut(Bin,A,B,Bout,D);
    initial begin
        // Debugging: Monitor signal changes
        $monitor("Time=%0t Bin= %d A=%d B=%d D=%d Bout=%d", $time,Bin, A, B, D, Bout);

        // Test cases
           #20; Bin=0; A=0; B=0;
            #10; A=1;
            #10; B=1;
            #10; A=0;
            #10; Bin=1; B=0;
            #10; A=1;
            #10; B=1; 
    end
endmodule