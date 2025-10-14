always@(posedge UI_CLK,posedge RST)
if (RST)        
   begin
        ZIO_IN_R1 <= 1'b0; 
        ZIO_IN_R2 <= 1'b0;

        RZQ_IN_R1 <= 1'b0; 
        RZQ_IN_R2 <= 1'b0;         
   end