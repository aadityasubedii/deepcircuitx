always @ (posedge clk_i)
begin
    if (rst_i[1] || manual_clear_error) begin
    
      dq_lane_error_r1 <= #TCQ 'b0;
      dq_lane_error_r2 <= #TCQ 'b0;
      data_valid_r <= #TCQ 1'b0;
      cumlative_dq_lane_error_reg <= #TCQ 'b0;
      end
    else begin
      data_valid_r <= #TCQ data_valid_i;
    
      dq_lane_error_r1 <= #TCQ dq_lane_error;
      cumlative_dq_lane_error_reg <= #TCQ cumlative_dq_lane_error_c;
    end
end