        always @(init_calib_complete or zq_request_r)
                  zq_request = init_calib_complete && zq_request_r;
      end 