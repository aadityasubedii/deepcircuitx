generate
for (i = 0 ; i <= 7 ; i = i+1)
begin : data_path_loop
parameter [7:0]	id1 = 8'h30 + i ;
parameter [7:0]	id2 = 8'h30 + i/2 ;
parameter [7:0]	id4 = 8'h30 + i/4 ;
















if (i % 2 == 0) begin: output_data

(* HBLKNM = "kcpsm6_port_id" *)
LUT6_2 #(
	.INIT    (64'hFF00F0F0CCCCAAAA))
sy_kk_mux_lut( 
	.I0     (sy[i]),
	.I1     (instruction[i]),
	.I2     (sy[i+1]),
	.I3     (instruction[i+1]),
	.I4     (instruction[12]),
	.I5     (1'b1),
	.O5     (sy_or_kk[i]),
	.O6     (sy_or_kk[i+1]));

end 


















if (i % 2 == 0) begin: second_operand

(* HBLKNM = "kcpsm6_out_port" *)
LUT6_2 #(
	.INIT    (64'hFF00F0F0CCCCAAAA))
out_port_lut( 
	.I0     (sx[i]),
	.I1     (instruction[i+4]),
	.I2     (sx[i+1]),
	.I3     (instruction[i+5]),
	.I4     (instruction[13]),
	.I5     (1'b1),
	.O5     (out_port[i]),
	.O6     (out_port[i+1]));

end 





























(* HBLKNM = {"kcpsm6_add",id4} *)
LUT6_2 #(
	.INIT    (64'h69696E8ACCCC0000))
arith_logical_lut( 
	.I0     (sy_or_kk[i]),
	.I1     (sx[i]),
	.I2     (arith_logical_sel[0]),
	.I3     (arith_logical_sel[1]),
	.I4     (arith_logical_sel[2]),
	.I5     (1'b1),
	.O5     (logical_carry_mask[i]),
	.O6     (half_arith_logical[i]));

(* HBLKNM = {"kcpsm6_add",id4} *)
FD arith_logical_flop( 
	.D      (arith_logical_value[i]),
	.Q      (arith_logical_result[i]),
	.C      (clk)) ;

if (i == 0) begin: lsb_arith_logical



(* HBLKNM = {"kcpsm6_add",id4} *)
MUXCY arith_logical_muxcy( 
	.DI 	(logical_carry_mask[i]),
	.CI 	(arith_carry_in),
	.S 	(half_arith_logical[i]),
	.O      (carry_arith_logical[i]));

(* HBLKNM = {"kcpsm6_add",id4} *)
XORCY arith_logical_xorcy( 
	.LI 	(half_arith_logical[i]),
	.CI 	(arith_carry_in),
	.O      (arith_logical_value[i]));

end 

if (i > 0) begin: upper_arith_logical



(* HBLKNM = {"kcpsm6_add",id4} *)
MUXCY arith_logical_muxcy( 
	.DI 	(logical_carry_mask[i]),
	.CI 	(carry_arith_logical[i-1]),
	.S 	(half_arith_logical[i]),
	.O      (carry_arith_logical[i]));

(* HBLKNM = {"kcpsm6_add",id4} *)
XORCY arith_logical_xorcy( 
	.LI 	(half_arith_logical[i]),
	.CI 	(carry_arith_logical[i-1]),
	.O      (arith_logical_value[i]));

end 








































if (hwbuild[i] == 1'b0) begin: low_hwbuild 



(* HBLKNM = "kcpsm6_sandr" *)
FDR shift_rotate_flop( 
	.D      (shift_rotate_value[i]),
	.Q      (shift_rotate_result[i]),
	.R      (instruction[7]),
	.C      (clk)) ;
           
end 

if (hwbuild[i] == 1'b1) begin: high_hwbuild 



(* HBLKNM = "kcpsm6_sandr" *)
FDS shift_rotate_flop( 
	.D      (shift_rotate_value[i]),
	.Q      (shift_rotate_result[i]),
	.S 	(instruction[7]),
	.C      (clk)) ;

end 

if (i == 0) begin: lsb_shift_rotate



(* HBLKNM = "kcpsm6_decode1" *)
LUT6 #(
	.INIT    (64'hBFBC8F8CB3B08380))
shift_bit_lut( 
	.I0     (instruction[0]),
	.I1     (instruction[1]),
	.I2     (instruction[2]),
	.I3     (carry_flag),
	.I4     (sx[0]),
	.I5     (sx[7]),
	.O      (shift_in_bit));




(* HBLKNM = "kcpsm6_sandr" *)
LUT6_2 #(
	.INIT    (64'hFF00F0F0CCCCAAAA))
shift_rotate_lut( 
	.I0     (shift_in_bit),
	.I1     (sx[i+1]),
	.I2     (sx[i]),
	.I3     (sx[i+2]),
	.I4     (instruction[3]),
	.I5     (1'b1),
	.O5     (shift_rotate_value[i]),
	.O6     (shift_rotate_value[i+1]));

end 

if (i == 2 || i == 4) begin: mid_shift_rotate



(* HBLKNM = "kcpsm6_sandr" *)
LUT6_2 #(
	.INIT    (64'hFF00F0F0CCCCAAAA))
shift_rotate_lut( 
	.I0     (sx[i-1]),
	.I1     (sx[i+1]),
	.I2     (sx[i]),
	.I3     (sx[i+2]),
	.I4     (instruction[3]),
	.I5     (1'b1),
	.O5     (shift_rotate_value[i]),
	.O6     (shift_rotate_value[i+1]));

end 

if (i == 6) begin: msb_shift_rotate



(* HBLKNM = "kcpsm6_sandr" *)
LUT6_2 #(
	.INIT    (64'hFF00F0F0CCCCAAAA))
shift_rotate_lut( 
	.I0     (sx[i-1]),
	.I1     (sx[i+1]),
	.I2     (sx[i]),
	.I3     (shift_in_bit),
	.I4     (instruction[3]),
	.I5     (1'b1),
	.O5     (shift_rotate_value[i]),
	.O6     (shift_rotate_value[i+1]));

end 

















(* HBLKNM = {"kcpsm6_alu",id4} *)
LUT6 #(
	.INIT    (64'hFF00F0F0CCCCAAAA))
alu_mux_lut( 
	.I0     (arith_logical_result[i]),
	.I1     (shift_rotate_result[i]),
	.I2     (in_port[i]),
	.I3     (spm_data[i]),
	.I4     (alu_mux_sel[0]),
	.I5     (alu_mux_sel[1]),
	.O      (alu_result[i]));




















if (scratch_pad_memory_size == 64) begin : small_spm

(* HBLKNM = {"kcpsm6_spm",id4} *)
FD spm_flop( 
	.D      (spm_ram_data[i]),
	.Q      (spm_data[i]),
	.C      (clk)) ;

if (i == 0 || i == 4) begin: small_spm_ram

RAM64M #( 
	.INIT_A	(64'h0000000000000000),
	.INIT_B	(64'h0000000000000000),
	.INIT_C	(64'h0000000000000000),
	.INIT_D	(64'h0000000000000000)) 
spm_ram(   
	.DOA 	(spm_ram_data[i]),
	.DOB 	(spm_ram_data[i+1]),
	.DOC    (spm_ram_data[i+2]),
	.DOD    (spm_ram_data[i+3]),
	.ADDRA 	(sy_or_kk[5:0]),
	.ADDRB 	(sy_or_kk[5:0]),
	.ADDRC  (sy_or_kk[5:0]),
	.ADDRD  (sy_or_kk[5:0]),
	.DIA 	(sx[i]),
	.DIB 	(sx[i+1]),
	.DIC    (sx[i+2]),
	.DID    (sx[i+3]),
	.WE 	(spm_enable),
	.WCLK 	(clk));

end 

end 

if (scratch_pad_memory_size == 128) begin : medium_spm

(* HBLKNM = {"kcpsm6_spm",id2} *)
RAM128X1S  #(
	.INIT	(128'h00000000000000000000000000000000))
spm_ram(       
	.D      (sx[i]),
	.WE 	(spm_enable),
	.WCLK 	(clk),
	.A0 	(sy_or_kk[0]),
	.A1 	(sy_or_kk[1]),
	.A2 	(sy_or_kk[2]),
	.A3 	(sy_or_kk[3]),
	.A4 	(sy_or_kk[4]),
	.A5 	(sy_or_kk[5]),
	.A6 	(sy_or_kk[6]),
	.O      (spm_ram_data[i]));

(* HBLKNM = {"kcpsm6_spm",id2} *)
FD spm_flop( 
	.D      (spm_ram_data[i]),
	.Q      (spm_data[i]),
	.C      (clk)) ;

end 

if (scratch_pad_memory_size == 256) begin : large_spm

(* HBLKNM = {"kcpsm6_spm",id1} *)
RAM256X1S #(
	.INIT	(256'h0000000000000000000000000000000000000000000000000000000000000000))
spm_ram (       
	.D      (sx[i]),
	.WE 	(spm_enable),
	.WCLK 	(clk),
	.A 	(sy_or_kk),
	.O      (spm_ram_data[i]));

(* HBLKNM = {"kcpsm6_spm",id1} *)
FD spm_flop( 
	.D      (spm_ram_data[i]),
	.Q      (spm_data[i]),
	.C      (clk)) ;

end 





end 
endgenerate