      always @ (posedge clk) begin
        if (rst) begin
          tmp_mr2_r[1]   <= #TCQ 2'b00;
          tmp_mr2_r[2]   <= #TCQ 2'b00;
          tmp_mr2_r[3]   <= #TCQ 2'b00;
          tmp_mr1_r[1]   <= #TCQ 3'b000;
          tmp_mr1_r[2]   <= #TCQ 3'b000;
          tmp_mr1_r[3]   <= #TCQ 3'b000;
          phy_tmp_odt_r  <= #TCQ 4'b0000;
          phy_tmp_cs1_r  <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b1}};
          phy_tmp_odt_r1 <= #TCQ phy_tmp_odt_r;
        end else begin  
          case ({slot_0_present[0],slot_0_present[1],
                 slot_1_present[0],slot_1_present[1]})       
            
            4'b10_00: begin
              if (
                  (init_state_r == INIT_RDLVL_STG1_WRITE) ||
                  (init_state_r == INIT_WRCAL_WRITE) ||
                  (init_state_r == INIT_OCAL_CENTER_WRITE) || 
                  (init_state_r == INIT_OCLKDELAY_WRITE)) begin
                
                phy_tmp_odt_r <= #TCQ 4'b0001;
              end
              phy_tmp_cs1_r <= #TCQ {nCS_PER_RANK{1'b0}};
              if ((RTT_WR == "OFF") || 
                  ((WRLVL=="ON") && ~wrlvl_done)) begin
                
                tmp_mr2_r[0] <= #TCQ 2'b00;
                
                tmp_mr1_r[0] <= #TCQ (RTT_NOM_int == "40") ? 3'b011 :
                                     (RTT_NOM_int == "60") ? 3'b001 :
                                     (RTT_NOM_int == "120") ? 3'b010 :
                                     3'b000;
              end else begin
                
                tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                                2'b10;
                
                tmp_mr1_r[0] <= #TCQ 3'b000;
              end
            end
            4'b00_10: begin
              
              
              if (
                  (init_state_r == INIT_RDLVL_STG1_WRITE) || 
                  (init_state_r == INIT_WRCAL_WRITE) ||
                  (init_state_r == INIT_OCAL_CENTER_WRITE) || 
                  (init_state_r == INIT_OCLKDELAY_WRITE)) begin
                
                phy_tmp_odt_r <= #TCQ 4'b0001;
              end
              phy_tmp_cs1_r <= #TCQ {nCS_PER_RANK{1'b0}};
              if ((RTT_WR == "OFF") || 
                  ((WRLVL=="ON") && ~wrlvl_done)) begin
                
                tmp_mr2_r[0] <= #TCQ 2'b00;
                
                tmp_mr1_r[0] <= #TCQ (RTT_NOM_int == "40") ? 3'b011 :
                                     (RTT_NOM_int == "60") ? 3'b001 :
                                     (RTT_NOM_int == "120") ? 3'b010 :
                                     3'b000;
              end else begin
                
                tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                                2'b10;
                
                tmp_mr1_r[0] <= #TCQ 3'b000;
              end
            end
            
            4'b00_11: begin
              if (
                  (init_state_r == INIT_RDLVL_STG1_WRITE) || 
                  (init_state_r == INIT_WRCAL_WRITE) ||
                  (init_state_r == INIT_OCAL_CENTER_WRITE) || 
                  (init_state_r == INIT_OCLKDELAY_WRITE)) begin
                
                phy_tmp_odt_r  
                  <= #TCQ 4'b0001;
              end
              
              
              phy_tmp_cs1_r[(chip_cnt_r*nCS_PER_RANK) +: nCS_PER_RANK] 
                <= #TCQ {nCS_PER_RANK{1'b0}};
              
              if ((RTT_WR == "OFF") ||
                  ((WRLVL=="ON") && ~wrlvl_done &&
                   (wrlvl_rank_cntr==3'd0))) begin
                
                tmp_mr2_r[0] <= #TCQ 2'b00;
                
                tmp_mr1_r[0] <= #TCQ (RTT_NOM_int == "40") ? 3'b011 :
                                     (RTT_NOM_int == "60") ? 3'b001 :
                                     (RTT_NOM_int == "120") ? 3'b010 :
                                     3'b000;
              end else begin
                
                tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                                2'b10;
                
                tmp_mr1_r[0] <= #TCQ 3'b000;
              end
            end
            4'b11_00: begin
              if (
                  (init_state_r == INIT_RDLVL_STG1_WRITE) || 
                  (init_state_r == INIT_WRCAL_WRITE) ||
                  (init_state_r == INIT_OCAL_CENTER_WRITE) || 
                  (init_state_r == INIT_OCLKDELAY_WRITE)) begin
                
                phy_tmp_odt_r <= #TCQ 4'b0001;
              end
              
              
              phy_tmp_cs1_r[(chip_cnt_r*nCS_PER_RANK) +: nCS_PER_RANK] 
                <= #TCQ {nCS_PER_RANK{1'b0}};
              
              if ((RTT_WR == "OFF") ||
                  ((WRLVL=="ON") && ~wrlvl_done &&
                   (wrlvl_rank_cntr==3'd0))) begin
                
                tmp_mr2_r[0] <= #TCQ 2'b00;
                
                tmp_mr1_r[0] <= #TCQ (RTT_NOM_int == "40") ? 3'b011 :
                                     (RTT_NOM_int == "60") ? 3'b001 :
                                     (RTT_NOM_int == "120") ? 3'b010 :
                                     3'b000;
              end else begin
                
                tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                                2'b10;
                
                tmp_mr1_r[0] <= #TCQ 3'b000;
              end
            end
            
            4'b10_10: begin
              if(DRAM_TYPE == "DDR2")begin
                if(chip_cnt_r == 2'b00)begin
                  phy_tmp_odt_r
                    <= #TCQ 4'b0010; 
                end else begin
                  phy_tmp_odt_r
                    <= #TCQ 4'b0001; 
                end
              end else begin
                if((init_state_r == INIT_WRLVL_WAIT) ||
                        (init_next_state == INIT_RDLVL_STG1_WRITE) ||
                        (init_next_state == INIT_WRCAL_WRITE) ||
                        (init_next_state == INIT_OCAL_CENTER_WRITE) || 
                        (init_next_state == INIT_OCLKDELAY_WRITE))
                  phy_tmp_odt_r <= #TCQ 4'b0011; 
                else if ((init_next_state == INIT_PI_PHASELOCK_READS) ||
                         (init_next_state == INIT_MPR_READ) ||
                         (init_next_state == INIT_RDLVL_STG1_READ) ||
                         (init_next_state == INIT_RDLVL_COMPLEX_READ) ||                         
                         (init_next_state == INIT_RDLVL_STG2_READ) ||
                         (init_next_state == INIT_OCLKDELAY_READ) ||
                         (init_next_state == INIT_WRCAL_READ) ||
                         (init_next_state == INIT_WRCAL_MULT_READS))
                  phy_tmp_odt_r <= #TCQ 4'b0010; 
              end
              
                 
                 phy_tmp_cs1_r[(chip_cnt_r*nCS_PER_RANK) +: nCS_PER_RANK] 
                  <= #TCQ {nCS_PER_RANK{1'b0}};

                 if ((RTT_WR == "OFF") ||
                    ((WRLVL=="ON") && ~wrlvl_done &&
                     (wrlvl_rank_cntr==3'd0))) begin
                   
                   tmp_mr2_r[0] <= #TCQ 2'b00;
                   
                   tmp_mr1_r[0] <= #TCQ (RTT_WR == "60") ? 3'b001 :
                                        (RTT_WR == "120") ? 3'b010 :
                                        3'b000;
                   
                   tmp_mr2_r[1] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                                       2'b10;
                   
                   tmp_mr1_r[1] <= #TCQ (RTT_NOM_int == "40") ? 3'b011 :
                                        (RTT_NOM_int == "60") ? 3'b001 :
                                        (RTT_NOM_int == "120") ? 3'b010 :
                                        3'b000;
                 end else begin
                   
                   tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                                       2'b10;
                   
                   tmp_mr1_r[0] <= #TCQ (RTT_NOM_int == "60") ? 3'b001 :
                                        (RTT_NOM_int == "120") ? 3'b010 :
                                        (RTT_NOM_int == "20") ? 3'b100 :
                                        (RTT_NOM_int == "30") ? 3'b101 :
                                        (RTT_NOM_int == "40")  ? 3'b011 :
                                        3'b000;
                   
                   tmp_mr2_r[1] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                                       2'b10;
                   
                   tmp_mr1_r[1] <= #TCQ (RTT_NOM_int == "60") ? 3'b001 :
                                        (RTT_NOM_int == "120") ? 3'b010 :
                                        (RTT_NOM_int == "20") ? 3'b100 :
                                        (RTT_NOM_int == "30") ? 3'b101 :
                                        (RTT_NOM_int == "40")  ? 3'b011 :
                                        3'b000;
                 end
               end
            
            4'b10_11: begin

              
              tmp_mr1_r[2] <= #TCQ (RTT_NOM_int == "60")  ? 3'b001 :
                                   (RTT_NOM_int == "120") ? 3'b010 :
                                   (RTT_NOM_int == "20")  ? 3'b100 :
                                   (RTT_NOM_int == "30")  ? 3'b101 :
                                   (RTT_NOM_int == "40")  ? 3'b011 :
                                   3'b000;
              tmp_mr2_r[2] <= #TCQ 2'b00;
              if ((RTT_WR == "OFF") ||
                  ((WRLVL=="ON") && ~wrlvl_done &&
                   (wrlvl_rank_cntr==3'd0))) begin
                
                tmp_mr2_r[0] <= #TCQ 2'b00;
                
                tmp_mr1_r[0] <= #TCQ (RTT_NOM_int == "40") ? 3'b011 :
                                     (RTT_NOM_int == "60") ? 3'b001 :
                                     (RTT_NOM_int == "120") ? 3'b010 :
                                     3'b000;
                
                tmp_mr2_r[1] <= #TCQ 2'b00;
                
                tmp_mr1_r[1] <= #TCQ (RTT_NOM_int == "40") ? 3'b011 :
                                     (RTT_NOM_int == "60") ? 3'b001 :
                                     (RTT_NOM_int == "120") ? 3'b010 :
                                     3'b000;
              end else begin
                
                   tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                                   2'b10;
                
                tmp_mr1_r[0] <= #TCQ (RTT_NOM_int == "60") ? 3'b001 :
                                     (RTT_NOM_int == "120") ? 3'b010 :
                                     (RTT_NOM_int == "20") ? 3'b100 :
                                     (RTT_NOM_int == "30") ? 3'b101 :
                                     (RTT_NOM_int == "40") ? 3'b011 :
                                     3'b000;
                
                tmp_mr2_r[1] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                                2'b10;
                
                tmp_mr1_r[1] <= #TCQ 3'b000;
              end
              
              if(DRAM_TYPE == "DDR2")begin
                if(chip_cnt_r == 2'b00)begin
                  phy_tmp_odt_r 
                    <= #TCQ 4'b0010;
                end else begin
                  phy_tmp_odt_r 
                    <= #TCQ 4'b0001;
                end
              end else begin               
                   if (
                       (init_state_r == INIT_RDLVL_STG1_WRITE) || 
                       (init_state_r == INIT_WRCAL_WRITE) ||
                       (init_state_r == INIT_OCAL_CENTER_WRITE) || 
                       (init_state_r == INIT_OCLKDELAY_WRITE)) begin
                     if (chip_cnt_r[0] == 1'b1) begin
                       phy_tmp_odt_r 
                         <= #TCQ 4'b0011;
                       
                     end else begin
                       phy_tmp_odt_r 
                         <= #TCQ 4'b0101; 
                     end
                   end else if ((init_state_r == INIT_RDLVL_STG1_READ) ||
                                (init_state_r == INIT_RDLVL_COMPLEX_READ) ||                   
                                (init_state_r == INIT_PI_PHASELOCK_READS) ||
                                (init_state_r == INIT_RDLVL_STG2_READ) ||
                                (init_state_r == INIT_OCLKDELAY_READ) ||
                                (init_state_r == INIT_WRCAL_READ) ||
                                (init_state_r == INIT_WRCAL_MULT_READS))begin
                     if (chip_cnt_r == 2'b00) begin
                       phy_tmp_odt_r 
                         <= #TCQ 4'b0100;
                     end else begin
                       phy_tmp_odt_r
                       <= #TCQ 4'b0001;
                     end
                   end
              end
              
              
              phy_tmp_cs1_r[(chip_cnt_r*nCS_PER_RANK) +: nCS_PER_RANK] 
                <= #TCQ {nCS_PER_RANK{1'b0}};   
              
            end
            
            4'b11_10: begin
              
              
              tmp_mr1_r[2] <= #TCQ (RTT_NOM2 == "60") ? 3'b001 :
                                   (RTT_NOM2 == "120") ? 3'b010 :
                                   (RTT_NOM2 == "20") ? 3'b100 :
                                   (RTT_NOM2 == "30") ? 3'b101 :
                                   (RTT_NOM2 == "40") ? 3'b011:
                                   3'b000;
              tmp_mr2_r[2] <= #TCQ 2'b00;
              if ((RTT_WR == "OFF") ||
                  ((WRLVL=="ON") && ~wrlvl_done &&
                   (wrlvl_rank_cntr==3'd0))) begin
                
                tmp_mr2_r[0] <= #TCQ 2'b00;
                
                tmp_mr1_r[0] <= #TCQ (RTT_NOM_int == "40") ? 3'b011 :
                                     (RTT_NOM_int == "60") ? 3'b001 :
                                     (RTT_NOM_int == "120") ? 3'b010 :
                                     3'b000;
                
                tmp_mr2_r[1] <= #TCQ 2'b00;
                
                tmp_mr1_r[1] <= #TCQ (RTT_NOM_int == "40") ? 3'b011 :
                                     (RTT_NOM_int == "60") ? 3'b001 :
                                     (RTT_NOM_int == "120") ? 3'b010 :
                                     3'b000;
              end else begin
                
                tmp_mr2_r[1] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                                2'b10;
                
                tmp_mr1_r[1] <= #TCQ (RTT_NOM_int == "60") ? 3'b001 :
                                     (RTT_NOM_int == "120") ? 3'b010 :
                                     (RTT_NOM_int == "20") ? 3'b100 :
                                     (RTT_NOM_int == "30") ? 3'b101 :
                                     (RTT_NOM_int == "40") ? 3'b011:
                                     3'b000;
                
                tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                                2'b10;
                
                tmp_mr1_r[0] <= #TCQ 3'b000;
              end
              
              if(DRAM_TYPE == "DDR2")begin
                if(chip_cnt_r[1] == 1'b1)begin
                  phy_tmp_odt_r <= 
                                   #TCQ 4'b0001;
                end else begin
                  phy_tmp_odt_r 
                    <= #TCQ 4'b0100; 
                end
              end else begin 
                if (
                    (init_state_r == INIT_RDLVL_STG1_WRITE) || 
                    (init_state_r == INIT_WRCAL_WRITE) ||
                    (init_state_r == INIT_OCAL_CENTER_WRITE) || 
                    (init_state_r == INIT_OCLKDELAY_WRITE)) begin
                  
                  if (chip_cnt_r[1] == 1'b1) begin
                    phy_tmp_odt_r 
                      <= #TCQ 4'b0110;
                  end else begin
                    phy_tmp_odt_r <= 
                                     #TCQ 4'b0101;
                  end
                end else if ((init_state_r == INIT_RDLVL_STG1_READ) ||
                         (init_state_r == INIT_RDLVL_COMPLEX_READ) ||
                             (init_state_r == INIT_PI_PHASELOCK_READS) ||
                             (init_state_r == INIT_RDLVL_STG2_READ) ||
                             (init_state_r == INIT_OCLKDELAY_READ) ||
                             (init_state_r == INIT_WRCAL_READ) ||
                             (init_state_r == INIT_WRCAL_MULT_READS)) begin
                  
                     if (chip_cnt_r[1] == 1'b1) begin
                       phy_tmp_odt_r[(1*nCS_PER_RANK) +: nCS_PER_RANK] 
                         <= #TCQ 4'b0010;
                     end else begin
                       phy_tmp_odt_r 
                         <= #TCQ 4'b0100;
                     end
                end
              end
              
              
              phy_tmp_cs1_r[(chip_cnt_r*nCS_PER_RANK) +: nCS_PER_RANK] 
                <= #TCQ {nCS_PER_RANK{1'b0}};
            end
            
            4'b11_11: begin
              
              tmp_mr1_r[2] <= #TCQ (RTT_NOM2 == "60") ? 3'b001 :
                                   (RTT_NOM2 == "120") ? 3'b010 :
                                   (RTT_NOM2 == "20") ? 3'b100 :
                                   (RTT_NOM2 == "30") ? 3'b101 :
                                   (RTT_NOM2 == "40") ? 3'b011 :
                                   3'b000;
              
              tmp_mr1_r[3] <= #TCQ (RTT_NOM3 == "60") ? 3'b001 :
                                   (RTT_NOM3 == "120") ? 3'b010 :
                                   (RTT_NOM3 == "20") ? 3'b100 :
                                   (RTT_NOM3 == "30") ? 3'b101 :
                                   (RTT_NOM3 == "40") ? 3'b011 :
                                   3'b000;
              tmp_mr2_r[2] <= #TCQ 2'b00;
              tmp_mr2_r[3] <= #TCQ 2'b00;
              if ((RTT_WR == "OFF") ||
                  ((WRLVL=="ON") && ~wrlvl_done &&
                   (wrlvl_rank_cntr==3'd0))) begin
                
                tmp_mr2_r[0] <= #TCQ 2'b00;
                
                tmp_mr1_r[0] <= #TCQ (RTT_NOM_int == "40") ? 3'b011 :
                                     (RTT_NOM_int == "60") ? 3'b001 :
                                     (RTT_NOM_int == "120") ? 3'b010 :
                                     3'b000;
                
                tmp_mr2_r[1] <= #TCQ 2'b00;
                
                tmp_mr1_r[1] <= #TCQ (RTT_NOM_int == "40") ? 3'b011 :
                                     (RTT_NOM_int == "60") ? 3'b001 :
                                     (RTT_NOM_int == "120") ? 3'b010 :
                                     3'b000;
              end else begin
                
                tmp_mr2_r[1] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                                2'b10;
                
                tmp_mr1_r[1] <= #TCQ 3'b000;
                
                tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                                2'b10;
                
                tmp_mr1_r[0] <= #TCQ 3'b000;
              end
              
              if(DRAM_TYPE == "DDR2")begin
                if(chip_cnt_r[1] == 1'b1)begin
                  phy_tmp_odt_r
                    <= #TCQ 4'b0001;
                end else begin
                  phy_tmp_odt_r
                    <= #TCQ 4'b0100;
                end
              end else begin
                if (
                    (init_state_r == INIT_RDLVL_STG1_WRITE) || 
                    (init_state_r == INIT_WRCAL_WRITE) ||
                    (init_state_r == INIT_OCAL_CENTER_WRITE) || 
                    (init_state_r == INIT_OCLKDELAY_WRITE)) begin
                  
                  if (chip_cnt_r[0] == 1'b1) begin
                    phy_tmp_odt_r
                      <= #TCQ 4'b0110;
                    
                  end else begin
                    phy_tmp_odt_r
                      <= #TCQ 4'b1001;
                  end
                end else if ((init_state_r == INIT_RDLVL_STG1_READ) ||
                             (init_state_r == INIT_RDLVL_COMPLEX_READ) ||                
                             (init_state_r == INIT_PI_PHASELOCK_READS) ||
                             (init_state_r == INIT_RDLVL_STG2_READ) ||
                             (init_state_r == INIT_OCLKDELAY_READ) ||
                             (init_state_r == INIT_WRCAL_READ) ||
                             (init_state_r == INIT_WRCAL_MULT_READS))begin
                  
                  if (chip_cnt_r[0] == 1'b1) begin
                    phy_tmp_odt_r
                      <= #TCQ 4'b0100;
                    
                  end else begin
                    phy_tmp_odt_r
                      <= #TCQ 4'b1000;
                  end
                end
              end
              
              
              phy_tmp_cs1_r[(chip_cnt_r*nCS_PER_RANK) +: nCS_PER_RANK] 
                <= #TCQ {nCS_PER_RANK{1'b0}};
            end
            default: begin
              phy_tmp_odt_r <= #TCQ 4'b1111;
              
              phy_tmp_cs1_r[(chip_cnt_r*nCS_PER_RANK) +: nCS_PER_RANK] 
                <= #TCQ {nCS_PER_RANK{1'b0}};
              if ((RTT_WR == "OFF") ||
                  ((WRLVL=="ON") && ~wrlvl_done)) begin
                
                tmp_mr2_r[0] <= #TCQ 2'b00;
                
                tmp_mr1_r[0] <= #TCQ (RTT_NOM_int == "40") ? 3'b011 :
                                     (RTT_NOM_int == "60") ? 3'b001 :
                                     (RTT_NOM_int == "120") ? 3'b010 :
                                     3'b000;
                
                tmp_mr2_r[1] <= #TCQ 2'b00;
                
                tmp_mr1_r[1] <= #TCQ (RTT_NOM_int == "40") ? 3'b011 :
                                     (RTT_NOM_int == "60") ? 3'b001 :
                                     (RTT_NOM_int == "60") ? 3'b010 :
                                     3'b000;
              end else begin
                
                tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                                2'b10;
                
                tmp_mr1_r[0] <= #TCQ (RTT_NOM_int == "60") ? 3'b001 :
                                     (RTT_NOM_int == "120") ? 3'b010 :
                                     (RTT_NOM_int == "20") ? 3'b100 :
                                     (RTT_NOM_int == "30") ? 3'b101 :
                                     (RTT_NOM_int == "40") ? 3'b011 :
                                     3'b000;
                
                tmp_mr2_r[1] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                                2'b10;
                
                tmp_mr1_r[1] <= #TCQ (RTT_NOM_int == "60") ? 3'b001 :
                                     (RTT_NOM_int == "120") ? 3'b010 :
                                     (RTT_NOM_int == "20") ? 3'b100 :
                                     (RTT_NOM_int == "30") ? 3'b101 :
                                     (RTT_NOM_int == "40") ? 3'b011 :
                                     3'b000;
              end
            end
          endcase
        end
      end