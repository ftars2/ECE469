module testbench(
);
 logic signed [31:0] A, B;
    logic [2:0] F;
    logic signed [31:0] Y;
    logic zero;
    logic signed [31:0] TY;
    logic Tzero;
    integer file, r;
    string line;
    alu dut(A,B,F,Y,zero);
    initial begin 
    file=$fopen("testvector.txt","r");
    if (file == 0) begin
      $display("Error: Could not open test vector file.");
      $finish;
    end
    while (!$feof(file)) begin
        r = $fgets(line, file);
        if (r != 0) begin
            
            r = $sscanf(line, "%d %b %b %b %b",F,A,B,TY,Tzero);
            if (r != 2) begin
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
        $finish;
    end



endmodule