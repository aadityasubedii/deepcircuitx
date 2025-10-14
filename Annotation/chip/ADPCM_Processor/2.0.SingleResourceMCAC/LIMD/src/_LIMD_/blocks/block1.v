always @(A1T,A2P)begin
                OME   = 16'd15360;
                A1UL  = (OME + 65536 - A2P);                    
                A1LL  = (A2P + 65536 - OME); 
                if ( 32768 <= A1T && A1T <= A1LL) begin       
                A1P = A1LL;
                end 
                else if ( A1UL <= A1T && A1T <= 32767) begin       
                A1P = A1UL;
                end 
                else begin
                A1P = A1T;
                end
end 