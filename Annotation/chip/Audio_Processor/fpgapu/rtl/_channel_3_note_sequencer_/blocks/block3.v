  always @(*) begin
    case (r_note_index)
      4'd00: begin r_note = `NOTE_RST;  r_note_len = note_len(30); end

      4'd01: begin r_note = `NOTE_Fs3;  r_note_len = note_len(6); end
      4'd02: begin r_note = `NOTE_Cs4;  r_note_len = note_len(6); end
      4'd03: begin r_note = `NOTE_Fs4;  r_note_len = note_len(18); end

      4'd04: begin r_note = `NOTE_E3;  r_note_len = note_len(6); end
      4'd05: begin r_note = `NOTE_B3;  r_note_len = note_len(6); end
      4'd06: begin r_note = `NOTE_E4;  r_note_len = note_len(18); end

      4'd07: begin r_note = `NOTE_Ds3;  r_note_len = note_len(6); end
      4'd08: begin r_note = `NOTE_As3;  r_note_len = note_len(6); end
      4'd09: begin r_note = `NOTE_Ds4;  r_note_len = note_len(18); end

      4'd10: begin r_note = `NOTE_D3;  r_note_len = note_len(6); end
      4'd11: begin r_note = `NOTE_A3;  r_note_len = note_len(6); end
      4'd12: begin r_note = `NOTE_D4;  r_note_len = note_len(18); end

      4'd13: begin r_note = `NOTE_Fs4;  r_note_len = note_len(30); end

      default: begin r_note = `NOTE_RST;   r_note_len = note_len(4); end
    endcase
  end