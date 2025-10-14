always @ (posedge clk_i) 
begin
     if (rst_i[2])
        pipe_data_in[41] <=  #TCQ   'b0;
     else if (cmd_vld)
        pipe_data_in[41] <=  #TCQ   instr_vld;
     else if (rdy_i && pipe_out_vld)
        pipe_data_in[41] <=  #TCQ   1'b0;
 end