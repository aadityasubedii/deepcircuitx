  output wire [nBANK_MACHS-1:0] sending_row;
  assign sending_row = grant_row_r_lcl & {nBANK_MACHS{~block_grant_row}};