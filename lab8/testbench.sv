module testbench();
logic clk; // clock signal
logic in;
logic rest;
logic rE, rC, r4, r6, r9;
logic RE, RC, R4, R6, R9;
integer file, r;
string line;
int count=0;
int fail=0;
fsm DUT(clk, in, rest,rE,rC, r4, r6, r9);
initial begin 
    file=$fopen("tvc.txt","r");
    if (file == 0) begin
      $display("Error: Could not open test vector file.");
      $finish;
    end
    while (!$feof(file)) begin
        r = $fgets(line, file);
        if (r != 0) begin
            
            r = $sscanf(line, "%b %b %b %b %b %b %b",in,rest,RE,RC,R4,R6,R9);
            if (r != 7) begin
                $display("Error: Incorrect test vector format in file.");
                continue;
            end
            #10;
            clk=1;
            #10;
            clk=0;
            // Apply input
            // if(first==0)begin
            //     #20;
            //     first=0;
            // end
            // else begin
                //#10;  // Wait for DUT to process
            // end
            // Compare output
               count++;
            if ((RE !== rE)||(rC !== RC)||(r4!== R4)||(r6!==R6)||(r9!==R9)) begin
            $display("#%d FAIL: Expected: rE=%b,rC=%b,r4=%b,r6=%b,r9=%b Got: rE=%b,rC=%b,r4=%b,r6=%b,r9=%b",count,RE, RC, R4, R6, R9,rE, rC, r4, r6, r9);
            fail=1;
            end else begin
            $display("#%d PASS: Expected: rE=%b,rC=%b,r4=%b,r6=%b,r9=%b Got: rE=%b,rC=%b,r4=%b,r6=%b,r9=%b",count,RE, RC, R4, R6, R9,rE, rC, r4, r6, r9);
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