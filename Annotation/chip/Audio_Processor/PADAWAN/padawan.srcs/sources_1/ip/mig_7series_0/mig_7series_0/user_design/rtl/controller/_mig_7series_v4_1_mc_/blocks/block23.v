      always @(posedge clk) begin
       
        mc_address <= #TCQ mc_address_ns;
        mc_bank <= #TCQ mc_bank_ns;
        mc_cas_n <= #TCQ mc_cas_n_ns;
        mc_cs_n <= #TCQ mc_cs_n_ns;
        mc_odt  <= #TCQ mc_odt_ns;
        mc_cke  <= #TCQ mc_cke_ns;
        mc_aux_out0 <= #TCQ mc_aux_out0_ns;
        mc_aux_out1 <= #TCQ mc_aux_out1_ns;
        mc_cmd <= #TCQ mc_cmd_ns;
        mc_ras_n <= #TCQ mc_ras_n_ns;
        mc_we_n <= #TCQ mc_we_n_ns;
        mc_data_offset <= #TCQ mc_data_offset_ns;
        mc_data_offset_1 <= #TCQ mc_data_offset_1_ns;
        mc_data_offset_2 <= #TCQ mc_data_offset_2_ns;
        mc_cas_slot <= #TCQ mc_cas_slot_ns;
        mc_wrdata_en <= #TCQ mc_wrdata_en_ns;
        mc_rank_cnt <= #TCQ mc_rank_cnt_ns;

        wr_data_addr <= #TCQ wr_data_addr_ns;
        wr_data_en <= #TCQ wr_data_en_ns;
        wr_data_offset <= #TCQ wr_data_offset_ns;

      end 