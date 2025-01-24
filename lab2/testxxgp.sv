module testxxgp();
    logic[1:0] gin, pin;
    logic g, p;

    // Instantiate the design under test
    xxgp dave(gin,pin,g,p);
    initial begin
        // Debugging: Monitor signal changes
        // $monitor("Time=%0t A=%b B=%b Sum=%b Carry=%b", $time, A, B, sum, c);

        // Test cases
        gin = 2'b00; pin = 2'b00;                  #20;
               pin = 2'b01;                  #10;
           pin=2'b10;                      #10;
         pin=2'b11;       #10;
        gin=2'b01; pin=2'b00; #10;
               pin = 2'b01;                  #10;
           pin=2'b10;                      #10;
         pin=2'b11;       #10;
         gin=2'b10; pin=2'b00; #10;
                        pin = 2'b01;                  #10;
           pin=2'b10;                      #10;
         pin=2'b11;       #10;
gin=2'b11; pin=2'b00; #10;
               pin = 2'b01;                  #10;
           pin=2'b10;                      #10;
         pin=2'b11;       #10;

        // End simulation
        // $finish;
    end
endmodule
