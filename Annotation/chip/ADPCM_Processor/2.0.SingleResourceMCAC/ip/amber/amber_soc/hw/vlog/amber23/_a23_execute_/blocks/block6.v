assign barrel_shift_carry_alu =  i_barrel_shift_data_sel == 2'd0 ? 
                                  (i_imm_shift_amount[4:1] == 0 ? status_bits_flags[1] : i_imm32[31]) : 
                                   barrel_shift_carry;