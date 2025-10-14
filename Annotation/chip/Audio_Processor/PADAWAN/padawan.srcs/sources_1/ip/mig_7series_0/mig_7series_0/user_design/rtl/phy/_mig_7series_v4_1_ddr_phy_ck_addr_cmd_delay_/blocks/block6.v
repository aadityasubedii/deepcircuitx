   always @(posedge clk) begin
     if (rst) begin
       po_stg2_f_incdec <= #TCQ 1'b0;
       po_en_stg2_f     <= #TCQ 1'b0;
       po_stg2_c_incdec <= #TCQ 1'b0;
       po_en_stg2_c     <= #TCQ 1'b0;
     end else begin
       if (po_cnt_dec) begin
         po_stg2_f_incdec <= #TCQ 1'b0;
         po_en_stg2_f     <= #TCQ 1'b1;
       end else begin
         po_stg2_f_incdec <= #TCQ 1'b0;
         po_en_stg2_f     <= #TCQ 1'b0;
       end
       if (po_cnt_inc) begin
         po_stg2_c_incdec <= #TCQ 1'b1;
         po_en_stg2_c     <= #TCQ 1'b1;
       end else begin
         po_stg2_c_incdec <= #TCQ 1'b0;
         po_en_stg2_c     <= #TCQ 1'b0;
       end
     end
   end