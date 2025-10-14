  assign take_no_action_break_a = enable_action_strobe && (ir == 2'b10) && 
    ~jdo[36] && 
    ~jdo[37];