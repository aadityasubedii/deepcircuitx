  input [CODE_WIDTH*ECC_WIDTH-1:0] h_rows;
  input [2*nCK_PER_CLK-1:0] raw_not_ecc;
  reg [2*nCK_PER_CLK-1:0] raw_not_ecc_r;