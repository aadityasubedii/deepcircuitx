  always @(posedge i_clk) begin
    if (i_rst) begin
      r_note_index <= 0;
      r_duration_count <= 0;
    end else if (i_note_stb) begin
      if (r_duration_count == r_note_len) begin
        r_duration_count <= 0;
        r_note_index <= r_note_index + 1;
        if (r_note_index == 4'd14) begin
          r_note_index <= 0;
        end
        
      end else begin
        r_duration_count <= r_duration_count + 1;
        
      end
    end
  end