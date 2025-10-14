module sine_LUT // #(.data_size(xx)) 
(
  input   [5:0]   step_counter,
  output  [15:0]  wave
);

always @(step_counter)
begin
  case(step_counter)
  0 : wave =16'h4000;
  1 : wave =16'h4645;
  2 : wave =16'h4c7c;
  3 : wave =16'h5293;
  4 : wave =16'h587d;
  5 : wave =16'h5e2b;
  6 : wave =16'h638e;
  7 : wave =16'h6899;
  8 : wave =16'h6d40;
  9 : wave =16'h7178;
  10 :wave =16'h7536;
  11 :wave =16'h7870;
  12 :wave =16'h7b20;
  13 :wave =16'h7d3e;
  14 :wave =16'h7ec4;
  15 :wave =16'h7fb0;
  16 :wave =16'h7fff;
  17 :wave =16'h7fb0;
  18 :wave =16'h7ec4;
  19 :wave =16'h7d3e;
  20 :wave =16'h7b20;
  21 :wave =16'h7870;
  22 :wave =16'h7536;
  23 :wave =16'h7178;
  24 :wave =16'h6d40;
  25 :wave =16'h6899;
  26 :wave =16'h638e;
  27 :wave =16'h5e2b;
  28 :wave =16'h587d;
  29 :wave =16'h5293;
  30 :wave =16'h4c7c;
  31 :wave =16'h4645;
  32 :wave =16'h4000;
  33 :wave =16'h39ba;
  34 :wave =16'h3383;
  35 :wave =16'h2d6c;
  36 :wave =16'h2782;
  37 :wave =16'h21d4;
  38 :wave =16'h1c71;
  39 :wave =16'h1766;
  40 :wave =16'h12bf;
  41 :wave =16'h0e87;
  42 :wave =16'h0ac9;
  43 :wave =16'h078f;
  44 :wave =16'h04df;
  45 :wave =16'h02c1;
  46 :wave =16'h013b;
  47 :wave =16'h004f;
  48 :wave =16'h0;
  49 :wave =16'h004f;
  50 :wave =16'h013b;
  51 :wave =16'h02c1;
  52 :wave =16'h04df;
  53 :wave =16'h078f;
  54 :wave =16'h0ac9;
  55 :wave =16'h0e87;
  56 :wave =16'h12bf;
  57 :wave =16'h1766;
  58 :wave =16'h1c71;
  59 :wave =16'h21d4;
  60 :wave =16'h2782;
  61 :wave =16'h2d6c;
  62 :wave =16'h3383;
  63 :wave =16'h39ba;
default	:wave =16'h7374;
endcase

end

endmodule