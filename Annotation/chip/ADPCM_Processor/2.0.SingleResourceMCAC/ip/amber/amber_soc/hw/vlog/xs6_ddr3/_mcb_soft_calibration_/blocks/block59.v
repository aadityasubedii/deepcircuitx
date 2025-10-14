always @ (posedge UI_CLK) begin
  if (RST)
    WaitCountEnable <= 1'b0;
  else if (~SELFREFRESH_REQ_R2 && SELFREFRESH_REQ_R1)  
    WaitCountEnable <= 1'b0;
    
  else if (!PERFORM_START_DYN_CAL_AFTER_SELFREFRESH && PERFORM_START_DYN_CAL_AFTER_SELFREFRESH_R1)
    WaitCountEnable <= 1'b1;
  else
    WaitCountEnable <=  WaitCountEnable;
end