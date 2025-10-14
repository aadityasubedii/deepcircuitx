initial begin
  $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
  $sdf_annotate("sdf/FMULT_tsmc18_scan.sdf", test.top);
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
			for (in_select=0; in_select<8; in_select=in_select+1) begin
				case (in_select)
				
					4'b0000:
						begin
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","a1.t"}, AnBns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","sr1.t"}, SRnDQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","wa1.t"}, WAnWBns);
						end
					4'b0001:
						begin
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","a2.t"}, AnBns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","sr2.t"}, SRnDQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","wa2.t"}, WAnWBns);
						end
					4'b0010:
						begin
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b1.t"}, AnBns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq1.t"}, SRnDQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","wb1.t"}, WAnWBns);
						end
					4'b0011:
						begin
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b2.t"}, AnBns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq2.t"}, SRnDQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","wb2.t"}, WAnWBns);
						end
					4'b0100:
						begin
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b3.t"}, AnBns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq3.t"}, SRnDQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","wb3.t"}, WAnWBns);
						end
					4'b0101:
						begin
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b4.t"}, AnBns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq4.t"}, SRnDQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","wb4.t"}, WAnWBns);
						end
					4'b0110:
						begin
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b5.t"}, AnBns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq5.t"}, SRnDQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","wb5.t"}, WAnWBns);
						end
					4'b0111:
						begin
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b6.t"}, AnBns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq6.t"}, SRnDQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","wb6.t"}, WAnWBns);
						end
				endcase
				@(posedge clk);
				for (j=0; j<loop; j=j+1) begin 
					AnBn = AnBns[j];
					SRnDQn = SRnDQns[j];
					@(posedge clk);
					`ifdef VERBOSE
						$display("AnBn = %h", AnBn);
						$display("SRnDQn = %h", SRnDQn);
						$display("WAWBn = %h", WAnWBn);
					`endif
					if (WAnWBn !== WAnWBns[j]) begin
					
					$display("%t ERROR: Test #%7d failed for %s, rate = %s, law = %s, %s, %s, AnBn = %h, SRnDQn = %h. WAnWBn = %h instead of %h",
                    				$time, j, models[model], rates[rate], laws[law], types[type], operations[operation], AnBn, SRnDQn, WAnWBn, WAnWBns[j]); 
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
			for (in_select=0; in_select<8; in_select=in_select+1) begin
				case (in_select)
				
					0:
						begin
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","a1.t"}, AnBns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","sr1.t"}, SRnDQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","wa1.t"}, WAnWBns);
						end
					1:
						begin
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","a2.t"}, AnBns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","sr2.t"}, SRnDQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","wa2.t"}, WAnWBns);
						end
					2:
						begin
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b1.t"}, AnBns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq1.t"}, SRnDQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","wb1.t"}, WAnWBns);
						end
					3:
						begin
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b2.t"}, AnBns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq2.t"}, SRnDQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","wb2.t"}, WAnWBns);
						end
					4:
						begin
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b3.t"}, AnBns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq3.t"}, SRnDQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","wb3.t"}, WAnWBns);
						end
					5:
						begin
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b4.t"}, AnBns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq4.t"}, SRnDQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","wb4.t"}, WAnWBns);
						end
					6:
						begin
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b5.t"}, AnBns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq5.t"}, SRnDQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","wb5.t"}, WAnWBns);
						end
					7:
						begin
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b6.t"}, AnBns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq6.t"}, SRnDQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","wb6.t"}, WAnWBns);
						end
				endcase
				@(posedge clk);
				for (j=0; j<loop; j=j+1) begin 
					AnBn = AnBns[j];
					SRnDQn = SRnDQns[j];
					@(posedge clk);
					`ifdef VERBOSE
						$display("AnBn = %h", AnBn);
						$display("SRnDQn = %h", SRnDQn);
						$display("WAWBn = %h", WAnWBn);
					`endif
					if (WAnWBn !== WAnWBns[j]) begin
					
					$display("%t ERROR: Test #%7d failed for %s, rate = %s, law = %s, %s, %s, AnBn = %h, SRnDQn = %h. WAnWBn = %h instead of %h",
                    				$time, j, models[model], rates[rate], laws[law], types[type], operations[operation], AnBn, SRnDQn, WAnWBn, WAnWBns[j]); 
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
  end 

  #10 $display("%t TEST COMPLETE", $time);
  $finish;
end 