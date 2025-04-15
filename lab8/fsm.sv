module fsm(input logic clk,in,rest,output logic rE, rC, r4, r6, r9);

typedef enum logic[3:0] {init, s1, s11, s111, s1110, s110,s1100,s10,s1001,s100} statetype; 

statetype current_state, next_state;

always_ff @ (posedge clk, posedge rest)
	if (rest) 	current_state <=  init;
else 		current_state <= next_state;

always_comb 
begin
	case (current_state)
		init: 	if(in)	next_state = s1;
				else		next_state = init;
		s1:		if(in)	next_state = s11;
				else		next_state = s10;
		s11:	if(in)	next_state = s111;
                else		next_state = s110;
        s111:   if(in)   next_state = s111;
                else        next_state = s1110;
        s1110:  if(in)   next_state = s1;
                else        next_state = s1100;
        s110:   if(in)   next_state = s1;
                else        next_state = s1100;
        s1100:  if(in)   next_state = init;
                else        next_state = s1001;
        s10:    if(in)   next_state = s1;
                else        next_state = s100;
        s1001:  if(in)   next_state = s11;
                else        next_state = s10;
        s100:   if(in)   next_state = init;
                else        next_state = s1001;
		default: 	next_state = init;

endcase
end

        always_comb begin
	rE=0;rC=0;r4=0;r6=0;r9=0;
	case (current_state)
         s1110: begin rE = 1; r6 = 1; end
         s110:  r6 = 1;
        s1100:  begin rC = 1; r4 = 1; end
        s1001:  r9 = 1;
        s100:   r4 = 1;

	endcase
end

	


endmodule