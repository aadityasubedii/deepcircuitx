     begin : UNREGISTERED_READY_PLINE
	
	
	assign in_ready = (~full1) | out_ready;
	