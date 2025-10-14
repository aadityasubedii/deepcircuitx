always @ (posedge clk or posedge reset)
begin
  if(reset)
    write_pointer <=#Tp 0;
  else
  if(clear)
    write_pointer <=#Tp { {(CNT_WIDTH-2){1'b0}}, write};
  else
  if(write & ~full)
    write_pointer <=#Tp write_pointer + 1'b1;
end