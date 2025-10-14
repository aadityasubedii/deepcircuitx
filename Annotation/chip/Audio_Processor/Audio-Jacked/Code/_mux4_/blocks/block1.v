	 always @(*)
		case(control)
			2'b00: e = a;
			2'b01: e = b;
			2'b10: e = c;
			2'b11: e = d;
			default: e = a;
		endcase