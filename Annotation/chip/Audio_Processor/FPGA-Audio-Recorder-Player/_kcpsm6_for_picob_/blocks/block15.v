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
