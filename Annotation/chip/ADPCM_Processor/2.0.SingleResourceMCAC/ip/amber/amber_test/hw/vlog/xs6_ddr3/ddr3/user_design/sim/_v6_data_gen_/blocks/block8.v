always @ (w1data,hdata)
begin
for (i=0; i <= 4*NUM_DQ_PINS - 1; i= i+1)
   ndata[i] = hdata[i] ^ w1data[i];
   
         end