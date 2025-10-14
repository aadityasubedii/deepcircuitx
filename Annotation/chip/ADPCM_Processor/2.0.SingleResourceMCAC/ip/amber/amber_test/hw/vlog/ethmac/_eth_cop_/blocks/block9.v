always @ (posedge wb_clk_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    begin
      m1_in_progress <=#Tp 0;
      m2_in_progress <=#Tp 0;
      s1_wb_adr_o    <=#Tp 0;
      s1_wb_sel_o    <=#Tp 0;
      s1_wb_we_o     <=#Tp 0;
      s1_wb_dat_o    <=#Tp 0;
      s1_wb_cyc_o    <=#Tp 0;
      s1_wb_stb_o    <=#Tp 0;
      s2_wb_adr_o    <=#Tp 0;
      s2_wb_sel_o    <=#Tp 0;
      s2_wb_we_o     <=#Tp 0;
      s2_wb_dat_o    <=#Tp 0;
      s2_wb_cyc_o    <=#Tp 0;
      s2_wb_stb_o    <=#Tp 0;
    end
  else
    begin
      case({m1_in_progress, m2_in_progress, m1_req, m2_req, m_wb_access_finished})  
        5'b00_10_0, 5'b00_11_0 :
          begin
            m1_in_progress <=#Tp 1'b1;  
            if(`M1_ADDRESSED_S1)
              begin
                s1_wb_adr_o <=#Tp m1_wb_adr_i;
                s1_wb_sel_o <=#Tp m1_wb_sel_i;
                s1_wb_we_o  <=#Tp m1_wb_we_i;
                s1_wb_dat_o <=#Tp m1_wb_dat_i;
                s1_wb_cyc_o <=#Tp 1'b1;
                s1_wb_stb_o <=#Tp 1'b1;
              end
            else if(`M1_ADDRESSED_S2)
              begin
                s2_wb_adr_o <=#Tp m1_wb_adr_i;
                s2_wb_sel_o <=#Tp m1_wb_sel_i;
                s2_wb_we_o  <=#Tp m1_wb_we_i;
                s2_wb_dat_o <=#Tp m1_wb_dat_i;
                s2_wb_cyc_o <=#Tp 1'b1;
                s2_wb_stb_o <=#Tp 1'b1;
              end
            else
              $display("(%t)(%m)WISHBONE ERROR: Unspecified address space accessed", $time);
          end
        5'b00_01_0 :
          begin
            m2_in_progress <=#Tp 1'b1;  
            if(`M2_ADDRESSED_S1)
              begin
                s1_wb_adr_o <=#Tp m2_wb_adr_i;
                s1_wb_sel_o <=#Tp m2_wb_sel_i;
                s1_wb_we_o  <=#Tp m2_wb_we_i;
                s1_wb_dat_o <=#Tp m2_wb_dat_i;
                s1_wb_cyc_o <=#Tp 1'b1;
                s1_wb_stb_o <=#Tp 1'b1;
              end
            else if(`M2_ADDRESSED_S2)
              begin
                s2_wb_adr_o <=#Tp m2_wb_adr_i;
                s2_wb_sel_o <=#Tp m2_wb_sel_i;
                s2_wb_we_o  <=#Tp m2_wb_we_i;
                s2_wb_dat_o <=#Tp m2_wb_dat_i;
                s2_wb_cyc_o <=#Tp 1'b1;
                s2_wb_stb_o <=#Tp 1'b1;
              end
            else
              $display("(%t)(%m)WISHBONE ERROR: Unspecified address space accessed", $time);
          end
        5'b10_10_1, 5'b10_11_1 :
          begin
            m1_in_progress <=#Tp 1'b0;  
            if(`M1_ADDRESSED_S1)
              begin
                s1_wb_cyc_o <=#Tp 1'b0;
                s1_wb_stb_o <=#Tp 1'b0;
              end
            else if(`M1_ADDRESSED_S2)
              begin
                s2_wb_cyc_o <=#Tp 1'b0;
                s2_wb_stb_o <=#Tp 1'b0;
              end
          end
        5'b01_01_1, 5'b01_11_1 :
          begin
            m2_in_progress <=#Tp 1'b0;  
            if(`M2_ADDRESSED_S1)
              begin
                s1_wb_cyc_o <=#Tp 1'b0;
                s1_wb_stb_o <=#Tp 1'b0;
              end
            else if(`M2_ADDRESSED_S2)
              begin
                s2_wb_cyc_o <=#Tp 1'b0;
                s2_wb_stb_o <=#Tp 1'b0;
              end
          end
      endcase
    end
end