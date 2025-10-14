  assign oci_tb_hbreak_req = oci_hbreak_req;
  assign hbreak_req = (oci_tb_hbreak_req | hbreak_pending) & hbreak_enabled &  ~(wait_for_one_post_bret_inst & ~W_valid);
  assign hbreak_pending_nxt = hbreak_pending ? hbreak_enabled 
    : hbreak_req;
