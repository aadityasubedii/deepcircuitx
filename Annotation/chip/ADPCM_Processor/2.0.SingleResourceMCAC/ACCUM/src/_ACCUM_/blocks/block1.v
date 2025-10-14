  always@(posedge clk, posedge reset)begin
    if(reset)
      S <= 0;
    else if(clear)
      S <= 0;
    else
      S <= W + S;
  end