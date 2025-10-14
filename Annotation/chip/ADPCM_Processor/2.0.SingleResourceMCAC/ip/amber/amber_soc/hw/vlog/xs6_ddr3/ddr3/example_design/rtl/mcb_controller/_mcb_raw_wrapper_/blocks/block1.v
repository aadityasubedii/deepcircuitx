generate
if( C_NUM_DQ_PINS == 16) begin : gen_udm
OBUFT iob_udm (.I(ioi_udm), .T(t_udm), .O(mcbx_dram_udm)); 
end
endgenerate