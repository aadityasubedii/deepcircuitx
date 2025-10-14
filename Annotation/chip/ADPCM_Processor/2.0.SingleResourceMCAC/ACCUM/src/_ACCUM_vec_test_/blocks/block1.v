initial begin
  $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
  $sdf_annotate("sdf/ACCUM_tsmc18_scan.sdf", test.top);
`endif

  clk         = 1'b0;
  reset       = 1'b1;  
  scan_in0    = 1'b0;
  scan_in1    = 1'b0;
  scan_in2    = 1'b0;
  scan_in3    = 1'b0;
  scan_in4    = 1'b0;
  scan_enable = 1'b0;
  test_mode   = 1'b0;

  clear = 1'b0;
  W <= 0;
 
  repeat(2)
    @(posedge clk);
  reset = 1'b0; 


  
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
                operations[operation],"/",rates[rate],"/","wa1.t"}, WA1s);
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","wa2.t"}, WA2s);
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","wb1.t"}, WB1s);
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","wb2.t"}, WB2s);
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","wb3.t"}, WB3s);
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","wb4.t"}, WB4s);
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","wb5.t"}, WB5s);
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","wb6.t"}, WB6s);
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","sez.t"}, SEZs);
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","se.t"}, SEs);

              @(posedge clk);

              for (j=0; j<loop; j=j+1) begin 

                
                clear = 1'b1;
                @(posedge clk);
                clear = 1'b0; 
                @(posedge clk);

                for (k=0; k<9; k=k+1) begin
                  case(k)
                    0: begin W <= WB1s[j]; end
                    1: begin W <= WB2s[j]; end
                    2: begin W <= WB3s[j]; end
                    3: begin W <= WB4s[j]; end
                    4: begin W <= WB5s[j]; end
                    5: begin W <= WB6s[j]; end
                    6: begin W <= WA1s[j]; end
                    7: begin W <= WA2s[j]; end
                    8: begin W <= 0; end
                  endcase

                  @(negedge clk);

                  if(k === 6 && S[15:1] !== SEZs[j]) begin
                    $display("%t ERROR: Test #%7d failed for %s, rate = %s, law = %s, %s, %s, W = %h. S = %h instead of %h", $time, j, models[model], rates[rate], laws[law], types[type], operations[operation], W, S[15:1], SEZs[j]);
`ifdef ERRORSTOP
                    $stop;
`endif
                  end
                  else if(k === 8 && S[15:1] !== SEs[j]) begin
                    $display("%t ERROR: Test #%7d failed for %s, rate = %s, law = %s, %s, %s, W = %h. S = %h instead of %h", $time, j, models[model], rates[rate], laws[law], types[type], operations[operation], W, S[15:1], SEs[j]);
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
                operations[operation],"/",rates[rate],"/","wa1.t"}, WA1s);
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","wa2.t"}, WA2s);
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","wb1.t"}, WB1s);
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","wb2.t"}, WB2s);
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","wb3.t"}, WB3s);
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","wb4.t"}, WB4s);
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","wb5.t"}, WB5s);
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","wb6.t"}, WB6s);
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","sez.t"}, SEZs);
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","se.t"}, SEs);

              @(posedge clk);

              for (j=0; j<loop; j=j+1) begin 

                
                clear = 1'b1;
                @(posedge clk);
                clear = 1'b0; 
                @(posedge clk);

                for (k=0; k<9; k=k+1) begin
                  case(k)
                    0: begin W <= WB1s[j]; end
                    1: begin W <= WB2s[j]; end
                    2: begin W <= WB3s[j]; end
                    3: begin W <= WB4s[j]; end
                    4: begin W <= WB5s[j]; end
                    5: begin W <= WB6s[j]; end
                    6: begin W <= WA1s[j]; end
                    7: begin W <= WA2s[j]; end
                    8: begin W <= 0; end
                  endcase

                  @(negedge clk);

                  if(k === 6 && S[15:1] !== SEZs[j]) begin
                    $display("%t ERROR: Test #%7d failed for %s, rate = %s, law = %s, %s, %s, W = %h. S = %h instead of %h", $time, j, models[model], rates[rate], laws[law], types[type], operations[operation], W, S[15:1], SEZs[j]);
`ifdef ERRORSTOP
                    $stop;
`endif
                  end
                  else if(k === 8 && S[15:1] !== SEs[j]) begin
                    $display("%t ERROR: Test #%7d failed for %s, rate = %s, law = %s, %s, %s, W = %h. S = %h instead of %h", $time, j, models[model], rates[rate], laws[law], types[type], operations[operation], W, S[15:1], SEs[j]);
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
  end 

  #10 $display("%t TEST COMPLETE", $time);
  $finish;
end 