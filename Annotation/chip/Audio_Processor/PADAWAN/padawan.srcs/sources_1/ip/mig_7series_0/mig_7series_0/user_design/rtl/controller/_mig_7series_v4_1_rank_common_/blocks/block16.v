  assign app_zq_ns = init_calib_complete && (app_zq_req || app_zq_r && zq_request);
  assign app_zq_ack_ns = app_zq_r && ~zq_request;