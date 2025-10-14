  always @(*)begin
    
    address_w = 'b0;
    bank_w   = 'b0;
    if ((init_state_r == INIT_PRECHARGE) ||
        (init_state_r == INIT_RDLVL_COMPLEX_PRECHARGE) ||
        (init_state_r == INIT_ZQCL) ||
        (init_state_r == INIT_DDR2_PRECHARGE)) begin
      
      address_w     = 'b0;
      address_w[10] = 1'b1;
      bank_w        = 'b0;
    end else if (init_state_r == INIT_WRLVL_START) begin
      
      bank_w[1:0]   = 2'b01;
      address_w     = load_mr1[ROW_WIDTH-1:0];
      address_w[2]  = mr1_r[chip_cnt_r][0];
      address_w[6]  = mr1_r[chip_cnt_r][1];
      address_w[9]  = mr1_r[chip_cnt_r][2];
      address_w[7]  = 1'b1;
    end else if (init_state_r == INIT_WRLVL_LOAD_MR) begin
      
      
      bank_w[1:0]   = 2'b01;
      address_w     = load_mr1[ROW_WIDTH-1:0];
      address_w[2]  = mr1_r[chip_cnt_r][0];
      address_w[6]  = mr1_r[chip_cnt_r][1];
      address_w[9]  = mr1_r[chip_cnt_r][2];
    end else if (init_state_r == INIT_WRLVL_LOAD_MR2) begin
      
      bank_w[1:0]     = 2'b10;
      address_w       = load_mr2[ROW_WIDTH-1:0];
      address_w[10:9] = mr2_r[chip_cnt_r];
    end else if (init_state_r == INIT_MPR_READ) begin
      address_w     = 'b0;
      bank_w        = 'b0;
    end else if (init_state_r == INIT_MPR_RDEN) begin
      
      bank_w[BANK_WIDTH-1:0] = 'd3;
      address_w              = {ROW_WIDTH{1'b0}};
      address_w[2]           = 1'b1;
    end else if (init_state_r == INIT_MPR_DISABLE) begin
      
      bank_w[BANK_WIDTH-1:0] = 'd3;
      address_w              = {ROW_WIDTH{1'b0}}; 
    end else if ((init_state_r == INIT_REG_WRITE)&
             (DRAM_TYPE == "DDR3"))begin
      
      
      
      bank_w        = 'b0;
      address_w     = 'b0;
      case (reg_ctrl_cnt_r)
        4'h1:begin
          address_w[4:0] = REG_RC1[4:0];
          bank_w         = REG_RC1[7:5];
        end
        4'h2: address_w[4:0] = REG_RC2[4:0];
        4'h3: begin
          address_w[4:0] = REG_RC3[4:0];
          bank_w         = REG_RC3[7:5];
        end
        4'h4: begin
          address_w[4:0] = REG_RC4[4:0];
          bank_w         = REG_RC4[7:5];
        end
        4'h5: begin
          address_w[4:0] = REG_RC5[4:0];
          bank_w         = REG_RC5[7:5];
        end
        4'h6: begin
          address_w[4:0] = REG_RC10[4:0];
          bank_w         = REG_RC10[7:5];
        end
        4'h7: begin
          address_w[4:0] = REG_RC11[4:0];
          bank_w         = REG_RC11[7:5];
        end
        default: address_w[4:0] = REG_RC0[4:0];
      endcase
    end else if (init_state_r == INIT_LOAD_MR) begin
      
      
      address_w     = 'b0;
      bank_w        = 'b0;
      if(DRAM_TYPE == "DDR3")begin
        if(rdlvl_stg1_done && prbs_rdlvl_done && pi_dqs_found_done)begin
          
          
          if (TEST_AL == "0") begin
            bank_w[1:0] = 2'b00;
            address_w   = load_mr0[ROW_WIDTH-1:0];
            address_w[8]= 1'b0; 
          end else begin
            
            bank_w[1:0]   = 2'b01;
            address_w     = load_mr1[ROW_WIDTH-1:0];
            if (TEST_AL == "CL-1")
              address_w[4:3]= 2'b01; 
            else
              address_w[4:3]= 2'b10; 
          end
        end else begin
         case (cnt_init_mr_r)
           INIT_CNT_MR2: begin
             bank_w[1:0] = 2'b10;
             address_w   = load_mr2[ROW_WIDTH-1:0];
             address_w[10:9] = mr2_r[chip_cnt_r];
           end
           INIT_CNT_MR3: begin
             bank_w[1:0] = 2'b11;
             address_w   = load_mr3[ROW_WIDTH-1:0];
           end
           INIT_CNT_MR1: begin
             bank_w[1:0] = 2'b01;
             address_w   = load_mr1[ROW_WIDTH-1:0];
             address_w[2] = mr1_r[chip_cnt_r][0];
             address_w[6] = mr1_r[chip_cnt_r][1];
             address_w[9] = mr1_r[chip_cnt_r][2];
           end
           INIT_CNT_MR0: begin
             bank_w[1:0] = 2'b00;
             address_w   = load_mr0[ROW_WIDTH-1:0];
             
             address_w[1:0] = 2'b00;
           end
           default: begin
             bank_w      = {BANK_WIDTH{1'bx}};
             address_w   = {ROW_WIDTH{1'bx}};
           end
          endcase
        end
      end else begin 
         case (cnt_init_mr_r)
           INIT_CNT_MR2: begin
             if(~ddr2_refresh_flag_r)begin
                bank_w[1:0] = 2'b10;
                address_w   = load_mr2[ROW_WIDTH-1:0];
             end else begin 
                bank_w[1:0] = 2'b00;
                address_w   = load_mr0[ROW_WIDTH-1:0];
                address_w[8]= 1'b0;
                
             end
          end
           INIT_CNT_MR3: begin
             if(~ddr2_refresh_flag_r)begin
               bank_w[1:0] = 2'b11;
               address_w   = load_mr3[ROW_WIDTH-1:0];
             end else begin 
               bank_w[1:0] = 2'b00;
               address_w   = load_mr0[ROW_WIDTH-1:0];
               address_w[8]= 1'b0;
               
               
            end
           end
           INIT_CNT_MR1: begin
             bank_w[1:0] = 2'b01;            
             if(~ddr2_refresh_flag_r)begin               
               address_w   = load_mr1[ROW_WIDTH-1:0];  
             end else begin 
               address_w   = load_mr1[ROW_WIDTH-1:0];
               address_w[9:7] = 3'b111;
               
             end
           end
           INIT_CNT_MR0: begin
             if(~ddr2_refresh_flag_r)begin
               bank_w[1:0] = 2'b00;
               address_w   = load_mr0[ROW_WIDTH-1:0];
             end else begin 
               bank_w[1:0] = 2'b01;
               address_w   = load_mr1[ROW_WIDTH-1:0];
               if((chip_cnt_r == 2'd1) || (chip_cnt_r == 2'd3))begin
               
                 address_w[2] = 'b0;
                 address_w[6] = 'b0;
               end 
                
             end
           end
           default: begin
             bank_w      = {BANK_WIDTH{1'bx}};
             address_w   = {ROW_WIDTH{1'bx}};
           end
         endcase
       end
    end else if ( ~prbs_rdlvl_done && ((init_state_r == INIT_PI_PHASELOCK_READS) ||
                 (init_state_r == INIT_RDLVL_STG1_WRITE) ||
                 (init_state_r == INIT_RDLVL_STG1_READ) ||
                 (init_state_r == INIT_RDLVL_COMPLEX_READ))) begin
      
      
      
      bank_w    = CALIB_BA_ADD[BANK_WIDTH-1:0];
      address_w[ROW_WIDTH-1:COL_WIDTH] = {ROW_WIDTH-COL_WIDTH{1'b0}};
      if (((stg1_wr_rd_cnt == NUM_STG1_WR_RD) && ~rdlvl_stg1_done) || (stg1_wr_rd_cnt == 'd127) || 
          ((stg1_wr_rd_cnt == 'd22) && (((init_state_r1 != INIT_RDLVL_STG1_WRITE) && ~stg1_wr_done) || complex_row0_rd_done))) begin
          address_w[COL_WIDTH-1:0] = {COL_WIDTH{1'b0}};
      end else if (phy_data_full_r || (!new_burst_r))
        address_w[COL_WIDTH-1:0] = phy_address[COL_WIDTH-1:0];
      else if ((stg1_wr_rd_cnt >= 9'd0) && new_burst_r && ~phy_data_full_r) begin
        if ((init_state_r == INIT_RDLVL_COMPLEX_READ) && (init_state_r1 != INIT_RDLVL_COMPLEX_READ) )
            
          address_w[COL_WIDTH-1:0] = complex_address[COL_WIDTH-1:0] + ADDR_INC;
        else
          address_w[COL_WIDTH-1:0] = phy_address[COL_WIDTH-1:0] + ADDR_INC;
      end
      
    end else if (prbs_rdlvl_done && ((init_state_r == INIT_RDLVL_STG1_WRITE) ||             
                 (init_state_r == INIT_RDLVL_COMPLEX_READ))) begin
      bank_w    = CALIB_BA_ADD[BANK_WIDTH-1:0];
      address_w[ROW_WIDTH-1:COL_WIDTH] = {ROW_WIDTH-COL_WIDTH{1'b0}};
       if ((stg1_wr_rd_cnt == 'd127) || ((stg1_wr_rd_cnt == 'd30) && (((init_state_r1 != INIT_RDLVL_STG1_WRITE) && ~stg1_wr_done) || complex_row0_rd_done))) begin
              address_w[COL_WIDTH-1:0] = {COL_WIDTH{1'b0}};
      end else if (phy_data_full_r || (!new_burst_r))
        address_w[COL_WIDTH-1:0] = phy_address[COL_WIDTH-1:0];
      else if ((stg1_wr_rd_cnt >= 9'd0) && new_burst_r && ~phy_data_full_r) begin
        if ((init_state_r == INIT_RDLVL_STG1_WRITE) && (init_state_r1 != INIT_RDLVL_STG1_WRITE) )
            
          address_w[COL_WIDTH-1:0] = complex_address[COL_WIDTH-1:0] + ADDR_INC;
        else
          address_w[COL_WIDTH-1:0] = phy_address[COL_WIDTH-1:0] + ADDR_INC;
      end      
      
    end else if ((init_state_r == INIT_OCLKDELAY_WRITE) ||
                 (init_state_r == INIT_OCAL_CENTER_WRITE) || 
                 (init_state_r == INIT_OCLKDELAY_READ)) begin
      bank_w    = CALIB_BA_ADD[BANK_WIDTH-1:0];
      address_w[ROW_WIDTH-1:COL_WIDTH] = {ROW_WIDTH-COL_WIDTH{1'b0}};
      if (oclk_wr_cnt == NUM_STG1_WR_RD)
        address_w[COL_WIDTH-1:0] = {COL_WIDTH{1'b0}};
      else if (phy_data_full_r || (!new_burst_r))
        address_w[COL_WIDTH-1:0] = phy_address[COL_WIDTH-1:0];
      else if ((oclk_wr_cnt >= 4'd0) && new_burst_r && ~phy_data_full_r)
        address_w[COL_WIDTH-1:0] = phy_address[COL_WIDTH-1:0] + ADDR_INC;
    end else if ((init_state_r == INIT_WRCAL_WRITE) ||
                 (init_state_r == INIT_WRCAL_READ)) begin
      bank_w    = CALIB_BA_ADD[BANK_WIDTH-1:0];
      address_w[ROW_WIDTH-1:COL_WIDTH] = {ROW_WIDTH-COL_WIDTH{1'b0}};
      if (wrcal_wr_cnt == NUM_STG1_WR_RD)
        address_w[COL_WIDTH-1:0] = {COL_WIDTH{1'b0}};
      else if (phy_data_full_r || (!new_burst_r))
        address_w[COL_WIDTH-1:0] = phy_address[COL_WIDTH-1:0];
      else if ((wrcal_wr_cnt >= 4'd0) && new_burst_r && ~phy_data_full_r)
        address_w[COL_WIDTH-1:0] = phy_address[COL_WIDTH-1:0] + ADDR_INC;      
    end else if ((init_state_r == INIT_WRCAL_MULT_READS) ||
                 (init_state_r == INIT_RDLVL_STG2_READ)) begin
      
      
      
      
      
      
      bank_w    = CALIB_BA_ADD[BANK_WIDTH-1:0];
      address_w[ROW_WIDTH-1:COL_WIDTH] = {ROW_WIDTH-COL_WIDTH{1'b0}};
      address_w[COL_WIDTH-1:0] = 
                {CALIB_COL_ADD[COL_WIDTH-1:3],burst_addr_r, 3'b000};
      address_w[12]            =  1'b1;
    end else if ((init_state_r == INIT_RDLVL_ACT) ||
                (init_state_r == INIT_RDLVL_COMPLEX_ACT) ||
                (init_state_r == INIT_WRCAL_ACT) ||
                (init_state_r == INIT_OCAL_COMPLEX_ACT) ||
                (init_state_r == INIT_OCAL_CENTER_ACT) ||
                (init_state_r == INIT_OCLKDELAY_ACT)) begin

      bank_w    = CALIB_BA_ADD[BANK_WIDTH-1:0];
      
      
      
      address_w = prbs_rdlvl_done ? CALIB_ROW_ADD[ROW_WIDTH-1:0] + complex_row_cnt_ocal :
                  CALIB_ROW_ADD[ROW_WIDTH-1:0] + complex_row_cnt;
    end else begin
      bank_w    = {BANK_WIDTH{1'bx}};
      address_w = {ROW_WIDTH{1'bx}};
    end
  end      