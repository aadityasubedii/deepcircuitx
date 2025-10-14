generate 
if(C_MEM_TYPE == "DDR" || C_MEM_TYPE =="MDDR" || (C_MEM_TYPE == "DDR2" && (C_MEM_DDR2_DIFF_DQS_EN == "NO"))) begin: gen_dqs_iobuf
IOBUF iob_dqs  (.IO(mcbx_dram_dqs), .I(ioi_dqs),.T(t_dqs),.O(in_pre_dqsp));
end else begin: gen_dqs_iobufds
IOBUFDS iob_dqs  (.IO(mcbx_dram_dqs),.IOB(mcbx_dram_dqs_n), .I(ioi_dqs),.T(t_dqs),.O(in_pre_dqsp));

end
endgenerate