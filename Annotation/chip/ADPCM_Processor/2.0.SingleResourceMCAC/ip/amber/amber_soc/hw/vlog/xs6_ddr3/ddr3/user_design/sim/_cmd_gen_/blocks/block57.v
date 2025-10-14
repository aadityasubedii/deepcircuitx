assign addr_o       = pipe_data_o[31:0];
assign instr_o      = pipe_data_o[34:32];
assign bl_o         = pipe_data_o[40:35];


assign cmd_o_vld    = pipe_data_o[41] & run_traffic_r;
assign pipe_out_vld = pipe_data_o[41] & run_traffic_r;


assign pipe_data_o = pipe_data_in;
