      always @(maint_zq_r or maint_sre_r or maint_srx_r or present_count
          or rst or send_cnt_r or start_maint)
        if (rst) send_cnt_ns = 4'b0;
        else begin
          send_cnt_ns = send_cnt_r;
          if (start_maint && (maint_zq_r || maint_sre_r || maint_srx_r)) send_cnt_ns = present_count;
          if (|send_cnt_ns)
            send_cnt_ns = send_cnt_ns - ONE[RANK_WIDTH-1:0];
        end