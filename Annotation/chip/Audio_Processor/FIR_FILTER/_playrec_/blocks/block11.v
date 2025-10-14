  always @(posedge clock)begin
      y[0] <= h[0]*Xin;
		for(int i = 1; i < N2; i++)
		   y[i] <= y[i-1]+h[N2-1-i]*Xin;
  end