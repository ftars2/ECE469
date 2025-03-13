module finalTB(
);
 logic clk,init,swapxy;
 logic [2:0] x,y;
 logic [3:0] rexpect[7:0], ract[7:0]; 
    
    integer file, r,i;
    string line;
    main dut(clk, init, swapxy, x, y, ract);
    initial begin 
    i=1;
    file=$fopen("tv.txt","r");
    if (file == 0) begin
      $display("Error: Could not open test vector file r=%d",r);
      $finish;
    end
    while (!$feof(file)) begin
        r = $fgets(line, file);
        if (i==1) begin
            i=0;
        end 
        else begin 
            if (r != 0) begin
            
                r = $sscanf(line, "%b %b %b %b %b %d %d %d %d %d %d %d %d",clk,init,swapxy,x,y,rexpect[0], rexpect[1],rexpect[2],rexpect[3],rexpect[4],rexpect[5],rexpect[6],rexpect[7]);
                if (r != 13) begin
                    if (r==-1 || r==0) begin $display("NEXT TEST CASE");
                    end
                    else begin 
                    $display("Error: Incorrect test vector format in file r=%d",r);
                    continue;
                end
            end     
            end
            // Apply input
            #10;  // Wait for DUT to process

            // Compare output
             if (rexpect[0] != ract[0] || rexpect[1] != ract[1] || rexpect[2] != ract[2] ||rexpect[3] != ract[3] || rexpect[4] != ract[4] || rexpect[5] != ract[5] || rexpect[6] != ract[6] || rexpect[7] != ract[7])begin
            $display("FAIL: Registers are: R0: %d R1: %d R2: %d R3: %d R4: %d R5: %d R6: %d R7: %d|Expected: R0: %d R1: %d R2: %d R3: %d R4: %d R5: %d R6: %d R7: %d",ract[0], ract[1],ract[2],ract[3],ract[4],ract[5],ract[6],ract[7],rexpect[0], rexpect[1],rexpect[2],rexpect[3],rexpect[4],rexpect[5],rexpect[6],rexpect[7]);
            end else begin
            $display("PASS: Registers are: R0: %d R1: %d R2: %d R3: %d R4: %d R5: %d R6: %d R7: %d|Expected: R0: %d R1: %d R2: %d R3: %d R4: %d R5: %d R6: %d R7: %d",ract[0], ract[1],ract[2],ract[3],ract[4],ract[5],ract[6],ract[7],rexpect[0], rexpect[1],rexpect[2],rexpect[3],rexpect[4],rexpect[5],rexpect[6],rexpect[7]);
            end
        end
        end

        $fclose(file);

    end



endmodule