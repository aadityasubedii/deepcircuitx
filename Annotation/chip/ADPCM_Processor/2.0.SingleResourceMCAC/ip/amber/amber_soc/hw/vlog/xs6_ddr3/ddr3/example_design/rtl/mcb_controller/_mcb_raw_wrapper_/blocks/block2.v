generate
if((C_MEM_TYPE == "DDR" || C_MEM_TYPE =="MDDR" || (C_MEM_TYPE == "DDR2" && (C_MEM_DDR2_DIFF_DQS_EN == "NO"))) && C_NUM_DQ_PINS == 16) begin: gen_udqs_pullupdn
PULLDOWN udqs_pulldown (.O(mcbx_dram_udqs));
end else if(C_NUM_DQ_PINS == 16) begin: gen_udqs_pullupdn_ds
PULLDOWN udqs_pulldown (.O(mcbx_dram_udqs));
PULLUP   udqs_n_pullup (.O(mcbx_dram_udqs_n));

end
endgenerate