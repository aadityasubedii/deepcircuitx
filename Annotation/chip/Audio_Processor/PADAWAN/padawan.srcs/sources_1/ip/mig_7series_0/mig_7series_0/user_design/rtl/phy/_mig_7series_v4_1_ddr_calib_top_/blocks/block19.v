     end else begin : oclk_calib_disabled

       assign   wrlvl_final = 'b0;
       assign   psen        = 'b0;
       assign   psincdec    = 'b0;
       assign   po_stg23_sel = 'b0;
       assign   po_stg23_incdec = 'b0;
       assign   po_en_stg23 = 'b0;
       assign   oclkdelay_calib_cnt = 'b0;
       assign   oclk_prech_req = 'b0;
       assign   oclk_calib_resume = 'b0;
       assign   oclkdelay_calib_done = 1'b1;
       assign   dbg_phy_oclkdelay_cal = 'h0;
       assign   dbg_oclkdelay_rd_data = 'h0;

     end