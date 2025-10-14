assign tag_wenable      = source_sel[C_INVA] ? 1'd1  :
                          source_sel[C_FILL] ? 1'd1  :
                          source_sel[C_INIT] ? 1'd1  :
                          source_sel[C_CORE] ? 1'd0  :
                                               1'd0  ;