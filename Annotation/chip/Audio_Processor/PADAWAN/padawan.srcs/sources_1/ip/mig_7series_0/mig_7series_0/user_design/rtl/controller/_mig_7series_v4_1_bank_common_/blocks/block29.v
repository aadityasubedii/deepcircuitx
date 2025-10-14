      always @(accept_req_lcl or idle_cnt_r or passing_open_bank
               or rst or start_pre_wait)
        if (rst) idle_cnt_ns = nBANK_MACHS;
        else begin
          idle_cnt_ns = idle_cnt_r - accept_req_lcl;
          for (i = 0; i <= nBANK_MACHS-1; i = i + 1) begin
            idle_cnt_ns = idle_cnt_ns + passing_open_bank[i];
          end
          idle_cnt_ns = idle_cnt_ns + |start_pre_wait;
        end