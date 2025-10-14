always @ (posedge clk_i)
begin
cmd_start  <= #TCQ  cmd_validC_i & cmd_rdyC ;
cmd_startB <= #TCQ  cmd_valid_i & cmd_rdyB;
cmd_startC <= #TCQ  cmd_validB_i & cmd_rdyC;
cmd_startD <= #TCQ  cmd_validB_i & cmd_rdyD;  
cmd_startE <= #TCQ  cmd_validB_i & cmd_rdyE;  
cmd_startF <= #TCQ  cmd_validB_i & cmd_rdyF;  
end