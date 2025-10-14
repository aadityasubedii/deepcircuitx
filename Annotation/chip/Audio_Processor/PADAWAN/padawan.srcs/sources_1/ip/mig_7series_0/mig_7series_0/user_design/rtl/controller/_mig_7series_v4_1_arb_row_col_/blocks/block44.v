  assign rnk_config_valid_ns =
          ~rst && (rnk_config_valid_r_lcl || rnk_config_strobe_ns);