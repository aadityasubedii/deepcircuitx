generate 
if (C_MEM_TYPE == "DDR3") begin : gen_ddr3_rst
OBUFT iob_rst (.O(mcbx_dram_ddr3_rst),.I(ioi_rst),.T(t_rst));
end
endgenerate