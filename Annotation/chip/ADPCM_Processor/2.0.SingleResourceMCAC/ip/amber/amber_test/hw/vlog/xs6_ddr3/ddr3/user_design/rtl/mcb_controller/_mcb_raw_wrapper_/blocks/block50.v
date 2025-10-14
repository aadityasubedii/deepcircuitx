               assign p2_cmd_full        = mig_p4_cmd_full  ; 
               assign mig_p5_en          = p2_wr_en;
               assign mig_p5_wr_data     = p2_wr_data[31:0];
               assign mig_p5_wr_mask     = p2_wr_mask[3:0];
               assign mig_p4_en          = p2_rd_en;
               
                assign mig_p4_clk        = p2_rd_clk;
                assign mig_p5_clk        = p2_wr_clk;

                assign p2_rd_data        = mig_p4_rd_data;
                assign p2_wr_count       = mig_p5_count;
                assign p2_rd_count       = mig_p4_count;
                assign p2_wr_empty       = mig_p5_empty;
                assign p2_wr_full        = mig_p5_full;
                assign p2_wr_error       = mig_p5_error;  
                assign p2_wr_underrun    = mig_p5_underrun;
                assign p2_rd_overflow    = mig_p4_overflow;    
                assign p2_rd_error       = mig_p4_error;
                assign p2_rd_full        = mig_p4_full;
                assign p2_rd_empty       = mig_p4_empty;
               
       end else
       begin
               assign mig_p4_arb_en      = 'b0;   
               assign mig_p4_cmd_clk     = 'b0;   
               assign mig_p4_cmd_en      = 'b0;   
               assign mig_p4_cmd_ra      = 'b0;   
               assign mig_p4_cmd_ba      = 'b0;   
               assign mig_p4_cmd_ca      = 'b0;   
               assign mig_p4_cmd_instr   = 'b0;   
               assign mig_p4_cmd_bl      = 'b0;   
               assign p2_cmd_empty       = 'b0;   
               assign p2_cmd_full        = 'b0;   
               assign mig_p5_en          = 'b0; 
               assign mig_p5_wr_data     = 'b0; 
               assign mig_p5_wr_mask     = 'b0; 
               assign mig_p4_en          = 'b0; 

                assign mig_p4_clk        = 'b0; 
                assign mig_p5_clk        = 'b0; 

                assign p2_rd_data        =   'b0;   
                assign p2_wr_count       =   'b0;   
                assign p2_rd_count       =   'b0;   
                assign p2_wr_empty       =   'b0;   
                assign p2_wr_full        =   'b0;   
                assign p2_wr_error       =   'b0;   
                assign p2_wr_underrun    =   'b0;   
                assign p2_rd_overflow    =   'b0;     
                assign p2_rd_error       =   'b0;   
                assign p2_rd_full        =   'b0;   
                assign p2_rd_empty       =   'b0;   
