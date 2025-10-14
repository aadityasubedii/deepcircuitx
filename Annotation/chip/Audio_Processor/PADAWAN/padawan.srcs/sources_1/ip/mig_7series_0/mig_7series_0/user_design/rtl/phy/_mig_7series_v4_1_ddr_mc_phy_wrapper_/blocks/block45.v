  generate
  if(CKE_ODT_AUX == "TRUE")begin:odt_thru_auxpins
    if (USE_ODT_PORT == 1) begin : gen_use_odt
      
      
      
      
      
      
        OBUF u_odt_obuf
          (
           .I (aux_out[4*CKE_ODT_RCLK_SELECT_BANK+1]),
           .O (ddr_odt[0])
           );
      if (ODT_WIDTH == 2 && RANKS == 1) begin: gen_2port_odt
        OBUF u_odt1_obuf
          (
           .I (aux_out[4*CKE_ODT_RCLK_SELECT_BANK+2]),
           .O (ddr_odt[1])
           );
      end else if (ODT_WIDTH == 2 && RANKS == 2) begin: gen_2rank_odt
        OBUF u_odt1_obuf
          (
           .I (aux_out[4*CKE_ODT_RCLK_SELECT_BANK+3]),
           .O (ddr_odt[1])
           );
      end else if (ODT_WIDTH == 3 && RANKS == 1) begin: gen_3port_odt
        OBUF u_odt1_obuf
          (
           .I (aux_out[4*CKE_ODT_RCLK_SELECT_BANK+2]),
           .O (ddr_odt[1])
           );
        OBUF u_odt2_obuf
          (
           .I (aux_out[4*CKE_ODT_RCLK_SELECT_BANK+3]),
           .O (ddr_odt[2])
           );
      end
    end else begin
        assign ddr_odt = 'b0;
    end
  end
  endgenerate