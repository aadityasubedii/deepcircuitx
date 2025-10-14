  wire [6*DQS_WIDTH-1:0] wl_po_fine_shifted = wl_po_fine_cnt >> oclkdelay_calib_cnt*6;
  output [5:0] wl_po_fine_cnt_sel;