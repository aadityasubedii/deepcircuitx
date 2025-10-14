always@(A2T)begin
                A2UL  = 16'h3000;                    
                A2LL  = 16'hD000;                    
		if ((16'h8000 <= A2T) && (A2T <= A2LL)) begin       
                A2P = A2LL;
                end
                else if ((A2UL <= A2T) && (A2T <= 16'h7FFF)) begin       
                A2P = A2UL;
                end 
                else begin
                A2P = A2T;
                end
end