generate
genvar i;
	for (i=0; i<RESET_SYNC_STAGES+NUM_RESET_OUTPUT-1; i=i+1)
	begin: reset_stage