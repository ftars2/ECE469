logic clk; // clock signal
logic [3:0] D_lookup;
//data to be “searched” (in parallel, within 1 cycle) across all the 8 registers.
logic setD;
logic [3:0] newD;
// when setD = 1, all the registers whose value matching D_lookup will be updated with newD.
logic init;
// initialize all the regs such that r[0] – r[7] = [8, 9, A, B, C, D, E, F] asynchronously.

logic [2:0] minAddr, maxAddr;
// The lowest and highest registers matching the value of D_lookup
logic valid;
// 1 meaning there’s at least one match for D_lookup, 0 meaning no match found
