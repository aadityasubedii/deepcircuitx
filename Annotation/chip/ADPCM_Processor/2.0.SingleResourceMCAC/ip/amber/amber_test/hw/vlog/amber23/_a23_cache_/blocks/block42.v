assign write_data_word  = i_byte_enable == 4'b0001 ? { o_read_data[31: 8], i_write_data[ 7: 0]                   } :
                          i_byte_enable == 4'b0010 ? { o_read_data[31:16], i_write_data[15: 8], o_read_data[ 7:0]} :
                          i_byte_enable == 4'b0100 ? { o_read_data[31:24], i_write_data[23:16], o_read_data[15:0]} :
                          i_byte_enable == 4'b1000 ? {                     i_write_data[31:24], o_read_data[23:0]} :
                          i_byte_enable == 4'b0011 ? { o_read_data[31:16], i_write_data[15: 0]                   } :
                          i_byte_enable == 4'b1100 ? {                     i_write_data[31:16], o_read_data[15:0]} :
                                                     i_write_data                                                  ;