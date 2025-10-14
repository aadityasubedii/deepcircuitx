always @ ( posedge UI_CLK, posedge RST)
begin 
if (RST)
   CKE_Train <= 1'b0;
else 
  if (STATE == WAIT_FOR_UODONE && MCB_UODONECAL)
   CKE_Train <= 1'b0;
  else if (WAIT_200us_COUNTER[15] && ~MCB_UODONECAL)
   CKE_Train <= 1'b1;
  else
   CKE_Train <= 1'b0;
  
end