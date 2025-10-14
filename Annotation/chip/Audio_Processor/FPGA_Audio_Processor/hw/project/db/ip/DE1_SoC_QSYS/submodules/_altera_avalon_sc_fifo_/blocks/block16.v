    generate if (USE_ALMOST_FULL_IF) begin : gen_blk17
      assign almost_full_data = (fill_level >= almost_full_threshold);
    end
    else
      assign almost_full_data = 0;
    endgenerate