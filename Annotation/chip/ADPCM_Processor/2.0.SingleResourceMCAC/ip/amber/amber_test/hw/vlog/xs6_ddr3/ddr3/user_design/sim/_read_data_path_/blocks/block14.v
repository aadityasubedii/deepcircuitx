 generate
 if (FAMILY == "VIRTEX6" && MEM_BURST_LEN == 4) begin: gen_error_2


    for (i = 0; i < NUM_DQ_PINS/2; i = i + 1) begin: gen_cmp
      assign error_byte[i] 
               = (~rd_mdata_fifo_empty && rd_mdata_en && (rd_v6_mdata[8*(i+1)-1:8*i] !== cmp_data[8*(i+1)-1:8*i]) );  


    end