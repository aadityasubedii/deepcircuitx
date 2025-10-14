  always @(calib_rddata_offset or calib_rddata_offset_1 or calib_rddata_offset_2) begin
    rank_rddata_offset_0 = calib_rddata_offset[5:0];
    rank_rddata_offset_1 = calib_rddata_offset_1[5:0];
    rank_rddata_offset_2 = calib_rddata_offset_2[5:0];
  end