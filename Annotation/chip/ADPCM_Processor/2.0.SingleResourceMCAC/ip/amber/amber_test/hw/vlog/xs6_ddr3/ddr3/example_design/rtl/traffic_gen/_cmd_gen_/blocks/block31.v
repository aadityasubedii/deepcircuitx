always @ (posedge clk_i)
if (mem_init_done)
    INC_COUNTS <= #TCQ  (DWIDTH/8)*(bl_out_reg);
else  begin
    if (fixed_bl_i == 0)
       INC_COUNTS <= #TCQ  (DWIDTH/8)*(64);
    else
       INC_COUNTS <= #TCQ  (DWIDTH/8)*(fixed_bl_i);
    end
end