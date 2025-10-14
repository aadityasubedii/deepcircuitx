  generate
    genvar p;

    for (p = 0; p < ROW_WIDTH; p = p + 1) begin: gen_addr_obuf
      OBUF u_addr_obuf
        (
         .I (out_addr[p]),
         .O (ddr_addr[p])
         );
    end

    for (p = 0; p < BANK_WIDTH; p = p + 1) begin: gen_bank_obuf
      OBUF u_bank_obuf
        (
         .I (out_ba[p]),
         .O (ddr_ba[p])
         );
    end

    if (USE_CS_PORT == 1) begin: gen_cs_n_obuf
      for (p = 0; p < CS_WIDTH*nCS_PER_RANK; p = p + 1) begin: gen_cs_obuf
        OBUF u_cs_n_obuf
          (
           .I (out_cs_n[p]),
           .O (ddr_cs_n[p])
           );
      end
    end
    if(CKE_ODT_AUX == "FALSE")begin:cke_odt_thru_outfifo
      if (USE_ODT_PORT== 1) begin: gen_odt_obuf
        for (p = 0; p < ODT_WIDTH; p = p + 1) begin: gen_odt_obuf
          OBUF u_cs_n_obuf
            (
             .I (out_odt[p]),
             .O (ddr_odt[p])
             );
        end
      end
        for (p = 0; p < CKE_WIDTH; p = p + 1) begin: gen_cke_obuf
          OBUF u_cs_n_obuf
            (
             .I (out_cke[p]),
             .O (ddr_cke[p])
             );
        end
    end

    if (REG_CTRL == "ON") begin: gen_parity_obuf
      
      OBUF u_parity_obuf
        (
         .I (out_parity),
         .O (ddr_parity)
         );
    end else begin: gen_parity_tieoff
      assign ddr_parity = 1'b0;
    end

    if ((DRAM_TYPE == "DDR3") || (REG_CTRL == "ON")) begin: gen_reset_obuf
      
      OBUF u_reset_obuf
        (
         .I (mux_reset_n),
         .O (ddr_reset_n)
         );
    end else begin: gen_reset_tieoff
      assign ddr_reset_n = 1'b1;
    end

    if (USE_DM_PORT == 1) begin: gen_dm_obuf
      for (p = 0; p < DM_WIDTH; p = p + 1) begin: loop_dm
        OBUFT u_dm_obuf
          (
           .I (out_dm[p]),
           .T (ts_dm[p]),
           .O (ddr_dm[p])
           );
      end
    end else begin: gen_dm_tieoff
      assign ddr_dm = 'b0;
    end

    if (DATA_IO_PRIM_TYPE == "HP_LP") begin: gen_dq_iobuf_HP
      for (p = 0; p < DQ_WIDTH; p = p + 1) begin: gen_dq_iobuf
        IOBUF_DCIEN #
          (
           .IBUF_LOW_PWR (IBUF_LOW_PWR)
           )
          u_iobuf_dq
            (
             .DCITERMDISABLE (data_io_idle_pwrdwn),
             .IBUFDISABLE    (data_io_idle_pwrdwn),
             .I              (out_dq[p]),
             .T              (ts_dq[p]),
             .O              (in_dq[p]),
             .IO             (ddr_dq[p])
             );
      end
    end else if (DATA_IO_PRIM_TYPE == "HR_LP") begin: gen_dq_iobuf_HR
      for (p = 0; p < DQ_WIDTH; p = p + 1) begin: gen_dq_iobuf
        IOBUF_INTERMDISABLE #
          (
           .IBUF_LOW_PWR (IBUF_LOW_PWR)
           )
          u_iobuf_dq
            (
             .INTERMDISABLE  (data_io_idle_pwrdwn),
             .IBUFDISABLE    (data_io_idle_pwrdwn),
             .I              (out_dq[p]),
             .T              (ts_dq[p]),
             .O              (in_dq[p]),
             .IO             (ddr_dq[p])
             );
      end
    end else begin: gen_dq_iobuf_default
      for (p = 0; p < DQ_WIDTH; p = p + 1) begin: gen_dq_iobuf
        IOBUF #
          (
           .IBUF_LOW_PWR (IBUF_LOW_PWR)
           )
          u_iobuf_dq
            (
             .I  (out_dq[p]),
             .T  (ts_dq[p]),
             .O  (in_dq[p]),
             .IO (ddr_dq[p])
             );
      end
    end

    
    if ((BANK_TYPE == "HP_IO") || (BANK_TYPE == "HPL_IO")) begin: gen_dqs_iobuf_HP
      for (p = 0; p < DQS_WIDTH; p = p + 1) begin: gen_dqs_iobuf
        if ((DRAM_TYPE == "DDR2") &&
            (DDR2_DQSN_ENABLE != "YES")) begin: gen_ddr2_dqs_se
          IOBUF_DCIEN #
            (
             .IBUF_LOW_PWR (IBUF_LOW_PWR)
             )
            u_iobuf_dqs
              (
               .DCITERMDISABLE (data_io_idle_pwrdwn),
               .IBUFDISABLE    (data_io_idle_pwrdwn),
               .I              (out_dqs[p]),
               .T              (ts_dqs[p]),
               .O              (in_dqs[p]),
               .IO             (ddr_dqs[p])
               );
          assign ddr_dqs_n[p] = 1'b0;
          assign pd_out_pre[p] = 1'b0;
        end else if ((DRAM_TYPE == "DDR2") ||
                     (tCK > 2500)) begin : gen_ddr2_or_low_dqs_diff
          IOBUFDS_DCIEN #
            (
             .IBUF_LOW_PWR (IBUF_LOW_PWR),
             .DQS_BIAS     ("TRUE")
             )
            u_iobuf_dqs
              (
               .DCITERMDISABLE (data_io_idle_pwrdwn),
               .IBUFDISABLE    (data_io_idle_pwrdwn),
               .I              (out_dqs[p]),
               .T              (ts_dqs[p]),
               .O              (in_dqs[p]),
               .IO             (ddr_dqs[p]),
               .IOB            (ddr_dqs_n[p])
               );
          assign pd_out_pre[p] = 1'b0;
        end else begin: gen_dqs_diff
          IOBUFDS_DIFF_OUT_DCIEN #
            (
             .IBUF_LOW_PWR (IBUF_LOW_PWR),
         .DQS_BIAS     ("TRUE"),
         .SIM_DEVICE   ("7SERIES"),
             .USE_IBUFDISABLE ("FALSE")
             )
            u_iobuf_dqs
              (
               .DCITERMDISABLE (data_io_idle_pwrdwn),
               .I              (out_dqs[p]),
               .TM             (ts_dqs[p]),
               .TS             (ts_dqs[p]),
               .OB             (in_dqs_lpbk_to_iddr[p]),
               .O              (in_dqs[p]),
               .IO             (ddr_dqs[p]),
               .IOB            (ddr_dqs_n[p])
               );

          mig_7series_v4_1_poc_pd #
          (
           .TCQ        (TCQ),
           .POC_USE_METASTABLE_SAMP (POC_USE_METASTABLE_SAMP)
          )
          u_iddr_edge_det
          (
            .clk         (clk),
            .iddr_rst         (iddr_rst_i),
            .kclk        (in_dqs_lpbk_to_iddr[p]),
            .mmcm_ps_clk (mmcm_ps_clk),
            .pd_out      (pd_out_pre[p])
          );
        end
      end
    
    end else if ((BANK_TYPE == "HR_IO") || (BANK_TYPE == "HRL_IO")) begin: gen_dqs_iobuf_HR
      for (p = 0; p < DQS_WIDTH; p = p + 1) begin: gen_dqs_iobuf
        if ((DRAM_TYPE == "DDR2") &&
            (DDR2_DQSN_ENABLE != "YES")) begin: gen_ddr2_dqs_se
          IOBUF_INTERMDISABLE #
            (
             .IBUF_LOW_PWR (IBUF_LOW_PWR)
             )
            u_iobuf_dqs
              (
               .INTERMDISABLE  (data_io_idle_pwrdwn),
               .IBUFDISABLE    (data_io_idle_pwrdwn),
               .I              (out_dqs[p]),
               .T              (ts_dqs[p]),
               .O              (in_dqs[p]),
               .IO             (ddr_dqs[p])
               );
          assign ddr_dqs_n[p] = 1'b0;
          assign pd_out_pre[p] = 1'b0;
        end else if ((DRAM_TYPE == "DDR2") ||
                     (tCK > 2500)) begin: gen_ddr2_or_low_dqs_diff
          IOBUFDS_INTERMDISABLE #
            (
             .IBUF_LOW_PWR (IBUF_LOW_PWR),
             .DQS_BIAS     ("TRUE")
             )
            u_iobuf_dqs
              (
               .INTERMDISABLE  (data_io_idle_pwrdwn),
               .IBUFDISABLE    (data_io_idle_pwrdwn),
               .I              (out_dqs[p]),
               .T              (ts_dqs[p]),
               .O              (in_dqs[p]),
               .IO             (ddr_dqs[p]),
               .IOB            (ddr_dqs_n[p])
               );
          assign pd_out_pre[p] = 1'b0;
        end else begin: gen_dqs_diff
          IOBUFDS_DIFF_OUT_INTERMDISABLE #
            (
             .IBUF_LOW_PWR (IBUF_LOW_PWR),
             .DQS_BIAS     ("TRUE"),
         .SIM_DEVICE   ("7SERIES"),
             .USE_IBUFDISABLE ("FALSE")
             )
            u_iobuf_dqs
              (
               .INTERMDISABLE  (data_io_idle_pwrdwn),
               
               .I              (out_dqs[p]),
               .TM             (ts_dqs[p]),
               .TS             (ts_dqs[p]),
               .OB             (in_dqs_lpbk_to_iddr[p]),
               .O              (in_dqs[p]),
               .IO             (ddr_dqs[p]),
               .IOB            (ddr_dqs_n[p])
               );

        mig_7series_v4_1_poc_pd #
        (
         .TCQ        (TCQ),
         .POC_USE_METASTABLE_SAMP (POC_USE_METASTABLE_SAMP)
        )
        u_iddr_edge_det
          (
           .clk         (clk),
               .iddr_rst    (iddr_rst_i),
           .kclk        (in_dqs_lpbk_to_iddr[p]),
               .mmcm_ps_clk (mmcm_ps_clk),
               .pd_out      (pd_out_pre[p])
          );
        end
      end
    end else begin: gen_dqs_iobuf_default
      for (p = 0; p < DQS_WIDTH; p = p + 1) begin: gen_dqs_iobuf
        if ((DRAM_TYPE == "DDR2") &&
            (DDR2_DQSN_ENABLE != "YES")) begin: gen_ddr2_dqs_se
          IOBUF #
            (
             .IBUF_LOW_PWR (IBUF_LOW_PWR)
             )
            u_iobuf_dqs
              (
               .I   (out_dqs[p]),
               .T   (ts_dqs[p]),
               .O   (in_dqs[p]),
               .IO  (ddr_dqs[p])
               );
          assign ddr_dqs_n[p] = 1'b0;
          assign pd_out_pre[p] = 1'b0;
        end else begin: gen_dqs_diff
          IOBUFDS #
            (
             .IBUF_LOW_PWR (IBUF_LOW_PWR),
             .DQS_BIAS     ("TRUE")
             )
            u_iobuf_dqs
              (
               .I   (out_dqs[p]),
               .T   (ts_dqs[p]),
               .O   (in_dqs[p]),
               .IO  (ddr_dqs[p]),
               .IOB (ddr_dqs_n[p])
               );
          assign pd_out_pre[p] = 1'b0;
        end
      end
    end

  endgenerate