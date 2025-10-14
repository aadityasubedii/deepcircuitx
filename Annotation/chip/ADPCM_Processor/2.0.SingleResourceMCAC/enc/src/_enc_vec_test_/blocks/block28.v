generate
	for (n=0; n<501; n=n+1) begin : gg
		assign memory[n] = test.u_main_mem.ram[n + 2100];
	end
endgenerate