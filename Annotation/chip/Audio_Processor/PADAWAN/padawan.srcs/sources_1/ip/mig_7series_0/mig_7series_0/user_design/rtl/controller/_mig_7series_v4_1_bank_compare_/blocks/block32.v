  generate
    if (BURST_MODE == "4") begin : burst_mode_4
      assign req_size_r_lcl = 1'b0;
    end
    else
      if (BURST_MODE == "8") begin : burst_mode_8
        assign req_size_r_lcl = 1'b1;
      end
      else
        if (BURST_MODE == "OTF") begin : burst_mode_otf
          reg req_size;
          wire req_size_ns = idle_ns
                                 ? (periodic_rd_insert || size)
                                 : req_size;