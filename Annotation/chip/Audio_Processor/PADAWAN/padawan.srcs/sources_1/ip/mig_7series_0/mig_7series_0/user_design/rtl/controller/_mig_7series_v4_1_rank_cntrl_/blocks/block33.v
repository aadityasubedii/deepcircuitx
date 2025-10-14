      always @(act_delayed or act_this_rank or add_rrd_inhbt
               or faw_cnt_r or rst) begin
        if (rst) faw_cnt_ns = 3'b0;
        else begin
          faw_cnt_ns = faw_cnt_r;
          if (act_this_rank) faw_cnt_ns = faw_cnt_r + 3'b1;
          if (act_delayed) faw_cnt_ns = faw_cnt_ns - 3'b1;
        end
        inhbt_act_faw_ns = (faw_cnt_ns == 3'h4) || add_rrd_inhbt;
      end