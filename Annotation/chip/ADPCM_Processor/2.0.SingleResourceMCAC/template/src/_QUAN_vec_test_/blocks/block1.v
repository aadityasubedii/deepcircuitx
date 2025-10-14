initial
begin
  $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
  $sdf_annotate("sdf/QUAN_tsmc18_scan.sdf", test.top);
`endif
  #10;




for(rate=0;rate<4;rate=rate+1) begin

for(law=0;law<2;law=law+1) begin
	$display("%s %s", rates[rate], laws[law]);
	$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/enc/",rates[rate],"/nrm/homing/dln.t"}, DLNs);
	$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/enc/",rates[rate],"/nrm/homing/ds.t"}, DSs);
	$readmemh({"../model/adpcm-itu/vector_out/",laws[law],"/enc/",rates[rate],"/nrm/homing/I.t"}, Is);
	RATE = rate;
	for (j = 0; j < 19879; j=j+1) begin
		#1 DLN = DLNs[j];
		DS = DSs[j];
		#10;
`ifdef VERBOSE
		$display("DLN = %h",DLN);
		$display("DS = %b",DS);
		$display("I = %h",I);
`endif
		if (I!=Is[j]) begin
			$display("TEST #%7d FAIL for RATE = %b, DS = %b, DLN = %d = 0x%h. I = %h instead of %h", j, RATE, DS, DLN, DLN, I, Is[j]);
`ifdef BREAKONERR
			$stop;
`endif
		end else begin
			
		end
	end
end

end