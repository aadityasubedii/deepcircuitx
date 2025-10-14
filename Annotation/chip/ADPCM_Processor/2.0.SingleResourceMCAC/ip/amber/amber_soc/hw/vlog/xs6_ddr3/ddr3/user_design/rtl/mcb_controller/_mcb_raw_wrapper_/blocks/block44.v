                           assign mig_p4_en    = p1_rd_en ;
                        else
                           assign mig_p4_en    = p1_rd_en & !p1_rd_empty;


                        assign p1_cmd_empty       =      mig_p2_cmd_empty ;  
                        assign p1_cmd_full        =      mig_p2_cmd_full  ;

                        assign p1_wr_count    = mig_p5_count;
                        assign p1_rd_count    = mig_p4_count;
                        assign p1_wr_full    = mig_p5_full;
                        assign p1_wr_error    = mig_p5_error | mig_p5_error;
                        assign p1_wr_empty    = mig_p5_empty;
                        assign p1_wr_underrun = mig_p3_underrun | mig_p5_underrun;
                        assign p1_rd_overflow = mig_p4_overflow;
                        assign p1_rd_error    = mig_p4_error;
                        assign p1_rd_full     = mig_p4_full;
                        assign p1_rd_empty    = mig_p4_empty;

                        assign p1_rd_data     = {mig_p4_rd_data , mig_p2_rd_data};
                       
                       
                 end else
                 begin
                       assign mig_p2_arb_en      = 'b0;
                   
                  
                  
                       
                       assign mig_p2_cmd_clk     = 'b0;
                       assign mig_p2_cmd_en      = 'b0;
                       assign mig_p2_cmd_ra      = 'b0;
                       assign mig_p2_cmd_ba      = 'b0;
                       assign mig_p2_cmd_ca      = 'b0;
                       assign mig_p2_cmd_instr   = 'b0;
                       assign mig_p2_cmd_bl      = 'b0;
                       assign mig_p2_clk      = 'b0;
                       assign mig_p3_clk      = 'b0;
                       assign mig_p4_clk      = 'b0;
                       assign mig_p5_clk      = 'b0;
                       assign mig_p3_en       = 'b0;
                       assign mig_p5_en       = 'b0;
                       assign mig_p3_wr_data  = 'b0;
                       assign mig_p3_wr_mask  = 'b0;
                       assign mig_p5_wr_data  = 'b0;
                       assign mig_p5_wr_mask  = 'b0; 
                       assign mig_p2_en    = 'b0;
                       assign mig_p4_en    = 'b0;
                       assign p1_cmd_empty    = 'b0;  
                       assign p1_cmd_full     = 'b0;  

                       assign p1_wr_count    = 'b0;
                       assign p1_rd_count    = 'b0;
                       assign p1_wr_full     = 'b0;
                       assign p1_wr_error    = 'b0;
                       assign p1_wr_empty    = 'b0;
                       assign p1_wr_underrun = 'b0;
                       assign p1_rd_overflow = 'b0;
                       assign p1_rd_error    = 'b0; 
                       assign p1_rd_full     = 'b0; 
                       assign p1_rd_empty    = 'b0; 
                       assign p1_rd_data     = 'b0;
                       
                 end               
                
                  
                       assign mig_p3_arb_en      =      1'b0;
                       assign mig_p4_arb_en      =      1'b0;
                       assign mig_p5_arb_en      =      1'b0;
                       
                       assign mig_p3_cmd_clk     =      1'b0;
                       assign mig_p3_cmd_en      =      1'b0;
                       assign mig_p3_cmd_ra      =      15'd0;
                       assign mig_p3_cmd_ba      =      3'd0;
                       assign mig_p3_cmd_ca      =      12'd0;
                       assign mig_p3_cmd_instr   =      3'd0;

                       assign mig_p4_cmd_clk     =      1'b0;
                       assign mig_p4_cmd_en      =      1'b0;
                       assign mig_p4_cmd_ra      =      15'd0;
                       assign mig_p4_cmd_ba      =      3'd0;
                       assign mig_p4_cmd_ca      =      12'd0;
                       assign mig_p4_cmd_instr   =      3'd0;
                       assign mig_p4_cmd_bl      =      6'd0;

                       assign mig_p5_cmd_clk     =      1'b0;
                       assign mig_p5_cmd_en      =      1'b0;
                       assign mig_p5_cmd_ra      =      15'd0;
                       assign mig_p5_cmd_ba      =      3'd0;
                       assign mig_p5_cmd_ca      =      12'd0;                       
                       assign mig_p5_cmd_instr   =      3'd0;
                       assign mig_p5_cmd_bl      =      6'd0;

                
                

  end else if(C_PORT_CONFIG == "B128" ) begin : u_config_5

