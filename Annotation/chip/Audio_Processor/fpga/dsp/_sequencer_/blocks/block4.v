    assign out_audio = out_we ? shift_out : 0;
    assign out_addr = out_we ? out_addr_2[(CHAN_W-1):0] : 0;