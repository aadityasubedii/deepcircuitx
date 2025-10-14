  assign IP2Bus_Data  = (mem_read_ack == 1'b1) ? mem_ip2bus_data : 0;
  assign IP2Bus_AddrAck = (mem_write_ack || (mem_read_enable && mem_read_ack));
  assign IP2Bus_WrAck = mem_write_ack;
  assign IP2Bus_RdAck = mem_read_ack;
  assign IP2Bus_Error = 0;