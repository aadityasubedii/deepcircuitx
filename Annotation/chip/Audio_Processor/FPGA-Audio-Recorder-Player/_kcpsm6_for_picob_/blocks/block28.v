generate
for (i = 0 ; i <= 4 ; i = i+1)
begin : stack_loop

parameter [7:0]	id4 = 8'h30 + i/4 ;

if (i == 0) begin: lsb_stack

(* HBLKNM = {"kcpsm6_stack",id4} *)
FDR pointer_flop(  
	.D      (stack_pointer_value[i]),
	.Q      (stack_pointer[i]),
	.R      (internal_reset),
	.C      (clk)) ;

(* HBLKNM = {"kcpsm6_stack",id4} *)
LUT6_2 #(
	.INIT    (64'h001529AAAAAAAAAA))
stack_pointer_lut( 
	.I0     (stack_pointer[i]),
	.I1     (pop_stack),
	.I2     (push_stack),
	.I3     (t_state[1]),
	.I4     (t_state[2]),
	.I5     (1'b1), 
	.O5     (feed_pointer_value[i]),
	.O6     (half_pointer_value[i]));

(* HBLKNM = {"kcpsm6_stack",id4} *)
XORCY stack_xorcy( 
	.LI 	(half_pointer_value[i]),
	.CI 	(1'b0),
	.O      (stack_pointer_value[i]));

(* HBLKNM = {"kcpsm6_stack",id4} *)
MUXCY stack_muxcy( 
	.DI	(feed_pointer_value[i]),
	.CI	(1'b0),
	.S 	(half_pointer_value[i]),
	.O      (stack_pointer_carry[i]));

end 

if (i > 0) begin: upper_stack

(* HBLKNM = {"kcpsm6_stack",id4} *)
FDR pointer_flop(  
	.D      (stack_pointer_value[i]),
	.Q      (stack_pointer[i]),
	.R      (internal_reset),
	.C      (clk)) ;

(* HBLKNM = {"kcpsm6_stack",id4} *)
LUT6_2 #(
	.INIT    (64'h002A252AAAAAAAAA))
stack_pointer_lut( 
	.I0     (stack_pointer[i]),
	.I1     (pop_stack),
	.I2     (push_stack),
	.I3     (t_state[1]),
	.I4     (t_state[2]),
	.I5     (1'b1), 
	.O5     (feed_pointer_value[i]),
	.O6     (half_pointer_value[i]));

(* HBLKNM = {"kcpsm6_stack",id4} *)
XORCY stack_xorcy( 
	.LI 	(half_pointer_value[i]),
	.CI 	(stack_pointer_carry[i-1]),
	.O      (stack_pointer_value[i]));

(* HBLKNM = {"kcpsm6_stack",id4} *)
MUXCY stack_muxcy( 
	.DI 	(feed_pointer_value[i]),
	.CI 	(stack_pointer_carry[i-1]),
	.S 	(half_pointer_value[i]),
	.O      (stack_pointer_carry[i]));

end 

end 
endgenerate