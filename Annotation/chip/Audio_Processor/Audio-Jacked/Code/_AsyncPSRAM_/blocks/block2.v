always @ (posedge sysclk)
begin
    b <= MEM_DATA;
    a <= mem_data_out;
end