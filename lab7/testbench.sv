module testbench();
logic clk; // clock signal
logic [3:0] D_lookup;
//data to be “searched” (in parallel, within 1 cycle) across all the 8 registers.
logic setD;
logic [3:0] newD;
// when setD = 1, all the registers whose value matching D_lookup will be updated with newD.
logic init;
// initialize all the regs such that r[0] – r[7] = [8, 9, A, B, C, D, E, F] asynchronously.
logic [2:0] min, max;
logic [2:0] minAddr, maxAddr;
// The lowest and highest registers matching the value of D_lookup
logic valid;
// 1 meaning there’s at least one match for D_lookup, 0 meaning no match found
integer file, r;
string line;

initial begin 
    file=$fopen("tv.txt","r");
    if (file == 0) begin
      $display("Error: Could not open test vector file.");
      $finish;
    end
    while (!$feof(file)) begin
        r = $fgets(line, file);
        if (r != 0) begin
            
            r = $sscanf(line, "%b %b %b %b %b",clk,D_lookup,setD,newD,init,min,max);
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