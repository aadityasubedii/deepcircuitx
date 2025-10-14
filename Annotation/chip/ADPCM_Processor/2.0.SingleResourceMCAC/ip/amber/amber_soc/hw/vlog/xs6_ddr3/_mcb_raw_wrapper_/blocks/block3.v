generate
if((C_MEM_TYPE == "DDR" || C_MEM_TYPE =="MDDR" || (C_MEM_TYPE == "DDR2" && (C_MEM_DDR2_DIFF_DQS_EN == "NO"))) && C_NUM_DQ_PINS == 16) begin: gen_udqs_iobuf
IOBUF iob_udqs  (.IO(mcbx_dram_udqs), .I(ioi_udqs),.T(t_udqs),.O(in_pre_udqsp));
end else if(C_NUM_DQ_PINS == 16) begin: gen_udqs_iobufds
IOBUFDS iob_udqs  (.IO(mcbx_dram_udqs),.IOB(mcbx_dram_udqs_n), .I(ioi_udqs),.T(t_udqs),.O(in_pre_udqsp));

end
endgenerate