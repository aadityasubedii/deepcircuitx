  generate
  if(CKE_ODT_AUX == "TRUE")begin:cke_thru_auxpins
    if (CKE_WIDTH == 1) begin : gen_cke
      
      
      
      
      
      
      OBUF u_cke_obuf
        (
         .I (aux_out[4*CKE_ODT_RCLK_SELECT_BANK]),
         .O (ddr_cke)
         );
    end else begin: gen_2rank_cke
      OBUF u_cke0_obuf
        (
         .I (aux_out[4*CKE_ODT_RCLK_SELECT_BANK]),
         .O (ddr_cke[0])
         );
      OBUF u_cke1_obuf
        (
         .I (aux_out[4*CKE_ODT_RCLK_SELECT_BANK+2]),
         .O (ddr_cke[1])
         );
    end
  end
  endgenerate