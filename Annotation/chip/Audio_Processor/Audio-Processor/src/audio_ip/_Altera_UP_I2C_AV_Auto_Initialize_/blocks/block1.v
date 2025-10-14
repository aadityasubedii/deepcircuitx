always @(*)
begin
	case (rom_address_counter)
	
	0		:	rom_data	<=	{10'h334, 7'h0, AUD_LINE_IN_LC};
	1		:	rom_data	<=	{10'h334, 7'h1, AUD_LINE_IN_RC};
	2		:	rom_data	<=	{10'h334, 7'h2, AUD_LINE_OUT_LC};
	3		:	rom_data	<=	{10'h334, 7'h3, AUD_LINE_OUT_RC};
	4		:	rom_data	<=	{10'h334, 7'h4, AUD_ADC_PATH};
	5		:	rom_data	<=	{10'h334, 7'h5, AUD_DAC_PATH};
	6		:	rom_data	<=	{10'h334, 7'h6, AUD_POWER};
	7		:	rom_data	<=	{10'h334, 7'h7, AUD_DATA_FORMAT};
	8		:	rom_data	<=	{10'h334, 7'h8, AUD_SAMPLE_CTRL};
	9		:	rom_data	<=	{10'h334, 7'h9, AUD_SET_ACTIVE};
	
	10		:	rom_data	<=	26'h3401500;
	11		:	rom_data	<=	26'h3401741;
	12		:	rom_data	<=	26'h3403a16;
	13		:	rom_data	<=	26'h3405004;
	14		:	rom_data	<=	26'h340c305;
	15		:	rom_data	<=	26'h340c480;
	16		:	rom_data	<=	26'h3400e80;
	17		:	rom_data	<=	26'h3405020;
	18		:	rom_data	<=	26'h3405218;
	19		:	rom_data	<=	26'h34058ed;
	20		:	rom_data	<=	26'h34077c5;
	21		:	rom_data	<=	26'h3407c93;
	22		:	rom_data	<=	26'h3407d00;
	23		:	rom_data	<=	26'h340d048;
	24		:	rom_data	<=	26'h340d5a0;
	25		:	rom_data	<=	26'h340d7ea;
	26		:	rom_data	<=	26'h340e43e;
	27		:	rom_data	<=	26'h340ea0f;
	28		:	rom_data	<=	26'h3403112;
	29		:	rom_data	<=	26'h3403281;
	30		:	rom_data	<=	26'h3403384;
	31		:	rom_data	<=	26'h34037A0;
	32		:	rom_data	<=	26'h340e580;
	33		:	rom_data	<=	26'h340e603;
	34		:	rom_data	<=	26'h340e785;
	35		:	rom_data	<=	26'h3405000;
	36		:	rom_data	<=	26'h3405100;
	37		:	rom_data	<=	26'h3400070;
	38		:	rom_data	<=	26'h3401010;
	39		:	rom_data	<=	26'h3400482;
	40		:	rom_data	<=	26'h3400860;
	41		:	rom_data	<=	26'h3400a18;
	42		:	rom_data	<=	26'h3401100;
	43		:	rom_data	<=	26'h3402b00;
	44		:	rom_data	<=	26'h3402c8c;
	45		:	rom_data	<=	26'h3402df2;
	46		:	rom_data	<=	26'h3402eee;
	47		:	rom_data	<=	26'h3402ff4;
	48		:	rom_data	<=	26'h34030d2;
	49		:	rom_data	<=	26'h3400e05;
	default	:	rom_data	<=	26'h1000000;
	endcase