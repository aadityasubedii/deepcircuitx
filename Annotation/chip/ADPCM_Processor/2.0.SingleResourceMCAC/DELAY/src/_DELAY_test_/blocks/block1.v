initial begin
  $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
  $sdf_annotate("sdf/DELAY_tsmc18_scan.sdf", test.top);
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

  X  = 0;
  X2 = 0;
  
  repeat(2)
    @(posedge clk);
  reset = 1'b0;

  repeat(31) begin
    @(posedge clk);
    if(Y !== RESET) begin
      $display("%t ERROR: Output not reset properly for 1st instantiation(not %h). Instead has value %h", $time, RESET, Y);
    end
    if(Y2 !== RESET2) begin
      $display("%t ERROR: Output not reset properly for 2nd instantiation(not %h). Instead has value %h", $time, RESET2, Y);
    end
  end
  for(j=1;j<2048;j=j+1) begin
   @(negedge clk);
    X  = j;
    X2 = j;
    
    repeat(32) begin
      @(posedge clk);
`ifndef NETLIST 
      if(Y !== j-1) begin
        $display("%t ERROR: Output not correct for 1st instantiation (not %h). Instead has value %h", $time, j-1, Y);
      end
      if(Y2 !== j-1) begin
        $display("%t ERROR: Output not correct for 2nd instantiation (not %h). Instead has value %h", $time, j-1, Y2);
      end
    end
`endif
`ifdef NETLIST 
      if(Y !== (j-1)) begin
        $display("%t ERROR: Output not correct for 1st instantiation (not %h). Instead has value %h", $time, j-1, Y);
      end
      if(Y2 !== (j-1)) begin
        $display("%t ERROR: Output not correct for 2nd instantiation (not %h). Instead has value %h", $time, j-1, Y2);
      end
    end
`endif
    @(posedge clk);
`ifndef NETLIST 
    if(Y !== X) begin
      $display("%t ERROR: Output not correct for 1st instantiation (not %h). Instead has value %h", $time, X, Y);
    end
    if(Y2 !== X2) begin
      $display("%t ERROR: Output not correct for 2nd instantiation (not %h). Instead has value %h", $time, X2, Y2);
    end
`endif
`ifdef NETLIST 
    if(Y !== X) begin
      $display("%t ERROR: Output not correct for 1st instantiation (not %h). Instead has value %h", $time, X, Y);
    end
    if(Y2 !== X2) begin
      $display("%t ERROR: Output not correct for 2nd instantiation (not %h). Instead has value %h", $time, X2, Y2);
    end
`endif

  end 

  #10 $display("%t TEST COMPLETE", $time);
  $finish;
end 