initial
begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/APRSC_saed32nm_scan.sdf", test.top);
`endif
    clk = 1'b0;
    CoPrclk = 1'b0;
    reset = 1'b0;
    scan_in0 = 1'b0;
    scan_in1 = 1'b0;
    scan_in2 = 1'b0;
    scan_in3 = 1'b0;
    scan_in4 = 1'b0;
    scan_enable = 1'b0;
    test_mode = 1'b0;
    wait_for_ack = 1'b1;

    i_wb_adr <= 32'h0000_0000;
    i_wb_sel <= 4'h0;
    i_wb_we <= 1'b0;
    i_wb_dat <= 32'h0000_0000;
    i_wb_cyc <= 1'b0;
    i_wb_stb <= 1'b0;

    j = 0;
    k = 0;
    test_channel = 0;
    dq = 0;
    tr = 0;
    rate_in = 0;
    req = 1'b0;


repeat(4) begin
    @(posedge CoPrclk)
   reset <= 1'b1;
end
   @(posedge CoPrclk)
   reset <= 1'b0;

repeat(2) begin
    @(posedge CoPrclk)
   test_mode <= 1'b1;
end
   @(posedge CoPrclk)
   test_mode <= 1'b0;


repeat(4) begin
    @(posedge CoPrclk)
    reset <= 1'b1;
end
   @(posedge CoPrclk)
   reset <= 1'b0;


  for (model=0; model<2; model=model+1) begin
    for (rate=0; rate<4; rate=rate+1) begin
      for (operation=0; operation<3; operation = operation+1) begin
        if(!(model==0 && operation==2)) begin 
          for (type=0; type<2; type=type+1) begin
            for (law=0; law<2; law=law+1) begin
              $display("Current channel being tested with main vectors is: %d", test_channel);            

              $display("%s %s %s %s %s law", models[model], rates[rate], operations[operation], types[type], laws[law]);
              $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","vectorSize.t"}, vectorSizes);
              	loop = vectorSizes[0];
                $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","dq.t"}, dqs);
                $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","tr.t"}, trs);
                $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","se.t"}, ses);
                $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","a2p.t"}, a2ps);
                $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","sr.t"}, srs);
		
                
                if(model==0) begin
                  $readmemh({"../sw/sc_model/null_vectors/output/",laws_null[law],"/", types[type],"/",
                  operations[operation],"/",rates[rate],"/","dq.t"}, dq_null);
                  $readmemh({"../sw/sc_model/null_vectors/output/",laws_null[law],"/", types[type],"/",
                  operations[operation],"/",rates[rate],"/","tr.t"}, tr_null);
                  $readmemh({"../sw/sc_model/null_vectors/output/",laws_null[law],"/", types[type],"/",
                  operations[operation],"/",rates[rate],"/","se.t"}, se_null);
                  $readmemh({"../sw/sc_model/null_vectors/output/",laws_null[law],"/", types[type],"/",
                  operations[operation],"/",rates[rate],"/","a2p.t"}, a2p_null);
                  $readmemh({"../sw/sc_model/null_vectors/output/",laws_null[law],"/", types[type],"/",
                  operations[operation],"/",rates[rate],"/","sr.t"}, sr_null);
                end

                @(posedge CoPrclk);

                
                repeat(4)
                begin
                    @(posedge CoPrclk)
                    reset <= 1'b1;
                end
                @(posedge CoPrclk)
             	reset <= 1'b0;
                @(posedge CoPrclk);

                for (j=0; j<loop; j=j+1)  begin 
                    for(k=0; k<32; k=k+1) begin
                        if(k==test_channel) begin 
                            wb_write_strobe({16'h0000, APRSC_DQ}, {8'h00, dqs[j]});
                            wb_write_strobe({16'h0000, APRSC_TR}, {8'h00, trs[j]});
                            wb_write_strobe({16'h0000, APRSC_RATE}, rate);
                            wb_write_strobe({16'h0000, APRSC_REQ}, 32'h0000_0001);
                            repeat(4)
                            @(negedge CoPrclk);
                            while(wait_for_ack) begin
	                      	wb_read_strobe({16'h0000, APRSC_ACK}, 1'b0, 32'h0000_0000);
	                      	if (o_wb_dat[0] == 1'b1) begin
	                        	wait_for_ack = 1'b0;
	                      	end
					@(posedge clk);
                            end
                            wait_for_ack = 1'b1;
                            wb_write_strobe({16'h0000, APRSC_REQ}, 32'h0000_0000);
                            wb_read_strobe({16'h0000, APRSC_SE}, 1'b1, {8'h00, ses[j]});
                            wb_read_strobe({16'h0000, APRSC_SR}, 1'b1, {8'h00, srs[j]});
                            wb_read_strobe({16'h0000, APRSC_A2P}, 1'b1, {8'h00, a2ps[j]});
                            @(posedge CoPrclk);
                            wb_write_strobe({16'h0000, APRSC_REQ}, 32'h0000_0000);
                        end 
                    else begin 
			if(model==0) begin 
                            wb_write_strobe({16'h0000, APRSC_DQ}, {8'h00, dq_null[j]});
                            wb_write_strobe({16'h0000, APRSC_TR}, {8'h00, tr_null[j]});
                            wb_write_strobe({16'h0000, APRSC_RATE}, rate);
                            wb_write_strobe({16'h0000, APRSC_REQ}, 32'h0000_0001);
		                repeat(4)
		                @(negedge CoPrclk);
		                while(wait_for_ack) begin
			          	wb_read_strobe({16'h0000, APRSC_ACK}, 1'b0, 32'h0000_0000);
			              	if (o_wb_dat[0] == 1'b1) begin
			                	wait_for_ack = 1'b0;
			              	end
						@(posedge clk);
		                end
                            wait_for_ack = 1'b1;
                            wb_write_strobe({16'h0000, APRSC_REQ}, 32'h0000_0000);
                            wb_read_strobe({16'h0000, APRSC_SE}, 1'b1, {8'h00, se_null[j]});
                            wb_read_strobe({16'h0000, APRSC_SR}, 1'b1, {8'h00, sr_null[j]});
                            wb_read_strobe({16'h0000, APRSC_A2P}, 1'b1, {8'h00, a2p_null[j]});
                            @(posedge CoPrclk);
                            wb_write_strobe({16'h0000, APRSC_REQ}, 32'h0000_0000);
			end 
			else begin 
		                wb_write_strobe({16'h0000, APRSC_DQ}, 32'h0000_0000);
		                wb_write_strobe({16'h0000, APRSC_TR}, 32'h0000_0000);
		                wb_write_strobe({16'h0000, APRSC_RATE}, rate);
		                wb_write_strobe({16'h0000, APRSC_REQ}, 32'h0000_0001);
		                repeat(4)
		                @(negedge CoPrclk);
		                while(wait_for_ack) begin
			          	wb_read_strobe({16'h0000, APRSC_ACK}, 1'b0, 32'h0000_0000);
			              	if (o_wb_dat[0] == 1'b1) begin
			                	wait_for_ack = 1'b0;
			              	end
						@(posedge clk);
		                end
		                wait_for_ack = 1'b1;
		                wb_write_strobe({16'h0000, APRSC_REQ}, 32'h0000_0000);
                                wb_read_strobe({16'h0000, APRSC_SE}, 1'b0, {8'h00, ses[j]});
                                wb_read_strobe({16'h0000, APRSC_SR}, 1'b0, {8'h00, srs[j]});
                                wb_read_strobe({16'h0000, APRSC_A2P}, 1'b0, {8'h00, a2ps[j]});
		                @(posedge CoPrclk);
		                @(posedge CoPrclk);
			end 
                    end 
                    repeat(2)
                        @(posedge CoPrclk);
                end 
                @(posedge CoPrclk);
              end 
              if(test_channel==31) test_channel = 0;
              else test_channel = test_channel + 1;
            end 
          end 
        end 
      end 
    end 
  end 

  test_channel = 0;

  
  for (model=0; model<2; model=model+1) begin
    for (rate=0; rate<4; rate=rate+1) begin
      for (operation=0; operation<2; operation = operation+1) begin
        for (type=0; type<2; type=type+1) begin
          if(!(model==0 && type==1)) begin 
            for (law=2; law<4; law=law+1) begin
                $display("Current channel being tested with main vectors is: %d", test_channel);

                $display("%s %s %s %s %s law", models[model], rates[rate], operations[operation], types[type], laws[law]);
                $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                    operations[operation],"/",rates[rate],"/","vectorSize.t"}, vectorSizes);
                loop = vectorSizes[0];
                $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","dq.t"}, dqs);
                $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","tr.t"}, trs);
                $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","se.t"}, ses);
                $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","a2p.t"}, a2ps);
                $readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/", models[model], "/", types[type],"/",
                operations[operation],"/",rates[rate],"/","sr.t"}, srs);

                
                if(model==0) begin
                  $readmemh({"../sw/sc_model/null_vectors/output/",laws_null[law],"/", types[type],"/",
                  operations[operation],"/",rates[rate],"/","dq.t"}, dq_null);
                  $readmemh({"../sw/sc_model/null_vectors/output/",laws_null[law],"/", types[type],"/",
                  operations[operation],"/",rates[rate],"/","tr.t"}, tr_null);
                  $readmemh({"../sw/sc_model/null_vectors/output/",laws_null[law],"/", types[type],"/",
                  operations[operation],"/",rates[rate],"/","se.t"}, se_null);
                  $readmemh({"../sw/sc_model/null_vectors/output/",laws_null[law],"/", types[type],"/",
                  operations[operation],"/",rates[rate],"/","a2p.t"}, a2p_null);
                  $readmemh({"../sw/sc_model/null_vectors/output/",laws_null[law],"/", types[type],"/",
                  operations[operation],"/",rates[rate],"/","sr.t"}, sr_null);
                end
                @(posedge CoPrclk);

                
                repeat(4)
                begin
                    @(posedge CoPrclk)
                    reset <= 1'b1;
                end
                @(posedge CoPrclk)
             	reset <= 1'b0;
                @(posedge CoPrclk);

                for (j=0; j<loop; j=j+1)  begin 
                    for(k=0; k<32; k=k+1) begin
                        if(k==test_channel) begin 
                            wb_write_strobe({16'h0000, APRSC_DQ}, {8'h00, dqs[j]});
                            wb_write_strobe({16'h0000, APRSC_TR}, {8'h00, trs[j]});
                            wb_write_strobe({16'h0000, APRSC_RATE}, rate);
                            wb_write_strobe({16'h0000, APRSC_REQ}, 32'h0000_0001);
                            repeat(4)
                            @(negedge CoPrclk);
                            while(wait_for_ack) begin
	                      	wb_read_strobe({16'h0000, APRSC_ACK}, 1'b0, 32'h0000_0000);
	                      	if (o_wb_dat[0] == 1'b1) begin
	                        	wait_for_ack = 1'b0;
	                      	end
					@(posedge clk);
                            end
                            wait_for_ack = 1'b1;
                            wb_write_strobe({16'h0000, APRSC_REQ}, 32'h0000_0000);
                            wb_read_strobe({16'h0000, APRSC_SE}, 1'b1, {8'h00, ses[j]});
                            wb_read_strobe({16'h0000, APRSC_SR}, 1'b1, {8'h00, srs[j]});
                            wb_read_strobe({16'h0000, APRSC_A2P}, 1'b1, {8'h00, a2ps[j]});
                            @(posedge CoPrclk);
                            wb_write_strobe({16'h0000, APRSC_REQ}, 32'h0000_0000);
                        end 
                    else begin 
			if(model==0) begin 
                            wb_write_strobe({16'h0000, APRSC_DQ}, {8'h00, dq_null[j]});
                            wb_write_strobe({16'h0000, APRSC_TR}, {8'h00, tr_null[j]});
                            wb_write_strobe({16'h0000, APRSC_RATE}, rate);
                            wb_write_strobe({16'h0000, APRSC_REQ}, 32'h0000_0001);
		                repeat(4)
		                @(negedge CoPrclk);
		                while(wait_for_ack) begin
			          	wb_read_strobe({16'h0000, APRSC_ACK}, 1'b0, 32'h0000_0000);
			              	if (o_wb_dat[0] == 1'b1) begin
			                	wait_for_ack = 1'b0;
			              	end
						@(posedge clk);
		                end
                            wait_for_ack = 1'b1;
                            wb_write_strobe({16'h0000, APRSC_REQ}, 32'h0000_0000);
                            wb_read_strobe({16'h0000, APRSC_SE}, 1'b1, {8'h00, se_null[j]});
                            wb_read_strobe({16'h0000, APRSC_SR}, 1'b1, {8'h00, sr_null[j]});
                            wb_read_strobe({16'h0000, APRSC_A2P}, 1'b1, {8'h00, a2p_null[j]});
                            @(posedge CoPrclk);
                            wb_write_strobe({16'h0000, APRSC_REQ}, 32'h0000_0000);
			end 
			else begin 
		                wb_write_strobe({16'h0000, APRSC_DQ}, 32'h0000_0000);
		                wb_write_strobe({16'h0000, APRSC_TR}, 32'h0000_0000);
		                wb_write_strobe({16'h0000, APRSC_RATE}, rate);
		                wb_write_strobe({16'h0000, APRSC_REQ}, 32'h0000_0001);
		                repeat(4)
		                @(negedge CoPrclk);
		                while(wait_for_ack) begin
			          	wb_read_strobe({16'h0000, APRSC_ACK}, 1'b0, 32'h0000_0000);
			              	if (o_wb_dat[0] == 1'b1) begin
			                	wait_for_ack = 1'b0;
			              	end
						@(posedge clk);
		                end
		                wait_for_ack = 1'b1;
		                wb_write_strobe({16'h0000, APRSC_REQ}, 32'h0000_0000);
                                wb_read_strobe({16'h0000, APRSC_SE}, 1'b0, {8'h00, ses[j]});
                                wb_read_strobe({16'h0000, APRSC_SR}, 1'b0, {8'h00, srs[j]});
                                wb_read_strobe({16'h0000, APRSC_A2P}, 1'b0, {8'h00, a2ps[j]});
		                @(posedge CoPrclk);
		                @(posedge CoPrclk);
			end 
                    end 
                    repeat(2)
                        @(posedge CoPrclk);
                end 
                @(posedge CoPrclk);
              end 
              if(test_channel==31) test_channel = 0;
              else test_channel = test_channel + 1;
            end 
          end 
        end 
      end 
    end 
  end 

#10 $display("%t TEST COMPLETE", $time);
  $finish;
end 