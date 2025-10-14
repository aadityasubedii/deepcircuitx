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