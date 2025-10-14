generate
if (EYE_TEST == "FALSE")  begin : d_clk_en2
assign data_clk_en = fifo_rdy_i && data_rdy_i && user_burst_cnt > 6'd1;
end 
endgenerate