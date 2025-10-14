generate
if((C_MEM_TYPE == "DDR3"  && (C_MEM_DDR3_RTT != "OFF" || C_MEM_DDR3_DYN_WRT_ODT != "OFF"))
 ||(C_MEM_TYPE == "DDR2" &&  C_MEM_DDR2_RTT != "OFF") ) begin : gen_dram_odt
OBUFT iob_odt (.O(mcbx_dram_odt),.I(ioi_odt),.T(t_odt));
end
endgenerate