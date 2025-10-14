        assign av_readdata = (av_address == 8'd1) ? {{12{1'b0}}, genlocked,
                                                                 underflow_sticky,
                                                                 1'b0,
                                                                 enable_resync} :
                             (av_address == 8'd2) ? {{13{1'b0}}, genlocked_int_reg,
                                                                 status_update_int_reg,
                                                                 1'b0} :
                             (av_address == 8'd3) ? usedw_output :
                             (av_address == 8'd4) ? is_mode_match_output :
                             {{11{1'b0}}, genlock_enable, interrupt_enable, enable_reg};