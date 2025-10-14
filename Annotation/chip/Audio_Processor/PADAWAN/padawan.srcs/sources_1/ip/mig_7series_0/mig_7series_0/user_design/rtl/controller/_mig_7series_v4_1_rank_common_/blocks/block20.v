  assign app_ref_ns = init_calib_complete && (app_ref_req || app_ref_r && |refresh_request);
  assign app_ref_ack_ns = app_ref_r && ~|refresh_request;