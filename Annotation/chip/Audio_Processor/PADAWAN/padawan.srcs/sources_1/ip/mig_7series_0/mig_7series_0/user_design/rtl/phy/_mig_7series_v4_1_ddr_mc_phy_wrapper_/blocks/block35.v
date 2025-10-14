  always @ (posedge clk) begin
     fine_delay_mod[((byte_sel_data_map[3:0])*3)+:3] <= #TCQ {fine_delay_incdec_pb[0],2'b00};
     fine_delay_mod[((byte_sel_data_map[12+3:12])*3)+:3] <= #TCQ {fine_delay_incdec_pb[1],2'b00};
     fine_delay_mod[((byte_sel_data_map[24+3:24])*3)+:3] <= #TCQ {fine_delay_incdec_pb[2],2'b00};
     fine_delay_mod[((byte_sel_data_map[36+3:36])*3)+:3] <= #TCQ {fine_delay_incdec_pb[3],2'b00};
     fine_delay_mod[((byte_sel_data_map[48+3:48])*3)+:3] <= #TCQ {fine_delay_incdec_pb[4],2'b00};
     fine_delay_mod[((byte_sel_data_map[60+3:60])*3)+:3] <= #TCQ {fine_delay_incdec_pb[5],2'b00};
     fine_delay_mod[((byte_sel_data_map[72+3:72])*3)+:3] <= #TCQ {fine_delay_incdec_pb[6],2'b00};
     fine_delay_mod[((byte_sel_data_map[84+3:84])*3)+:3] <= #TCQ {fine_delay_incdec_pb[7],2'b00};
     fine_delay_sel_r <= #TCQ fine_delay_sel;
  end