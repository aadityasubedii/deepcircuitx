if (scratch_pad_memory_size == 64) begin : small_spm

(* HBLKNM = {"kcpsm6_spm",id4} *)
FD spm_flop( 
	.D      (spm_ram_data[i]),
	.Q      (spm_data[i]),
	.C      (clk)) ;
