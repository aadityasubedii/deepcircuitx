   always @ (posedge clk) begin
     if(rst || (init_state_r == INIT_OCAL_COMPLEX_ACT) || 
               (prbs_rdlvl_done && (init_state_r == INIT_RDLVL_COMPLEX_ACT)) )
       complex_ocal_ref_done <= #TCQ 1'b1;   
     else if (init_state_r == INIT_RDLVL_STG1_WRITE)
       complex_ocal_ref_done <= #TCQ 1'b0; 
   end