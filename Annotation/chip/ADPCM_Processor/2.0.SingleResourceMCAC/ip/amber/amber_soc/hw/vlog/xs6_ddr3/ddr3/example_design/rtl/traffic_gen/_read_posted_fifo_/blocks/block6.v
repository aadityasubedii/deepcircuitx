 always @ (posedge clk_i)
 begin
 if (rst_i) begin
     rd_data_received_counts <= #TCQ 'b0;
     end
 else if (data_valid_i) begin
     rd_data_received_counts <= #TCQ rd_data_received_counts + 1;
     end     
 end