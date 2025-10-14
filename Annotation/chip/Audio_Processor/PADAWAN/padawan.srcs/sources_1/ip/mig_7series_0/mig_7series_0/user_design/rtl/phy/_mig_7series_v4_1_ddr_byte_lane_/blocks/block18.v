  end
  else begin :  phy_din_gen
     assign phy_din =  {if_q9, if_q8, if_q7, if_q6, if_q5, if_q4, if_q3, if_q2, if_q1, if_q0};
     assign empty_post_fifo = if_empty_;
  end