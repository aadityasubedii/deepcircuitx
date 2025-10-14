  always @ (posedge CLK_100MHz)
    if (ready) out_data <= audio_out_data;
  assign audio_in_data = left_in_data[19:12];