    always @(posedge clk)
        if ((~oclkdelay_calib_done)&& (DRAM_TYPE == "DDR3"))
          phy_wrdata <= #TCQ {{DQ_WIDTH/4{4'hF}},
                              {DQ_WIDTH/4{4'h0}},
                              {DQ_WIDTH/4{4'hF}},
                              {DQ_WIDTH/4{4'h0}}};
        else if ((!wrcal_done) && (DRAM_TYPE == "DDR3"))begin
          case (wrcal_pat_cnt)
          2'b00: begin
            phy_wrdata <= #TCQ {{DQ_WIDTH/4{4'h5}},
                                {DQ_WIDTH/4{4'hA}},
                                {DQ_WIDTH/4{4'h0}},
                                {DQ_WIDTH/4{4'hF}}};
          end
          2'b01: begin
            phy_wrdata <= #TCQ {{DQ_WIDTH/4{4'h6}},
                                {DQ_WIDTH/4{4'h9}},
                                {DQ_WIDTH/4{4'hA}},
                                {DQ_WIDTH/4{4'h5}}};
          end
          2'b10: begin
            phy_wrdata <= #TCQ {{DQ_WIDTH/4{4'h4}},
                                {DQ_WIDTH/4{4'hE}},
                                {DQ_WIDTH/4{4'h1}},
                                {DQ_WIDTH/4{4'hB}}};
          end
          2'b11: begin
            phy_wrdata <= #TCQ {{DQ_WIDTH/4{4'h8}},
                                {DQ_WIDTH/4{4'hD}},
                                {DQ_WIDTH/4{4'hE}},
                                {DQ_WIDTH/4{4'h4}}};
          end
          endcase
        end else if (!rdlvl_stg1_done) begin
          
          
          
          case (wrdata_pat_cnt)
          2'b00: begin
            phy_wrdata <= #TCQ {{DQ_WIDTH/4{4'hE}},
                                {DQ_WIDTH/4{4'h7}},
                                {DQ_WIDTH/4{4'h3}},
                                {DQ_WIDTH/4{4'h9}}};
          end
          
          2'b01: begin
            phy_wrdata <= #TCQ {{DQ_WIDTH/4{4'h4}},
                                {DQ_WIDTH/4{4'h2}},
                                {DQ_WIDTH/4{4'h9}},
                                {DQ_WIDTH/4{4'hC}}};
          end
          
          2'b10: begin
            phy_wrdata <= #TCQ {{DQ_WIDTH/4{4'hE}},
                                {DQ_WIDTH/4{4'h7}},
                                {DQ_WIDTH/4{4'h1}},
                                {DQ_WIDTH/4{4'hB}}};
          end
          
          2'b11: begin
            phy_wrdata <= #TCQ {{DQ_WIDTH/4{4'h4}},
                                {DQ_WIDTH/4{4'h2}},
                                {DQ_WIDTH/4{4'h9}},
                                {DQ_WIDTH/4{4'hC}}};
          end
          endcase
        end else if (!prbs_rdlvl_done && ~phy_data_full) begin
          phy_wrdata <= #TCQ prbs_o;
          
          
          



        end else if (!complex_oclkdelay_calib_done && ~phy_data_full) begin
          phy_wrdata <= #TCQ prbs_o;
        end

   end