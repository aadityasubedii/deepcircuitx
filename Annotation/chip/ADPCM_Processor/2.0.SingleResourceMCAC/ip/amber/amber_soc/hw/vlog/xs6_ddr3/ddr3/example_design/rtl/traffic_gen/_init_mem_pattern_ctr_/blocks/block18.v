wire [6:0] FIXED_BL_VALUE;
assign FIXED_BL_VALUE = (FAMILY == "VIRTEX6" && (MEM_BURST_LEN == 8 || MEM_BURST_LEN == 0)) ? 2 :
                        (FAMILY == "VIRTEX6" && MEM_BURST_LEN == 4) ? 1 :
                         FIXEDBL;