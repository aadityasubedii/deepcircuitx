always @*
begin
	shift_32 = i_shift_amount == 32;

	shift_over = |i_shift_amount[7:5];

	shift_nzero = |i_shift_amount[7:0];

	shift_amount = i_shift_amount[4:0];

	if (i_shift_imm_zero) begin
		if (i_function == LSR || i_function == ASR) begin
			
			
			
			
			shift_nzero = 1'b1;
			shift_over = 1'b1;
			
			
		end else if (i_function == ROR) begin
			
			shift_amount[0] = 1'b1;
			shift_nzero = 1'b1;
		end
	end

	
	
	
	case (i_function)
		LSL: low_selector = shift_amount[3:0];
		LSR: low_selector = shift_amount[3:0];
		ASR: low_selector = shift_amount[3:0];
		ROR: low_selector = 4'b0000;
	endcase

	
	case (i_function)
		LSL: lsl_selector = {shift_32, shift_over, shift_amount[4]};
		LSR: lsl_selector = 3'b0_1_0; 
		ASR: lsl_selector = 3'b0_1_0; 
		ROR: lsl_selector = 3'b0_1_0; 
	endcase

	
	case (i_function)
		LSL: lsr_selector = 3'b0_1_0; 
		LSR: lsr_selector = {shift_32, shift_over, shift_amount[4]};
		ASR: lsr_selector = {shift_32, shift_over, shift_amount[4]};
		ROR: lsr_selector = 3'b0_0_0; 
	endcase

	
	case (i_function)
		LSL: direction = 1'b0; 
		LSR: direction = 1'b1; 
		ASR: direction = 1'b1; 
		ROR: direction = 1'b1; 
	endcase

	
	asr_sign = 1'b0;
	if (i_function == ASR && i_in[31])
		asr_sign = 1'b1;
end