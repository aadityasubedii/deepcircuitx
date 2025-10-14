always @ (w1data,hdata)
begin
for (i=0; i <= DWIDTH - 1; i= i+1)
   ndata[i] = hdata[i] ^ w1data[i];
   
         end