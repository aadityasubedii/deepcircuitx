assign cmp_data_valid = (FAMILY == "SPARTAN6") ? cmp_data_en :
                        (FAMILY == "VIRTEX6" && MEM_BURST_LEN == 4)? v6_data_cmp_valid :data_valid_i;