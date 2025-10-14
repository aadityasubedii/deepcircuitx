   generate
   if(C3_NUM_DQ_PINS == 16) begin : MEM_INST3
     ddr3_model_c3 u_mem_c3(
      .ck         (mcb3_dram_ck),
      .ck_n       (mcb3_dram_ck_n),
      .cke        (mcb3_dram_cke),
      .cs_n       (1'b0),
      .ras_n      (mcb3_dram_ras_n),
      .cas_n      (mcb3_dram_cas_n),
      .we_n       (mcb3_dram_we_n),
      .dm_tdqs    ({mcb3_dram_udm,mcb3_dram_dm}),
      .ba         (mcb3_dram_ba),
      .addr       (mcb3_dram_a),
      .dq         (mcb3_dram_dq),
      .dqs        ({mcb3_dram_udqs,mcb3_dram_dqs}),
      .dqs_n      ({mcb3_dram_udqs_n,mcb3_dram_dqs_n}),
      .tdqs_n     (),
      .odt        (mcb3_dram_odt),
      .rst_n      (mcb3_dram_reset_n)
      );
   end else begin
     ddr3_model_c3 u_mem_c3(
      .ck         (mcb3_dram_ck),
      .ck_n       (mcb3_dram_ck_n),
      .cke        (mcb3_dram_cke),
      .cs_n       (1'b0),
      .ras_n      (mcb3_dram_ras_n),
      .cas_n      (mcb3_dram_cas_n),
      .we_n       (mcb3_dram_we_n),
      .dm_tdqs    (mcb3_dram_dm),
      .ba         (mcb3_dram_ba),
      .addr       (mcb3_dram_a),
      .dq         (mcb3_dram_dq),
      .dqs        (mcb3_dram_dqs),
      .dqs_n      (mcb3_dram_dqs_n),
      .tdqs_n     (),
      .odt        (mcb3_dram_odt),
      .rst_n      (mcb3_dram_reset_n)
     );
  end
endgenerate