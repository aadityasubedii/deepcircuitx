always@(vga_addr_bit)
	if (reset)
		buff_num <= 0;
	else 
		buff_num <= ~buff_num; 