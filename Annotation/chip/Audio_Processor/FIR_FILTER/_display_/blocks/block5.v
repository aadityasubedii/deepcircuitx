always @(*) begin
	st = streg;
	case(streg)
		st_ploty: if(y == ymax) st = st_done;
		st_done: if(!freeze && (delay_counter == sweep_delay)) st = st_ploty;
	endcase
end