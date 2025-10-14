always @(*)
  for (i = 0; i < DQ_WIDTH; i = i+1) begin
    dout_rise0[i] = (dout_o[7]&&sel[i] || dout_o[15]&&~sel[i]);
    dout_fall0[i] = (dout_o[6]&&sel[i] || dout_o[14]&&~sel[i]);
    dout_rise1[i] = (dout_o[5]&&sel[i] || dout_o[13]&&~sel[i]);
    dout_fall1[i] = (dout_o[4]&&sel[i] || dout_o[12]&&~sel[i]);
    dout_rise2[i] = (dout_o[3]&&sel[i] || dout_o[11]&&~sel[i]);
    dout_fall2[i] = (dout_o[2]&&sel[i] || dout_o[10]&&~sel[i]);
    dout_rise3[i] = (dout_o[1]&&sel[i] || dout_o[9]&&~sel[i]);
    dout_fall3[i] = (dout_o[0]&&sel[i] || dout_o[8]&&~sel[i]);
  end