  always @(*) begin     
    init_next_state = init_state_r;
    (* full_case, parallel_case *) case (init_state_r)

      
      
      

      
      
      
      
      
      INIT_IDLE:
        if (cnt_pwron_cke_done_r && phy_ctl_ready && ck_addr_cmd_delay_done  && delay_incdec_done
            && ~(phy_ctl_full || phy_cmd_full) ) begin 
          
          if (SIM_INIT_OPTION == "SKIP_INIT")       
            
            
            
            
              
              init_next_state = INIT_RDLVL_ACT;
           
              
              
          else
            init_next_state = INIT_WAIT_CKE_EXIT;
        end
        
      
      INIT_WAIT_CKE_EXIT:
        if ((cnt_txpr_done_r) && (DRAM_TYPE == "DDR3") 
           && ~(phy_ctl_full || phy_cmd_full)) begin
          if((REG_CTRL == "ON") && ((nCS_PER_RANK > 1) ||
             (RANKS > 1)))
            
            
            
            init_next_state = INIT_REG_WRITE;
          else
          
          init_next_state = INIT_LOAD_MR;
        end else if ((cnt_init_pre_wait_done_r) && (DRAM_TYPE == "DDR2")
                     && ~(phy_ctl_full || phy_cmd_full))
          
          init_next_state = INIT_DDR2_PRECHARGE;                             

      INIT_REG_WRITE:
          init_next_state = INIT_REG_WRITE_WAIT;

      INIT_REG_WRITE_WAIT:
        if (cnt_cmd_done_r && ~(phy_ctl_full || phy_cmd_full))  begin
           if(reg_ctrl_cnt_r == 4'd8)
             init_next_state = INIT_LOAD_MR;
           else
             init_next_state = INIT_REG_WRITE;
        end
        
      INIT_LOAD_MR:
          init_next_state = INIT_LOAD_MR_WAIT;
          
     
      INIT_LOAD_MR_WAIT:
        if (cnt_cmd_done_r && ~(phy_ctl_full || phy_cmd_full)) begin
          
          if (prbs_rdlvl_done && pi_dqs_found_done && rdlvl_stg1_done)
            
            init_next_state = INIT_PRECHARGE;
          else if (~wrcal_done && temp_lmr_done)
            init_next_state = INIT_PRECHARGE_PREWAIT;
          else if (cnt_init_mr_done_r)begin
            if(DRAM_TYPE == "DDR3")
              init_next_state = INIT_ZQCL;
            else begin 
              if(ddr2_refresh_flag_r)begin
                
                if (!mem_init_done_r && (chip_cnt_r <= RANKS-1))
                  init_next_state  = INIT_DDR2_MULTI_RANK;                     
                else 
                  init_next_state = INIT_RDLVL_ACT;
                
              end else 
                init_next_state = INIT_DDR2_PRECHARGE;
            end  
          end else      
            init_next_state = INIT_LOAD_MR;
        end

      
      INIT_DDR2_MULTI_RANK:
        init_next_state = INIT_DDR2_MULTI_RANK_WAIT;

      INIT_DDR2_MULTI_RANK_WAIT:
        init_next_state = INIT_DDR2_PRECHARGE;
 
      
      INIT_ZQCL:
          init_next_state = INIT_WAIT_DLLK_ZQINIT;

      
      INIT_WAIT_DLLK_ZQINIT:
        if (cnt_dllk_zqinit_done_r && ~(phy_ctl_full || phy_cmd_full))
          
          if (!mem_init_done_r && (chip_cnt_r <= RANKS-1))
            init_next_state = INIT_LOAD_MR;
          
          
          else
            
            init_next_state = INIT_RDLVL_ACT;

      
      INIT_DDR2_PRECHARGE: 
          init_next_state = INIT_DDR2_PRECHARGE_WAIT; 

      INIT_DDR2_PRECHARGE_WAIT: 
        if (cnt_cmd_done_r && ~(phy_ctl_full || phy_cmd_full)) begin
          if (ddr2_pre_flag_r)
            init_next_state = INIT_REFRESH;
          else 
            init_next_state = INIT_LOAD_MR;
        end                                  

      INIT_REFRESH:
        if ((SKIP_CALIB == "TRUE") && ~calib_tap_inc_done && pi_dqs_found_done)
		  init_next_state = INIT_SKIP_CALIB_WAIT;
		else if ((RANKS == 2) && (chip_cnt_r == RANKS - 1))
          init_next_state = INIT_REFRESH_RNK2_WAIT;
        else
          init_next_state = INIT_REFRESH_WAIT; 

      INIT_REFRESH_RNK2_WAIT:
        if (cnt_cmd_done_r && ~(phy_ctl_full || phy_cmd_full))
          init_next_state = INIT_PRECHARGE;
      
      INIT_REFRESH_WAIT: 
        if (cnt_cmd_done_r && ~(phy_ctl_full || phy_cmd_full))begin
          if(cnt_init_af_done_r && (~mem_init_done_r))
            
            init_next_state = INIT_LOAD_MR;
          
          else if (~oclkdelay_calib_done && (mpr_last_byte_done || mpr_rdlvl_done) && (DRAM_TYPE == "DDR3")) begin
            if (num_refresh == 'd8)
              init_next_state = INIT_OCAL_CENTER_ACT;
            else
              init_next_state = INIT_REFRESH;
          end else if(rdlvl_stg1_done && oclkdelay_center_calib_done &&
	          complex_oclkdelay_calib_done && ~wrlvl_done_r1 && (WRLVL == "ON")) 
            init_next_state = INIT_WRLVL_START;
          else if (pi_dqs_found_done && ~wrlvl_done_r1 && ~wrlvl_final && ~wrlvl_byte_redo && (WRLVL == "ON"))
            init_next_state = INIT_WRLVL_START;
          else if ((((prbs_last_byte_done_r || prbs_rdlvl_done) && ~complex_oclkdelay_calib_done
                     && pi_dqs_found_done) && (WRLVL == "ON")) 
                    && mem_init_done_r) begin
            if (num_refresh == 'd8) begin
			  if (BYPASS_COMPLEX_OCAL == "FALSE")
                init_next_state = INIT_RDLVL_COMPLEX_PRECHARGE_PREWAIT;
			  else
			    init_next_state = INIT_WRCAL_ACT;
            end else 
              init_next_state = INIT_REFRESH;
          end else if (~pi_dqs_found_done ||
                   (rdlvl_stg1_done && ~prbs_rdlvl_done && ~complex_oclkdelay_calib_done) ||
                   ((CLK_PERIOD/nCK_PER_CLK <= 2500) && wrcal_done && ~rdlvl_stg1_done) ||
                   ((CLK_PERIOD/nCK_PER_CLK > 2500) && wrlvl_done_r1 && ~rdlvl_stg1_done)) begin
            if (num_refresh == 'd8)
              init_next_state = INIT_RDLVL_ACT;
            else
              init_next_state = INIT_REFRESH;
          end else if ((~wrcal_done && wrlvl_byte_redo)&& (DRAM_TYPE == "DDR3")
                   && (CLK_PERIOD/nCK_PER_CLK > 2500))
            init_next_state = INIT_WRLVL_LOAD_MR2;
          else if (((prbs_rdlvl_done && rdlvl_stg1_done && complex_oclkdelay_calib_done && pi_dqs_found_done) && (WRLVL == "ON"))
                    && mem_init_done_r && (CLK_PERIOD/nCK_PER_CLK > 2500))
            init_next_state = INIT_WRCAL_ACT;
          else if (pi_dqs_found_done && (DRAM_TYPE == "DDR3") && ~(mpr_last_byte_done || mpr_rdlvl_done)) begin
            if (num_refresh == 'd8)
              init_next_state = INIT_MPR_RDEN;
            else
              init_next_state = INIT_REFRESH;
          end else if (((oclkdelay_calib_done && wrlvl_final && ~wrlvl_done_r1) ||  
                       (~wrcal_done && wrlvl_byte_redo)) && (DRAM_TYPE == "DDR3"))
            init_next_state = INIT_WRLVL_LOAD_MR2;
          else if ((~wrcal_done && (WRLVL == "ON") && (CLK_PERIOD/nCK_PER_CLK <= 2500)) 
                       && pi_dqs_found_done)
            init_next_state = INIT_WRCAL_ACT;
          else if (mem_init_done_r) begin
            if (RANKS < 2)
              init_next_state = INIT_RDLVL_ACT;
            else if (stg1_wr_done && ~rnk_ref_cnt && ~rdlvl_stg1_done)
              init_next_state = INIT_PRECHARGE;
            else
              init_next_state = INIT_RDLVL_ACT;
          end else 
            init_next_state = INIT_REFRESH;
        end
           
	  INIT_SKIP_CALIB_WAIT:
	    if (calib_tap_inc_done)
		  init_next_state = INIT_WRCAL_ACT;
		  
           
      
      
      

      
      
      INIT_WRLVL_START:
          init_next_state = INIT_WRLVL_WAIT;

      
      
      INIT_WRLVL_WAIT:
        if (wrlvl_rank_done_r7 && ~(phy_ctl_full || phy_cmd_full))
          init_next_state = INIT_WRLVL_LOAD_MR;

      
      INIT_WRLVL_LOAD_MR:
          init_next_state = INIT_WRLVL_LOAD_MR_WAIT;
        
      INIT_WRLVL_LOAD_MR_WAIT:
        if (cnt_cmd_done_r && ~(phy_ctl_full || phy_cmd_full))
          init_next_state = INIT_WRLVL_LOAD_MR2;
        
      
      
      INIT_WRLVL_LOAD_MR2:
          init_next_state = INIT_WRLVL_LOAD_MR2_WAIT;    

      
      INIT_WRLVL_LOAD_MR2_WAIT:
        if (cnt_cmd_done_r && ~(phy_ctl_full || phy_cmd_full)) begin  
          
          
      
      
          if (~wrlvl_done_r1)
            init_next_state = INIT_WRLVL_START;
          else if (SIM_CAL_OPTION == "SKIP_CAL")
            
            init_next_state = INIT_DONE;
          else 
            
            
            init_next_state = INIT_PRECHARGE_PREWAIT;
        end
          
      
      
      

      
      
      INIT_RDLVL_ACT:
          init_next_state = INIT_RDLVL_ACT_WAIT;

      
      
      
      INIT_RDLVL_ACT_WAIT:
        if (cnt_cmd_done_r && ~(phy_ctl_full || phy_cmd_full)) begin
          
          
          if (!pi_calib_done_r1)
            init_next_state = INIT_PI_PHASELOCK_READS;
          else if (!pi_dqs_found_done)
                 
            init_next_state = INIT_RDLVL_STG2_READ;
          else if (~wrcal_done && (WRLVL == "ON") && (CLK_PERIOD/nCK_PER_CLK <= 2500))
            init_next_state = INIT_WRCAL_ACT_WAIT;
          else if ((!rdlvl_stg1_done && ~stg1_wr_done && ~rdlvl_last_byte_done) ||
                   (!prbs_rdlvl_done && ~stg1_wr_done && ~prbs_last_byte_done)) begin
            
            if (!prbs_rdlvl_done && ~stg1_wr_done && rdlvl_last_byte_done)
              init_next_state = INIT_RDLVL_ACT_WAIT;
            else
            init_next_state = INIT_RDLVL_STG1_WRITE;
          end else if ((!rdlvl_stg1_done && rdlvl_stg1_start_int) || !prbs_rdlvl_done) begin
            if (rdlvl_last_byte_done || prbs_last_byte_done)
            
              init_next_state = INIT_RDLVL_ACT_WAIT;
            else begin
            
            
               if (rdlvl_stg1_done)
                init_next_state = INIT_RDLVL_STG1_WRITE_READ;
               else
                init_next_state = INIT_RDLVL_STG1_READ;
            end
          end else if ((prbs_rdlvl_done && rdlvl_stg1_done && (RANKS == 1)) && (WRLVL == "ON") &&
                        (CLK_PERIOD/nCK_PER_CLK > 2500))
            init_next_state = INIT_WRCAL_ACT_WAIT;
          else
            
            
            
            
            init_next_state = INIT_PRECHARGE_PREWAIT;
        end

      
      
      
      
      
      INIT_PI_PHASELOCK_READS:
        if (pi_phase_locked_all_r3 && ~pi_phase_locked_all_r4)
          init_next_state = INIT_PRECHARGE_PREWAIT;
      
      
      
      

      
      
      INIT_RDLVL_STG1_WRITE:
        
        
        
        
        
        
        
        if ((complex_num_writes_dec == 1) && ~complex_row0_wr_done && prbs_rdlvl_done && rdlvl_stg1_done_r1)
          init_next_state = INIT_OCAL_COMPLEX_WRITE_WAIT;
        
        else if (stg1_wr_rd_cnt == 9'd1) begin
          if (rdlvl_stg1_done_r1)
            init_next_state = INIT_RDLVL_COMPLEX_PRECHARGE_PREWAIT;
          else
            init_next_state = INIT_RDLVL_STG1_WRITE_READ;
        end

      INIT_RDLVL_COMPLEX_PRECHARGE_PREWAIT:
        if (complex_rdlvl_int_ref_req || (prbs_rdlvl_done && ~prbs_rdlvl_done_r1)) 
          init_next_state = INIT_PRECHARGE_PREWAIT;
        else if (complex_wait_cnt == 'd15)
          
          init_next_state = INIT_RDLVL_COMPLEX_PRECHARGE;
      
      INIT_RDLVL_COMPLEX_PRECHARGE:
        init_next_state = INIT_RDLVL_COMPLEX_PRECHARGE_WAIT;
        
      INIT_RDLVL_COMPLEX_PRECHARGE_WAIT:
        if (complex_rdlvl_int_ref_req || (prbs_rdlvl_done && ~prbs_rdlvl_done_r1))
          init_next_state = INIT_PRECHARGE_PREWAIT;
        else if (complex_wait_cnt == 'd15) begin
          if (prbs_rdlvl_done || prbs_last_byte_done_r) begin 
		    
		    if ((~prbs_rdlvl_done && complex_oclkdelay_calib_start_int) || ~lim_done)
              init_next_state = INIT_OCAL_CENTER_ACT; 
			else if (lim_done && complex_oclkdelay_calib_start_r2)
			  init_next_state = INIT_RDLVL_COMPLEX_ACT;
			else
			  init_next_state = INIT_RDLVL_COMPLEX_PRECHARGE_WAIT;
          end else
		    init_next_state = INIT_RDLVL_COMPLEX_ACT;
		end
            
         
      INIT_RDLVL_COMPLEX_ACT:
        
        
        if(prbs_rdlvl_start && (num_samples_done_r || ~complex_init_pi_dec_done))
          init_next_state = INIT_RDLVL_COMPLEX_PI_WAIT;
        else init_next_state = INIT_RDLVL_COMPLEX_ACT_WAIT;

      
      INIT_RDLVL_COMPLEX_PI_WAIT:
        if(complex_pi_incdec_done) 
          init_next_state = INIT_RDLVL_COMPLEX_ACT_WAIT;
        
      INIT_RDLVL_COMPLEX_ACT_WAIT:  
        if (complex_rdlvl_int_ref_req || prech_req_posedge_r)  
          init_next_state = INIT_PRECHARGE_PREWAIT;
        else if (complex_wait_cnt == 'd15) begin
          if (oclkdelay_center_calib_start)
            init_next_state = INIT_OCAL_CENTER_WRITE_WAIT;
          else if (stg1_wr_done)
            init_next_state = INIT_RDLVL_COMPLEX_READ;
          else if (~complex_row1_wr_done)
            if (complex_oclkdelay_calib_start_int && complex_ocal_num_samples_done_r) 
              init_next_state = INIT_OCAL_COMPLEX_RESUME_WAIT;
            else 
              init_next_state = INIT_RDLVL_STG1_WRITE;
          else
            init_next_state = INIT_RDLVL_STG1_WRITE_READ;
        end
      
      
      INIT_RDLVL_STG1_WRITE_READ: 
        if (reset_rd_addr_r1)
          init_next_state = INIT_RDLVL_COMPLEX_PRECHARGE_PREWAIT;
        else if (cnt_cmd_done_r && ~(phy_ctl_full || phy_cmd_full))begin
          if (rdlvl_stg1_done_r1)
           
            init_next_state = INIT_RDLVL_COMPLEX_PI_WAIT; 
          else
            init_next_state = INIT_RDLVL_STG1_READ;
        end

      
      
      
      
      INIT_RDLVL_STG1_READ:
        if (rdlvl_stg1_rank_done || (rdlvl_stg1_done && ~rdlvl_stg1_done_r1) ||
            prech_req_posedge_r || (prbs_rdlvl_done && ~prbs_rdlvl_done_r1))
          init_next_state = INIT_PRECHARGE_PREWAIT;

      INIT_RDLVL_COMPLEX_READ:
        if (prech_req_posedge_r || (prbs_rdlvl_done && ~prbs_rdlvl_done_r1))
          init_next_state = INIT_PRECHARGE_PREWAIT;  
       
        else if (~prbs_rdlvl_done && (complex_num_reads_dec == 1) && ~complex_row0_rd_done) 
          init_next_state = INIT_RDLVL_COMPLEX_READ_WAIT;
        
        else if (stg1_wr_rd_cnt == 'd1)
          init_next_state = INIT_RDLVL_COMPLEX_PRECHARGE_PREWAIT;

      INIT_RDLVL_COMPLEX_READ_WAIT:
        if (prech_req_posedge_r || complex_rdlvl_int_ref_req || (prbs_rdlvl_done && ~prbs_rdlvl_done_r1))
            init_next_state = INIT_PRECHARGE_PREWAIT;
        else if (stg1_wr_rd_cnt == 'd1)
          init_next_state = INIT_RDLVL_COMPLEX_PRECHARGE_PREWAIT;
        else if (complex_wait_cnt == 'd15)
          init_next_state = INIT_RDLVL_COMPLEX_READ;        

      
      
      
      

      
      
      INIT_RDLVL_STG2_READ:
        
        if (num_reads == 'b1)
          init_next_state = INIT_RDLVL_STG2_READ_WAIT;

      
      
      
      INIT_RDLVL_STG2_READ_WAIT:
        if (~(phy_ctl_full || phy_cmd_full)) begin
          if (pi_dqs_found_rank_done ||
              pi_dqs_found_done || prech_req_posedge_r)
            init_next_state = INIT_PRECHARGE_PREWAIT;
          else if (cnt_cmd_done_r)
              init_next_state = INIT_RDLVL_STG2_READ;
        end
      
      
      
      
      
      
      
      
      INIT_MPR_RDEN:
        init_next_state = INIT_MPR_WAIT;
        
      
      INIT_MPR_WAIT:
        if (cnt_cmd_done_r) begin
          init_next_state = INIT_MPR_READ;
        end
      
      
      
      
      INIT_MPR_READ:
        if (mpr_rdlvl_done || mpr_rnk_done || rdlvl_prech_req)
          init_next_state = INIT_MPR_DISABLE_PREWAIT;
      
      INIT_MPR_DISABLE_PREWAIT:
        if (cnt_cmd_done_r)
          init_next_state = INIT_MPR_DISABLE;
      
      
      
      INIT_MPR_DISABLE:
        init_next_state = INIT_MPR_DISABLE_WAIT;
        
      INIT_MPR_DISABLE_WAIT:
        init_next_state = INIT_PRECHARGE_PREWAIT;
      
      
      
      
      
      
      
      
      
      
      
      INIT_OCLKDELAY_ACT:
        init_next_state = INIT_OCLKDELAY_ACT_WAIT;
      
      INIT_OCLKDELAY_ACT_WAIT:
        if (cnt_cmd_done_r && ~oclk_prech_req)
          init_next_state = INIT_OCLKDELAY_WRITE;
        else if (oclkdelay_calib_done || prech_req_posedge_r)
          init_next_state = INIT_PRECHARGE_PREWAIT;
          
      INIT_OCLKDELAY_WRITE:
        if (oclk_wr_cnt == 4'd1)
        init_next_state = INIT_OCLKDELAY_WRITE_WAIT;
      
      INIT_OCLKDELAY_WRITE_WAIT:
        if (cnt_cmd_done_r && ~(phy_ctl_full || phy_cmd_full)) begin
          if (oclkdelay_int_ref_req)
            init_next_state = INIT_PRECHARGE_PREWAIT;
          else			
            init_next_state = INIT_OCLKDELAY_READ;
		end
      
      INIT_OCLKDELAY_READ:
        init_next_state = INIT_OCLKDELAY_READ_WAIT;

      INIT_OCLKDELAY_READ_WAIT:
        if (~(phy_ctl_full || phy_cmd_full)) begin
          if ((oclk_calib_resume_level || oclk_calib_resume) && ~oclkdelay_int_ref_req)
            init_next_state = INIT_OCLKDELAY_WRITE;
          else if (oclkdelay_calib_done || prech_req_posedge_r ||
                   wrlvl_final || oclkdelay_int_ref_req)
            init_next_state = INIT_PRECHARGE_PREWAIT;
		  else if (oclkdelay_center_calib_start)
		    init_next_state = INIT_OCAL_CENTER_WRITE_WAIT;
        end
      
      
      
      
      

      
      INIT_WRCAL_ACT:
          init_next_state = INIT_WRCAL_ACT_WAIT;

      
      INIT_WRCAL_ACT_WAIT:
        if (cnt_cmd_done_r && ~wrcal_prech_req)
          init_next_state = INIT_WRCAL_WRITE;
        else if (wrcal_done || prech_req_posedge_r)
          init_next_state = INIT_PRECHARGE_PREWAIT;                                  

      
      INIT_WRCAL_WRITE:
        
        
        if (wrcal_wr_cnt == 4'd1)
          init_next_state = INIT_WRCAL_WRITE_READ;

      
      INIT_WRCAL_WRITE_READ: 
        if (cnt_cmd_done_r && ~(phy_ctl_full || phy_cmd_full)) 
          init_next_state = INIT_WRCAL_READ;
        else if (dqsfound_retry)
            init_next_state = INIT_RDLVL_STG2_READ_WAIT;


      INIT_WRCAL_READ:
        if (burst_addr_r == 1'b1)
          init_next_state = INIT_WRCAL_READ_WAIT;
          
      INIT_WRCAL_READ_WAIT:
        if (~(phy_ctl_full || phy_cmd_full)) begin
          if (wrcal_resume_r) begin
            if (wrcal_final_chk)
              init_next_state = INIT_WRCAL_READ;
            else
              init_next_state = INIT_WRCAL_WRITE;
          end else if (wrcal_done || prech_req_posedge_r || wrcal_act_req ||
          
                  wrlvl_byte_redo || (temp_wrcal_done && ~temp_lmr_done))
            init_next_state = INIT_PRECHARGE_PREWAIT;
          else if (dqsfound_retry)
            init_next_state = INIT_RDLVL_STG2_READ_WAIT;
          else if (wrcal_read_req && cnt_wrcal_rd)
            init_next_state = INIT_WRCAL_MULT_READS;
        end        

      INIT_WRCAL_MULT_READS:
        
        if (wrcal_reads == 'b1)
          init_next_state = INIT_WRCAL_READ_WAIT;        

      
      
      

      
      
      INIT_PRECHARGE_PREWAIT:
        if (cnt_cmd_done_r && ~(phy_ctl_full || phy_cmd_full))
          init_next_state = INIT_PRECHARGE;                
                                     
      
      INIT_PRECHARGE: 
        init_next_state = INIT_PRECHARGE_WAIT; 

      INIT_PRECHARGE_WAIT: 
        if (cnt_cmd_done_r && ~(phy_ctl_full || phy_cmd_full)) begin
          if ((wrcal_sanity_chk_done && (DRAM_TYPE == "DDR3")) || 
              (rdlvl_stg1_done && prbs_rdlvl_done && pi_dqs_found_done && 
              (DRAM_TYPE == "DDR2")))
             init_next_state = INIT_DONE;               
          else if ((wrcal_done || (WRLVL == "OFF")) && rdlvl_stg1_done && prbs_rdlvl_done &&
             pi_dqs_found_done && complex_oclkdelay_calib_done && wrlvl_done_r1 && ((ddr3_lm_done_r) || (DRAM_TYPE == "DDR2")))
             init_next_state = INIT_WRCAL_ACT;             
          else if ((wrcal_done || (WRLVL == "OFF") || (~wrcal_done && temp_wrcal_done && ~temp_lmr_done)) 
                   && (rdlvl_stg1_done || (~wrcal_done && temp_wrcal_done && ~temp_lmr_done)) 
                   && prbs_rdlvl_done && complex_oclkdelay_calib_done && wrlvl_done_r1 &rdlvl_stg1_done && pi_dqs_found_done) begin
           
            init_next_state = INIT_LOAD_MR; 
          
          end else if (~wrcal_done && temp_wrcal_done && temp_lmr_done)
            init_next_state = INIT_WRCAL_READ_WAIT;
          else if (rdlvl_stg1_done && pi_dqs_found_done && (WRLVL == "ON"))
            
            init_next_state = INIT_REFRESH; 
          else
            
            init_next_state = INIT_REFRESH;
        end
          
      
      
      
      INIT_OCAL_COMPLEX_ACT:
        init_next_state = INIT_OCAL_COMPLEX_ACT_WAIT;
      
      INIT_OCAL_COMPLEX_ACT_WAIT:
        if (complex_wait_cnt =='d15)
          init_next_state = INIT_RDLVL_STG1_WRITE;
          
      INIT_OCAL_COMPLEX_WRITE_WAIT:
        if (prech_req_posedge_r || (complex_oclkdelay_calib_done && ~complex_oclkdelay_calib_done_r1))
            init_next_state = INIT_PRECHARGE_PREWAIT;
        else if (stg1_wr_rd_cnt == 'd1)
          init_next_state = INIT_RDLVL_COMPLEX_PRECHARGE_PREWAIT;
        else if (complex_wait_cnt == 'd15)
          init_next_state = INIT_RDLVL_STG1_WRITE;    
    
      
      INIT_OCAL_COMPLEX_RESUME_WAIT:
        if (complex_oclk_calib_resume)
          init_next_state = INIT_RDLVL_STG1_WRITE;        
        else if (complex_oclkdelay_calib_done || complex_ocal_ref_req )        
            init_next_state = INIT_PRECHARGE_PREWAIT;          

      
      
      
      INIT_OCAL_CENTER_ACT: 
        init_next_state = INIT_OCAL_CENTER_ACT_WAIT;
          
      INIT_OCAL_CENTER_ACT_WAIT:
	    if (ocal_act_wait_cnt == 'd15)
	      init_next_state = INIT_OCAL_CENTER_WRITE_WAIT;
	  
	  INIT_OCAL_CENTER_WRITE:
        if(!oclk_center_write_resume && !lim_wr_req)
          init_next_state = INIT_OCAL_CENTER_WRITE_WAIT;
      
      INIT_OCAL_CENTER_WRITE_WAIT:
	    
		if (prech_req_posedge_r)
          init_next_state = INIT_PRECHARGE_PREWAIT;
        else if (lim_done && ~mask_lim_done && ~complex_mask_lim_done && oclkdelay_calib_done && ~oclkdelay_center_calib_start)
		  init_next_state = INIT_OCAL_COMPLEX_ACT_WAIT;
		else if (lim_done && ~mask_lim_done && ~complex_mask_lim_done && ~oclkdelay_center_calib_start)
		  init_next_state = INIT_OCLKDELAY_READ_WAIT; 
        else if (oclk_center_write_resume || lim_wr_req)
          init_next_state = INIT_OCAL_CENTER_WRITE;
     
      
      
      

      INIT_DONE:
        init_next_state = INIT_DONE;

    endcase
  end
      