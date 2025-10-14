
wire             tracemem_on;
wire    [ 35: 0] tracemem_trcdata;
wire             tracemem_tw;
reg     [  6: 0] trc_im_addr ;
wire    [ 35: 0] trc_im_data;
wire             trc_on_chip;
reg              trc_wrap ;
wire             tw_valid;
wire             xbrk_wrap_traceoff;
  assign trc_im_data = tw;