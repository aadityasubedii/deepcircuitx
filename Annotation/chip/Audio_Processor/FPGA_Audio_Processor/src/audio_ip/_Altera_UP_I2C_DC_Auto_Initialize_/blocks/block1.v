always @(*)
begin
	case (rom_address_counter)
	0		:	rom_data	<=	{10'h201, DC_ROW_START};
	1		:	rom_data	<=	{10'h002, DC_COLUMN_START};
	2		:	rom_data	<=	{10'h003, DC_ROW_WIDTH};
	3		:	rom_data	<=	{10'h004, DC_COLUMN_WIDTH};
	4		:	rom_data	<=	{10'h005, DC_H_BLANK_B};
	5		:	rom_data	<=	{10'h006, DC_V_BLANK_B};
	6		:	rom_data	<=	{10'h007, DC_H_BLANK_A};
	7		:	rom_data	<=	{10'h008, DC_V_BLANK_A};
	8		:	rom_data	<=	{10'h009, DC_SHUTTER_WIDTH};
	9		:	rom_data	<=	{10'h00A, DC_ROW_SPEED};
	10		:	rom_data	<=	{10'h00B, DC_EXTRA_DELAY};
	11		:	rom_data	<=	{10'h00C, DC_SHUTTER_DELAY};
	12		:	rom_data	<=	{10'h10D, DC_RESET};
	13		:	rom_data	<=	{10'h21F, DC_FRAME_VALID};
	14		:	rom_data	<=	{10'h020, DC_READ_MODE_B};
	15		:	rom_data	<=	{10'h021, DC_READ_MODE_A};
	16		:	rom_data	<=	{10'h022, DC_DARK_COL_ROW};
	17		:	rom_data	<=	{10'h123, DC_FLASH};
	18		:	rom_data	<=	{10'h22B, DC_GREEN_GAIN_1};
	19		:	rom_data	<=	{10'h02C, DC_BLUE_GAIN};
	20		:	rom_data	<=	{10'h02D, DC_RED_GAIN};
	21		:	rom_data	<=	{10'h02E, DC_GREEN_GAIN_2};
	22		:	rom_data	<=	{10'h12F, DC_GLOBAL_GAIN};
	23		:	rom_data	<=	{10'h3C8, DC_CONTEXT_CTRL};
	default	:	rom_data	<=	26'h1000000;
	endcase
end