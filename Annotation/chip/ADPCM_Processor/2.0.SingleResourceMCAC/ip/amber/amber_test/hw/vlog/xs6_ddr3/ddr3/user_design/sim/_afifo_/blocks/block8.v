always @(posedge rd_clk)
begin
if (rst)
   begin
        rd_ptr <= #TCQ 'b0;
        rd_gray <= #TCQ 'b0;
   end
else begin
    if (rd_strobe)
        rd_ptr <= #TCQ rd_ptr + 1;
        
    rd_ptr_tmp <= #TCQ rd_ptr;
        
    
    rd_gray <= #TCQ rd_gray_nxt;
end

end