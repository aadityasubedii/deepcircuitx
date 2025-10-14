wire             xbrk_traceoff;
wire             xbrk_traceon;
wire             xbrk_trigout;
wire             xbrk_wrap_traceoff;
  lab7_soc_nios2_gen2_0_cpu_nios2_oci_debug the_lab7_soc_nios2_gen2_0_cpu_nios2_oci_debug
    (
      .clk                  (clk),
      .dbrk_break           (dbrk_break),
      .debugack             (debugack),
      .debugreq             (debugreq),
      .hbreak_enabled       (hbreak_enabled),
      .jdo                  (jdo),
      .jrst_n               (jrst_n),
      .monitor_error        (monitor_error),
      .monitor_go           (monitor_go),
      .monitor_ready        (monitor_ready),
      .oci_hbreak_req       (oci_hbreak_req),
      .ocireg_ers           (ocireg_ers),
      .ocireg_mrs           (ocireg_mrs),
      .reset                (reset),
      .resetlatch           (resetlatch),
      .resetrequest         (resetrequest),
      .st_ready_test_idle   (st_ready_test_idle),
      .take_action_ocimem_a (take_action_ocimem_a),
      .take_action_ocireg   (take_action_ocireg),
      .xbrk_break           (xbrk_break)
    );