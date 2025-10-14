  generate
  genvar i;
    for (i = 0; i <= 2; i = i+1) begin : bankwise_signal

      assign po_sel_stg2stg3[i]  = ((ck_addr_cmd_delay_done && ~oclkdelay_calib_done && mpr_rdlvl_done) ? po_stg23_sel :
                                   (complex_oclkdelay_calib_start_w&&~complex_oclkdelay_calib_done_w? po_stg23_sel : 1'b0 )
                                  
                                   ) || calib_po_sel_stg2stg3 || dbg_po_f_stg23_sel_r;

      assign po_stg2_c_incdec[i] =  cmd_po_stg2_c_incdec ||
                                    cmd_po_stg2_incdec_ddr2_c ||
                                    calib_po_c_inc ||
                                    dqs_wl_po_stg2_c_incdec;

      assign po_en_stg2_c[i]     = cmd_po_en_stg2_c ||
                                   cmd_po_en_stg2_ddr2_c ||
                                   calib_po_c_en ||
                                   dqs_wl_po_en_stg2_c;

      assign po_stg2_f_incdec[i] = dqs_po_stg2_f_incdec ||
                                   cmd_po_stg2_f_incdec ||
                                   ck_po_stg2_f_indec ||
                                   po_stg23_incdec ||
                                   calib_po_f_incdec ||
                                  
                                  
                                   dbg_po_f_inc_r;

      assign po_en_stg2_f[i]     = dqs_po_en_stg2_f ||
                                   cmd_po_en_stg2_f ||
                                   ck_po_stg2_f_en ||
                                   po_en_stg23 ||
                                   calib_po_f_en ||
                                  
                                  
                                   dbg_po_f_en_r;

    end
  endgenerate