always @ (posedge clk_i) begin
 if (rst_i[0]) begin
     rd_data_received_counts <= #TCQ  'b0;
     rd_data_received_counts_total <= #TCQ  'b0;
  end else if(reading_rd_data_i) begin
     rd_data_received_counts <= #TCQ  rd_data_received_counts + 1;
     rd_data_received_counts_total <= #TCQ  rd_data_received_counts_total + 1;
     end
 end