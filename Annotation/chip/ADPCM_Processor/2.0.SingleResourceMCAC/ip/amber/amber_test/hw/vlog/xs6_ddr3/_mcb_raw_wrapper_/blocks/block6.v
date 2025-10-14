generate
      for(dq_i = 0; dq_i < C_NUM_DQ_PINS; dq_i = dq_i + 1) begin : gen_dq_iobuft
         IOBUF gen_iob_dq_inst (.IO(mcbx_dram_dq[dq_i]),.I(ioi_dq[dq_i]),.T(t_dq[dq_i]),.O(in_pre_dq[dq_i]));
      end
endgenerate