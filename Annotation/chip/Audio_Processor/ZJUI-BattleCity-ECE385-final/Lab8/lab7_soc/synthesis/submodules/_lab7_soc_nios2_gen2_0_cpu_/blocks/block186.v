  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W1_rf_ecc_recoverable_valid <= 0;
      else 
        W1_rf_ecc_recoverable_valid <= W_rf_ecc_recoverable_valid;
    end