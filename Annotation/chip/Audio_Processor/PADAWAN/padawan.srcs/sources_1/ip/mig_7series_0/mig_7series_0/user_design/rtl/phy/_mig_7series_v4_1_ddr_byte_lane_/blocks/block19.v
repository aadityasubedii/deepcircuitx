   always @(posedge phy_clk) begin
     rd_data_r      <= #(025) rd_data;
     if_empty_r[0]  <= #(025) if_empty_;
     if_empty_r[1]  <= #(025) if_empty_;
     if_empty_r[2]  <= #(025) if_empty_;
     if_empty_r[3]  <= #(025) if_empty_;
   end