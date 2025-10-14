	always @(*)
		case (cond_code)
			`EQ:	code_met = 	 Z ? 			1'b1:1'b0;
			`NE:	code_met = 	~Z ? 			1'b1:1'b0;
			`GE:	code_met = 	(N || Z)	? 	1'b1:1'b0;
			`CS: 	code_met = 	 C ? 			1'b1:1'b0;
			`CC: 	code_met = 	~C ? 			1'b1:1'b0;
			`HI:	code_met = 	 L ? 			1'b1:1'b0;
			`LS: 	code_met = 	~L ? 			1'b1:1'b0;
			`LO: 	code_met = 	~(L && Z) ? 1'b1:1'b0;
			`HS: 	code_met = 	~(L || Z) ? 1'b1:1'b0;
			`GRT:	code_met	=	 N	?			1'b1:1'b0;
			`LE:	code_met	=	~N	?			1'b1:1'b0;
			`FS:	code_met	=	 F	?			1'b1:1'b0;
			`FC:	code_met = 	~F	?			1'b1:1'b0;
			`LT:	code_met = 	~(N && Z) ? 1'b1:1'b0;
			`UC:	code_met = 					1'b0;
			`AT:	code_met = 					1'b1;
			default: code_met = 				1'b0;
		endcase