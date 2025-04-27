module testbench();
logic clk; // clock signal
logic reset;
//actual values
                    logic [5:0] op, funcht;
                    logic       zero;
                   logic       pcen, memwr, irwr, regwr;
                   logic       alusrca, iord, mem2reg, regdest;
                   logic [1:0] alusrcb, pcsrc;
                   logic [2:0] alucontrol;
//correct values
                   logic       pcenn, memwrn, irwrn, regwrn;
                   logic       alusrcan, iordn, mem2regn, regdestn;
                   logic [1:0] alusrcbn, pcsrcn;
                   logic [2:0] alucontroln;
                   
integer file, r;
string line;
int count=0;
int fail=0;
controller DUT(clk, reset, op,funcht,zero,pcen,memwr,irwr,regwr,alusrca,iord,mem2reg,regdest,alusrcb,pcsrc,alucontrol);
initial begin 
    file=$fopen("tv.txt","r");
    if (file == 0) begin
      $display("Error: Could not open test vector file.");
      $finish;
    end
    while (!$feof(file)) begin
        r = $fgets(line, file);
        if (r != 0) begin
            
            r = $sscanf(line, "%b %b %b %b %b %b %b",reset, op,funcht,zero,pcenn,memwrn,irwrn,regwrn,alusrcan,iordn,mem2regn,regdestn,alusrcbn,pcsrcn,alucontroln);
            if (r != 15) begin
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
            if ((pcen !== pcenn)||(memwr !== memwrn)||(irwr!== irwrn)||(regwr!==regwrn)||(alusrca!==alusrcan)||(iord!==iordn)||(mem2reg!==mem2regn)||(regdest!==regdestn)||(alusrcb!==alusrcbn)||(pcsrc!==pcsrcn)||(alucontrol!==alucontroln)) begin
            $display("#%d FAIL: Expected: pcen=%b,memwr=%b,irwr=%b,regwr=%b,alusrca=%b,iord=%b,mem2reg=%b,regdest=%b,alusrcb=%b,pcsrc=%b,alucontrol=%b \x0d Got: pcen=%b,memwr=%b,irwr=%b,regwr=%b,alusrca=%b,iord=%b,mem2reg=%b,regdest=%b,alusrcb=%b,pcsrc=%b,alucontrol=%b",count,pcen,memwr,irwr,regwr,alusrca,iord,mem2reg,regdest,alusrcb,pcsrc,alucontrol,pcenn,memwrn,irwrn,regwrn,alusrcan,iordn,mem2regn,regdestn,alusrcbn,pcsrcn,alucontroln);
            fail=1;
            end else begin
            $display("#%d PASS: Expected: pcen=%b,memwr=%b,irwr=%b,regwr=%b,alusrca=%b,iord=%b,mem2reg=%b,regdest=%b,alusrcb=%b,pcsrc=%b,alucontrol=%b \x0d Got: pcen=%b,memwr=%b,irwr=%b,regwr=%b,alusrca=%b,iord=%b,mem2reg=%b,regdest=%b,alusrcb=%b,pcsrc=%b,alucontrol=%b",count,pcen,memwr,irwr,regwr,alusrca,iord,mem2reg,regdest,alusrcb,pcsrc,alucontrol,pcenn,memwrn,irwrn,regwrn,alusrcan,iordn,mem2regn,regdestn,alusrcbn,pcsrcn,alucontroln);
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