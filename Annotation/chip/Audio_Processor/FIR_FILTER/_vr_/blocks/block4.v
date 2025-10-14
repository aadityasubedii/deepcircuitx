always @(*)
	case(scale)
		0: display_data_scaled = display_data;
		1: display_data_scaled = {{2{display_data[15]}}, display_data[14:1]};
		2: display_data_scaled = {{3{display_data[15]}}, display_data[14:2]};
		3: display_data_scaled = {{4{display_data[15]}}, display_data[14:3]};
		4: display_data_scaled = {{5{display_data[15]}}, display_data[14:4]};
		5: display_data_scaled = {{6{display_data[15]}}, display_data[14:5]};
		6: display_data_scaled = {{7{display_data[15]}}, display_data[14:6]};
		7: display_data_scaled = {{8{display_data[15]}}, display_data[14:7]};
		8: display_data_scaled = {{9{display_data[15]}}, display_data[14:8]};
		9: display_data_scaled = {{10{display_data[15]}}, display_data[14:9]};
		10: display_data_scaled = {{11{display_data[15]}}, display_data[14:10]};
		11: display_data_scaled = {{12{display_data[15]}}, display_data[14:11]};
		12: display_data_scaled = {{13{display_data[15]}}, display_data[14:12]};
		13: display_data_scaled = {{14{display_data[15]}}, display_data[14:13]};
		14: display_data_scaled = {{15{display_data[15]}}, display_data[14:14]};
		15: display_data_scaled = {16{display_data[15]}};
	endcase