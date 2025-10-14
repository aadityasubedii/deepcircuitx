always @ (posedge clk_i) begin

    cmd_rdy_o <= #TCQ  cmd_rdy;
    tst_cmd_rdy_o <= #TCQ  cmd_rdy;
    
end