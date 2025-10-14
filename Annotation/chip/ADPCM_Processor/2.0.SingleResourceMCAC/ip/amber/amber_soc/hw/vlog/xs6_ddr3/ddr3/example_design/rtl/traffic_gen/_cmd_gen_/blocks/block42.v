always @ (posedge clk_i) begin
 if (rst_i[0]) begin
    rd_data_counts_asked <= #TCQ  'b0;
  end else if (instr_vld_dly1 && pipe_data_in[32]== 1) begin
    if (pipe_data_in[40:35] == 0)
       rd_data_counts_asked <=  #TCQ rd_data_counts_asked + (64) ;
    else
       rd_data_counts_asked <=  #TCQ rd_data_counts_asked + (pipe_data_in[40:35]) ;

    end
 end