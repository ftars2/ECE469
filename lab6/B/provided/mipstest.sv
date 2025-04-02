// Example testbench for MIPS processor

module testbench();

  logic        clk;
  logic        reset;

  logic [31:0] writedata, dataadr;
  logic        memwrite;
  int a=0,b=0,c=0,d=0, e=0;;
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
          a=1;
        end else if (dataadr === 32 & writedata === 3) begin
          $display("3 written to 32");
          b=1;
          // $stop;
        end else if (dataadr === 28 & writedata === 6) begin
          $display("6 written to 28");
          c=1;
        end else if (dataadr === 24 & writedata === 9) begin
          $display("9 written to 24");
          d=1;
        end else if (dataadr === 20 & writedata === 28) begin
          $display("28 written to 20");
          e=1;
        end
        if(a&b&c&d&e)begin
         $display("Simulation succeeded");//if this shows up, all the values were written to   
         $stop;       
        end
      end
    end
endmodule



