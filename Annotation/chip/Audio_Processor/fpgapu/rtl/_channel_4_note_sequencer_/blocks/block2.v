  always @(*) begin
    case (r_envelope_index)
      4'd00: r_envelope = 'd10*2;
      4'd01: r_envelope = 'd10*2;
      4'd02: r_envelope = 'd10*2;
      4'd03: r_envelope = 'd6*2;
      4'd04: r_envelope = 'd6*2;
      4'd05: r_envelope = 'd6*2;
      4'd06: r_envelope = 'd4*2;
      4'd07: r_envelope = 'd4*2;
      4'd08: r_envelope = 'd2*2;
      4'd09: r_envelope = 'd0;

      default: r_envelope = 0;
    endcase
  end