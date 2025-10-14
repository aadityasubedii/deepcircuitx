generate 
if(C_MEM_TYPE == "DDR" || C_MEM_TYPE =="MDDR" || (C_MEM_TYPE == "DDR2" && (C_MEM_DDR2_DIFF_DQS_EN == "NO"))) begin: gen_dqs_pullupdn
PULLDOWN dqs_pulldown (.O(mcbx_dram_dqs));
end else begin: gen_dqs_pullupdn_ds
PULLDOWN dqs_pulldown (.O(mcbx_dram_dqs));
PULLUP dqs_n_pullup (.O(mcbx_dram_dqs_n));

end
endgenerate