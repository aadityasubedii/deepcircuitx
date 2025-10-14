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


$readmemh({"./APRSCTests.t"},testCases);
model = testCases[0];
type = testCases[1];
operation=testCases[2];
law = testCases[3];
rate = testCases[4];

$display("%s %s %s %s %s law", models[model], rates[rate], operations[operation], types[type], laws[law]);


$readmemh({"../sw/mc_model/vector_out/",laws[law],"/", models[model], "/", types[type],"/", operations[operation],"/",rates[rate],"/","vectorSize.t"}, vectorSizes);
loop = vectorSizes[0];
$readmemh({"../sw/mc_model/vector_out/",laws[law],"/", models[model], "/", types[type],"/", operations[operation],"/",rates[rate],"/","channel.t"}, channels);
test_channel = channels[0];
$display("Current channel being tested with main vectors is: %d", test_channel);
$display("Other channels being tested with null vectors");           
$readmemh({"../sw/mc_model/vector_out/",laws[law],"/", models[model], "/", types[type],"/", operations[operation],"/",rates[rate],"/","dq.t"}, dqs);
$readmemh({"../sw/mc_model/vector_out/",laws[law],"/", models[model], "/", types[type],"/", operations[operation],"/",rates[rate],"/","tr.t"}, trs);
$readmemh({"../sw/mc_model/vector_out/",laws[law],"/", models[model], "/", types[type],"/", operations[operation],"/",rates[rate],"/","se.t"}, ses);
$readmemh({"../sw/mc_model/vector_out/",laws[law],"/", models[model], "/", types[type],"/", operations[operation],"/",rates[rate],"/","a2p.t"}, a2ps);
$readmemh({"../sw/mc_model/vector_out/",laws[law],"/", models[model], "/", types[type],"/", operations[operation],"/",rates[rate],"/","sr.t"}, srs);

@(posedge CoPrclk);


repeat(4)
begin
	@(posedge CoPrclk)
	reset <= 1'b1;
end
@(posedge CoPrclk)
reset <= 1'b0;
@(posedge CoPrclk);


for (j=0; j<loop; j=j+1) begin
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
	wb_read_se({16'h0000, APRSC_SE}, 1'b1, {8'h00, ses[j]});
	wb_read_sr({16'h0000, APRSC_SR}, 1'b1, {8'h00, srs[j]});
	wb_read_a2p({16'h0000, APRSC_A2P}, 1'b1, {8'h00, a2ps[j]});
	@(posedge CoPrclk);
	wb_write_strobe({16'h0000, APRSC_REQ}, 32'h0000_0000);	
	@(posedge CoPrclk);
end 

#10 $display("%t TEST COMPLETE", $time);
  $finish;
end 