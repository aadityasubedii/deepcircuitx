initial
begin
    $timeformat(-9,3,"ns",16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/CLK_GEN_saed32nm_scan.sdf", test.top);
`endif
    clk = 1'b0;
    reset = 1'b0;
    i_frame_syn = 1'b0;
    exp_frame_syn = 1'b0;
    scan_in0 = 1'b0;
    scan_in1 = 1'b0;
    scan_in2 = 1'b0;
    scan_in3 = 1'b0;
    scan_in4 = 1'b0;
    scan_enable = 1'b0;
    test_mode = 1'b0;
    fs_enabled = 1'b1; 
    k = 0;
    exp_k = 0;
    bits = 0;
    exp_bits = 0;
    channel = 0;
    exp_channel = 0;

    
    @(posedge clk);
    reset <= 1'b1;
    repeat(2)
        @(posedge clk);
    reset <= 1'b0;
    @(posedge clk);

    
    @(posedge o_sys_clk);
    sys_clk_start = $time;
    @(posedge o_sys_clk);
    sys_clk_end = $time;
    @(posedge clk);
    $display("Start of clk period at: %t", sys_clk_start);
    $display("End of clk period at : %t", sys_clk_end);
    $display("Clk period. Expected: %t. Obtained: %t", `SYS_CLK_PERIOD*1000, (sys_clk_end-sys_clk_start));
    if( ((sys_clk_end-sys_clk_start) >  (`SYS_CLK_PERIOD*1000)+5) ||  ((sys_clk_end-sys_clk_start) <  (`SYS_CLK_PERIOD*1000)-5)) begin
        $display("%t ERROR: System clock period not as expected", $time);
`ifdef ERRORSTOP
        $stop;
`endif
    end
    $display("-----------------------------------");

    
    @(posedge o_co_proc_clk);
    co_proc_clk_start = $time;
    @(posedge o_co_proc_clk);
    co_proc_clk_end = $time;
    @(posedge clk);
    $display("Start of co-proc clk period at: %t", co_proc_clk_start);
    $display("End of co-proc clk period at: %t", co_proc_clk_end);
    $display("Co-proc Clk period. Expected: %t. Obtained: %t", `CO_CLK_PERIOD*1000, (co_proc_clk_end-co_proc_clk_start));
    if( ((co_proc_clk_end-co_proc_clk_start) >  (`CO_CLK_PERIOD*1000)+10) ||  ((co_proc_clk_end-co_proc_clk_start) <  (`CO_CLK_PERIOD*1000)-10)) begin
        $display("%t ERROR: Co-processor clock period not as expected", $time);
`ifdef ERRORSTOP
        $stop;
`endif
    end
    $display("-----------------------------------");

    
    @(posedge o_serial_clk);
    ser_clk_start = $time;
    @(posedge o_serial_clk);
    ser_clk_end = $time;
    @(posedge clk);
    $display("Start of serial clk period at: %t", ser_clk_start);
    $display("End of serial clk period at: %t", ser_clk_end);
    $display("Serial Clk period. Expected: %t. Obtained: %t", `SER_CLK_PERIOD*1000, (ser_clk_end-ser_clk_start));
    if( ((ser_clk_end-ser_clk_start) >  (`SER_CLK_PERIOD*1000)+125) ||  ((ser_clk_end-ser_clk_start) <  (`SER_CLK_PERIOD*1000)-125)) begin
        $display("%t ERROR: Serial clock period not as expected", $time);
`ifdef ERRORSTOP
        $stop;
`endif
    end
    $display("-----------------------------------");

    
    repeat(1024)
        @(posedge o_serial_clk);
    
    repeat(35530)
        @(posedge o_serial_clk);

    
    fs_enabled = 1'b0;
    repeat(30016)
        @(posedge o_serial_clk);

    
    repeat(4)
        @(posedge clk);
    #10 $display("%t TEST COMPLETE", $time);
    $finish;
end 