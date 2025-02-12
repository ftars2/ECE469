module test16bitcompare();
logic [15:0] a, b;
logic agreat,bgreat,equal;

bitcomparex16 dut(a,b,agreat,bgreat,equal);
    initial begin
        // Debugging: Monitor signal changes
        $monitor("Time=%0t a=%d b=%d agreat=%d bgreat=%d eq=%d", $time, a, b, agreat, bgreat,equal);

        // Test cases
    #10; a=0; b=0;
    #10; a=1; 
    #10; b=1;
    #10; b=30;
    #10; a=29;
    #10; a=30;
    #10; a=31;
    end
endmodule