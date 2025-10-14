always @ (posedge clk or posedge reset)
begin
  if(reset)
    cnt <=#Tp 0;
  else
  if(clear)
    cnt <=#Tp { {(CNT_WIDTH-1){1'b0}}, read^write};
  else
  if(read ^ write)
    if(read)
      cnt <=#Tp cnt - 1'b1;
    else
      cnt <=#Tp cnt + 1'b1;
end