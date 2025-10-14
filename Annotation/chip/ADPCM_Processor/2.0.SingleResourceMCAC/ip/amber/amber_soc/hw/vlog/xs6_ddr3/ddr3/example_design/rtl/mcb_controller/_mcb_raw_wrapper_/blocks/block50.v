
               if (C_USR_INTERFACE_MODE == "AXI")               
                   assign mig_p1_rd_en    = p0_rd_en ;
                else
                   assign mig_p1_rd_en    = p0_rd_en & !p0_rd_empty;

                assign p0_wr_count       = mig_p1_wr_count;  
                assign p0_rd_count       = mig_p1_rd_count;
                assign p0_wr_empty       = mig_p1_wr_empty;
                assign p0_wr_error       = mig_p1_wr_error | mig_p0_wr_error;  
                assign p0_wr_full        = mig_p1_wr_full;
                assign p0_wr_underrun    = mig_p1_wr_underrun | mig_p0_wr_underrun; 
                assign p0_rd_overflow    = mig_p1_rd_overflow | mig_p0_rd_overflow; 
                assign p0_rd_error       = mig_p1_rd_error | mig_p0_rd_error; 
                assign p0_rd_full        = mig_p1_rd_full;

 
       end else
       begin
       
               assign mig_p0_arb_en      = 'b0;
               assign mig_p0_cmd_clk     = 'b0;
               assign mig_p0_cmd_en      = 'b0;
               assign mig_p0_cmd_ra      = 'b0;
               assign mig_p0_cmd_ba      = 'b0;
               assign mig_p0_cmd_ca      = 'b0;
               assign mig_p0_cmd_instr   = 'b0;
               assign mig_p0_cmd_bl      = 'b0;
               assign p0_cmd_empty       =  'b0;
               assign p0_cmd_full        =  'b0;


               assign mig_p0_wr_clk   = 'b0;
               assign mig_p0_rd_clk   = 'b0;
               assign mig_p1_wr_clk   = 'b0;
               assign mig_p1_rd_clk   = 'b0;
               
               assign mig_p0_wr_en    = 'b0;
               assign mig_p1_wr_en    = 'b0;
               assign mig_p0_wr_data  = 'b0;
               assign mig_p0_wr_mask  = 'b0;
               assign mig_p1_wr_data  = 'b0;
               assign mig_p1_wr_mask  = 'b0; 

               assign p0_rd_empty       = 'b0;
               assign p0_rd_data        = 'b0;
               assign mig_p0_rd_en      = 'b0;
               assign mig_p1_rd_en      = 'b0;
 
 
               assign p0_wr_count       =  'b0;
               assign p0_rd_count       =  'b0;
               assign p0_wr_empty       =  'b0;
               assign p0_wr_error       =  'b0;
               assign p0_wr_full        =  'b0;
               assign p0_wr_underrun    =  'b0;
               assign p0_rd_overflow    =  'b0;
               assign p0_rd_error       =  'b0;
               assign p0_rd_full        =  'b0;
                                         