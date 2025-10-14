  assign last_master_ns = rst
                            ? ONE[0+:WIDTH]
                            : upd_last_master
                                ? current_master
                                : last_master_r;