always @(posedge rd_clk)
begin
if (rst)
   begin
        wr_ptr <= #TCQ 'b0;
        wr_gray <= #TCQ 'b0;
   end
else begin
    if (wr_en)
        wr_ptr <= #TCQ wr_ptr + 1;
        
    
    wr_gray <= #TCQ wr_gray_nxt;
end

end