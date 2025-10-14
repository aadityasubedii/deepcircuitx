  assign mc_cs_n[2*CS_WIDTH*nCS_PER_RANK -1  : CS_WIDTH*nCS_PER_RANK ] =
     {(~(cs_one_hot << (nCS_PER_RANK*ra1)) | {CS_WIDTH*nCS_PER_RANK{~cs_en1}})};