                
                assign p0_rd_data     = {mig_p4_rd_data , mig_p2_rd_data , mig_p1_rd_data , mig_p0_rd_data};
                assign p0_rd_empty    = mig_p4_empty;
                assign p0_rd_full     = mig_p4_full;
                assign p0_rd_error    = mig_p0_rd_error | mig_p1_rd_error | mig_p2_error | mig_p4_error;  
                assign p0_rd_overflow    = mig_p0_rd_overflow | mig_p1_rd_overflow | mig_p2_overflow | mig_p4_overflow; 

                assign p0_wr_underrun    = mig_p0_wr_underrun | mig_p1_wr_underrun | mig_p3_underrun | mig_p5_underrun;      
                assign p0_wr_empty    = mig_p5_empty;
                assign p0_wr_full     = mig_p5_full;
                assign p0_wr_error    = mig_p0_wr_error | mig_p1_wr_error | mig_p3_error | mig_p5_error; 