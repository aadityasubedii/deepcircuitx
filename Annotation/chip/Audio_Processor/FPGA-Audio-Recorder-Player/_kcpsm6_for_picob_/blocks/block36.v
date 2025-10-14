generate
for (i = 0 ; i <= 11 ; i = i+1)
begin : address_loop
parameter [7:0] id4 = 8'h30 + i/4 ;
parameter [7:0] id8 = 8'h30 + i/8 ;
parameter [7:0] ip4d8 = 8'h30 + (i+4)/8 ;	  





















(* HBLKNM = {"kcpsm6_stack_ram",ip4d8} *)
FD return_vector_flop(  
	.D      (stack_memory[i]),
	.Q      (return_vector[i]),
	.C      (clk));




if (i % 2 == 0) begin: output_data

(* HBLKNM = {"kcpsm6_vector",id8} *)
LUT6_2 #(
	.INIT   (64'hFF00F0F0CCCCAAAA))
pc_vector_mux_lut( 
	.I0     (instruction[i]),
	.I1     (return_vector[i]),
	.I2     (instruction[i+1]),
	.I3     (return_vector[i+1]),
	.I4     (instruction[12]),
	.I5     (1'b1),
	.O5     (pc_vector[i]),
	.O6     (pc_vector[i+1]));

end 































(* HBLKNM = {"kcpsm6_pc",id4} *)
FDRE pc_flop(  
	.D      (pc_value[i]),
	.Q      (pc[i]),
	.R      (internal_reset),
	.CE     (t_state[1]),
	.C      (clk));

if (i == 0) begin: lsb_pc






if (interrupt_vector[i] == 1'b0) begin: low_int_vector

(* HBLKNM = {"kcpsm6_pc",id4} *)
LUT6 #(
	.INIT    (64'h00AA000033CC0F00))
pc_lut( 
	.I0     (register_vector[i]),
	.I1     (pc_vector[i]),
	.I2     (pc[i]),
	.I3     (pc_mode[0]),
	.I4     (pc_mode[1]),
	.I5     (pc_mode[2]), 
	.O      (half_pc[i]));

end 

if (interrupt_vector[i] == 1'b1) begin: high_int_vector

(* HBLKNM = {"kcpsm6_pc",id4} *)
LUT6 #(
	.INIT    (64'h00AA00FF33CC0F00))
pc_lut( 
	.I0     (register_vector[i]),
	.I1     (pc_vector[i]),
	.I2     (pc[i]),
	.I3     (pc_mode[0]),
	.I4     (pc_mode[1]),
	.I5     (pc_mode[2]), 
	.O      (half_pc[i]));

end 





(* HBLKNM = {"kcpsm6_pc",id4} *)
XORCY pc_xorcy( 
	.LI	(half_pc[i]),
	.CI	(1'b0),
	.O      (pc_value[i]));

(* HBLKNM = {"kcpsm6_pc",id4} *)
MUXCY pc_muxcy( 
	.DI 	(pc_mode[0]),
	.CI 	(1'b0),
	.S	(half_pc[i]),
        .O      (carry_pc[i]));

end 

if (i > 0) begin : upper_pc






if (interrupt_vector[i] == 1'b0) begin: low_int_vector

(* HBLKNM = {"kcpsm6_pc",id4} *)
LUT6 #(
	.INIT    (64'h00AA0000CCCCF000))
pc_lut( 
	.I0     (register_vector[i]),
	.I1     (pc_vector[i]),
	.I2     (pc[i]),
	.I3     (pc_mode[0]),
	.I4     (pc_mode[1]),
	.I5     (pc_mode[2]), 
	.O      (half_pc[i]));

end 

if (interrupt_vector[i] == 1'b1) begin: high_int_vector

(* HBLKNM = {"kcpsm6_pc",id4} *)
LUT6 #(
	.INIT    (64'h00AA00FFCCCCF000))
pc_lut( 
	.I0     (register_vector[i]),
	.I1     (pc_vector[i]),
	.I2     (pc[i]),
	.I3     (pc_mode[0]),
	.I4     (pc_mode[1]),
	.I5     (pc_mode[2]), 
	.O      (half_pc[i]));

end 




(* HBLKNM = {"kcpsm6_pc",id4} *)
XORCY pc_xorcy( 
	.LI	(half_pc[i]),
	.CI	(carry_pc[i-1]),
	.O      (pc_value[i]));





if (i < 11) begin: mid_pc

(* HBLKNM = {"kcpsm6_pc",id4} *)
MUXCY pc_muxcy( 
	.DI 	(1'b0),
	.CI 	(carry_pc[i-1]),
	.S 	(half_pc[i]),
	.O     	(carry_pc[i]));

end 

end 





end 
endgenerate