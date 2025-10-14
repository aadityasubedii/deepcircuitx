always @(*) casez (tempmon_state)
   IDLE      : tempmon_state_name = "IDLE";
   INIT      : tempmon_state_name = "INIT";
   FOUR_INC  : tempmon_state_name = "FOUR_INC";
   THREE_INC : tempmon_state_name = "THREE_INC";
   TWO_INC   : tempmon_state_name = "TWO_INC";
   ONE_INC   : tempmon_state_name = "ONE_INC";
   NEUTRAL   : tempmon_state_name = "NEUTRAL";
   ONE_DEC   : tempmon_state_name = "ONE_DEC";
   TWO_DEC   : tempmon_state_name = "TWO_DEC";
   THREE_DEC : tempmon_state_name = "THREE_DEC";
   FOUR_DEC  : tempmon_state_name = "FOUR_DEC";
   default   : tempmon_state_name = "BAD_STATE";
endcase