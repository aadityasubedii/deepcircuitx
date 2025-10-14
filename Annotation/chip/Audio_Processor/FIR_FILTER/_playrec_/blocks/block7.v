always @(posedge CLOCK_50)
	if(reset) ram_addr <= 0;
	else
		case(streg)
			st_start: ram_addr <= 0;
			st_rc_ram_nextaddr: ram_addr <= ram_addr + 1;
			st_pl_ram_nextaddr: ram_addr <= ram_addr + 1 + speed;
		endcase