always @ (SIGPK or PK0 or PK1) begin
	if ( (!PKS) && (!SIGPK))

		UGA1<= 192;

	else if ( (PKS) && (!SIGPK))

		UGA1<= 65344;

	else 
      
		UGA1<=0;

end