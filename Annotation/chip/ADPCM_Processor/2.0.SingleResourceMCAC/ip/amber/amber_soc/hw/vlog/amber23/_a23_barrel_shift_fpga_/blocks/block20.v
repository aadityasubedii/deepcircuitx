generate
genvar i, j;
	for (i = 0; i < 5; i = i + 1)
	begin : netgen
		wire [31:0] in;
		reg [31:0] out;
		for (j = 0; j < 32; j = j + 1)
		begin : net