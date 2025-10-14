    u_ddr_mc_phy
      (
       .rst                    (rst),
       
       
       .ddr_rst_in_n           (1'b1),
       .phy_clk                (clk),
       .clk_div2               (clk_div2),
       .freq_refclk            (freq_refclk),
       .mem_refclk             (mem_refclk),
       
       .mem_refclk_div4        (clk),
       .pll_lock               (pll_lock),
       .auxout_clk             (),
       .sync_pulse             (sync_pulse),
       
       .idelayctrl_refclk      (),
       .phy_dout               (phy_dout),
       .phy_cmd_wr_en          (phy_cmd_wr_en),
       .phy_data_wr_en         (phy_data_wr_en),
       .phy_rd_en              (phy_rd_en),
       .phy_ctl_wd             (phy_ctl_wd_temp),
       .phy_ctl_wr             (phy_ctl_wr_temp),
       .if_empty_def           (phy_if_empty_def),
       .if_rst                 (phy_if_reset),
       .phyGo                  ('b1),
       .aux_in_1               (aux_in_1),
       .aux_in_2               (aux_in_2),
       
       
       .data_offset_1          (data_offset_1_temp),
       .data_offset_2          (data_offset_2_temp),
       .cke_in                 (),
       .if_a_empty             (),
       .if_empty               (if_empty),
       .if_empty_or            (),
       .if_empty_and           (),
       .of_ctl_a_full          (),
      
       .of_ctl_full            (phy_cmd_full),
       .of_data_full           (),
       .pre_data_a_full        (phy_pre_data_a_full),
       .idelay_ld              (idelay_ld),
       .idelay_ce              (idelay_ce),
       .idelay_inc             (idelay_inc),
       .input_sink             (),
       .phy_din                (phy_din),
       .phy_ctl_a_full         (),
       .phy_ctl_full           (phy_ctl_full_temp),
       .mem_dq_out             (mem_dq_out),
       .mem_dq_ts              (mem_dq_ts),
       .mem_dq_in              (mem_dq_in),
       .mem_dqs_out            (mem_dqs_out),
       .mem_dqs_ts             (mem_dqs_ts),
       .mem_dqs_in             (mem_dqs_in),
       .aux_out                (aux_out),
       .phy_ctl_ready          (),
       .rst_out                (),
       .ddr_clk                (ddr_clk),
       
       .mcGo                   (phy_mc_go),
       .phy_write_calib        (phy_write_calib),
       .phy_read_calib         (phy_read_calib),
       .calib_sel              (calib_sel),
       .calib_in_common        (calib_in_common),
       .calib_zero_inputs      (calib_zero_inputs),
       .calib_zero_ctrl        (calib_zero_ctrl),
       .calib_zero_lanes       ('b0),
       .po_fine_enable         (po_fine_enable),
       .po_coarse_enable       (po_coarse_enable),
       .po_fine_inc            (po_fine_inc),
       .po_coarse_inc          (po_coarse_inc),
       .po_counter_load_en     (po_counter_load_en),
       .po_sel_fine_oclk_delay (po_sel_fine_oclk_delay),
       .po_counter_load_val    (po_counter_load_val),
       .po_counter_read_en     (po_counter_read_en),
       .po_coarse_overflow     (),
       .po_fine_overflow       (),
       .po_counter_read_val    (po_counter_read_val),
       .pi_rst_dqs_find        (pi_rst_dqs_find),
       .pi_fine_enable         (pi_fine_enable),
       .pi_fine_inc            (pi_fine_inc),
       .pi_counter_load_en     (pi_counter_load_en),
       .pi_counter_read_en     (dbg_pi_counter_read_en),
       .pi_counter_load_val    (pi_counter_load_val),
       .pi_fine_overflow       (),
       .pi_counter_read_val    (pi_counter_read_val),
       .pi_phase_locked        (pi_phase_locked),
       .pi_phase_locked_all    (pi_phase_locked_all),
       .pi_dqs_found           (),
       .pi_dqs_found_any       (pi_dqs_found),
       .pi_dqs_found_all       (pi_dqs_found_all),
       .pi_dqs_found_lanes     (dbg_pi_dqs_found_lanes_phy4lanes),
       
       
       
       
       .pi_dqs_out_of_range    (pi_dqs_out_of_range)

       ,.ref_dll_lock          (ref_dll_lock)
       ,.pi_phase_locked_lanes (dbg_pi_phase_locked_phy4lanes)
       ,.fine_delay            (fine_delay_mod)
       ,.fine_delay_sel        (fine_delay_sel_r)

       );
