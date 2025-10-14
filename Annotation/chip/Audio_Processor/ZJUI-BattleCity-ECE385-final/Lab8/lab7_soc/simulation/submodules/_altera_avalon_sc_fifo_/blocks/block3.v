    else begin : gen_blk20_else
      assign ok_to_forward = 1'b1;
      assign drop_on_error = 1'b0;
      if (ADDR_WIDTH <= 1)
        assign curr_sop_ptr = 1'b0;
      else
        assign curr_sop_ptr = {ADDR_WIDTH - 1 { 1'b0 }};