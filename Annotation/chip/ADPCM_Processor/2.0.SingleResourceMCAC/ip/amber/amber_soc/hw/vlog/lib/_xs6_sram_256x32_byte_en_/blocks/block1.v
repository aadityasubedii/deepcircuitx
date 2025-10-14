initial
    begin
    if ( DATA_WIDTH    != 32  ) 
        $display("%M (xx_sram_256x32_byte_en) Warning: Incorrect parameter DATA_WIDTH");
    if ( ADDRESS_WIDTH != 8   ) 
        $display("%M (xx_sram_256x32_byte_en) Warning: Incorrect parameter ADDRESS_WIDTH");
    end