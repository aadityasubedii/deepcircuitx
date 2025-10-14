   assign po_ck_addr_cmd_delay_done = (TDQSS_DLY == 0) ? pi_fine_dly_dec_done_r
                                     : delay_done_r4;
