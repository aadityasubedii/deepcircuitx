initial begin
  $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
  $sdf_annotate("sdf/DELAY_tsmc18_scan.sdf", test.top);       
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
                operations[operation],"/",rates[rate],"/","In1.t"}, In1s); 
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","Out1.t"}, Out1s); 

              for (j=0; j<loop; j=j+1) begin 
                #1 In1 = In1s[j]; 
                #10;
`ifdef VERBOSE
                $display("In1 = %h", In1);   
                $display("Out1 = %h", Out1); 
`endif
                
                if (Out1 !== Out1s[j]) begin
                  
                  $display("%t ERROR: Test #%7d failed for %s, rate = %s, law = %s, %s, %s, In1 = %h. Out1 = %h instead of %h",
                    $time, j, models[model], rates[rate], laws[law], types[type], operations[operation], In1, Out1, Out1s[j]); 
`ifdef ERRORSTOP
                  $stop;
`endif
                end 
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
                operations[operation],"/",rates[rate],"/","In1.t"}, In1s); 
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","Out1.t"}, Out1s); 

              for (j=0; j<loop; j=j+1) begin 
                #1 In1 = In1s[j]; 
                #10;
`ifdef VERBOSE
                $display("In1 = %h", In1);   
                $display("Out1 = %h", Out1); 
`endif
                
                if (Out1 !== Out1s[j]) begin
                  
                  $display("%t ERROR: Test #%7d failed for %s, rate = %s, law = %s, %s, %s, In1 = %h. Out1 = %h instead of %h",
                    $time, j, models[model], rates[rate], laws[law], types[type], operations[operation], In1, Out1, Out1s[j]); 
`ifdef ERRORSTOP
                  $stop;
`endif
                end 
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