assign no_shift    = execute_instruction[11:4] == 8'h0;
assign mtrans_itype = execute_instruction[24:23];


assign opcode_compare =
            opcode == CMP || 
            opcode == CMN || 
            opcode == TEQ || 
            opcode == TST ;