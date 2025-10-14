assign opcode        = instruction[24:21];
assign condition_nxt = instruction[31:28];

assign o_rm_sel_nxt    = instruction[3:0];

assign o_rn_sel_nxt    = branch  ? 4'd15              : 
                                   instruction[19:16] ;

assign o_rds_sel_nxt   = control_state == SWAP_WRITE  ? instruction[3:0]   : 
                         itype == MTRANS              ? mtrans_reg         :
                         branch                       ? 4'd15              : 
                         rds_use_rs                   ? instruction[11:8]  :
                                                        instruction[15:12] ;


assign shift_imm     = instruction[11:7];


assign shift_extend  = !instruction[25] && !instruction[4] && !(|instruction[11:7]) && instruction[6:5] == 2'b11;

assign offset12      = { 20'h0, instruction[11:0]};
assign offset24      = {{6{instruction[23]}}, instruction[23:0], 2'd0 }; 
assign imm8          = instruction[7:0];

assign immediate_shifter_operand = instruction[25];
assign rds_use_rs                = (itype == REGOP && !instruction[25] && instruction[4]) ||
                                   (itype == MULT &&
                                    (control_state == MULT_PROC1  ||
                                     control_state == MULT_PROC2  ||
                                     instruction_valid && !interrupt )) ;
assign branch                    = itype == BRANCH;
assign opcode_compare =
            opcode == CMP ||
            opcode == CMN ||
            opcode == TEQ ||
            opcode == TST ;


assign mem_op               = itype == TRANS;
assign load_op              = mem_op && instruction[20];
assign store_op             = mem_op && !instruction[20];
assign write_pc             = pc_wen_nxt && pc_sel_nxt != 2'd0;
assign regop_set_flags      = itype == REGOP && instruction[20];