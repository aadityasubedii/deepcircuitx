always @ (posedge clk_i) begin
   if (rst_i[4]) begin
        addr_counts <= #TCQ    start_addr_i;
        mem_init_done <= #TCQ  1'b0;
  end else if (cmd_clk_en_r || mode_load_pulse_r1)
    if(addr_counts_next_r>= end_addr_i) begin
                addr_counts <= #TCQ    start_addr_i;
                mem_init_done <= #TCQ  1'b1;
    end else if(addr_counts < end_addr_r)  
                addr_counts <= #TCQ    addr_counts + INC_COUNTS;
end