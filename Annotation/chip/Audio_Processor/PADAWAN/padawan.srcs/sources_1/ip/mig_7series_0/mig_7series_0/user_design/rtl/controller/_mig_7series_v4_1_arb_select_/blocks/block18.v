  generate
    if(nCK_PER_CLK  == 4) begin

      assign mc_cs_n[3*CS_WIDTH*nCS_PER_RANK -1  :2*CS_WIDTH*nCS_PER_RANK ] =
        {(~(cs_one_hot << (nCS_PER_RANK*ra2)) | {CS_WIDTH*nCS_PER_RANK{~cs_en2}})};

      assign mc_cs_n[4*CS_WIDTH*nCS_PER_RANK -1  :3*CS_WIDTH*nCS_PER_RANK ] =
        {(~(cs_one_hot << (nCS_PER_RANK*ra3)) | {CS_WIDTH*nCS_PER_RANK{~cs_en3}})};

    end
  endgenerate