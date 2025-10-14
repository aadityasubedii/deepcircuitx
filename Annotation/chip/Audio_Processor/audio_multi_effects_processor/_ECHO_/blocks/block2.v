always@(DATA_IN)
begin
    DATA_OUT = DATA_IN + (IN[40]>>2 + IN[40]>>1);
end