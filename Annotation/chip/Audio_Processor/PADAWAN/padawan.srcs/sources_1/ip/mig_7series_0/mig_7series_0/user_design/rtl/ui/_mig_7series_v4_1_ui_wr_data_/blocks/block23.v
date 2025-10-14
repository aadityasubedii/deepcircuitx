      always @(posedge clk) begin
      	if ( rst )
	   occ_cnt <= #TCQ 16'h0000;
	else case ({wr_data_end, rd_data_upd_indx_r})
	      2'b01 : occ_cnt <= #TCQ {1'b0,occ_cnt[15:1]};
	      2'b10 : occ_cnt <= #TCQ {occ_cnt[14:0],1'b1};
             endcase 
      end