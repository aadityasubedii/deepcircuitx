     always @(posedge clk) begin
       dqs_po_dec_done_r1 <= #TCQ dqs_po_dec_done;
       dqs_po_dec_done_r2 <= #TCQ dqs_po_dec_done_r1;
       fine_dly_dec_done_r2 <= #TCQ fine_dly_dec_done_r1;
       fine_dly_dec_done_r3 <= #TCQ fine_dly_dec_done_r2;
       fine_dly_dec_done_r4 <= #TCQ fine_dly_dec_done_r3;
       if (PI_DIV2_INCDEC == "TRUE")
         pi_fine_dly_dec_done <= #TCQ fine_dly_dec_done_r4;
       else
       pi_fine_dly_dec_done <= #TCQ fine_dly_dec_done_r2;
     end