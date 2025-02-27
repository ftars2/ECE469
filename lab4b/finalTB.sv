module finalTB(
);
 logic signed [31:0] A, B;
    logic [2:0] F;
    logic signed [31:0] Y;
    logic zero;
    logic signed [31:0] TY;
    logic OF;
    logic TOF;
    logic Tzero;
    integer file, r;
    string line;
    alu dut(A,B,F,Y,zero,OF);
    initial begin 
    file=$fopen("testcaseb.txt","r");
    if (file == 0) begin
      $display("Error: Could not open test vector file.");
      $finish;
    end
    while (!$feof(file)) begin
        r = $fgets(line, file);
        if (r != 0) begin
            
            r = $sscanf(line, "%d %h %h %h %b %b",F,A,B,TY,Tzero, TOF);
            if (r != 6) begin
                $display("Error: Incorrect test vector format in file.");
                continue;
            end

            // Apply input
            #10;  // Wait for DUT to process

            // Compare output
            if ((TOF==OF)&&((Y !== TY)||(zero !== Tzero)))begin
            $display("OVERFLOW: Input: A=%b,B=%b,F=%b |Expected: Y=%d Zero=%b OF=%b, Got: Y=%d zero=%b OF=%b",A,B, F, TY,Tzero, TOF, Y, zero, OF);
            end else if ((Y !== TY)||(zero !== Tzero)||(TOF!==OF)) begin
            $display("FAIL: Input: A=%d,B=%d,F=%b |Expected: Y=%d Zero=%b OF=%b, Got: Y=%d zero=%b OF=%b",A,B, F, TY,Tzero, TOF, Y, zero, OF);
            end else begin
            $display("PASS: Input: A=%b,B=%b,F=%b |Expected: Y=%d Zero=%b OF=%b, Got: Y=%d zero=%b OF=%b",A,B, F, TY,Tzero, TOF, Y, zero, OF);
            end
        end
        end

        $fclose(file);

    end



endmodule