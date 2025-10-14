assign imm32_nxt            =  
                               itype == MULT               ? {  32'd0                      } :

                               
                               itype == MTRANS             ? {  mtrans_base_reg_change     } :
                               itype == BRANCH             ? {  offset24                   } :
                               itype == TRANS              ? {  offset12                   } :
                               instruction[11:8] == 4'h0  ? {            24'h0, imm8[7:0] } :
                               instruction[11:8] == 4'h1  ? { imm8[1:0], 24'h0, imm8[7:2] } :
                               instruction[11:8] == 4'h2  ? { imm8[3:0], 24'h0, imm8[7:4] } :
                               instruction[11:8] == 4'h3  ? { imm8[5:0], 24'h0, imm8[7:6] } :
                               instruction[11:8] == 4'h4  ? { imm8[7:0], 24'h0            } :
                               instruction[11:8] == 4'h5  ? { 2'h0,  imm8[7:0], 22'h0     } :
                               instruction[11:8] == 4'h6  ? { 4'h0,  imm8[7:0], 20'h0     } :
                               instruction[11:8] == 4'h7  ? { 6'h0,  imm8[7:0], 18'h0     } :
                               instruction[11:8] == 4'h8  ? { 8'h0,  imm8[7:0], 16'h0     } :
                               instruction[11:8] == 4'h9  ? { 10'h0, imm8[7:0], 14'h0     } :
                               instruction[11:8] == 4'ha  ? { 12'h0, imm8[7:0], 12'h0     } :
                               instruction[11:8] == 4'hb  ? { 14'h0, imm8[7:0], 10'h0     } :
                               instruction[11:8] == 4'hc  ? { 16'h0, imm8[7:0], 8'h0      } :
                               instruction[11:8] == 4'hd  ? { 18'h0, imm8[7:0], 6'h0      } :
                               instruction[11:8] == 4'he  ? { 20'h0, imm8[7:0], 4'h0      } :
                                                            { 22'h0, imm8[7:0], 2'h0      } ;