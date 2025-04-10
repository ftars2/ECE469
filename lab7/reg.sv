module register(input logic clk, setd, init,input logic [3:0]newd, D_lookup,output logic valid, output logic [2:0] Min, Max);
    logic [3:0]R[7:0];
    logic v[7:0],V[7:0];
    logic [2:0] min,max;
    //stores values in registers
    flop a0(newd, 4'b1000, V[0], init, setd, R[0]);
    flop a1(newd, 4'b1001, V[1], init, setd, R[1]);    
    flop a2(newd, 4'b1010, V[2], init, setd, R[2]);
    flop a3(newd, 4'b1011, V[3], init, setd, R[3]);
    flop a4(newd, 4'b1100, V[4], init, setd, R[4]);
    flop a5(newd, 4'b1101, V[5], init, setd, R[5]);
    flop a6(newd, 4'b1110, V[6], init, setd, R[6]);
    flop a7(newd, 4'b1111, V[7], init, setd, R[7]);    

    mainlog log(D_lookup,R,min,max,v);
    //stores values of valid
    flip b0(v[0], clk, init, V[0]);
    flip b1(v[1], clk, init, V[1]);
    flip b2(v[2], clk, init, V[2]);
    flip b3(v[3], clk, init, V[3]);
    flip b4(v[4], clk, init, V[4]);
    flip b5(v[5], clk, init, V[5]);
    flip b6(v[6], clk, init, V[6]);
    flip b7(v[7], clk, init, V[7]);
    
    
    DFFR #(3) ma(clk,init,1'b1,max,3'b000,Max);
    DFFR #(3) mi(clk,init,1'b1,min,3'b000,Min);    
    assign valid=V[0]|V[1]|V[2]|V[3]|V[4]|V[5]|V[6]|V[7];

endmodule