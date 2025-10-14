  assign wr_en = (!empty_in[2] & ((!rd_en_in & !my_full[0]) |
                                  (rd_en_in & !my_empty[2])));