      always @(rd_data_upd_indx_r or rst or wr_accepted
               or wr_req_cnt_r) begin
        wr_req_cnt_ns = wr_req_cnt_r;
        if (rst) wr_req_cnt_ns = 5'b0;
        else case ({wr_accepted, rd_data_upd_indx_r})
               2'b01 : wr_req_cnt_ns = wr_req_cnt_r - 5'b1;
               2'b10 : wr_req_cnt_ns = wr_req_cnt_r + 5'b1;
             endcase 
      end