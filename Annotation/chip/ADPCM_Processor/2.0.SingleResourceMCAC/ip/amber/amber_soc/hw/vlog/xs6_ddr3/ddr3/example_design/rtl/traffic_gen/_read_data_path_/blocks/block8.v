 generate
 if (FAMILY == "VIRTEX6" && MEM_BURST_LEN == 8) begin: gen_error_3
    for (i = 0; i < NUM_DQ_PINS/2; i = i + 1) begin: gen_cmp
      assign error_byte[i] 
               = (data_valid_i && (data_i[8*(i+1)-1:8*i] !== cmp_data[8*(i+1)-1:8*i]) );  
    end
    
    
    
    