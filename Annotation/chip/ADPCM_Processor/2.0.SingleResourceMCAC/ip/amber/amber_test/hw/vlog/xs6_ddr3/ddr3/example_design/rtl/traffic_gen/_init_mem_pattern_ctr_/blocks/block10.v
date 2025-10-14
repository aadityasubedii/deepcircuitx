 always @ (posedge clk_i)
 begin
      mcb_init_done_reg1 <= mcb_init_done_i;
      mcb_init_done_reg <= mcb_init_done_reg1;
end