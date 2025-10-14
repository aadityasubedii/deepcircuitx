      always @(negedge rst) begin
      
        $display ("**********************************************");
        $display ("H Matrix:");

        for (i=0; i<ECC_WIDTH; i=i+1)
          $display ("%b", h_rows[i*CODE_WIDTH+:CODE_WIDTH]);
       
       $display ("**********************************************");
      
      end