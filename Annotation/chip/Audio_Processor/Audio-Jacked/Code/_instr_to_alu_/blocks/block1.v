always @(*)		
	case (op_hi)
		`REGISTER:	case (op_lo)
						`ADD: 	alu_op = 4'b0010; 
						`MUL:	alu_op = 4'b0111; 
						`SUB: 	alu_op = 4'b1010; 
						`CMP: 	alu_op = 4'b0011; 
						`AND: 	alu_op = 4'b0000; 
						`OR:	alu_op = 4'b0001; 
						`XOR:	alu_op = 4'b0100; 
						default:alu_op = 4'b0011; 
					endcase
		`ADDI:	alu_op = 4'b0010; 
		
		
		`MULI:	alu_op = 4'b0111; 
		`ANDI:	alu_op = 4'b0000; 
		`ORI:	alu_op = 4'b0001; 
		`XORI:	alu_op = 4'b0100; 
		`SUBI:	alu_op = 4'b1010; 
		
		`CMPI:	alu_op = 4'b0011; 
		`SPECIAL: alu_op = 4'b0011; 
		default:alu_op = 4'b0011; 
	endcase