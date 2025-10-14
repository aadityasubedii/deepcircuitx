  always @(posedge out_clk or posedge out_reset) begin
    if (out_reset) begin
      out_data_toggle_flopped <= 1'b0;
      out_data_buffer <= {DATA_WIDTH{1'b0}};
    end else begin
      out_data_buffer <= in_data_buffer;
      if (out_data_taken) begin
        out_data_toggle_flopped <= out_data_toggle;
      end
    end 
  end 