always @ (posedge clk_i) begin
  if ((rd_addr < 42) && VCCO_PAT_EN)
    dout_o <= #TCQ mem_out[BRAM_DATA_WIDTH-3:0];
  else if ((rd_addr < 127) && VCCAUX_PAT_EN)
    dout_o <= #TCQ mem_out[BRAM_DATA_WIDTH-3:0];
  else if (ISI_PAT_EN && (rd_addr > 126))
    dout_o <= #TCQ mem_out[BRAM_DATA_WIDTH-3:0];
  else
    dout_o <= #TCQ 'd0;
end