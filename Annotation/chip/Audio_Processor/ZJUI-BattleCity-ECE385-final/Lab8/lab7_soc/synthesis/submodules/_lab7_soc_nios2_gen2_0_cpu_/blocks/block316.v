
module lab7_soc_nios2_gen2_0_cpu_nios2_oci_fifo_wrptr_inc (
                                                            
                                                             ge2_free,
                                                             ge3_free,
                                                             input_tm_cnt,

                                                            
                                                             fifo_wrptr_inc
                                                          )
;

  output  [  3: 0] fifo_wrptr_inc;
  input            ge2_free;
  input            ge3_free;
  input   [  1: 0] input_tm_cnt;


reg     [  3: 0] fifo_wrptr_inc;