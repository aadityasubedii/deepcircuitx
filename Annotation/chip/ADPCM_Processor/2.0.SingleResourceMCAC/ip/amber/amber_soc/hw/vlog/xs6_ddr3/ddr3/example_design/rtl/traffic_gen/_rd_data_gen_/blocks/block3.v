always @ (data_valid, data_port_fifo_rdy)
if (FAMILY == "SPARTAN6")
    data_valid_o = data_valid;
else
    data_valid_o = data_port_fifo_rdy;