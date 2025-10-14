assign rd_mdata = (FAMILY == "SPARTAN6") ? rd_data_r3: 
                  (FAMILY == "VIRTEX6" && MEM_BURST_LEN == 4)? rd_v6_mdata_r2:
                  rd_data_r;