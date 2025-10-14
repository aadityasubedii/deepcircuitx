  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_rf_ecc_unrecoverable_valid <= 0;
      else 
        W_rf_ecc_unrecoverable_valid <= E_rf_ecc_unrecoverable_valid & ~E_rf_ecc_recoverable_valid;
    end