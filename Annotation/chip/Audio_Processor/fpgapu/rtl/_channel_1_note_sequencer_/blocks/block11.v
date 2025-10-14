  always @(*) begin
    case (r_envelope_index)
      4'd00: r_envelope = 3*2;
      4'd01: r_envelope = 4*2;
      4'd02: r_envelope = 6*2;
      4'd03: r_envelope = 7*2;
      4'd04: r_envelope = 8*2;
      4'd05: r_envelope = 9*2;
      4'd06: r_envelope = 10*2;
      4'd07: r_envelope = 10*2;
      4'd08: r_envelope = 10*2;
      4'd09: r_envelope = 11*2;
      4'd10: r_envelope = 12*2;
      4'd11: r_envelope = 12*2;
      4'd12: r_envelope = 13*2;
      4'd13: r_envelope = 15*2;
      4'd14: r_envelope = 15*2;
      4'd15: r_envelope = 15*2;

      default: r_envelope = 0;
    endcase
  end