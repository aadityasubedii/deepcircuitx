  assign oci_hbreak_req = jtag_break | dbrk_break | xbrk_break | debugreq;
  assign debugack = ~hbreak_enabled;