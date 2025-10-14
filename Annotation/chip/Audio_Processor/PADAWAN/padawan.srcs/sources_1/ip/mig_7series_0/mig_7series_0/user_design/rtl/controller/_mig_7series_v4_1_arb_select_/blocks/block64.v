    always @(*) 
    begin
      cke_ns = 1'b1;
      if (maint_sre_r & insert_maint_r1)
         cke_ns = 1'b0;
      else if (cke_r==1'b0)
      begin
         if (maint_srx_r & insert_maint_r1)
           cke_ns = 1'b1;
         else
           cke_ns = 1'b0;
      end
    end