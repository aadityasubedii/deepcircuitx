always @ (posedge clk_i) begin

for (i=0; i <= 4*NUM_DQ_PINS - 1; i= i+1)
      if (i == SEL_VICTIM_LINE || (i-NUM_DQ_PINS) == SEL_VICTIM_LINE ||
          (i-(NUM_DQ_PINS*2)) ==  SEL_VICTIM_LINE || (i-(NUM_DQ_PINS*3)) == SEL_VICTIM_LINE)
              hdata[i] <= #TCQ 1'b1;
      else if ( i >= 0 && i <= 1*NUM_DQ_PINS - 1)
              hdata[i] <= #TCQ 1'b1;
      else if ( i >= 1*NUM_DQ_PINS && i <= 2*NUM_DQ_PINS - 1)
              hdata[i] <= #TCQ 1'b0;
      else if ( i >= 2*NUM_DQ_PINS && i <= 3*NUM_DQ_PINS - 1)
              hdata[i] <= #TCQ 1'b1;
      else if ( i >= 3*NUM_DQ_PINS && i <= 4*NUM_DQ_PINS - 1)
              hdata[i] <= #TCQ 1'b0;
      else 
              hdata[i] <= 1'b1;
      
     
end