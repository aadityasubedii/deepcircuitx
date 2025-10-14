task shift_n_expand (
  input   [7:0] data_in,
  output  [8:0] data_out
  );

  begin
    if (data_in[0])
      data_out[1:0]  = 2'b11;
    else
      data_out[1:0]  = 2'b00;

    if (data_in[1:0] == 2'b10)
      data_out[2:1]  = 2'b11;
    else
      data_out[2:1]  = {data_in[1], data_out[1]};

    if (data_in[2:1] == 2'b10)
      data_out[3:2]  = 2'b11;
    else
      data_out[3:2]  = {data_in[2], data_out[2]};

    if (data_in[3:2] == 2'b10)
      data_out[4:3]  = 2'b11;
    else
      data_out[4:3]  = {data_in[3], data_out[3]};

    if (data_in[4:3] == 2'b10)
      data_out[5:4]  = 2'b11;
    else
      data_out[5:4]  = {data_in[4], data_out[4]};

    if (data_in[5:4] == 2'b10)
      data_out[6:5]  = 2'b11;
    else
      data_out[6:5]  = {data_in[5], data_out[5]};

    if (data_in[6:5] == 2'b10)
      data_out[7:6]  = 2'b11;
    else
      data_out[7:6]  = {data_in[6], data_out[6]};

    if (data_in[7:6] == 2'b10)
      data_out[8:7]  = 2'b11;
    else
      data_out[8:7]  = {data_in[7], data_out[7]};
  end
endtask