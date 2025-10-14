		if (PK0 !== PK0s[j][0]) begin

                  $display("%t ERROR: Test #%7d failed for %s, rate = %s, law = %s, %s, %s, DQ = %h SEZ = %h PK0 = %h instead of %h",
                  	$time, j, models[model], rates[rate], laws[law], types[type], operations[operation], DQ, SEZ, PK0, PK0s[j]); 
		
		`ifdef ERRORSTOP
			$stop;
		`endif
			
                end 
                
                if (SIGPK !== SIGPKs[j][0]) begin

                  $display("%t ERROR: Test #%7d failed for %s, rate = %s, law = %s, %s, %s, DQ = %h SEZ = %h SIGPK = %h instead of %h",
                  	$time, j, models[model], rates[rate], laws[law], types[type], operations[operation], DQ, SEZ, SIGPK, SIGPKs[j]); 
		
		`ifdef ERRORSTOP
			$stop;
		`endif
			
                end 