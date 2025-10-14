always @ (posedge clk_i) begin
if (FAMILY == "SPARTAN6")
    refresh_prbs <= #TCQ  prbs_instr_b[3] & refresh_cmd_en;
else
    refresh_prbs <= #TCQ  1'b0;
end    