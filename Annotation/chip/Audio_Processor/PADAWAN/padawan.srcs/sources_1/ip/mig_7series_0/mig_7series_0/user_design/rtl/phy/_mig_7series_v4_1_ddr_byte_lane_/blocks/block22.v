generate
if ( PO_DATA_CTL == "FALSE" ) begin : dq_gen_48
   assign of_dqbus[48-1:0] = {of_q6[7:4], of_q5[7:4], of_q9, of_q8, of_q7, of_q6[3:0], of_q5[3:0], of_q4, of_q3, of_q2, of_q1, of_q0};
   assign phy_din =  80'h0;
   assign byte_rd_en = 1'b1;
end