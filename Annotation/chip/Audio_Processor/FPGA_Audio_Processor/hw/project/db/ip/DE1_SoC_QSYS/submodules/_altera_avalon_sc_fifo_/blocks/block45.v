    generate if (USE_MEMORY_BLOCKS == 1) begin : gen_blk11

        assign incremented_wr_ptr = wr_ptr + 1'b1;
        assign incremented_rd_ptr = rd_ptr + 1'b1;
        assign next_wr_ptr =  drop_on_error ? curr_sop_ptr : write ?  incremented_wr_ptr : wr_ptr;
        assign next_rd_ptr = (read) ? incremented_rd_ptr : rd_ptr;
