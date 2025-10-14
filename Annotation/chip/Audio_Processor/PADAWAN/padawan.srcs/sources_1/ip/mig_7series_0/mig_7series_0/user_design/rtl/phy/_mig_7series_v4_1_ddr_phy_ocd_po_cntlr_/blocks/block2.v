  always @(*) phy_rddata_en_3_second_ns = ~reset_scan && (phy_rddata_en_3 
                                                    ? ~phy_rddata_en_3_second_r 
                                                    : phy_rddata_en_3_second_r);