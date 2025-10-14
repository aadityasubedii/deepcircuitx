  always @(posedge clk) begin
    if (rst) begin
      dbg_po_f_inc_r      <= #TCQ 1'b0;
      dbg_po_f_stg23_sel_r<= #TCQ 1'b0;
      dbg_po_f_en_r       <= #TCQ 1'b0;
      dbg_sel_po_incdec_r <= #TCQ 1'b0;
    end else begin
      dbg_po_f_inc_r      <= #TCQ dbg_po_f_inc;
      dbg_po_f_stg23_sel_r<= #TCQ dbg_po_f_stg23_sel;
      dbg_po_f_en_r       <= #TCQ (dbg_po_f_inc | dbg_po_f_dec);
      dbg_sel_po_incdec_r <= #TCQ dbg_sel_po_incdec;
    end
  end