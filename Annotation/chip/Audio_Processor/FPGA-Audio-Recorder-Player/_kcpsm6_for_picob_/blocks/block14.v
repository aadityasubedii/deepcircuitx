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



