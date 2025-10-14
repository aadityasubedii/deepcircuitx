      end else if (ODT_WIDTH == 2 && RANKS == 2) begin: gen_2rank_odt
        OBUF u_odt1_obuf
          (
           .I (aux_out[4*CKE_ODT_RCLK_SELECT_BANK+3]),
           .O (ddr_odt[1])
           );