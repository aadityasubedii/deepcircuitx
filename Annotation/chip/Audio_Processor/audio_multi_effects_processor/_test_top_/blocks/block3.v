	initial begin
		swDIS = 0;
		swDEL = 0;
		swECHO = 0;
		swREVERB = 0;
		#20000
		swDIS = 1;
		#40000
		swDIS = 0;
		swDEL = 1;
		#40000
		swDEL = 0;
		swECHO = 1;
		#40000
		swECHO = 0;
		swREVERB = 1;
		#40000
		swREVERB = 0;
	end