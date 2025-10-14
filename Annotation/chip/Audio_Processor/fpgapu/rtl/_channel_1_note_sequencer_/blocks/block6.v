  always @(*) begin
    case (r_vibrato_index)
      4'd00: begin r_vibrato_depth = 3'd0;  r_vibrato_len = note_len(30); end

      4'd01: begin r_vibrato_depth = 3'd0;  r_vibrato_len = note_len(7); end
      4'd02: begin r_vibrato_depth = 3'd1;  r_vibrato_len = note_len(11); end
      4'd03: begin r_vibrato_depth = 3'd0;  r_vibrato_len = note_len(12); end

      4'd04: begin r_vibrato_depth = 3'd0;  r_vibrato_len = note_len(13); end
      4'd05: begin r_vibrato_depth = 3'd2;  r_vibrato_len = note_len(9); end
      4'd06: begin r_vibrato_depth = 3'd0;  r_vibrato_len = note_len(8); end

      4'd07: begin r_vibrato_depth = 3'd0;  r_vibrato_len = note_len(30); end

      4'd08: begin r_vibrato_depth = 3'd0;  r_vibrato_len = note_len(7); end
      4'd09: begin r_vibrato_depth = 3'd3;  r_vibrato_len = note_len(17); end
      4'd10: begin r_vibrato_depth = 3'd0;  r_vibrato_len = note_len(6); end

      4'd11: begin r_vibrato_depth = 3'd0;  r_vibrato_len = note_len(14); end
      4'd12: begin r_vibrato_depth = 3'd4;  r_vibrato_len = note_len(16); end

      default: begin r_vibrato_depth = 0;  r_vibrato_len = note_len(30); end
    endcase
  end