function [3:0] get_4bit_signal;
input [2:0] num;
begin
    case (num)
        3'd0: get_4bit_signal = `U_EXECUTE.o_byte_enable;
        3'd1: get_4bit_signal = `U_WB.mem_load_rd_r;
    endcase
end
endfunction