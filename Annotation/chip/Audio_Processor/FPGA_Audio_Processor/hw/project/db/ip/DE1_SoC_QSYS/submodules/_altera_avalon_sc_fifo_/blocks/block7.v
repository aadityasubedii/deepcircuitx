    generate if (USE_STORE_FORWARD) begin : gen_blk20
      assign wait_for_threshold   = (fifo_fill_level_lt_cut_through_threshold) & wait_for_pkt ;
      assign wait_for_pkt         = pkt_cnt_eq_zero  | (pkt_cnt_eq_one  & out_pkt_leave);
      assign ok_to_forward        = (pkt_mode ? (~wait_for_pkt | ~pkt_has_started) : 
                                     ~wait_for_threshold) | fifo_too_small_r;
      assign in_pkt_eop_arrive    = in_valid & in_ready & in_endofpacket;
      assign in_pkt_start         = in_valid & in_ready & in_startofpacket;
      assign in_pkt_error         = in_valid & in_ready & |in_error;
      assign out_pkt_sop_leave    = out_valid & out_ready & out_startofpacket;
      assign out_pkt_leave        = out_valid & out_ready & out_endofpacket;
      assign fifo_too_small       = (pkt_mode ? wait_for_pkt : wait_for_threshold) & full & out_ready;
