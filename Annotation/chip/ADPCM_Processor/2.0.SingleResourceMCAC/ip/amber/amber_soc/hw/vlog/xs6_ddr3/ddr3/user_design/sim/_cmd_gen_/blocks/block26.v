always @ (posedge clk_i) begin
     end_addr_r <= #TCQ  end_addr_i - DWIDTH/8*fixed_bl_i +1;
end