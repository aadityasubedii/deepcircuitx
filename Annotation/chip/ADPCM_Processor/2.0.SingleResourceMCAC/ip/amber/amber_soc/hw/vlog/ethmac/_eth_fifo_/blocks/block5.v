always @ (posedge clk or posedge reset)
begin
  if(reset)
    read_pointer <=#Tp 0;
  else
  if(clear)
    read_pointer <=#Tp { {(CNT_WIDTH-2){1'b0}}, read};
  else
  if(read & ~empty)
    read_pointer <=#Tp read_pointer + 1'b1;
end