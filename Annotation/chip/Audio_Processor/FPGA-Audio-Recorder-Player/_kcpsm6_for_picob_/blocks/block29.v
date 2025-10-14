(* HBLKNM = "kcpsm6_stack_ram1" *)
RAM32M #(
	.INIT_A	(64'h0000000000000000), 
	.INIT_B	(64'h0000000000000000), 
	.INIT_C	(64'h0000000000000000), 
	.INIT_D	(64'h0000000000000000)) 
stack_ram_high(    
	.DOA	(stack_memory[5:4]), 
	.DOB	(stack_memory[7:6]),
	.DOC   	(stack_memory[9:8]),
	.DOD   	(stack_memory[11:10]),
	.ADDRA 	(stack_pointer[4:0]), 
	.ADDRB 	(stack_pointer[4:0]), 
	.ADDRC  (stack_pointer[4:0]), 
	.ADDRD  (stack_pointer[4:0]),
	.DIA    (pc[5:4]),
	.DIB    (pc[7:6]),
	.DIC    (pc[9:8]),
	.DID    (pc[11:10]),
	.WE 	(t_state[1]),  
	.WCLK 	(clk));
