initial begin
  $timeformat(-9,2,"ns", 16);

   `ifdef SDFSCAN
       $sdf_annotate("sdf/UPA1_tsmc18_scan.sdf", test.top);
`endif

  clk         = 1'b0;
  reset       = 1'b0;
  scan_in0    = 1'b0;
  scan_in1    = 1'b0;
  scan_in2    = 1'b0;
  scan_in3    = 1'b0;
  scan_in4    = 1'b0;
  scan_enable = 1'b0;
  test_mode   = 1'b0;

  
  for (model=0; model<2; model=model+1) begin

    for (rate=0; rate<4; rate=rate+1) begin

      for (operation=0; operation<3; operation = operation+1) begin

        if(!(model==0 && operation==2)) begin 

          for (type=0; type<2; type=type+1) begin

            for (law=0; law<2; law=law+1) begin

              $display("%s %s %s %s %s law", models[model], rates[rate], operations[operation], types[type], laws[law]);

              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","vectorSize.t"}, vectorSizes);
              
              
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","pk0.t"}, PK0s); 
              
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","pk1.t"}, PK1s); 
              
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","a1.t"}, A1s); 
              
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","sigpk.t"}, SIGPKs); 
              
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","a1t.t"}, A1Ts); 

              loop = vectorSizes[0];


              @(posedge clk);
            
                 for (j=0; j<loop; j=j+1) begin 
                   PK0 = PK0s[j]; 
                   PK1 = PK1s[j];
                   A1 = A1s[j];
                   SIGPK = SIGPKs[j];
                
              @(negedge clk);

`ifdef VERBOSE
                $display("PK0 = %h", PK0); 
                $display("PK1 = %h", PK1);
                $display("A1 = %h", A1);
                $display("SIGPK = %h", SIGPK);
                $display("A1T = %h", A1T); 

`endif
                
                if (A1T !== A1Ts[j]) begin
                  
                  $display("%t ERROR: Test #%7d failed for %s, rate = %s, law = %s, %s, %s, PK0 = %h PK1=%h A1=%h SIGPK=%h A1T = %h instead of %h",
                    $time, j, models[model], rates[rate], laws[law], types[type], operations[operation], PK0,PK1,A1,SIGPK,A1T, A1Ts[j]); 
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
  
                        end 

  
  for (model=0; model<2; model=model+1) begin
    
         for (rate=0; rate<4; rate=rate+1) begin
     
              for (operation=0; operation<2; operation = operation+1) begin
        
                  for (type=0; type<2; type=type+1) begin
          
                      if(!(model==0 && type==1)) begin 
            
                         for (law=2; law<4; law=law+1) begin
              $display("%s %s %s %s %s law", models[model], rates[rate], operations[operation], types[type], laws[law]);
              
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","vectorSize.t"}, vectorSizes);
              
              
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","pk0.t"}, PK0s); 
              
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","pk1.t"}, PK1s); 
              
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","a1.t"}, A1s); 
              
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","sigpk.t"}, SIGPKs);                          
              
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","a1t.t"}, A1Ts);

               loop = vectorSizes[0];

              @(posedge clk);

              for (j=0; j<loop; j=j+1) begin 

                   PK0 = PK0s[j]; 
                   PK1 = PK1s[j];
                   A1 = A1s[j];
                   SIGPK = SIGPKs[j];

                @(negedge clk);

`ifdef VERBOSE
                $display("PK0 = %h", PK0);   
                $display("PK1 = %h", PK1);
                $display("A1 = %h", A1);
                $display("SIGPK = %h", SIGPK);
                $display("A1T = %h", A1T); 

`endif

                
                if (A1T !== A1Ts[j]) begin
                  
                  $display("%t ERROR: Test #%7d failed for %s, rate = %s, law = %s, %s, %s, PK0 = %h PK1 = %h A1 = %h SIGPK = %h A1T = %h instead of %h",
                    $time, j, models[model], rates[rate], laws[law], types[type], operations[operation], PK0,PK1,A1,SIGPK, A1T, A1Ts[j]); 
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

  end 


  #10 $display("%t TEST COMPLETE", $time);

  $finish;

end 