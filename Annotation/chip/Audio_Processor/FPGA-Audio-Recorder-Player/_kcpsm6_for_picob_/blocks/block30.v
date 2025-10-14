(* HBLKNM = "kcpsm6_stack_ram0" *)
RAM32M #(
	.INIT_A	(64'h0000000000000000), 
	.INIT_B	(64'h0000000000000000), 
	.INIT_C (64'h0000000000000000), 
	.INIT_D (64'h0000000000000000)) 
stack_ram_low ( 
	.DOA	({stack_zero_flag, stack_carry_flag}), 
	.DOB	({stack_bit, stack_bank}),
	.DOC    (stack_memory[1:0]), 
	.DOD    (stack_memory[3:2]),
	.ADDRA	(stack_pointer[4:0]), 
	.ADDRB	(stack_pointer[4:0]), 
	.ADDRC  (stack_pointer[4:0]), 
	.ADDRD  (stack_pointer[4:0]),
	.DIA	({zero_flag, carry_flag}), 
	.DIB	({run, bank}),
	.DIC    (pc[1:0]),
	.DID    (pc[3:2]),
	.WE 	(t_state[1]), 
	.WCLK	(clk));
