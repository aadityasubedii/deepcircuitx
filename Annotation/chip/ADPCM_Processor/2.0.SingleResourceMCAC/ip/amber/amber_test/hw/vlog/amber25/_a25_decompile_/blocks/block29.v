initial 
    #1 decompile_file = $fopen(`A25_DECOMPILE_FILE, "w");





assign opcode       = execute_instruction[24:21];
assign condition    = execute_instruction[31:28];
assign s_bit        = execute_instruction[20];
assign reg_n        = execute_instruction[19:16];
assign reg_d        = execute_instruction[15:12];
assign reg_m        = execute_instruction[3:0];
assign reg_s        = execute_instruction[11:8];
assign shift_imm    = execute_instruction[11:7];
assign offset12     = execute_instruction[11:0];
assign offset8      = {execute_instruction[11:8], execute_instruction[3:0]};
assign imm8         = execute_instruction[7:0];
assign no_shift     = execute_instruction[11:4] == 8'h0;
assign mtrans_itype = execute_instruction[24:23];

assign opcode_compare =
            opcode == CMP || 
            opcode == CMN || 
            opcode == TEQ || 
            opcode == TST ;
            
assign opcode_move =
            opcode == MOV || 
            opcode == MVN ;
            
assign shift_op_imm = itype == REGOP && execute_instruction[25] == 1'd1;

assign imm32 =  execute_instruction[11:8] == 4'h0 ? {            24'h0, imm8[7:0] } :
                execute_instruction[11:8] == 4'h1 ? { imm8[1:0], 24'h0, imm8[7:2] } :
                execute_instruction[11:8] == 4'h2 ? { imm8[3:0], 24'h0, imm8[7:4] } :
                execute_instruction[11:8] == 4'h3 ? { imm8[5:0], 24'h0, imm8[7:6] } :
                execute_instruction[11:8] == 4'h4 ? { imm8[7:0], 24'h0            } :
                execute_instruction[11:8] == 4'h5 ? { 2'h0,  imm8[7:0], 22'h0 }     :
                execute_instruction[11:8] == 4'h6 ? { 4'h0,  imm8[7:0], 20'h0 }     :
                execute_instruction[11:8] == 4'h7 ? { 6'h0,  imm8[7:0], 18'h0 }     :
                execute_instruction[11:8] == 4'h8 ? { 8'h0,  imm8[7:0], 16'h0 }     :
                execute_instruction[11:8] == 4'h9 ? { 10'h0, imm8[7:0], 14'h0 }     :
                execute_instruction[11:8] == 4'ha ? { 12'h0, imm8[7:0], 12'h0 }     :
                execute_instruction[11:8] == 4'hb ? { 14'h0, imm8[7:0], 10'h0 }     :
                execute_instruction[11:8] == 4'hc ? { 16'h0, imm8[7:0], 8'h0  }     :
                execute_instruction[11:8] == 4'hd ? { 18'h0, imm8[7:0], 6'h0  }     :
                execute_instruction[11:8] == 4'he ? { 20'h0, imm8[7:0], 4'h0  }     :
                                                    { 22'h0, imm8[7:0], 2'h0  }     ;






assign itype = 
    {execute_instruction[27:23], execute_instruction[21:20], execute_instruction[11:4] } == { 5'b00010, 2'b00, 8'b00001001 } ? SWAP     :  
    {execute_instruction[27:22], execute_instruction[7:4]                              } == { 6'b000000, 4'b1001           } ? MULT     :  
    {execute_instruction[27:26]                                                        } == { 2'b00                        } ? REGOP    :    
    {execute_instruction[27:26]                                                        } == { 2'b01                        } ? TRANS    :
    {execute_instruction[27:25]                                                        } == { 3'b100                       } ? MTRANS   :
    {execute_instruction[27:25]                                                        } == { 3'b101                       } ? BRANCH   :
    {execute_instruction[27:25]                                                        } == { 3'b110                       } ? CODTRANS :
    {execute_instruction[27:24], execute_instruction[4]                                } == { 4'b1110, 1'b0                } ? COREGOP  :
    {execute_instruction[27:24], execute_instruction[4]                                } == { 4'b1110, 1'b1                } ? CORTRANS :
                                                                                                                               SWI      ;