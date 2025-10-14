  always @(posedge i_clk) begin
    if (i_rst) begin
      r_vibrato_index <= 0;
      r_vibrato_len_count <= 0;
    end else if (i_note_stb) begin
      if (r_vibrato_len_count == r_vibrato_len) begin
        r_vibrato_len_count <= 0;
        r_vibrato_index <= r_vibrato_index + 1;
        if (r_vibrato_index == 4'd12) begin
          r_vibrato_index <= 0;
        end
      end else begin
        r_vibrato_len_count <= r_vibrato_len_count + 1;
      end
    end
  end