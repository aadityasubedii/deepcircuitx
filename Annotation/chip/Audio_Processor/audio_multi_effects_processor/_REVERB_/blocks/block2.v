always@(DATA_IN)
begin
	DATA_OUT = DATA_IN + (IN[8]>>2 + IN[8]>>1)  + (IN[16]>>2 + IN[16]>>1)
	 + (IN[24]>>2 + IN[24]>>1) + (IN[32]>>2 + IN[32]>>1)  + (IN[40]>>2 + IN[40]>>1);
end