initial begin
  $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
  $sdf_annotate("sdf/LIMD_tsmc18_scan.sdf", test.top);
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
              loop = vectorSizes[0];
              
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","a1t.t"}, A1Ts);                 
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","a2p.t"}, A2Ps);                 
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","a1p.t"}, A1Ps);                 
              
              @(posedge clk);
              for (j=0; j<loop; j=j+1) begin 
                #1 A1T = A1Ts[j]; A2P = A2Ps[j];
                @(posedge clk); 
`ifdef VERBOSE
                $display("A1T = %h", A1T); 
                $display("A2P = %h", A2P);  
                $display("A1P = %h", A1P);
`endif
                                                     
                if (A1P !== A1Ps[j]) begin                                                                                    
                  $display("%t ERROR: Test #%7d failed for %s, rate = %s, law = %s, %s, %s, A1T = %h, A2P = %h. A1P = %h instead of %h",  
                    $time, j, models[model], rates[rate], laws[law], types[type], operations[operation], A1T,A2P, A1P, A1Ps[j]); 
`ifdef ERRORSTOP
                  $stop;
`endif
                end 
                @(negedge clk);
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
              loop = vectorSizes[0];

              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","a1t.t"}, A1Ts); 
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","a2p.t"}, A2Ps); 
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","a1p.t"}, A1Ps); 
               @(posedge clk);
              for (j=0; j<loop; j=j+1) begin 
                #1 A1T = A1Ts[j]; A2P = A2Ps[j];         
                @(posedge clk);
`ifdef VERBOSE
                $display("A1T = %h", A1T); 
                $display("A2P = %h", A2P);
                $display("A1P = %h", A1P); 
`endif
              
                if (A2P !== A2Ps[j]) begin
                  $display("%t ERROR: Test #%7d failed for %s, rate = %s, law = %s, %s, %s, A1T = %h, A2P = %h. A1P = %h instead of %h",  
                    $time, j, models[model], rates[rate], laws[law], types[type], operations[operation], A1T,A2P, A1P, A1Ps[j]); 
`ifdef ERRORSTOP
                  $stop;
`endif
                end 
               @(negedge clk);
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