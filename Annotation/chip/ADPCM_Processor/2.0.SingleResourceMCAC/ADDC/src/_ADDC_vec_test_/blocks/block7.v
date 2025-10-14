  
    for (rate=0; rate<4; rate=rate+1) begin
    
      for (operation=0; operation<2; operation = operation+1) begin
      
        for (type=0; type<2; type=type+1) begin
        
          if(!(model==0 && type==1)) begin 
          
            for (law=2; law<4; law=law+1) begin
            
	      $display("%s %s %s %s %s law", models[model], rates[rate], operations[operation], types[type], laws[law]);
              
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",operations[operation],"/",rates[rate],"/","vectorSize.t"}, vectorSizes);
              
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",operations[operation],"/",rates[rate],"/","dq.t"}, DQs);
              
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",operations[operation],"/",rates[rate],"/","sez.t"}, SEZs);
              
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",operations[operation],"/",rates[rate],"/","pk0.t"}, PK0s);
              
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",operations[operation],"/",rates[rate],"/","sigpk.t"}, SIGPKs);
              
              loop = vectorSizes[0];
              
              @(posedge clk);
    
              for (j=0; j<loop; j=j+1) begin
                
                DQ = DQs[j];
                SEZ = SEZs[j];

	        @(negedge clk);
		
		`ifdef VERBOSE
                	$display("DQ = %h", DQ);
                	$display("SEZ = %h", SEZ);
                	$display("PK0 = %h", PK0);
	        	$display("SIGPK = %h", SIGPK);
		`endif
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
                
                @(posedge clk);
                
              end 
              
            end 
            
          end 
          
        end 
        
      end 
      
    end 
    