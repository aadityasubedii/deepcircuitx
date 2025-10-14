  always@(posedge prbs_rdlvl_done)begin
    if(!rst)
    	$display("PHY_INIT : PRBS/PER_BIT calibration completed at %t",$time);
  end 