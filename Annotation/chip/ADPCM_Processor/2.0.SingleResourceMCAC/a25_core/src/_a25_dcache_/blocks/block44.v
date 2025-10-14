assign con_write_data_word  = 
                          i_byte_enable == 4'b0001 ? { con_read_data_word[31: 8], i_write_data[ 7: 0]                          } :
                          i_byte_enable == 4'b0010 ? { con_read_data_word[31:16], i_write_data[15: 8], con_read_data_word[ 7:0]} :
                          i_byte_enable == 4'b0100 ? { con_read_data_word[31:24], i_write_data[23:16], con_read_data_word[15:0]} :
                          i_byte_enable == 4'b1000 ? {                            i_write_data[31:24], con_read_data_word[23:0]} :
                          i_byte_enable == 4'b0011 ? { con_read_data_word[31:16], i_write_data[15: 0]                          } :
                          i_byte_enable == 4'b1100 ? {                            i_write_data[31:16], con_read_data_word[15:0]} :
                                                                   i_write_data                                                  ;