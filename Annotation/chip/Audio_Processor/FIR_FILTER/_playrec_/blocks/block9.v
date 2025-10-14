always @(*) begin
	st = streg;
	case(streg)
		st_start: st = st_input_check;
		st_input_check:
			if(!pause)
				if(play) st = st_pl_audio_wait;
				else if(record) st = st_rc_audio_wait;
				else st = st_start;

		st_rc_audio_wait: if(audio_in_available) st = st_rc_ram_nextaddr;
		st_rc_ram_nextaddr: st = st_rc_ram_wait;
		st_rc_ram_wait: if(!ram_waitrq) st = st_input_check;

		st_pl_audio_wait: if(audio_out_allowed) st = st_pl_ram_rd;
		st_pl_ram_rd: if(!ram_waitrq && ram_valid) st = st_pl_ram_nextaddr; 
																			
		st_pl_ram_nextaddr: st = st_input_check;
	endcase
end