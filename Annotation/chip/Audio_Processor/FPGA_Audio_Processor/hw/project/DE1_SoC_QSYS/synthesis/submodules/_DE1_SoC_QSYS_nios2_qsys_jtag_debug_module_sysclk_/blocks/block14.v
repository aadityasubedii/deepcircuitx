  assign take_action_ocimem_a = enable_action_strobe && (ir == 2'b00) && 
    ~jdo[35] && jdo[34];