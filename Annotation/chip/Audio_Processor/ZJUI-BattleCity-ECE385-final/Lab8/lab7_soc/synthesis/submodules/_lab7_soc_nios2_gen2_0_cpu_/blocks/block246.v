  assign oci_reg_readdata = oci_reg_00_addressed ? {28'b0, oci_single_step_mode, monitor_go,
    monitor_ready, monitor_error} : 
    oci_reg_01_addressed ?  oci_ienable :   
    32'b0;