   always @(posedge clk) begin
     if (rst) begin
     
     
     
       dqs_wl_po_stg2_c_incdec   <= #TCQ 1'b0;
       dqs_wl_po_en_stg2_c       <= #TCQ 1'b0;
     end else if (wl_state_r == WL_CORSE_INC) begin
     
       dqs_wl_po_stg2_c_incdec <= #TCQ 1'b1;
       dqs_wl_po_en_stg2_c     <= #TCQ 1'b1;
     end else begin
       dqs_wl_po_stg2_c_incdec <= #TCQ 1'b0;
       dqs_wl_po_en_stg2_c     <= #TCQ 1'b0; 
     end
   end