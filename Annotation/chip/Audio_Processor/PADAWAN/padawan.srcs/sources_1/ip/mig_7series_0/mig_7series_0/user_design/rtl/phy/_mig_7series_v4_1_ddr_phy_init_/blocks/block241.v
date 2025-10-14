  always@(posedge oclkdelay_center_calib_done)begin
    if(!rst)
    	$display("PHY_INIT : OCLKDELAY CENTER CALIB calibration completed at %t",$time);
  end 