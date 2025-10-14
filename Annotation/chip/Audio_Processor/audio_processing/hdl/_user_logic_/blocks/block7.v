always @( posedge Bus2IP_Clk)
  begin
    if(Bus2IP_Resetn == 0) 
    begin
      mem_read_ack_dly1 <= 0;
      mem_read_ack_dly2 <= 0;
    end
    else
    begin
      mem_read_ack_dly1 <= mem_read_enable;
      mem_read_ack_dly2 <= mem_read_ack_dly1;
    end
  end