      begin : rd_buf
        wire [RAM_WIDTH-1:0] rd_buf_in_data;
        if (REMAINDER == 0)
          if (ECC == "OFF")
            assign rd_buf_in_data = rd_data;
          else
            assign rd_buf_in_data = {ecc_single, ecc_multiple, rd_data};
        else
          if (ECC == "OFF")
            assign rd_buf_in_data = {{6-REMAINDER{1'b0}}, rd_data};
          else
            assign rd_buf_in_data = 
              {{6-REMAINDER{1'b0}}, ecc_single, ecc_multiple, rd_data};