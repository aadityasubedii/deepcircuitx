  lab7_soc_nios2_gen2_0_cpu_nios2_ocimem the_lab7_soc_nios2_gen2_0_cpu_nios2_ocimem
    (
      .MonDReg                 (MonDReg),
      .address                 (address),
      .byteenable              (byteenable),
      .clk                     (clk),
      .debugaccess             (debugaccess),
      .jdo                     (jdo),
      .jrst_n                  (jrst_n),
      .ociram_readdata         (ociram_readdata),
      .read                    (read),
      .reset_req               (reset_req),
      .take_action_ocimem_a    (take_action_ocimem_a),
      .take_action_ocimem_b    (take_action_ocimem_b),
      .take_no_action_ocimem_a (take_no_action_ocimem_a),
      .waitrequest             (waitrequest),
      .write                   (write),
      .writedata               (writedata)
    );

  assign trigout = dbrk_trigout | xbrk_trigout;