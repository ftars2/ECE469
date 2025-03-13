module testbench();
    logic clk;
    logic init;
    logic swapxy;
    logic [2:0] x, y;
    
    integer file, r;
    string line;
    
    logic [7:0] expected_final_regs, final_regs; // Store initial and final values

    // DUT instance
    init dut(clk, init, swapxy, x, y);

    initial begin 
        file = $fopen("tv.txt", "r");
        if (file == 0) begin
            $display("Error: Could not open test vector file.");
            $finish;
        end

        // Process each test vector in the file
        while (!$feof(file)) begin
            // Read a line from the file
            r = $fgets(line, file);
            if (r != 0) begin
                // Parse the expected final register values and the input signals from the same line
                r = $sscanf(line, "%d, %d, %d, %d, %d, %d, %d, %d %b %b %b %b %b", 
                            expected_final_regs[0], expected_final_regs[1], expected_final_regs[2], expected_final_regs[3],
                            expected_final_regs[4], expected_final_regs[5], expected_final_regs[6], expected_final_regs[7],
                            clk, init, swapxy, x, y);
                
                // Check if parsing was successful
                if (r != 13) begin
                    $display("Error: Incorrect test vector format in file.");
                    continue;
                end

                // Apply inputs
                #10;  // Wait for DUT to process

                // Store final register values after processing test vector
                final_regs = dut.r; // Assuming `r` holds the final register values in the DUT

                // Compare final register values with expected ones
                if (final_regs != expected_final_regs) begin
                    $display("FAIL: Expected final_regs = %b, but got final_regs = %b", expected_final_regs, final_regs);
                end
                else begin
                    $display("PASS: Final register values match the expected values.");
                end
            end
        end

        $fclose(file);
        $finish;
    end
endmodule
