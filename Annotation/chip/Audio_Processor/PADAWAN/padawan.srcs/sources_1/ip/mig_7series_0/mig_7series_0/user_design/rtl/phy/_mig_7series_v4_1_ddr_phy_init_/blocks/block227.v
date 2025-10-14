  generate
    if(DRAM_TYPE == "DDR3") begin: gen_load_mr0_DDR3
      assign load_mr0[1:0]   = (BURST_MODE == "8")   ? 2'b00 :
                               (BURST_MODE == "OTF") ? 2'b01 : 
                               (BURST_MODE == "4")   ? 2'b10 : 2'b11;
      assign load_mr0[2]     = (nCL >= 12) ? 1'b1 : 1'b0;   
      assign load_mr0[3]     = (BURST_TYPE == "SEQ") ? 1'b0 : 1'b1;
      assign load_mr0[6:4]   = ((nCL == 5) || (nCL == 13))  ? 3'b001 :
                               ((nCL == 6) || (nCL == 14))  ? 3'b010 : 
                               (nCL == 7)  ? 3'b011 : 
                               (nCL == 8)  ? 3'b100 :
                               (nCL == 9)  ? 3'b101 :
                               (nCL == 10) ? 3'b110 : 
                               (nCL == 11) ? 3'b111 :  
                               (nCL == 12) ? 3'b000 : 3'b111;
      assign load_mr0[7]     = 1'b0;
      assign load_mr0[8]     = 1'b1;   
      assign load_mr0[11:9]  = (TWR_CYC == 5)  ? 3'b001 :
                               (TWR_CYC == 6)  ? 3'b010 : 
                               (TWR_CYC == 7)  ? 3'b011 :
                               (TWR_CYC == 8)  ? 3'b100 :
                               (TWR_CYC == 9)  ? 3'b101 :
                               (TWR_CYC == 10)  ? 3'b101 :
                               (TWR_CYC == 11)  ? 3'b110 : 
                               (TWR_CYC == 12)  ? 3'b110 :
                               (TWR_CYC == 13)  ? 3'b111 :
                               (TWR_CYC == 14)  ? 3'b111 :
                               (TWR_CYC == 15)  ? 3'b000 :
                               (TWR_CYC == 16)  ? 3'b000 : 3'b010;
      assign load_mr0[12]    = 1'b0;   
      assign load_mr0[15:13] = 3'b000;
    end else if (DRAM_TYPE == "DDR2") begin: gen_load_mr0_DDR2 
      assign load_mr0[2:0]   = (BURST_MODE == "8")   ? 3'b011 :
                               (BURST_MODE == "4")   ? 3'b010 : 3'b111;
      assign load_mr0[3]     = (BURST_TYPE == "SEQ") ? 1'b0 : 1'b1;       
      assign load_mr0[6:4]   = (nCL == 3)  ? 3'b011 :
                               (nCL == 4)  ? 3'b100 :
                               (nCL == 5)  ? 3'b101 : 
                               (nCL == 6)  ? 3'b110 : 3'b111;
      assign load_mr0[7]     = 1'b0;
      assign load_mr0[8]     = 1'b1;   
      assign load_mr0[11:9]  = (TWR_CYC == 2)  ? 3'b001 :
                               (TWR_CYC == 3)  ? 3'b010 :
                               (TWR_CYC == 4)  ? 3'b011 :
                               (TWR_CYC == 5)  ? 3'b100 : 
                               (TWR_CYC == 6)  ? 3'b101 : 3'b010;
      assign load_mr0[15:12]= 4'b0000; 
    end
  endgenerate