// Example testbench for MIPS processor

module testbench();

  logic        clk;
  logic        reset;

  logic [31:0] writedata, dataadr;
  logic        memwrite;

  // instantiate device to be tested
  top dut(clk, reset, writedata, dataadr, memwrite);
  
  // initialize test
  initial
    begin
      reset <= 1; # 22; reset <= 0;
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

  // check that 7 gets written to address 84
  always@(negedge clk)
    begin
      if(memwrite) begin
        if(dataadr === 52 & writedata === 1) begin
          $display("1 written to 52");
          // $stop;
        end else if (dataadr === 32 & writedata === 3) begin
          $display("3 written to 32");
          // $stop;
        end else if (dataadr === 28 & writedata === 6) begin
          $display("6 written to 28");
        end else if (dataadr === 24 & writedata === 9) begin
          $display("9 written to 24");
        end else if (dataadr === 20 & writedata === 28) begin
          $display("28 written to 20");
        end
      end
    end
endmodule



