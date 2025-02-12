module test2bitcompare();
logic [1:0] a, b;
// logic agreat,bgreat,equal;
logic c;
bitcomparex2 dut(a,b,c);
    initial begin
        // Debugging: Monitor signal changes
        $monitor("Time=%0t a=%d b=%d", $time, a, b);

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