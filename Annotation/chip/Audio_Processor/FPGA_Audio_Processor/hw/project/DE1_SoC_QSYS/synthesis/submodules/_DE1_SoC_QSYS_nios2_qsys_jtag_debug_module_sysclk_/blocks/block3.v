  assign take_no_action_break_c = enable_action_strobe && (ir == 2'b10) && 
    jdo[36] &&  jdo[35] &&
    ~jdo[37];