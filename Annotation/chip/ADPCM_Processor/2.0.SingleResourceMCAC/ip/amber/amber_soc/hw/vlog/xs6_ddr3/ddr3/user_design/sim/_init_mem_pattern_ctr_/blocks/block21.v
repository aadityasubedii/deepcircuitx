always @ (posedge clk_i)
begin
if (rst_i)
    current_address <= BEGIN_ADDRESS;
else if (mcb_wr_en_i && (current_state == INIT_MEM_WRITE && (PORT_MODE == "WR_MODE" || PORT_MODE == "BI_MODE"))
         || (mcb_wr_en_i && (current_state == IDLE && PORT_MODE == "RD_MODE")) )
    current_address <= current_address + INC_COUNTS;
else
    current_address <= current_address;

end    