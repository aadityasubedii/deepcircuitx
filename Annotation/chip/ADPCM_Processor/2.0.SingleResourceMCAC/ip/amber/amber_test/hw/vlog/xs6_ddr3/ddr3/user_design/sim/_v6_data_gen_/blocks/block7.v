always @ (full_prbs_data,hdata,SEL_VICTIM_LINE)
begin
for (i=0; i <= 4*NUM_DQ_PINS - 1; i= i+1)
      if (i == SEL_VICTIM_LINE || (i-NUM_DQ_PINS) == SEL_VICTIM_LINE ||
          (i-(NUM_DQ_PINS*2)) == SEL_VICTIM_LINE || (i-(NUM_DQ_PINS*3)) == SEL_VICTIM_LINE)

               h_prbsdata[i] = full_prbs_data[SEL_VICTIM_LINE];
      else
                 h_prbsdata[i] = hdata[i];

   
         end