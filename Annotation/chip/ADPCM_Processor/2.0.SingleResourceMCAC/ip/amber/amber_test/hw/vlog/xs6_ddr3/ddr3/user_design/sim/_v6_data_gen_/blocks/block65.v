always @ (posedge clk_i) begin
 if (data_mode_rr_c[2:0] == 3'b101  || data_mode_rr_c[2:0] == 3'b100 || data_mode_rr_c[2:0] == 3'b110)   
     sel_w1gen_logic <= #TCQ 1'b1;
 else
     sel_w1gen_logic <= #TCQ 1'b0;
end