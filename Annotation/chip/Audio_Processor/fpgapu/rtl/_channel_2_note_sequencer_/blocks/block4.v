  always @(*) begin
    case (r_note_index)
      
      4'd00: begin r_note = `NOTE_Fs5;  r_note_len = note_len(2); end
      4'd01: begin r_note = `NOTE_Cs6;  r_note_len = note_len(2); end
      4'd02: begin r_note = `NOTE_Fs6;  r_note_len = note_len(2); end
      4'd03: begin r_note = `NOTE_Gs6;  r_note_len = note_len(2); end
      4'd04: begin r_note = `NOTE_Cs6;  r_note_len = note_len(2); end
      4'd05: begin r_note = `NOTE_Fs6;  r_note_len = note_len(2); end
      4'd06: begin r_note = `NOTE_Gs6;  r_note_len = note_len(2); end
      4'd07: begin r_note = `NOTE_B6;   r_note_len = note_len(2); end
      4'd08: begin r_note = `NOTE_Cs6;  r_note_len = note_len(2); end
      4'd09: begin r_note = `NOTE_B6;   r_note_len = note_len(2); end
      4'd10: begin r_note = `NOTE_As6;  r_note_len = note_len(2); end
      4'd11: begin r_note = `NOTE_Cs6;  r_note_len = note_len(2); end
      4'd12: begin r_note = `NOTE_As6;  r_note_len = note_len(2); end
      4'd13: begin r_note = `NOTE_Gs6;  r_note_len = note_len(2); end
      4'd14: begin r_note = `NOTE_Fs6;  r_note_len = note_len(2); end
      
      default: begin r_note = `NOTE_RST;   r_note_len = note_len(4); end
    endcase
  end