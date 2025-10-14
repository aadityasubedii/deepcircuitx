      always @(posedge clk or posedge reset) begin
        if (reset) begin
          pkt_cnt           <= 0;
          pkt_has_started   <= 0;
          sop_has_left_fifo <= 0;
          fifo_too_small_r  <= 0;
          pkt_cnt_eq_zero   <= 1'b1;
          pkt_cnt_eq_one    <= 1'b0;
          fifo_fill_level_lt_cut_through_threshold <= 1'b1;
        end
        else begin
          fifo_fill_level_lt_cut_through_threshold <= fifo_fill_level < cut_through_threshold;
          fifo_too_small_r <= fifo_too_small;

          if( in_pkt_eop_arrive )
            sop_has_left_fifo <= 1'b0;
          else if (out_pkt_sop_leave & pkt_cnt_eq_zero )
            sop_has_left_fifo <= 1'b1;

          if (in_pkt_eop_arrive & ~out_pkt_leave & ~drop_on_error ) begin
            pkt_cnt <= pkt_cnt + 1'b1;
            pkt_cnt_eq_zero <= 0;
            if (pkt_cnt == 0)
              pkt_cnt_eq_one <= 1'b1;
            else
              pkt_cnt_eq_one <= 1'b0;
          end
          else if((~in_pkt_eop_arrive | drop_on_error) & out_pkt_leave) begin
            pkt_cnt <= pkt_cnt - 1'b1;
            if (pkt_cnt == 1) 
              pkt_cnt_eq_zero <= 1'b1;
            else
              pkt_cnt_eq_zero <= 1'b0;
            if (pkt_cnt == 2) 
              pkt_cnt_eq_one <= 1'b1;
            else
              pkt_cnt_eq_one <= 1'b0;
          end

          if (in_pkt_start)
            pkt_has_started <= 1'b1;
          else if (in_pkt_eop_arrive)
            pkt_has_started <= 1'b0;
        end
      end