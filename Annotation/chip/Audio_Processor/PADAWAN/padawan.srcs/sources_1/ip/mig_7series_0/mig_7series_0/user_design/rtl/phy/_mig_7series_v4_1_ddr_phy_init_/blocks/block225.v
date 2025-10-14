  generate
    if(DRAM_TYPE == "DDR3") begin: gen_load_mr2_DDR3
      assign load_mr2[2:0]   = 3'b000; 
      assign load_mr2[5:3]   = (nCWL == 5) ? 3'b000 :
                               (nCWL == 6) ? 3'b001 : 
                               (nCWL == 7) ? 3'b010 : 
                               (nCWL == 8) ? 3'b011 : 
                               (nCWL == 9) ? 3'b100 :
                               (nCWL == 10) ? 3'b101 :
                               (nCWL == 11) ? 3'b110 : 3'b111;
      assign load_mr2[6]     = 1'b0;
      assign load_mr2[7]     = 1'b0;
      assign load_mr2[8]     = 1'b0;
                               
      assign load_mr2[10:9]  = 2'b00;
      assign load_mr2[15:11] = 5'b00000;
    end else begin: gen_load_mr2_DDR2
      assign load_mr2[15:0] = 16'd0;
    end
  endgenerate