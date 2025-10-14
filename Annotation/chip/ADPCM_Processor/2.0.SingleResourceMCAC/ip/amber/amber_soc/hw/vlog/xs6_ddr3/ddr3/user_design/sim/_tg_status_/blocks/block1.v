always @ (posedge clk_i)
begin

if (rst_i || manual_clear_error) begin
   error_status <= #TCQ  'b0;
   error_set    <= #TCQ  1'b0;
end
else begin
  
  if (data_error_i && ~data_error_r && ~error_set ) begin
     error_status[31:0]  <= #TCQ  cmp_addr_i;
     error_status[37:32] <= #TCQ  cmp_bl_i;
     error_status[40] <= #TCQ  mcb_cmd_full_i;
     error_status[41] <= #TCQ  mcb_wr_full_i;
     error_status[42] <= #TCQ  mcb_rd_empty_i;
     error_set <= #TCQ  1'b1;
     error_status[64 + (DWIDTH - 1)  :64]           <= #TCQ  cmp_data_i;
     error_status[64 + (2*DWIDTH - 1):64 + DWIDTH]  <= #TCQ  rd_data_i;
   
  end

  error_status[39:38]  <= #TCQ  'b0;    
  error_status[63:43] <= #TCQ  'b0;    


end end