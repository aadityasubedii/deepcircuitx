  function [143:0] calc_phy_bitlanes_outonly;
    input [215:0] data_mask_in;
    integer       z;
    begin
      calc_phy_bitlanes_outonly = 'b0;
      
      
      if (USE_DM_PORT == 1)
        for (z = 0; z < DM_WIDTH; z = z + 1)
          calc_phy_bitlanes_outonly[48*data_mask_in[(12*z+8)+:3] +
                                    12*data_mask_in[(12*z+4)+:2] +
                                    data_mask_in[12*z+:4]] = 1'b1;
    end
  endfunction