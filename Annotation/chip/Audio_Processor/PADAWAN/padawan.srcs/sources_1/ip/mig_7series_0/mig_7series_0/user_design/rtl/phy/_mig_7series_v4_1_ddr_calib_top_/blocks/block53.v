  assign ck_addr_cmd_delay_done = (WRLVL == "ON") ? po_ck_addr_cmd_delay_done :
                                                    (po_ck_addr_cmd_delay_done
                                                    && pi_fine_dly_dec_done) ;