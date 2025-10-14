        always @(free_rd_buf or occ_cnt_r or rd_accepted or rst or occ_minus_one or occ_plus_one) begin
          occ_cnt_ns = occ_cnt_r;
          if (rst) occ_cnt_ns = 0;
          else case ({rd_accepted, free_rd_buf})
                 2'b01 : occ_cnt_ns = occ_minus_one;
                 2'b10 : occ_cnt_ns = occ_plus_one;
          endcase 
        end