initial begin
  $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
  $sdf_annotate("sdf/UPB_tsmc18_scan.sdf", test.top);
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
			for (in_select=0; in_select<6; in_select=in_select+1) begin
				case (in_select)
				
					4'b0000:
						begin
						  	$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","u1.t"}, Uns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq.t"}, DQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b1.t"}, Bns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b1p.t"}, BnPs);
						end
					4'b0001:
						begin
							$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","u2.t"}, Uns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq.t"}, DQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b2.t"}, Bns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b2p.t"}, BnPs);
						end
					4'b0010:
						begin
							$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","u3.t"}, Uns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq.t"}, DQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b3.t"}, Bns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b3p.t"}, BnPs);
						end
					4'b0011:
						begin
							$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","u4.t"}, Uns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq.t"}, DQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b4.t"}, Bns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b4p.t"}, BnPs);
						end
					4'b0100:
						begin
							$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","u5.t"}, Uns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq.t"}, DQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b5.t"}, Bns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b5p.t"}, BnPs);
						end
					4'b0101:
						begin
							$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","u6.t"}, Uns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq.t"}, DQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b6.t"}, Bns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b6p.t"}, BnPs);
						end
				endcase
				@(posedge clk);
				for (j=0; j<loop; j=j+1) begin 
					Un = Uns[j];
					DQn = DQns[j];
					Bn = Bns[j];
					rate_in = rate;
					@(posedge clk);
					`ifdef VERBOSE
						$display("Un = %h", Un);
						$display("DQn = %h", DQn);
						$display("Bn = %h", Bn);
						$display("BnP = %h", BnP);
					`endif
					if (BnP !== BnPs[j]) begin
					
					$display("%t ERROR: Test #%7d failed for %s, rate = %s, law = %s, %s, %s, Un = %h, DQn = %h, Bn = %h. BnP = %h instead of %h",
                    				$time, j, models[model], rates[rate], laws[law], types[type], operations[operation], Un, DQn, Bn, BnP, BnPs[j]); 
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
			for (in_select=0; in_select<6; in_select=in_select+1) begin
				case (in_select)
				
					4'b0000:
						begin
						  	$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","u1.t"}, Uns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq.t"}, DQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b1.t"}, Bns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b1p.t"}, BnPs);
						end
					4'b0001:
						begin
							$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","u2.t"}, Uns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq.t"}, DQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b2.t"}, Bns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b2p.t"}, BnPs);
						end
					4'b0010:
						begin
							$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","u3.t"}, Uns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq.t"}, DQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b3.t"}, Bns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b3p.t"}, BnPs);
						end
					4'b0011:
						begin
							$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","u4.t"}, Uns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq.t"}, DQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b4.t"}, Bns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b4p.t"}, BnPs);
						end
					4'b0100:
						begin
							$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","u5.t"}, Uns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq.t"}, DQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b5.t"}, Bns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b5p.t"}, BnPs);
						end
					4'b0101:
						begin
							$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","u6.t"}, Uns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","dq.t"}, DQns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b6.t"}, Bns);
						  $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/",models[model], "/", types[type],"/",
						    operations[operation],"/",rates[rate],"/","b6p.t"}, BnPs);
						end
				endcase
				@(posedge clk);
				for (j=0; j<loop; j=j+1) begin 
					Un = Uns[j];
					DQn = DQns[j];
					Bn = Bns[j];
					rate_in = rate;
					@(posedge clk);
					`ifdef VERBOSE
						$display("Un = %h", Un);
						$display("DQn = %h", DQn);
						$display("Bn = %h", Bn);
						$display("BnP = %h", BnP);
					`endif
					if (BnP !== BnPs[j]) begin
					
					$display("%t ERROR: Test #%7d failed for %s, rate = %s, law = %s, %s, %s, Un = %h, DQn = %h, Bn = %h. BnP = %h instead of %h",
                    				$time, j, models[model], rates[rate], laws[law], types[type], operations[operation], Un, DQn, Bn, BnP, BnPs[j]); 
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