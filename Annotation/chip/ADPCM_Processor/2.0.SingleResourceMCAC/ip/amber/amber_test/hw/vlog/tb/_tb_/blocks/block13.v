initial
    begin
    test_mode = 0 ;
    scan_enable = 0 ;
    scan_in0 = 0 ;
    scan_in1 = 0 ;
    scan_in2 = 0 ;
    scan_in3 = 0 ;
    scan_in4 = 0 ;
    sysrst = #0 1'd0;
    sysrst = #1 1'd0;
    @(posedge clk_25mhz)
        sysrst = #1 1'd1;
    repeat(`RESET_TICKS)
		@(posedge clk_25mhz);
    sysrst = 1'd0;
    end