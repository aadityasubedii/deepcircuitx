assign rd_data_pres = (c3_p0_rd_count > 7'h00);
assign rdy = c3_calib_done;
assign STATLED4 = c3_p0_rd_empty;