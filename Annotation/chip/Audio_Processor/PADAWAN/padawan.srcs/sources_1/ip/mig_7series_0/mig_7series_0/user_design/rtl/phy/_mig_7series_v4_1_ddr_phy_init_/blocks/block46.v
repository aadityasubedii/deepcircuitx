        end else if (!wrcal_done) begin
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
        end