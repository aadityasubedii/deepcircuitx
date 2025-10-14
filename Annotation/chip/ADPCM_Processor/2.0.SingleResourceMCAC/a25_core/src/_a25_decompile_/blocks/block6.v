function [31:0] get_reg_val;
input [4:0] regnum;
begin
    case (regnum)
        5'd0   : get_reg_val = `U_REGISTER_BANK.r0_out;
        5'd1   : get_reg_val = `U_REGISTER_BANK.r1_out; 
        5'd2   : get_reg_val = `U_REGISTER_BANK.r2_out; 
        5'd3   : get_reg_val = `U_REGISTER_BANK.r3_out; 
        5'd4   : get_reg_val = `U_REGISTER_BANK.r4_out; 
        5'd5   : get_reg_val = `U_REGISTER_BANK.r5_out; 
        5'd6   : get_reg_val = `U_REGISTER_BANK.r6_out; 
        5'd7   : get_reg_val = `U_REGISTER_BANK.r7_out; 
        5'd8   : get_reg_val = `U_REGISTER_BANK.r8_out; 
        5'd9   : get_reg_val = `U_REGISTER_BANK.r9_out; 
        5'd10  : get_reg_val = `U_REGISTER_BANK.r10_out; 
        5'd11  : get_reg_val = `U_REGISTER_BANK.r11_out; 
        5'd12  : get_reg_val = `U_REGISTER_BANK.r12_out; 
        5'd13  : get_reg_val = `U_REGISTER_BANK.r13_out; 
        5'd14  : get_reg_val = `U_REGISTER_BANK.r14_out; 
        5'd15  : get_reg_val = `U_REGISTER_BANK.r15_out_rm; 
        
        5'd16  : get_reg_val = `U_REGISTER_BANK.r14_svc;
        5'd17  : get_reg_val = `U_REGISTER_BANK.r14_firq;
        5'd18  : get_reg_val = `U_REGISTER_BANK.r14_irq;
        5'd19  : get_reg_val = `U_REGISTER_BANK.r14_svc;
        5'd20  : get_reg_val = `U_REGISTER_BANK.r14_svc;
        5'd21  : get_reg_val = `U_REGISTER_BANK.r15_out_rn; 
    endcase
end
endfunction