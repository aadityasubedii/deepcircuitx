      end else if (ODT_WIDTH == 3 && RANKS == 1) begin: gen_3port_odt
        OBUF u_odt1_obuf
          (
           .I (aux_out[4*CKE_ODT_RCLK_SELECT_BANK+2]),
           .O (ddr_odt[1])
           );