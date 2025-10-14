always @(*)
begin
	case (rom_address_counter)
	0		:	rom_data	<=	{6'h02, LCM_INPUT_FORMAT_UB};
	1		:	rom_data	<=	{6'h03, LCM_INPUT_FORMAT_LB};
	2		:	rom_data	<=	{6'h04, LCM_POWER};
	3		:	rom_data	<=	{6'h05, LCM_DIRECTION_AND_PHASE};
	4		:	rom_data	<=	{6'h06, LCM_HORIZONTAL_START_POSITION};
	5		:	rom_data	<=	{6'h07, LCM_VERTICAL_START_POSITION};
	6		:	rom_data	<=	{6'h08, LCM_ENB_NEGATIVE_POSITION};
	7		:	rom_data	<=	{6'h09, LCM_GAIN_OF_CONTRAST};
	8		:	rom_data	<=	{6'h0A, LCM_R_GAIN_OF_SUB_CONTRAST};
	9		:	rom_data	<=	{6'h0B, LCM_B_GAIN_OF_SUB_CONTRAST};
	10		:	rom_data	<=	{6'h0C, LCM_OFFSET_OF_BRIGHTNESS};
	11		:	rom_data	<=	{6'h10, LCM_VCOM_HIGH_LEVEL};
	12		:	rom_data	<=	{6'h11, LCM_VCOM_LOW_LEVEL};
	13		:	rom_data	<=	{6'h12, LCM_PCD_HIGH_LEVEL};
	14		:	rom_data	<=	{6'h13, LCM_PCD_LOW_LEVEL};
	15		:	rom_data	<=	{6'h14, LCM_GAMMA_CORRECTION_0};
	16		:	rom_data	<=	{6'h15, LCM_GAMMA_CORRECTION_1};
	17		:	rom_data	<=	{6'h16, LCM_GAMMA_CORRECTION_2};
	18		:	rom_data	<=	{6'h17, LCM_GAMMA_CORRECTION_3};
	19		:	rom_data	<=	{6'h18, LCM_GAMMA_CORRECTION_4};
	default	:	rom_data	<=	14'h0000;
	endcase
end