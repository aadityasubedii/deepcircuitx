  assign take_action_tracemem_a = enable_action_strobe && (ir == 2'b01) &&
    ~jdo[37] && 
    jdo[36];