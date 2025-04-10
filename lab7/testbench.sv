module testbench();
logic clk; // clock signal
logic [3:0] D_lookup;
//data to be “searched” (in parallel, within 1 cycle) across all the 8 registers.
logic setD;
logic [3:0] newD;
// when setD = 1, all the registers whose value matching D_lookup will be updated with newD.
logic init;
// initialize all the regs such that r[0] – r[7] = [8, 9, minAdder, maxAddr, C, D, E, v] asynchronously.
logic [2:0] min, max;
logic [2:0] minAddr, maxAddr;
// The lowest and highest registers matching the value of D_lookup
logic valid;
logic v;
// 1 meaning there’s at least one match for D_lookup, 0 meaning no match found
integer file, r;
string line;
int count=0;
int fail=0;
register DUT(clk, setD, init,newD,D_lookup, valid, minAddr, maxAddr);
initial begin 
    file=$fopen("tv.txt","r");
    if (file == 0) begin
      $display("Error: Could not open test vector file.");
      $finish;
    end
    while (!$feof(file)) begin
        r = $fgets(line, file);
        if (r != 0) begin
            
            r = $sscanf(line, "%b %b %b %b %b %b %b %b",clk,D_lookup,setD,newD,init,min,max,v);
            if (r != 8) begin
                $display("Error: Incorrect test vector format in file.");
                continue;
            end
         
            // Apply input
            // if(first==0)begin
            //     #20;
            //     first=0;
            // end
            // else begin
                #10;  // Wait for DUT to process
            // end
            // Compare output
               count++;
            if ((minAddr !== min)||(max !== maxAddr)||(v!== valid)) begin
            $display("#%d FAIL: Expected: min=%b,max=%b,v=%b Got: minAddr=%b maxAddr=%b v=%b",count,min, max, v,minAddr,maxAddr, valid);
            fail=1;
            end else begin
            $display("#%d PASS: Expected: min=%b,max=%b,v=%b Got: minAddr=%b maxAddr=%b v=%b",count, min, max, v,minAddr,maxAddr, valid);
            end
        end
        end
        if(fail!==1)begin
            $display("passed all test input cases, great job!");
        end else begin
            $display("failed, better luck next time!");
        end
        $fclose(file);

    end



endmodule