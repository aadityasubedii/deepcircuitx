   always @(posedge clk) begin
     if (rst) begin
     
       dqs_po_stg2_f_incdec   <= #TCQ 1'b0;
       dqs_po_en_stg2_f       <= #TCQ 1'b0;
     
     
     
     end else if (po_cnt_dec || (wl_state_r == WL_INIT_FINE_DEC) ||
                  (wl_state_r == WL_FINE_DEC)) begin
       dqs_po_stg2_f_incdec <= #TCQ 1'b0;
       dqs_po_en_stg2_f     <= #TCQ 1'b1;
     
     end else if ((wl_state_r == WL_INIT_FINE_INC) ||
                  (wl_state_r == WL_FINE_INC)) begin
       dqs_po_stg2_f_incdec <= #TCQ 1'b1;
       dqs_po_en_stg2_f     <= #TCQ 1'b1;
     end else begin
       dqs_po_stg2_f_incdec <= #TCQ 1'b0;
       dqs_po_en_stg2_f     <= #TCQ 1'b0; 
     end
   end