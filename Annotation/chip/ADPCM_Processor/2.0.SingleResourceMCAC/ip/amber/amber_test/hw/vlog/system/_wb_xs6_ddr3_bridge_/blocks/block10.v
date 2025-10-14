assign wb_sel = write_buf_r ? wb_sel_buf_r : i_wb_sel;
assign wb_dat = write_buf_r ? wb_dat_buf_r : i_wb_dat;
assign wb_adr = write_buf_r ? wb_adr_buf_r : i_wb_adr;