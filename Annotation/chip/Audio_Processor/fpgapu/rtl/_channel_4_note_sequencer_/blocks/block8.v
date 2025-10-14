  always @(*) begin
    case (r_note_index)
      5'd00: begin r_note = 2'd0;  r_note_len = note_len(30); end
      5'd01: begin r_note = 2'd0;  r_note_len = note_len(30); end
      5'd02: begin r_note = 2'd0;  r_note_len = note_len(30); end
      5'd03: begin r_note = 2'd0;  r_note_len = note_len(30); end

      5'd04: begin r_note = 2'd0;  r_note_len = note_len(22); end
      5'd05: begin r_note = 2'd2;  r_note_len = note_len(2); end
      5'd06: begin r_note = 2'd1;  r_note_len = note_len(2); end
      5'd07: begin r_note = 2'd2;  r_note_len = note_len(2); end
      5'd08: begin r_note = 2'd1;  r_note_len = note_len(2); end

      5'd09: begin r_note = 2'd1;  r_note_len = note_len(2); end
      5'd10: begin r_note = 2'd3;  r_note_len = note_len(2); end
      5'd11: begin r_note = 2'd2;  r_note_len = note_len(2); end
      5'd12: begin r_note = 2'd3;  r_note_len = note_len(2); end

      5'd13: begin r_note = 2'd1;  r_note_len = note_len(2); end
      5'd14: begin r_note = 2'd3;  r_note_len = note_len(2); end
      5'd15: begin r_note = 2'd2;  r_note_len = note_len(2); end
      5'd16: begin r_note = 2'd3;  r_note_len = note_len(2); end

      5'd17: begin r_note = 2'd1;  r_note_len = note_len(2); end
      5'd18: begin r_note = 2'd3;  r_note_len = note_len(2); end
      5'd19: begin r_note = 2'd2;  r_note_len = note_len(2); end
      5'd20: begin r_note = 2'd3;  r_note_len = note_len(2); end

      5'd21: begin r_note = 2'd1;  r_note_len = note_len(2); end
      5'd22: begin r_note = 2'd3;  r_note_len = note_len(2); end
      5'd23: begin r_note = 2'd2;  r_note_len = note_len(2); end

      default: begin r_note = 2'd0;   r_note_len = note_len(30); end
    endcase
  end