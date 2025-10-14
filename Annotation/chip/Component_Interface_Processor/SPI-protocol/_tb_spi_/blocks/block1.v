task reg_write(input [ADDR_WIDTH-1:0] addr, input [DATA_WIDTH-1:0] data);
begin
	@(posedge pclk_i);
	paddr_i = addr;
	pwdata_i = data;
	pwrite_i = 1;
	penable_i = 1;
	wait (pready_o == 1);
	@(posedge pclk_i);
	pwrite_i = 0;
	penable_i = 0;
	paddr_i = 0;
	pwdata_i = 0;
end
endtask