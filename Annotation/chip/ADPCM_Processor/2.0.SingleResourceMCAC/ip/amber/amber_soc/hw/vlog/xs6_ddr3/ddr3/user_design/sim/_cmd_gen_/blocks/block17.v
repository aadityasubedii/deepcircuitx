generate

if (CMD_PATTERN == "CGEN_FIXED" || CMD_PATTERN == "CGEN_ALL" ) begin : fixed_addr_gen
    assign fixed_addr = (DWIDTH == 32)?  {fixed_addr_i[31:2],2'b0} :
                        (DWIDTH == 64)?  {fixed_addr_i[31:3],3'b0}:
                        (DWIDTH <= 128)? {fixed_addr_i[31:4],4'b0}:
                        (DWIDTH <= 256)? {fixed_addr_i[31:5],5'b0}:
                                         {fixed_addr_i[31:6],6'b0};
  end
endgenerate