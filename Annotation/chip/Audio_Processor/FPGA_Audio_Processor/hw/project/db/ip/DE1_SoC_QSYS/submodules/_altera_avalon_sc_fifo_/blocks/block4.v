      assign drop_on_error = drop_on_error_en & (error_in_pkt | in_pkt_error) & in_pkt_eop_arrive & 
                            ~sop_has_left_fifo & ~(out_pkt_sop_leave & pkt_cnt_eq_zero);