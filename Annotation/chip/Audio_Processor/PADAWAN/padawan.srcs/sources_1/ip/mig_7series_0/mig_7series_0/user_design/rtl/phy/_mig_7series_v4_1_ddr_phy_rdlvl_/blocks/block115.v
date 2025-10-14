   always @ (posedge clk) begin
     rdlvl_stg1_done_int_r1 <= #TCQ rdlvl_stg1_done_int;
     rdlvl_stg1_done_int_r2 <= #TCQ rdlvl_stg1_done_int_r1;
     rdlvl_stg1_done_int_r3 <= #TCQ rdlvl_stg1_done_int_r2;
     rdlvl_last_byte_done_int_r1 <= #TCQ rdlvl_last_byte_done_int;
     rdlvl_last_byte_done_int_r2 <= #TCQ rdlvl_last_byte_done_int_r1;
     rdlvl_last_byte_done_int_r3 <= #TCQ rdlvl_last_byte_done_int_r2;
   end