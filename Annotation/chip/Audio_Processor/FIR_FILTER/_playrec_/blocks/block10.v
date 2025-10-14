always @(sel)begin
  case(sel)
  0: Y = audio_in;
  1: Y = Y1;
  2: Y = Y2;
  3: Y = Y3;
  4: Y = Y4;
  default: Y = audio_in;
  endcase
end