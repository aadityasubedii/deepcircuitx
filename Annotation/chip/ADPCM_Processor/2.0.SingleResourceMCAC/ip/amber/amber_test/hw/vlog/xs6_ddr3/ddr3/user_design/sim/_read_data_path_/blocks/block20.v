assign rd_mdata_o = rd_mdata;

assign rd_mdata = (FAMILY == "SPARTAN6") ? rd_data_r3: 
                  (FAMILY == "VIRTEX6" && MEM_BURST_LEN == 4)? rd_v6_mdata_r2:
                  rd_data_r;

assign cmp_data_valid = (FAMILY == "SPARTAN6") ? cmp_data_en :
                        (FAMILY == "VIRTEX6" && MEM_BURST_LEN == 4)? v6_data_cmp_valid :data_valid_i;



   
assign        cmp_data_o  = (FAMILY == "SPARTAN6") ? cmp_data_r3 : cmp_data_r2;
assign        cmp_addr_o  = gen_addr;
assign        cmp_bl_o    = gen_bl;


   
assign data_rdy_o = data_rdy;
assign data_rdy = cmp_valid & data_valid_i;
