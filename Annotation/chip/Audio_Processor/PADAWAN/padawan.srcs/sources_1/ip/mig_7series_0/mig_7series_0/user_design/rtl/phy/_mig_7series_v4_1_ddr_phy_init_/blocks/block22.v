      always @(posedge clk) begin
        if (rst) begin
          tmp_mr2_r[1]   <= #TCQ 2'b00;
          tmp_mr2_r[2]   <= #TCQ 2'b00;
          tmp_mr2_r[3]   <= #TCQ 2'b00;
          tmp_mr1_r[1]   <= #TCQ 3'b000;
          tmp_mr1_r[2]   <= #TCQ 3'b000;
          tmp_mr1_r[3]   <= #TCQ 3'b000;
          phy_tmp_cs1_r <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b1}};
          phy_tmp_odt_r <= #TCQ 4'b0000;
          phy_tmp_odt_r1 <= #TCQ phy_tmp_odt_r;
        end else begin 
          case ({slot_0_present[0],slot_0_present[1],
                 slot_0_present[2],slot_0_present[3]})
            
            
            
            4'b1111: begin    
              if ((RTT_WR == "OFF") || 
                  ((WRLVL=="ON") && ~wrlvl_done &&
                   (wrlvl_rank_cntr==3'd0))) begin
                
                tmp_mr2_r[0] <= #TCQ 2'b00;
                
                tmp_mr1_r[0] <= #TCQ (RTT_NOM_int == "40")  ? 3'b011 :
                                     (RTT_NOM_int == "60")  ? 3'b001 :
                                     (RTT_NOM_int == "120") ? 3'b010 :
                                     3'b000;
              end else begin
                
                tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                                2'b10;
                
                tmp_mr1_r[0] <= #TCQ 3'b000;
              end
              phy_tmp_odt_r <= #TCQ 4'b0001;
              
              phy_tmp_cs1_r[((chip_cnt_r*nCS_PER_RANK)
                             ) +: nCS_PER_RANK] <= #TCQ 'b0;
            end 
        
            
            4'b1000: begin    
              phy_tmp_odt_r <= #TCQ 4'b0001;
              if ((REG_CTRL == "ON") && (nCS_PER_RANK > 1)) begin
                phy_tmp_cs1_r[chip_cnt_r] <= #TCQ 1'b0;
              end else begin
                phy_tmp_cs1_r <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b0}};
              end
              if ((RTT_WR == "OFF") || 
                  ((WRLVL=="ON") && ~wrlvl_done && 
                   ((cnt_init_mr_r == 2'd0) || (USE_ODT_PORT == 1)))) begin
                
                tmp_mr2_r[0] <= #TCQ 2'b00;
                
                tmp_mr1_r[0] <= #TCQ (RTT_NOM_int == "40")  ? 3'b011 :
                                     (RTT_NOM_int == "60")  ? 3'b001 :
                                     (RTT_NOM_int == "120") ? 3'b010 :
                                     3'b000;
              end else begin
                
                tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                                2'b10;
                
                tmp_mr1_r[0] <= #TCQ 3'b000;
              end
            end 
            
            
            4'b1100: begin
              phy_tmp_odt_r <= #TCQ 4'b0001;
              
              
              phy_tmp_cs1_r[((chip_cnt_r*nCS_PER_RANK)
                             ) +: nCS_PER_RANK] <= #TCQ 'b0;
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
            
            default: begin    
              phy_tmp_odt_r <= #TCQ 4'b0001;
              phy_tmp_cs1_r <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b0}};
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
          endcase
        end
      end