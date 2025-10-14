  wire [DATA_CNT_WIDTH-1:0] data_cnt = complex_oclkdelay_calib_start 
                                         ? CMPLX_DATA_CNT[DATA_CNT_WIDTH-1:0] 
                                         : SIMP_DATA_CNT[DATA_CNT_WIDTH-1:0];