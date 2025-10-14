`timescale 1ns / 1ps






module DE1_SoC_QSYS_nios2_qsys_nios2_avalon_reg (
                                                  
                                                   address,
                                                   clk,
                                                   debugaccess,
                                                   monitor_error,
                                                   monitor_go,
                                                   monitor_ready,
                                                   reset_n,
                                                   write,
                                                   writedata,

                                                  
                                                   oci_ienable,
                                                   oci_reg_readdata,
                                                   oci_single_step_mode,
                                                   ocireg_ers,
                                                   ocireg_mrs,
                                                   take_action_ocireg
                                                )
;

  output  [ 31: 0] oci_ienable;
  output  [ 31: 0] oci_reg_readdata;
  output           oci_single_step_mode;
  output           ocireg_ers;
  output           ocireg_mrs;
  output           take_action_ocireg;