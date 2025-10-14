      assign mc_cs_n[3*CS_WIDTH*nCS_PER_RANK -1  :2*CS_WIDTH*nCS_PER_RANK ] =
        {(~(cs_one_hot << (nCS_PER_RANK*ra2)) | {CS_WIDTH*nCS_PER_RANK{~cs_en2}})};
