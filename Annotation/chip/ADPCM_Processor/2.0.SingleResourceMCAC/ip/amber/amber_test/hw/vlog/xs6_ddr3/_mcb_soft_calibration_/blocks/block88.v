always @ (posedge UI_CLK)
     DONE_SOFTANDHARD_CAL    <= ((DQS_DELAY_INITIAL != 8'h00) || (STATE == DONE)) && MCB_UODONECAL;  
