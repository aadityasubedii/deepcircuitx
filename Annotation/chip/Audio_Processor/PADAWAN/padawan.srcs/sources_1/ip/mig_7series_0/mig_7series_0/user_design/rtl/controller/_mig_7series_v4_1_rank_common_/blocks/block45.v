        always @(init_calib_complete or sre_request_r)
          sre_request = init_calib_complete && sre_request_r;
      
      end 