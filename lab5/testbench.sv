module testbench();
    logic clk;
    logic init;
    logic swapxy;
    logic [2:0] x, y;
    integer file, r;
    string line;
    init dut(clk,init,swapxy,x,y);
    initial begin 
    file=$fopen("tv.txt","r");
    if (file == 0) begin
      $display("Error: Could not open test vector file.");
      $finish;
    end
    while (!$feof(file)) begin
        r = $fgets(line, file);
        if (r != 0) begin
            
            r = $sscanf(line, "%b %b %b %b %b",clk, init, swapxy, x, y);
            if (r != 5) begin
                $display("Error: Incorrect test vector format in file.");
                continue;
            end

            // Apply input
            #10;  // Wait for DUT to process

            // Compare output
            if ((Y !== TY)||(zero !== Tzero)) begin
            $display("FAIL: Input: A=%d,B=%d,F=%b |Expected: Y=%d Zero=%b, Got: Y=%d zero=%b",A,B, F, TY,Tzero, Y, zero);
            end else begin
            $display("PASS: Input: A=%b,B=%b,F=%b |Expected: Y=%d Zero=%b, Got: Y=%d zero=%b",A,B, F, TY,Tzero, Y, zero);
            end
        end
        end

        $fclose(file);

    end



endmodule