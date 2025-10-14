  always @(posedge clock)begin
      y[0] <= Xin;
		y[1] <= y[0];
		y[2] <= y[1];
		y[3] <= y[2];
		y[4] <= y[3];
		y[5] <= y[4];
		y[6] <= y[5];
		y[7] <= (y[6]>>1)+Xin;
  end