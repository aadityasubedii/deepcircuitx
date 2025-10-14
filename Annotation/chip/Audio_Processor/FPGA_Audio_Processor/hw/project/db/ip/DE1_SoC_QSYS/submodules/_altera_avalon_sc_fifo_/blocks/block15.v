    generate if (USE_ALMOST_EMPTY_IF) begin : gen_blk18
      assign almost_empty_data = (fill_level <= almost_empty_threshold);
    end
    else
      assign almost_empty_data = 0;
    endgenerate