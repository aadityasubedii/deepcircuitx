always@(*)
	case(present_state)
		`menu1: 		if(record)
							next_state = `menu1_wait;
						else
							next_state = `menu1;
		`menu1_wait:if(no_touch)
							next_state = `menu2;
						else
							next_state = `menu1_wait;
		`menu2: 		if(stop)
							next_state = `menu2_wait;
						else if (end_progress_bar)
							next_state = `menu3;
						else
							next_state = `menu2;
		`menu2_wait:if(no_touch)
							next_state = `menu3;
						else
							next_state = `menu2_wait;
		`menu3: 		if(record_new)
							next_state = `menu3_wait;
						else
							next_state = `menu3;
		`menu3_wait:if(no_touch)
							next_state = `menu1;
						else
							next_state = `menu3_wait;
		default: next_state = `menu1;
	endcase