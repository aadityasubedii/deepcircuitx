   else begin: PORT2_NO_TG
      assign p2_error          = 'b0;
      assign p2_error_status   = 'b0;
      assign p2_cmp_data       = 'b0;
      assign p2_cmp_data_valid = 'b0;
      assign p2_cmp_error      = 'b0;
   end   
endgenerate