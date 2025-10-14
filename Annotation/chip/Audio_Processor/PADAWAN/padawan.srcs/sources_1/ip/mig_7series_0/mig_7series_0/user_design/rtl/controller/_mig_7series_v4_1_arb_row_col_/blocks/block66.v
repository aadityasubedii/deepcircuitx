  wire[nBANK_MACHS-1:0] grant_row_r_lcl;
  output wire[nBANK_MACHS-1:0] grant_row_r;
  assign grant_row_r = grant_row_r_lcl;
  reg granted_row_r;